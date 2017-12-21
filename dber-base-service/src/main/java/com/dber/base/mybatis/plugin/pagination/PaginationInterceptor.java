package com.dber.base.mybatis.plugin.pagination;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.MappedStatement.Builder;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.reflection.DefaultReflectorFactory;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.ReflectorFactory;
import org.apache.ibatis.reflection.factory.DefaultObjectFactory;
import org.apache.ibatis.reflection.factory.ObjectFactory;
import org.apache.ibatis.reflection.wrapper.DefaultObjectWrapperFactory;
import org.apache.ibatis.reflection.wrapper.ObjectWrapperFactory;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;

import com.dber.base.mybatis.plugin.pagination.dialect.AbstractDialect;
import com.dber.base.mybatis.plugin.pagination.dialect.MysqlDialect;
import com.dber.base.mybatis.plugin.pagination.ext.PageParameter;
import com.dber.base.mybatis.plugin.pagination.ext.PageParameterHandler;
import com.dber.base.mybatis.plugin.pagination.page.Page;

/**
 * <li>文件名称: PaginationInterceptor.java</li>
 * <li>修改记录: ...</li>
 * <li>内容摘要: ...</li>
 * <li>其他说明: ...</li>
 * 
 * @version 1.0
 * @since 2017年12月20日
 * @author dev-v
 */
@Intercepts({ @Signature(type = Executor.class, method = "query", args = { MappedStatement.class, Object.class,
		RowBounds.class, ResultHandler.class }) })
public class PaginationInterceptor implements Interceptor {
	private static final Interceptor instance = new PaginationInterceptor();

	private static final int MAPPED_STATEMENT_INDEX = 0;
	private static final int PARAMETER_INDEX = 1;
	private static final int ROWBOUNDS_INDEX = 2;
	private static final String sql = "sql";
	private static final String SQLSOURCE_STRING = "sqlSource";
	private static final ObjectFactory DEFAULT_OBJECT_FACTORY = new DefaultObjectFactory();
	private static final ObjectWrapperFactory DEFAULT_OBJECT_WRAPPER_FACTORY = new DefaultObjectWrapperFactory();
	private static final ReflectorFactory DEFAULT_REFLECTOR_FACTORY = new DefaultReflectorFactory();

	private static AbstractDialect dialect = new MysqlDialect();

	private static final Map<String, Builder> BUILDER_MAP = new HashMap<>();

	private boolean needCacheCount = true;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Object intercept(final Invocation invocation) throws Throwable {
		final Object[] queryArgs = invocation.getArgs();
		final Object prameterObj = queryArgs[PARAMETER_INDEX];

		if (prameterObj instanceof Page<?>) {
			final MappedStatement ms = (MappedStatement) queryArgs[MAPPED_STATEMENT_INDEX];

			Page page = (Page) prameterObj;

			final BoundSql boundSql = ms.getBoundSql(page.getCondition());

			Connection connection = ((Executor) invocation.getTarget()).getTransaction().getConnection();
			long count = getCount(connection, boundSql, page, ms);
			page.setCount(count);

			if (count == 0) {
				page.emptyDatas();
			} else {
				queryArgs[ROWBOUNDS_INDEX] = new RowBounds(RowBounds.NO_ROW_OFFSET, RowBounds.NO_ROW_LIMIT);
				queryArgs[MAPPED_STATEMENT_INDEX] = getPageStatement(ms, boundSql, page);
				queryArgs[PARAMETER_INDEX] = page.getCondition();
				page.setDatas((Collection<?>) invocation.proceed());
			}
			return page.getDatas();
		}
		return invocation.proceed();
	}

	private final MappedStatement getPageStatement(MappedStatement ms, BoundSql boundSql, Page<?> page) {
		String id = ms.getId();
		Builder builder = BUILDER_MAP.get(id);
		PageConditionParseSqlSource sqlSource = PageConditionParseSqlSource.getPageConditionParseSqlSource(boundSql);

		if (builder == null) {
			builder = new Builder(ms.getConfiguration(), ms.getId(), sqlSource, ms.getSqlCommandType());
			builder.resource(ms.getResource());
			builder.fetchSize(ms.getFetchSize());
			builder.statementType(ms.getStatementType());
			builder.keyGenerator(ms.getKeyGenerator());
			if (ms.getKeyProperties() != null && ms.getKeyProperties().length != 0) {
				StringBuilder keyProperties = new StringBuilder();
				for (String keyProperty : ms.getKeyProperties()) {
					keyProperties.append(keyProperty).append(',');
				}
				keyProperties.delete(keyProperties.length() - 1, keyProperties.length());
				builder.keyProperty(keyProperties.toString());
			}

			builder.timeout(ms.getTimeout());

			builder.parameterMap(ms.getParameterMap());

			builder.resultMaps(ms.getResultMaps());
			builder.resultSetType(ms.getResultSetType());

			builder.cache(ms.getCache());
			builder.flushCacheRequired(ms.isFlushCacheRequired());
			builder.useCache(ms.isUseCache());
			BUILDER_MAP.put(id, builder);
		}

		MappedStatement resultMs = builder.build();

		MetaObject
				.forObject(boundSql, DEFAULT_OBJECT_FACTORY, DEFAULT_OBJECT_WRAPPER_FACTORY, DEFAULT_REFLECTOR_FACTORY)
				.setValue(sql, dialect.getPageSql(boundSql.getSql(), page));
		MetaObject
				.forObject(resultMs, DEFAULT_OBJECT_FACTORY, DEFAULT_OBJECT_WRAPPER_FACTORY, DEFAULT_REFLECTOR_FACTORY)
				.setValue(SQLSOURCE_STRING, sqlSource);

		return resultMs;
	}

	@SuppressWarnings("unchecked")
	private final long getCount(Connection connection, BoundSql boundSql, Page<?> page, MappedStatement ms)
			throws SQLException {
		long count = 0;

		Object[] keyAndParemeters = PageParameterHandler.getKeyAndParameters(ms, boundSql);
		String key = (String) keyAndParemeters[0];
		if (needCacheCount) {
			count = CacheCount.getCacheCount(key);
			if (count != -1 && page.getCurrentPage() < (page.getAllPage() - 2)) {
				return count;
			}
		}

		String countSql = AbstractDialect.getCountSql(boundSql.getSql());
		final PreparedStatement countStmt = connection.prepareStatement(countSql);
		if (keyAndParemeters[1] != null) {
			List<PageParameter> parameters = (List<PageParameter>) keyAndParemeters[1];
			PageParameterHandler.setParameters(countStmt, parameters);
		}
		final ResultSet rs = countStmt.executeQuery();
		if (rs.next()) {
			count = rs.getInt(1);
		}
		rs.close();
		countStmt.close();

		if (needCacheCount) {
			CacheCount.cacheCount(key, count);
		}

		return count;
	}

	public Object plugin(Object target) {
		return Plugin.wrap(target, this);
	}

	@Override
	public void setProperties(Properties properties) {
	}

	private PaginationInterceptor() {
	}

	public static final Interceptor getInstance() {
		return instance;
	}
}

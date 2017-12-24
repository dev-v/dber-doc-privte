package com.dber.#{packageName}.config;

import java.io.IOException;

import javax.sql.DataSource;

import org.apache.ibatis.plugin.Interceptor;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.dber.base.mybatis.plugin.pagination.PaginationInterceptor;
import com.dber.base.util.DBUtil;
import com.dber.base.util.JdbcPoolConfig;

/**
 * <li>文件名称: #{projectJavaName}Service.java</li>
 * <li>修改记录: ...</li>
 * <li>内容摘要: ...</li>
 * <li>其他说明: ...</li>
 * 
 * @version 1.0
 * @since 2017年12月21日
 * @author dev-v
 */
@Configuration
@EnableConfigurationProperties
@EnableAutoConfiguration
@EnableTransactionManagement
@ComponentScan("com.dber.#{packageName}.service")
@MapperScan(basePackages = { "com.dber.#{packageName}.mapper" })
public class #{projectJavaName}ServiceConfig {
	@Bean
	@ConfigurationProperties(prefix = "dber.#{packageName}.service.mysql")
	public JdbcPoolConfig #{packageName}JdbcPoolConfig() {
		return new JdbcPoolConfig();
	}

	@Bean
	public DataSource #{packageName}DataSource() {
		DataSource #{packageName}DataSource = DBUtil.dataSource(#{packageName}JdbcPoolConfig());
		return #{packageName}DataSource;
	}

	@Bean
	public DataSourceTransactionManager #{packageName}TransactionManager() {
		DataSourceTransactionManager transactionManager = new DataSourceTransactionManager(#{packageName}DataSource());
		return transactionManager;
	}

	@Bean
	public org.apache.ibatis.session.Configuration #{packageName}MybatisConfiguration() {
		org.apache.ibatis.session.Configuration configuration = new org.apache.ibatis.session.Configuration();
		configuration.setMapUnderscoreToCamelCase(true);
		configuration.getTypeAliasRegistry().registerAliases("com.dber.#{packageName}.api.entity");
		return configuration;
	}

	@Bean
	public SqlSessionFactoryBean #{packageName}SqlSessionFactoryBean() throws IOException {
		SqlSessionFactoryBean #{packageName}SqlSessionFactoryBean = new SqlSessionFactoryBean();

		#{packageName}SqlSessionFactoryBean.setDataSource(#{packageName}DataSource());

		#{packageName}SqlSessionFactoryBean.setConfiguration(#{packageName}MybatisConfiguration());

		PathMatchingResourcePatternResolver resourceResolver = new PathMatchingResourcePatternResolver();
		#{packageName}SqlSessionFactoryBean
				.setMapperLocations(resourceResolver.getResources("classpath*:/com/dber/#{packageName}/mapper/*_mapper.xml"));

		Interceptor[] interceptors = { PaginationInterceptor.getInstance() };
		#{packageName}SqlSessionFactoryBean.setPlugins(interceptors);

		return #{packageName}SqlSessionFactoryBean;
	}
}

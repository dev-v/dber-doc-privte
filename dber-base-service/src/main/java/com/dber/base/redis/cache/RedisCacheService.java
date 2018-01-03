package com.dber.base.redis.cache;

import java.util.Deque;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.data.redis.support.collections.DefaultRedisList;
import org.springframework.data.redis.support.collections.DefaultRedisMap;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.parser.ParserConfig;
import com.alibaba.fastjson.util.TypeUtils;
import com.dber.base.cache.ICacheService;
import com.dber.base.exception.system.ThirdException;
import com.dber.base.util.Util;

/**
 * <li>文件名称: RedisCache.java</li>
 * <li>修改记录: ...</li>
 * <li>内容摘要: ...</li>
 * <li>其他说明: ...</li>
 * 
 * @version 1.0
 * @since 2017年12月23日
 * @author dev-v
 */
public class RedisCacheService implements ICacheService {
	private static final Log LOG = LogFactory.getLog(RedisCacheService.class);

	private RedisConnectionFactory connectionFactory;

	private StringRedisTemplate stringTemplate;

	/**
	 * 基础类型及其包装类、字符序列、集合操作
	 */
	private ValueOperations<String, String> baseOperations;

	private Map<Class<?>, ObjectMap> object_map = new HashMap<>();

	public RedisCacheService(RedisConnectionFactory connectionFactory) {
		this.connectionFactory = connectionFactory;

		this.stringTemplate = new StringRedisTemplate(connectionFactory);

		baseOperations = stringTemplate.opsForValue();
	}

	@Override
	public void put(String key, Object object) {
		String val = Util.isPremitive(object.getClass()) ? object.toString() : JSON.toJSONString(object);
		baseOperations.set(generateKey(key, object.getClass()), val);
	}

	@Override
	public <T> T get(String key, Class<T> clz) {
		String val = baseOperations.get(generateKey(key, clz));
		if (val != null) {
			return TypeUtils.cast(val, clz, ParserConfig.global);
		}
		return null;
	}

	@Override
	public void put(Object object) {
		ObjectMap map = object_map.get(object.getClass());
		if (map == null) {
			map = generateObjectMap(object.getClass());
		}
		long id;
		try {
			id = map.idField.getLong(object);
		} catch (IllegalArgumentException | IllegalAccessException e) {
			LOG.error(e);
			throw new ThirdException("字段id必须为整形，且必须赋值，该字段值用于唯一标志对象！", e);
		}
		map.redisMap.put(id, object);
	}

	private <T> ObjectMap generateObjectMap(Class<T> clz) {
		ObjectMap map = new ObjectMap();

		try {
			map.idField = clz.getField("id");
		} catch (NoSuchFieldException | SecurityException e) {
			LOG.error(e);
			throw new ThirdException("存储的对象必须具有id字段属性，区分大小写！", e);
		}

		map.redisMap = new DefaultRedisMap<>(stringTemplate.boundHashOps(getClzKey(clz)));
		object_map.put(clz, map);

		return map;
	}

	@Override
	public <T> T get(Long id, Class<T> clz) {
		ObjectMap map = object_map.get(clz);
		if (map == null) {
			map = generateObjectMap(clz);
		}

		Object object = map.redisMap.get(id);
		if (object != null) {
			return TypeUtils.castToJavaBean(object, clz);
		}

		return null;
	}

	private Map<Class<?>, RedisTemplate<String, ?>> dqueue_template = new HashMap<>();

	@SuppressWarnings("unchecked")
	@Override
	public <T> Deque<T> getDeque(String key, Class<T> clz, int maxSize) {
		RedisTemplate<String, T> template = (RedisTemplate<String, T>) dqueue_template.get(clz);

		if (template == null) {
			template = new RedisTemplate<>();
			template.setConnectionFactory(connectionFactory);
			dqueue_template.put(clz, template);
		}

		DefaultRedisList<T> list = new DefaultRedisList<>(template.boundListOps(key), maxSize);

		return list;
	}

	private static final Map<Class<?>, String> clz_keys = new HashMap<>();

	public static final String getClzKey(Class<?> clz) {
		String key = clz_keys.get(clz);
		if (key == null) {
			if (Util.isPremitive(clz)) {
				char c = clz.getSimpleName().charAt(0);
				key = "j" + (clz.isPrimitive() ? Character.toUpperCase(c) : c);
				clz_keys.put(clz, key);
			} else {
				String[] names = clz.getName().split("\\.");
				int length = names.length - 1;
				key = names[length];
				for (int i = 0; i < length; i++) {
					key += names[i].charAt(0);
				}
			}
		}
		return key;
	}

	public static final <T> String generateKey(String key, Class<T> clz) {
		return key + getClzKey(clz);
	}
}
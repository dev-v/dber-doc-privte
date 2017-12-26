package com.dber.redis.config;

import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.interceptor.KeyGenerator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;

import com.dber.cache.ICacheService;
import com.dber.mq.IMqManager;
import com.dber.redis.cache.RedisCacheService;
import com.dber.redis.mq.RedisMqManager;

/**
 * <li>文件名称: RedisConfig.java</li>
 * <li>修改记录: ...</li>
 * <li>内容摘要: ...</li>
 * <li>其他说明: ...</li>
 * 
 * @version 1.0
 * @since 2017年12月22日
 * @author dev-v
 */
@Configuration
@EnableCaching
public class RedisConfig {

	@Bean
	public LettuceConnectionFactory lettuceConnectionFactory() {
		LettuceConnectionFactory factory = new LettuceConnectionFactory();
		return factory;
	}

	@Bean
	public ICacheService redisCacheService(LettuceConnectionFactory connectionFactory) {
		return new RedisCacheService(connectionFactory);
	}

	@Bean
	public IMqManager redisMqManager(LettuceConnectionFactory connectionFactory) {
		return new RedisMqManager(connectionFactory);
	}

	/**
	 * <pre>
	 * 启用注解管理cache
	 * 
	 * &#64;Cacheable triggers cache population
	 * 
	 * &#64;CacheEvict triggers cache eviction
	 * 
	 * &#64;CachePut updates the cache without interfering with the method execution
	 * 
	 * &#64;Caching regroups multiple cache operations to be applied on a method
	 * 
	 * &#64;CacheConfig shares some common cache-related settings at class-level
	 * </pre>
	 * 
	 * @param connectionFactory
	 * @return
	 */
	public RedisCacheManager redisCacheManager(RedisConnectionFactory connectionFactory) {
		return null;
	}

	/**
	 * <pre>
	 * 注解缓存默认key生成策略
	 * org.springframework.cache.interceptor.DefaultKeyGenerator
	 * 
	 * If no params are given, return SimpleKey.EMPTY.
	 * 
	 * If only one param is given, return that instance.
	 * 
	 * If more the one param is given, return a SimpleKey containing all parameters.
	 * </pre>
	 * 
	 * @return
	 */
	public KeyGenerator keyGenerator() {
		return null;
	}
}
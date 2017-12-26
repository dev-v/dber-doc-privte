package com.dber.redis.mq;

import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.listener.RedisMessageListenerContainer;

import com.dber.mq.AbstractMqManager;
import com.dber.mq.Publisher;
import com.dber.mq.Subscriber;

/**
 * <li>文件名称: RedisMqManager.java</li>
 * <li>修改记录: ...</li>
 * <li>内容摘要: ...</li>
 * <li>其他说明: ...</li>
 * 
 * @version 1.0
 * @since 2017年12月23日
 * @author dev-v
 */
public class RedisMqManager extends AbstractMqManager {

	private RedisConnectionFactory connectionFactory;

	private Executor executor;

	private RedisTemplate<String, String> template;

	private RedisMessageListenerContainer container;

	public RedisMqManager(RedisConnectionFactory connectionFactory) {
		this(connectionFactory, null);
	}

	/**
	 * @param connectionFactory
	 * @param executor
	 *            接收消息后的处理器，若不需要订阅服务可不提供
	 */
	public RedisMqManager(RedisConnectionFactory connectionFactory, Executor executor) {
		this.connectionFactory = connectionFactory;
		this.executor = executor;
	}

	@Override
	protected Publisher sgetPublisher(String system) {
		if (template == null) {
			this.template = new RedisTemplate<>();
			template.setConnectionFactory(connectionFactory);
		}
		return new RedisPubliser(system + '.', template);
	}

	@Override
	protected Subscriber sgetSubscriber(String system) {
		if (container == null) {
			this.container = new RedisMessageListenerContainer();
			this.container.setConnectionFactory(connectionFactory);
			this.container.setTaskExecutor(executor != null ? executor : Executors.newFixedThreadPool(2));
		}
		return new RedisSubscriber(system + '.', container);
	}

}
package com.dber.base.mq;

/**
 * <li>文件名称: MqManager.java</li>
 * <li>修改记录: ...</li>
 * <li>内容摘要: ...</li>
 * <li>其他说明: ...</li>
 * 
 * @version 1.0
 * @since 2017年12月23日
 * @author dev-v
 */
public interface IMqManager {

	Publisher getPublisher(String systemName);

	Subscriber getSubscirber(String systemName);
}

package com.dber.example.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

/**
 * <li>文件名称: ExampleConfig.java</li>
 * <li>修改记录: ...</li>
 * <li>内容摘要: ...</li>
 * <li>其他说明: ...</li>
 * 
 * @version 1.0
 * @since 2017年12月20日
 * @author dev-v
 */
@Configuration
@Import({ ExampleServiceConfig.class, ExampleWebConfig.class })
public class AppConfig {
}

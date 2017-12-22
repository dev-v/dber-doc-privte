package com.dber.example.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.annotation.RequestParamMapMethodArgumentResolver;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

/**
 * <li>文件名称: WebConfig.java</li>
 * <li>修改记录: ...</li>
 * <li>内容摘要: ...</li>
 * <li>其他说明: ...</li>
 * 
 * @version 1.0
 * @since 2017年12月21日
 * @author dev-v
 */
@Configuration
@ComponentScan("com.dber.example.web")
public class ExampleWebConfig {

	@Bean
	public MappingJackson2JsonView jsonView() {
		return new MappingJackson2JsonView();
	}

	@Bean
	public RequestParamMapMethodArgumentResolver requestParamMapMethodArgumentResolver() {
		return new RequestParamMapMethodArgumentResolver();
	}
}

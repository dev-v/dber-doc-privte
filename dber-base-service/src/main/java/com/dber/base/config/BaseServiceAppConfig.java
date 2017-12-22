package com.dber.base.config;

import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.web.method.annotation.RequestParamMapMethodArgumentResolver;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.AbstractView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter;
import com.alibaba.fastjson.support.spring.FastJsonJsonView;
import com.alibaba.fastjson.support.spring.FastJsonViewResponseBodyAdvice;
import com.dber.base.web.resolver.ExceptionResolver;
import com.dber.base.web.resolver.FastJsonArgumentResolver;

/**
 * <li>文件名称: BaseServiceAppConfig.java</li>
 * <li>修改记录: ...</li>
 * <li>内容摘要: ...</li>
 * <li>其他说明: ...</li>
 * 
 * @version 1.0
 * @since 2017年12月22日
 * @author dev-v
 */
@Configuration
@Import({ ExceptionResolver.class, FastJsonViewResponseBodyAdvice.class })
@EnableWebMvc
public class BaseServiceAppConfig extends WebMvcConfigurerAdapter {

	static {
		JSON.DEFAULT_PARSER_FEATURE |= SerializerFeature.WriteDateUseDateFormat.getMask();
		JSON.DEFFAULT_DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
	}

	@Override
	public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
		converters.add(fastJsonHttpMessageConverter());
	}

	@Override
	public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
		argumentResolvers.add(new FastJsonArgumentResolver());
	}

	@Bean
	public FastJsonHttpMessageConverter fastJsonHttpMessageConverter() {
		FastJsonHttpMessageConverter converter = new FastJsonHttpMessageConverter();
		converter.getFastJsonConfig().setSerializerFeatures(SerializerFeature.BrowserSecure,
				SerializerFeature.WriteDateUseDateFormat);
		return converter;
	}

	@Bean
	public AbstractView jsonView() {
		return new FastJsonJsonView();
	}

	@Bean
	public RequestParamMapMethodArgumentResolver requestParamMapMethodArgumentResolver() {
		return new RequestParamMapMethodArgumentResolver();
	}
}

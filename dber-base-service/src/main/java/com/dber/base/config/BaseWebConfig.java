package com.dber.base.config;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.data.redis.repository.configuration.EnableRedisRepositories;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.method.annotation.RequestParamMapMethodArgumentResolver;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
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
@ComponentScan("com.dber.base.web")
@EnableWebMvc
@EnableRedisHttpSession
@EnableRedisRepositories
public class BaseWebConfig extends WebMvcConfigurerAdapter {

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
		List<MediaType> supportedMediaTypes = new ArrayList<>();
		supportedMediaTypes.add(MediaType.APPLICATION_JSON);
		supportedMediaTypes.add(MediaType.APPLICATION_JSON_UTF8);
		supportedMediaTypes.add(MediaType.APPLICATION_ATOM_XML);
		supportedMediaTypes.add(MediaType.APPLICATION_FORM_URLENCODED);
		supportedMediaTypes.add(MediaType.APPLICATION_OCTET_STREAM);
		supportedMediaTypes.add(MediaType.APPLICATION_PDF);
		supportedMediaTypes.add(MediaType.APPLICATION_RSS_XML);
		supportedMediaTypes.add(MediaType.APPLICATION_XHTML_XML);
		supportedMediaTypes.add(MediaType.APPLICATION_XML);
		supportedMediaTypes.add(MediaType.IMAGE_GIF);
		supportedMediaTypes.add(MediaType.IMAGE_JPEG);
		supportedMediaTypes.add(MediaType.IMAGE_PNG);
		supportedMediaTypes.add(MediaType.TEXT_EVENT_STREAM);
		supportedMediaTypes.add(MediaType.TEXT_HTML);
		supportedMediaTypes.add(MediaType.TEXT_MARKDOWN);
		supportedMediaTypes.add(MediaType.TEXT_PLAIN);
		supportedMediaTypes.add(MediaType.TEXT_XML);
		converter.setSupportedMediaTypes(supportedMediaTypes);
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

	@Bean
	public CharacterEncodingFilter characterEncodingFilter() {
		CharacterEncodingFilter filter = new CharacterEncodingFilter();
		filter.setEncoding("utf-8");
		filter.setForceEncoding(true);
		return filter;
	}

	@Override
	public void addCorsMappings(CorsRegistry registry) {
		registry.addMapping("/**").allowedOrigins("http://localhost:8000");
	}
}

package com.dber.#{packageName}.config;

import com.dber.config.SystemConfig;
import com.dber.cache.ICacheService;
import com.dber.#{packageName}.api.I#{projectJavaName}Client;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

import com.dber.base.config.BaseWebConfig;

import javax.annotation.PostConstruct;

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
@Import({ #{projectJavaName}ServiceConfig.class,BaseWebConfig.class})
@ComponentScan("com.dber.#{packageName}.web")
public class #{projectJavaName}WebConfig {
    @Autowired
    SystemConfig systemConfig;

    @Autowired
    ICacheService cacheService;

    @PostConstruct
    public void init() {
        cacheService.put(I#{projectJavaName}Client.BASE_URL_KEY, systemConfig.getWeb().getBaseUrl());
    }
}

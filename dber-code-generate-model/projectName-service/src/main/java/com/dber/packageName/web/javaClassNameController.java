package com.dber.#{packageName}.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dber.base.service.IService;
import com.dber.base.web.controller.AbstractController;
import com.dber.#{packageName}.api.entity.#{javaClassName};
import com.dber.#{packageName}.service.I#{javaClassName}Service;

/**
 * <li>文件名称: #{javaClassName}Controller.java</li>
 * <li>修改记录: ...</li>
 * <li>内容摘要: ...</li>
 * <li>其他说明: ...</li>
 * 
 * @version 1.0
 * @since 2017年12月21日
 * @author dev-v
 */
@RestController
@RequestMapping("/#{tableName}")
public class #{javaClassName}Controller extends AbstractController<#{javaClassName}> {

	@Autowired
	private I#{javaClassName}Service service;

	@Override
	protected IService<#{javaClassName}> getService() {
		return this.service;
	}
}

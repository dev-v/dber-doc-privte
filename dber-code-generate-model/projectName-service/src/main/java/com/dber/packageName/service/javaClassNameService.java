package com.dber.#{packageName}.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dber.base.mapper.IMapper;
import com.dber.base.service.AbstractService;
import com.dber.#{packageName}.api.entity.#{javaClassName};
import com.dber.#{packageName}.mapper.I#{javaClassName}Mapper;

/**
 * <li>文件名称: #{javaClassName}Service.java</li>
 * <li>修改记录: ...</li>
 * <li>内容摘要: ...</li>
 * <li>其他说明: ...</li>
 * 
 * @version 1.0
 * @since 2017年12月20日
 * @author dev-v
 */
@Service
public class #{javaClassName}Service extends AbstractService<#{javaClassName}> implements I#{javaClassName}Service {

	@Autowired
	private I#{javaClassName}Mapper mapper;

	@Override
	protected IMapper<#{javaClassName}> getMapper() {
		return this.mapper;
	}

}

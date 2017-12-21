package com.dber.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dber.base.mapper.IMapper;
import com.dber.base.service.AbstractService;
import com.dber.example.api.entity.PromotionCustomer;
import com.dber.example.mapper.IPromotionCustomerMapper;

/**
 * <li>文件名称: PromotionCustomerService.java</li>
 * <li>修改记录: ...</li>
 * <li>内容摘要: ...</li>
 * <li>其他说明: ...</li>
 * 
 * @version 1.0
 * @since 2017年12月20日
 * @author dev-v
 */
@Service
public class PromotionCustomerService extends AbstractService<PromotionCustomer> implements IPromotionCustomerService {

	@Autowired
	private IPromotionCustomerMapper mapper;

	@Override
	protected IMapper<PromotionCustomer> getMapper() {
		return this.mapper;
	}

}

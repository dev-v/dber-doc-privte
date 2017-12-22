package com.dber.example.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dber.base.service.IService;
import com.dber.base.web.controller.AbstractController;
import com.dber.example.api.entity.PromotionCustomer;
import com.dber.example.service.IPromotionCustomerService;

/**
 * <li>文件名称: PromotionCustomerController.java</li>
 * <li>修改记录: ...</li>
 * <li>内容摘要: ...</li>
 * <li>其他说明: ...</li>
 * 
 * @version 1.0
 * @since 2017年12月21日
 * @author dev-v
 */
@RestController
@RequestMapping("/promotion/customer")
public class PromotionCustomerController extends AbstractController<PromotionCustomer> {

	@Autowired
	private IPromotionCustomerService service;
	
	@Override
	protected IService<PromotionCustomer> getService() {
		return this.service;
	}
}

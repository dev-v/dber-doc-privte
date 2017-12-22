package com.dber.example.service;

import java.sql.Date;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.ConfigFileApplicationContextInitializer;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alibaba.fastjson.JSON;
import com.dber.base.mybatis.plugin.pagination.page.Page;
import com.dber.example.api.entity.PromotionCustomer;
import com.dber.example.config.AppConfig;

/**
 * <li>文件名称: PromotionCustomerServiceTest.java</li>
 * <li>修改记录: ...</li>
 * <li>内容摘要: ...</li>
 * <li>其他说明: ...</li>
 * 
 * @version 1.0
 * @since 2017年12月20日
 * @author dev-v
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest
@ContextConfiguration(classes = AppConfig.class, initializers = ConfigFileApplicationContextInitializer.class)
@FixMethodOrder(MethodSorters.JVM)
public class PromotionCustomerServiceTest {

	private Log log = LogFactory.getLog(PromotionCustomerServiceTest.class);

	@Autowired
	private IPromotionCustomerService service;

	private long id = 500;
	private long saveId = 501;

	@Test
	public void test1_insert() {
		for(;;) {
			PromotionCustomer customer = new PromotionCustomer();
//			customer.setId(id);
			customer.setCustomerId(5);
			customer.setInvalidDate(new Date(1000));
			customer.setPromotionId(1);
			customer.setPromotionName("insert");
			customer.setGetDate(new Date(1000));
			customer.setStatus(1);
			service.insert(customer);
			log.info(customer);
		}
	}

	@Test
	public void test2_save() {
		PromotionCustomer customer = new PromotionCustomer();
		customer.setId(saveId);
		customer.setCustomerId(5);
		customer.setInvalidDate(new Date(1000));
		customer.setPromotionId(1);
		customer.setPromotionName("save-insert");
		customer.setGetDate(new Date(1000));
		customer.setStatus(1);
		log.info(service.save(customer));
		log.info(customer);

		customer.setPromotionName("save-update");
		log.info(service.save(customer));
		log.info(customer);
	}

	@Test
	public void test3_getInsert() {
		log.info(service.get(1));
	}

	@Test
	public void test4_update() {
		PromotionCustomer customer = new PromotionCustomer();
		customer.setId(id);
		customer.setInvalidDate(new Date(1000));
		customer.setPromotionId(1);
		customer.setPromotionName("update");
		customer.setGetDate(new Date(1000));
		customer.setStatus(1);
		log.info(service.update(customer));
	}

	@Test
	public void test5_getUpdate() {
		log.info(service.get(1));
	}

	@Test
	public void test6_query() {
		PromotionCustomer customer = new PromotionCustomer();
		customer.setId(id);
		log.info(service.queryWithoutPage(customer));
		customer.setId(null);

		customer.setPromotionName("insert");
		log.info(service.queryWithoutPage(customer));

		customer.setPromotionName("update");
		log.info(service.queryWithoutPage(customer));

		customer.setPromotionName("save");
		log.info(service.queryWithoutPage(customer));
	}

	@Test
	public void test7_gets() {
		Long[] list = { id, saveId };
		log.info(service.gets(list));
	}

	@Test
	public void test8_queryPage() {
		Page<PromotionCustomer> page = new Page<>();
		PromotionCustomer customer = new PromotionCustomer();
		page.setCondition(customer);

		customer.setId(id);
		service.query(page);
		log.info(JSON.toJSONString(page));

		customer.setPromotionName("insert");
		service.query(page);
		log.info(JSON.toJSONString(page));

		customer.setId(null);

		customer.setPromotionName("update");
		service.query(page);
		log.info(JSON.toJSONString(page));

		customer.setPromotionName("aaaa");
		service.query(page);
		log.info(JSON.toJSONString(page));
	}

	@Test
	public void test100_del() {
		log.info(service.del(id));
		log.info(service.del(saveId));
	}

}

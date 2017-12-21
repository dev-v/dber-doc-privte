package com.dber.example.api.entity;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

/**
* <li>文件名称: PromotionCustomer.java</li>
* <li>修改记录: ...</li>
* <li>内容摘要: ...</li>
* <li>其他说明: ...</li>
* @version  1.0
* @since    2017年12月20日
* @author   dev-v
*/
@Data
public class PromotionCustomer {
	private Long id;
	
	private Integer customerId;
	
	private Integer promotionId;
	
	private String promotionName;
	
	private String customerName;
	
	/**
	 * 失效日期
	 */
	private Date invalidDate;
	
	private Timestamp modifyTime;
	
	private Date getDate;
	
	private Integer status;
	
}



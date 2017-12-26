package com.dber.base.web.controller;

import com.dber.exception.system.NotLoginException;

/**
 * <li>文件名称: ILoginCheckService.java</li>
 * <li>修改记录: ...</li>
 * <li>内容摘要: 登录管理</li>
 * <li>其他说明: ...</li>
 * 
 * @version 1.0
 * @since 2017年12月21日
 * @author dev-v
 */
public interface ILoginService {

	/**
	 * <pre>
	 * 获取已登录用户的账号信息
	 * </pre>
	 * 
	 * @return 账号没登录或登录过期 抛出异常
	 */
	Account getAccount() throws NotLoginException;
}

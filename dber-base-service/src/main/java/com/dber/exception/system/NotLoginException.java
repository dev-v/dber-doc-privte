package com.dber.exception.system;

import com.dber.exception.BaseException;
import com.dber.exception.FrameworkException;

/**
 * <li>文件名称: NotLoginException.java</li>
 * <li>修改记录: ...</li>
 * <li>内容摘要: ...</li>
 * <li>其他说明: ...</li>
 * 
 * @version 1.0
 * @since 2017年12月21日
 * @author dev-v
 */
public class NotLoginException extends FrameworkException {

	private static final long serialVersionUID = 8117046608888737346L;

	private static final int code = 600;

	static {
		BaseException.registCode(code, NotLoginException.class);
	}

	public NotLoginException() {
		super(code, "请登录！");
	}

}

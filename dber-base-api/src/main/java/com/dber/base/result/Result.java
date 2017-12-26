package com.dber.base.result;

import java.io.Serializable;

import lombok.Data;

/**
 * <li>文件名称: Response.java</li>
 * <li>修改记录: ...</li>
 * <li>内容摘要: 用于接收响应信息，若要发送信息请使用：com.dber.base.web.vo.Response</li>
 * <li>其他说明: ...</li>
 * 
 * @version 1.0
 * @since 2017年12月20日
 * @author dev-v
 */
@Data
public class Result<E> implements Serializable {

	private static final long serialVersionUID = 409194411665386603L;

	/**
	 * 响应代码 200 表示成功 500 + 表示访问异常
	 */
	private int code = 0;

	/**
	 * 响应的uuid 用来追踪请求响应
	 */
	private long uuid = 0;

	/**
	 * 返回失败消息 （发生异常时，将异常信息的Throwable.getMessage设置到消息中）
	 */
	private String msg;

	/**
	 * <pre>
	 * 访问成功后的结果真实数据
	 * <b>注意：后台异常对象不能直接返回，只准返回异常消息如Throwable.getMessage</b>
	 * </pre>
	 */
	private E response;

	/**
	 * <pre>
	 * 给序列化工具使用 请勿在代码中直接使用
	 * <b>
	 * 代码new请使用：com.dber.base.web.vo.Response
	 * </b>
	 * </pre>
	 */
	public Result() {
	}

	public boolean isSuccess() {
		return 200 == code;
	}

}

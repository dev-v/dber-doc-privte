package com.dber.base.response;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import lombok.Data;

/**
 * <li>文件名称: Response.java</li>
 * <li>修改记录: ...</li>
 * <li>内容摘要: 统一的响应结果和响应结果接收信息包装</li>
 * <li>其他说明: ...</li>
 * 
 * @version 1.0
 * @since 2017年12月20日
 * @author dev-v
 */
@Data
public class Response<E> implements Serializable {

	/**
	 * 
	 */
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

	private Response(int code, E response) {
		this.setCode(code);
		this.setUuid(uuid);
		this.setResponse(response);
	}

	/**
	 * <pre>
	 * 给序列化工具使用 请勿在代码中直接使用
	 * 
	 * <b>
	 * 代码中使用见：
	 * </b> 
	 * &#64;see
	 * {@link #newResponse(int, Object)} 
	 * {@link #newSuccessResponse(Object)} 
	 * {@link #newFailureResponse(Throwable)} 
	 * {@link #newFailureResponse(String)}
	 * </pre>
	 */
	public Response() {
	}

	public static <E> Response<E> newResponse(int code, E response) {
		return new Response<E>(code, response);
	}

	public static <E> Response<E> newSuccessResponse(E response) {
		return newResponse(200, response);
	}

	public static Response<Throwable> newFailureResponse(Throwable error) {
		return new Response<Throwable>(500, error);
	}

	/**
	 * <pre>
	 * </pre>
	 * 
	 * @param msg
	 *            失败消息
	 * @return
	 */
	public static Response<Throwable> newFailureResponse(String msg) {
		Response<Throwable> response = new Response<Throwable>(500, null);
		response.setMsg(msg);
		return response;
	}

	public void setCode(int code) {
		if (this.code == 0) {
			this.code = code;
		}
	}

	public void setUuid(long uuid) {
		if (this.uuid == 0) {
			if (uuid == 0) {
				this.uuid = UUID.randomUUID().getMostSignificantBits();
			} else {
				this.uuid = uuid;
			}
		}

	}

	public void setResponse(E response) {
		if (response != null && this.response == null) {
			if (response instanceof Throwable) {
				this.msg = ((Throwable) response).getMessage();
			} else {
				this.response = response;
			}
		}
	}

	public Map<String, Object> toMap() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", getCode());
		map.put("uuid", getUuid());
		map.put("msg", getMsg());
		map.put("response", getResponse());
		return map;
	}
}

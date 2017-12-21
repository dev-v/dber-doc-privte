package com.dber.base.web.resolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import com.dber.base.response.Response;

/**
 * <li>文件名称: ExceptionResolver.java</li>
 * <li>修改记录: ...</li>
 * <li>内容摘要: ...</li>
 * <li>其他说明: ...</li>
 * 
 * @version 1.0
 * @since 2017年12月21日
 * @author dev-v
 */
public class ExceptionResolver implements HandlerExceptionResolver {

	private Log log = LogFactory.getLog(ExceptionResolver.class);

	@Autowired
	@Qualifier("jsonView")
	private View jsonView;

	@Override
	@ExceptionHandler(Throwable.class)
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		log.error(ex);
		ModelAndView mv = new ModelAndView();
		mv.addObject(Response.newFailureResponse(ex));
		mv.setView(jsonView);
		return mv;
	}
}

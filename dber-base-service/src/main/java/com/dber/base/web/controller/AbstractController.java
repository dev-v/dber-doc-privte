package com.dber.base.web.controller;

import java.io.Serializable;
import java.util.Collection;

import javax.annotation.PostConstruct;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dber.base.exception.system.NotLoginException;
import com.dber.base.mybatis.plugin.pagination.page.Page;
import com.dber.base.response.Response;
import com.dber.base.service.IService;

/**
 * <li>文件名称: AbstractController.java</li>
 * <li>修改记录: ...</li>
 * 
 * <pre>
 * 内容摘要: controller顶层类
 * 需要登录验证  统一controller处理的公共方法需集成此类
 * </pre>
 * 
 * <li>其他说明: ...</li>
 * 
 * @version 1.0
 * @since 2017年12月21日
 * @author dev-v
 */
public abstract class AbstractController<E> implements ILoginService {
	private static final NotLoginException notLoginException = new NotLoginException();

	IService<E> service;

	@Override
	public Account getAccount() throws NotLoginException {
		throw notLoginException;
	}

	@RequestMapping("/insert")
	public Response<E> insert(E e) {
		service.insert(e);
		return Response.newSuccessResponse(e);
	}

	/**
	 * <pre>
	 * 根据主键修改数据
	 * </pre>
	 * 
	 * @param e
	 * @return 修改成功行数
	 */
	@RequestMapping("/update")
	Response<Integer> update(E e) {
		return Response.newSuccessResponse(service.update(e));
	}

	/**
	 * <pre>
	 * 保存数据 ：
	 * 有id为修改
	 * 无id为新增
	 * </pre>
	 * 
	 * @param e
	 * @return
	 */
	@RequestMapping("/save")
	Response<E> save(E e) {
		service.save(e);
		return Response.newSuccessResponse(e);
	}

	/**
	 * <pre>
	 * 根据主键删除数据
	 * </pre>
	 * 
	 * @param key
	 * @return
	 */
	@RequestMapping("/del/{id}")
	Response<Integer> del(@PathVariable("id") Serializable id) {
		return Response.newSuccessResponse(service.del(id));
	}

	/**
	 * <pre>
	 * 根据主键获取数据
	 * </pre>
	 * 
	 * @param key
	 * @return
	 */
	@RequestMapping("/get/{id}")
	Response<E> get(@PathVariable("id") Serializable id) {
		return Response.newSuccessResponse(service.get(id));
	}

	/**
	 * <pre>
	 * 根据主键集合获取数据
	 * </pre>
	 * 
	 * @param key
	 * @return
	 */
	@RequestMapping("/gets")
	Response<Collection<E>> gets(Long[] ids) {
		return Response.newSuccessResponse(service.gets(ids));
	}

	/**
	 * <pre>
	 * 分页查询数据
	 * 默认20页
	 * </pre>
	 * 
	 * @param e
	 * @return
	 */
	@RequestMapping("/query/{currentPage}")
	Response<Page<E>> query(@PathVariable("currentPage") int currentPage, @ModelAttribute E data) {
		Page<E> page = new Page<>(currentPage);
		page.setCondition(data);
		page.setSort("modify_time desc");
		service.query(page);
		return Response.newSuccessResponse(page);
	}

	@PostConstruct
	public final void setService() {
		this.service = getService();
	}

	protected abstract IService<E> getService();
}

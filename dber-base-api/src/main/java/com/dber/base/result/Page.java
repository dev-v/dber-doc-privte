package com.dber.base.result;

import java.io.Serializable;
import java.util.Collection;

/**
 * <li>文件名称: Page.java</li>
 * <li>修改记录: ...</li>
 * <li>内容摘要: ...</li>
 * <li>其他说明: ...</li>
 * 
 * @version 1.0
 * @since 2017年12月20日
 * @author dev-v
 */
public class Page<E> implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4250863837743850829L;

	/**
	 * 当前页，从1开始
	 */
	private long currentPage;

	/**
	 * 每页数量 (默认20)
	 */
	private long pageSize;

	/**
	 * 总数据行数
	 */
	private long count;

	/**
	 * 总页数
	 */
	private long allPage;

	/**
	 * 当前页查询的数据
	 */
	private Collection<E> datas;

	public long getCurrentPage() {
		return currentPage;
	}

	public long getPageSize() {
		return pageSize;
	}

	public long getCount() {
		return count;
	}

	public long getAllPage() {
		return allPage;
	}

	public Collection<E> getDatas() {
		return datas;
	}
}

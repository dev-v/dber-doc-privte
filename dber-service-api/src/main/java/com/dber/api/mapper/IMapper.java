package com.dber.api.mapper;

import java.io.Serializable;
import java.util.Collection;

/**
* <li>文件名称: IMapper.java</li>
* <li>修改记录: ...</li>
* <li>内容摘要: dao层基础操作</li>
* <li>其他说明: ...</li>
* @version  1.0
* @since    2017年12月19日
* @author   dev-v
*/
public interface IMapper <E>{
	/**
	 * <pre>
	 * 插入数据 若主键自动生成 主键会设置到实体中
	 * </pre>
	 * @param e
	 * @return 返回插入数量
	 */
	int insert(E e);
	
	/**
	 * <pre>
	 * 根据主键删除数据
	 * </pre>
	 * @param key
	 * @return 删除成功行数
	 */
	int del(Serializable key);
	
	/**
	 * <pre>
	 * 根据主键修改数据
	 * </pre>
	 * @param e
	 * @return 修改成功行数
	 */
	int update(E e);
	
	/**
	 * <pre>
	 * 根据主键获取数据
	 * </pre>
	 * @param key
	 * @return
	 */
	E get(Serializable key);
	
	/**
	 * <pre>
	 * 查询数据
	 * </pre>
	 * @param e
	 * @return
	 */
	Collection<E> query(E e);
	
	/**
	 * <pre>
	 * 保存数据 ：
	 * 有id为修改
	 * 无id为新增
	 * </pre>
	 * @param e
	 * @return
	 */
	int save(E e);
}



package com.dber.generator.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.dber.generator.entity.Column;
import com.dber.generator.entity.Table;

/**
 * <li>文件名称: TableMapper.java</li>
 * <li>修改记录: ...</li>
 * <li>内容摘要: ...</li>
 * <li>其他说明: ...</li>
 * 
 * @version 1.0
 * @since 2017年12月23日
 * @author dev-v
 */
@Repository
public interface TableMapper {
	List<Table> getTables(String schemaName);

	List<Column> getColumns(@Param("schemaName") String schemaName, @Param("tableName") String tableName);
}

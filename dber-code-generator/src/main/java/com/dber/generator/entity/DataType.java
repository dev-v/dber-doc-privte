package com.dber.generator.entity;

/**
 * <li>文件名称: DataType.java</li>
 * <li>修改记录: ...</li>
 * <li>内容摘要: ...</li>
 * <li>其他说明: ...</li>
 * 
 * @version 1.0
 * @since 2017年12月23日
 * @author dev-v
 */
public enum DataType {

	BIGINT("Long","bigint"),
	CHAR("String","char"),
	DATE("Date","date"),
	DATETIME("Date","datetime"),
	DECIMAL("BigDecimal","decimal"),
	DOUBLE("Double","double"),
	FLOAT("Float","float"),
	INT("Integer","int"),
	SMALLINT("Integer","smallint"),
	TIME("Time","time"),
	TIMESTAMP("timestamp","timestamp"),
	TINYINT("Integer","tinyint"),
	VARCHAR("String","varchar");

	public String javaType;
	public String dataBaseType;

	private DataType(String javaType,String dataBaseType) {
		this.javaType=javaType;
		this.dataBaseType=dataBaseType;
	}
	
	public String getJavaType() {
		return javaType;
	}
	
}

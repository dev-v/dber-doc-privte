package com.dber.generator.entity;

/**
 * <li>文件名称: DataType.java</li>
 * <li>修改记录: ...</li>
 * <li>内容摘要: ...</li>
 * <li>其他说明: ...</li>
 *
 * @author dev-v
 * @version 1.0
 * @since 2017年12月23日
 */
public enum DataType {

    BIGINT("Long", "bigint"),
    CHAR("String", "char"),
    DECIMAL("BigDecimal", "decimal"),
    DOUBLE("Double", "double"),
    FLOAT("Float", "float"),
    INT("Integer", "int"),
    SMALLINT("Integer", "smallint"),
    TINYINT("Integer", "tinyint"),
    VARCHAR("String", "varchar"),
    
    TIME("java.sql.Time", "time"),
    DATETIME("java.sql.Date", "datetime"),
    TIMESTAMP("java.sql.Timestamp", "timestamp"),
    DATE("java.sql.Date", "date");

    public String javaType;
    public String dataBaseType;

    private DataType(String javaType, String dataBaseType) {
        this.javaType = javaType;
        this.dataBaseType = dataBaseType;
    }

    public String getJavaType() {
        return javaType;
    }

}

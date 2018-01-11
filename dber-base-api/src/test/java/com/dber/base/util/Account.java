package com.dber.base.util;

import lombok.Data;

/**
 * <li>修改记录: ...</li>
 * <li>内容摘要: ...</li>
 * <li>其他说明: ...</li>
 *
 * @author dev-v
 * @version 1.0
 * @since 2018/1/11
 */
@Data
public class Account {
    private String name;
    private String password;
    private String verifyWay;
}

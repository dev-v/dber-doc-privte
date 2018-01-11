package com.dber.base;

import com.dber.base.result.Result;
import com.dber.base.util.Account;
import org.junit.Test;
import org.junit.Before;
import org.junit.After;

/**
 * DefaultClientUtil Tester.
 *
 * @author <Authors name>
 * @version 1.0
 * @since ${DATE}
 */
public class DefaultClientUtilTest {

    IClientUtil clientUtil = DefaultClientUtil.getClientUtil("http://localhost:8080");

    /**
     * Method: get(String path, Object params, Class<E> clz)
     */
    @Test
    public void testGet() throws Exception {
        Result<Account> result;
        Account account = new Account();
        account.setName("fasd");
        account.setPassword("888888");
        account.setVerifyWay("account");

        result = clientUtil.get("/login/login", account, Account.class);
        System.out.println(result.isSuccess());
        System.out.println(result);

        result = clientUtil.get("/login/login", Account.class);
        System.out.println(result.isSuccess());
        System.out.println(result);
    }

    /**
     * Method: post(String path, Object params, Class<E> clz)
     */
    @Test
    public void testPost() throws Exception {
        Result<Account> result;
        Account account = new Account();
        account.setName("fasd");
        account.setPassword("8888");
        account.setVerifyWay("account");

        result = clientUtil.post("/login/login", account, Account.class);
        System.out.println(result.isSuccess());
        System.out.println(result);
    }

}
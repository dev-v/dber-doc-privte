package com.dber.base.util;

import com.dber.base.result.Result;
import lombok.Data;
import org.junit.Test;
import org.junit.Before;
import org.junit.After;

import java.util.HashMap;
import java.util.Map;

/**
 * HttpClientUtil Tester.
 *
 * @author <Authors name>
 * @version 1.0
 * @since ${DATE}
 */
public class HttpClientUtilTest {

    @Before
    public void before() throws Exception {
    }

    @After
    public void after() throws Exception {
    }

    /**
     * Method: getInstance()
     */
    @Test
    public void testGetInstance() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: getString(String url, Map<String, Object> params)
     */
    @Test
    public void testGetString() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: getResultType(Class<E> clz)
     */
    @Test
    public void testGetResultType() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: getJson(String url, Map<String, Object> params)
     */
    @Test
    public void testGetJson() throws Exception {
//TODO: Test goes here... 
    }

    HttpClientUtil clientUtil = HttpClientUtil.getInstance();

    /**
     * Method: getResult(String url, Map<String, Object> params, Class<E> clz)
     */
    @Test
    public void testGetResult() throws Exception {
        Result<Account> result = clientUtil.getResult("http://localhost:8080/login/login?" +
                "name=admin&password=888888&verifyWay=account", null, Account.class);
        System.out.println(result);
    }

    /**
     * Method: postString(String url, Map<String, Object> params)
     */
    @Test
    public void testPostString() throws Exception {
        Account account=new Account();
        account.setName("fasd");
        account.setPassword("8888");
        account.setVerifyWay("account");
        Result<Account> result = clientUtil.postResult("http://localhost:8080/login/login",
                account, Account.class);
        System.out.println(result.isSuccess());
        System.out.println(result);
    }

    /**
     * Method: postJson(String url, Map<String, Object> params)
     */
    @Test
    public void testPostJson() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: get(String url, Map<String, Object> params)
     */
    @Test
    public void testGet() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: postGzip(String url, Map<String, Object> params)
     */
    @Test
    public void testPostGzip() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: post(String url, Map<String, Object> params)
     */
    @Test
    public void testPost() throws Exception {
//TODO: Test goes here... 
    }


    /**
     * Method: buildGet(String url, Map<String, Object> params)
     */
    @Test
    public void testBuildGet() throws Exception {
//TODO: Test goes here... 
/* 
try { 
   Method method = HttpClientUtil.getClass().getMethod("buildGet", String.class, Map<String,.class); 
   method.setAccessible(true); 
   method.invoke(<Object>, <Parameters>); 
} catch(NoSuchMethodException e) { 
} catch(IllegalAccessException e) { 
} catch(InvocationTargetException e) { 
} 
*/
    }

    /**
     * Method: buildPost(String url, Map<String, Object> params)
     */
    @Test
    public void testBuildPost() throws Exception {
//TODO: Test goes here... 
/* 
try { 
   Method method = HttpClientUtil.getClass().getMethod("buildPost", String.class, Map<String,.class); 
   method.setAccessible(true); 
   method.invoke(<Object>, <Parameters>); 
} catch(NoSuchMethodException e) { 
} catch(IllegalAccessException e) { 
} catch(InvocationTargetException e) { 
} 
*/
    }

    /**
     * Method: checkResponse(HttpResponse response, HttpEntity entity, Object params)
     */
    @Test
    public void testCheckResponse() throws Exception {
//TODO: Test goes here... 
/* 
try { 
   Method method = HttpClientUtil.getClass().getMethod("checkResponse", HttpResponse.class, HttpEntity.class, Object.class); 
   method.setAccessible(true); 
   method.invoke(<Object>, <Parameters>); 
} catch(NoSuchMethodException e) { 
} catch(IllegalAccessException e) { 
} catch(InvocationTargetException e) { 
} 
*/
    }

    /**
     * Method: encodeUrl(String url)
     */
    @Test
    public void testEncodeUrl() throws Exception {
//TODO: Test goes here... 
/* 
try { 
   Method method = HttpClientUtil.getClass().getMethod("encodeUrl", String.class); 
   method.setAccessible(true); 
   method.invoke(<Object>, <Parameters>); 
} catch(NoSuchMethodException e) { 
} catch(IllegalAccessException e) { 
} catch(InvocationTargetException e) { 
} 
*/
    }

} 

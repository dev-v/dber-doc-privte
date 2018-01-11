package com.dber.base;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.dber.base.result.Result;
import com.dber.base.util.HttpClientUtil;
import org.apache.http.HttpEntity;

import java.util.HashMap;
import java.util.Map;

/**
 * <li>修改记录: ...</li>
 * <li>内容摘要: ...</li>
 * <li>其他说明: ...</li>
 *
 * @author dev-v
 * @version 1.0
 * @since 2018/1/11
 */
public class DefaultClientUtil implements IClientUtil {
    private String baseUrl;

    private static final HttpClientUtil httpClientUtil = HttpClientUtil.getInstance();

    private static final Map<String, IClientUtil> CACHE_CLIENT = new HashMap<>();

    private final Map<String, Object> systemKeyParams = new HashMap<>();

    private DefaultClientUtil(String baseUrl, String system, String key) {
        this.baseUrl = baseUrl;
        systemKeyParams.put("system", system);
        systemKeyParams.put("key", key);
        CACHE_CLIENT.put(baseUrl, this);
    }

    public static final IClientUtil getClientUtil(String baseUrl, String system, String key) {
        baseUrl = baseUrl.trim();
        if (baseUrl.endsWith("/")) {
            baseUrl = baseUrl.substring(0, baseUrl.length());
        }
        IClientUtil util = CACHE_CLIENT.get(baseUrl);
        if (util == null) {
            CACHE_CLIENT.put(baseUrl, util = new DefaultClientUtil(baseUrl, system, key));
        }
        return util;
    }

    @Override
    public String getString(String path, Object params) {
        return httpClientUtil.getString(getUrl(path), params);
    }

    @Override
    public String getString(String path) {
        return getString(path, null);
    }

    @Override
    public <E> Result<E> get(String path, Object params, Class<E> clz) {
        return httpClientUtil.getResult(getUrl(path), getParams(params), clz);
    }

    @Override
    public <E> Result<E> get(String path, Class<E> clz) {
        return get(path, null, clz);
    }

    @Override
    public String postString(String path, Object params) {
        return httpClientUtil.postString(getUrl(path), getParams(params));
    }

    @Override
    public <E> Result<E> post(String path, Object params, Class<E> clz) {
        return httpClientUtil.postResult(getUrl(path), getParams(params), clz);
    }

    @Override
    public HttpEntity gize(String path, Object params) {
        return httpClientUtil.gzip(getUrl(path), getParams(params));
    }


    private String getUrl(String path) {
        return baseUrl + path;
    }

    private Map<String, Object> getParams(Object params) {
        if (params == null) {
            return systemKeyParams;
        } else {
            params = JSON.toJSON(params);
            if (params instanceof JSONObject) {
                ((JSONObject) params).putAll(systemKeyParams);
                return (JSONObject) params;
            } else {
                throw new IllegalArgumentException("参数必须为map或纯pojo");
            }
        }
    }
}

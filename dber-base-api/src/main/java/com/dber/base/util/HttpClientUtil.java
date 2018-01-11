package com.dber.base.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;
import com.dber.base.result.Result;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.ParseException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.cache.CachingHttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Type;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
public class HttpClientUtil {
    private static final int TIME_OUT = 1000 * 30;

    private static final HttpClient client = CachingHttpClientBuilder.create().build();
    private static final RequestConfig config = RequestConfig.custom()
            .setSocketTimeout(TIME_OUT)
            .setConnectTimeout(TIME_OUT)
            .setConnectionRequestTimeout(TIME_OUT).build();

    public static final Map<Class, Type> CACHE_RESPONSE_TYPE = new HashMap<>();
    private static final HttpClientUtil INSTANCE = new HttpClientUtil();

    private static final Log log = LogFactory.getLog(HttpClientUtil.class);


    private HttpClientUtil() {
    }

    public static HttpClientUtil getInstance() {
        return INSTANCE;
    }

    private static final <E> Type getResultType(Class<E> clz) {
        Type type = CACHE_RESPONSE_TYPE.get(clz);
        if (type == null) {
            TypeReference<Result<E>> reference = new TypeReference<Result<E>>(clz) {
            };
            type = reference.getType();
            CACHE_RESPONSE_TYPE.put(clz, type);
        }
        return type;
    }

    public <E> Result<E> getResult(String url, Object params, Class<E> clz) {
        try {
            return JSON.parseObject(get(url, params).getContent(), getResultType(clz));
        } catch (Exception e) {
            log.error(e);
            throw new IllegalStateException(e);
        }
    }

    public <E> Result<E> postResult(String url, Object params, Class<E> clz) {
        try {
            return JSON.parseObject(post(url, params).getContent(), getResultType(clz));
        } catch (Exception e) {
            log.error(e);
            throw new IllegalStateException(e);
        }
    }

    public String getString(String url, Object params) {
        try {
            return EntityUtils.toString(get(url, params));
        } catch (Exception e) {
            log.error(e);
            throw new IllegalStateException(e);
        }
    }

    public String postString(String url, Object params) {
        try {
            return EntityUtils.toString(post(url, params));
        } catch (Exception e) {
            log.error(e);
            throw new IllegalStateException(e);
        }
    }

    public HttpEntity get(String url, Object params) {
        try {
            HttpGet httpGet = buildGet(url, params);
            HttpResponse response = client.execute(httpGet);
            HttpEntity entity = response.getEntity();
            checkResponse(response, entity, params);
            return entity;
        } catch (Exception e) {
            log.error(e);
            throw new IllegalStateException(e);
        }
    }

    public HttpEntity gzip(String url, Object params) {
        try {
            HttpPost httpPost = buildPost(url, params);
            httpPost.addHeader("Accept-Encoding", "gzip");
            HttpResponse response = client.execute(httpPost);
            HttpEntity entity = response.getEntity();
            checkResponse(response, entity, params);
            return entity;
        } catch (Exception e) {
            log.error(e);
            throw new IllegalStateException(e);
        }
    }

    public HttpEntity post(String url, Object params) {
        try {
            HttpPost httpPost = buildPost(url, params);
            HttpResponse response = client.execute(httpPost);
            HttpEntity entity = response.getEntity();
            checkResponse(response, entity, params);
            return entity;
        } catch (Exception e) {
            log.error(e);
            throw new IllegalStateException(e);
        }
    }

    private HttpGet buildGet(String url, Object params) {
        if (params != null) {
            JSONObject tempParams = parseParams(params);

            Object val;
            StringBuilder builder = new StringBuilder("?");
            for (Map.Entry<String, Object> entry : tempParams.entrySet()) {
                val = entry.getValue();
                if (val != null) {
                    builder.append(entry.getKey())
                            .append('=')
                            .append(encodeUrl(val.toString()))
                            .append('&');
                }
            }
            builder.setLength(builder.length() - 1);
            url += builder.toString();
        }
        HttpGet httpGet = new HttpGet(url);
        httpGet.setConfig(config);
        return httpGet;
    }


    private HttpPost buildPost(String url, Object params)
            throws UnsupportedEncodingException {
        HttpPost httpPost = new HttpPost(url);
        if (params != null) {
            JSONObject tempParams = parseParams(params);
            Object val;
            List<NameValuePair> pairs = new ArrayList<>(tempParams.size());
            for (Map.Entry<String, Object> entry : tempParams.entrySet()) {
                val = entry.getValue();
                if (val != null) {
                    pairs.add(new BasicNameValuePair(entry.getKey(), val.toString()));
                }
            }

            HttpEntity entity = new UrlEncodedFormEntity(pairs, "utf-8");
            httpPost.setEntity(entity);
        }
        httpPost.setConfig(config);
        return httpPost;
    }

    private JSONObject parseParams(Object params) {
        Object obj = JSON.toJSON(params);
        if (obj instanceof JSONObject) {
            return (JSONObject) obj;
        } else {
            throw new IllegalArgumentException("参数必须为map或纯pojo");
        }
    }

    private void checkResponse(HttpResponse response, HttpEntity entity, Object params) {
        if (response.getStatusLine().getStatusCode() != 200) {
            StringBuilder sb = new StringBuilder("访问错误：\r\n");
            try {
                sb.append("信息：").append(EntityUtils.toString(entity)).append("\r\n");
            } catch (ParseException | IOException e) {
                log.error(e);
            }
            sb.append("参数：").append(JSON.toJSONString(params));
            throw new IllegalStateException(sb.toString());
        }
    }

    private String encodeUrl(String url) {
        try {
            return URLEncoder.encode(url, "utf8");
        } catch (Exception e) {
            log.error(e);
            return url;
        }
    }
}
package com.dber.base.mybatis.plugin.pagination;

import com.dber.base.mybatis.plugin.pagination.page.Page;
import com.mysql.jdbc.util.LRUCache;

/**
 * <li>文件名称: CacheCount.java</li>
 * <li>修改记录: ...</li>
 * <li>内容摘要: ...</li>
 * <li>其他说明: ...</li>
 * 
 * @version 1.0
 * @since 2017年12月20日
 * @author dev-v
 */
public class CacheCount {

	private long lastCacheTime;
	private long count = -1;

	private static long cacheTime = 1000 * 60 * 60;

	private static final LRUCache<String, CacheCount> CACHE_MAP = new LRUCache<>(10000);

	private CacheCount(long count) {
		this.count = count;
		this.lastCacheTime = System.currentTimeMillis();
	}

	public static final long getCacheCount(String key) {
		CacheCount cacheCount = CACHE_MAP.get(key);

		if (cacheCount == null) {
			return -1;
		} else if (System.currentTimeMillis() - cacheCount.lastCacheTime > cacheTime) {
			CACHE_MAP.remove(key);
			return -1;
		} else {
			return cacheCount.count;
		}
	}

	public static final void cacheCount(String key, long count) {
		if (count > Page.MAX_PAGE_SIZE) {
			CACHE_MAP.put(key, new CacheCount(count));
		}
	}
}

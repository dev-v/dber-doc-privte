package com.dber.base.tool.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.alibaba.fastjson.JSONObject;

/**
 * <li>文件名称: Util.java</li>
 * <li>修改记录: ...</li>
 * <li>内容摘要: ...</li>
 * <li>其他说明: ...</li>
 * 
 * @version 1.0
 * @since 2017年12月20日
 * @author dev-v
 */
public class Util {

	private static final Log LOG = LogFactory.getLog(Util.class);

	private static final ThreadLocal<SimpleDateFormat> simpleDateFormatThreadLocal = new ThreadLocal<SimpleDateFormat>();

	public static final char SYMBOL_UNDERLINE = '_';
	public static final char SYMBOL_POINT = '.';
	public static final char SYMBOL_COMMA = ',';

	private static final Pattern isBlankPattern = Pattern.compile("^\\s*$");

	private static final long TIME_NANO_MILI = 1000 * 1000;

	/**
	 * <pre>
	 * 验证某个字符串是否为null或空字符串
	 * </pre>
	 * 
	 * @param str
	 * @return
	 */
	public static final boolean isBlank(String str) {
		return str == null || (isBlankPattern.matcher(str).find());
	}

	/**
	 * <pre>
	 * 将下划线、点等风格映射为java属性命名风格
	 * 目前仅支持下划线、点
	 * </pre>
	 */
	public static final String toJavaStyle(String name) {
		if (!isBlank(name)) {
			char[] ns = name.trim().toCharArray();
			char[] temp = new char[ns.length];
			char c;
			int j = 0;
			boolean prevIsUnderline = false;
			for (int i = 0, len = ns.length; i < len; i++) {
				c = ns[i];
				if (c == SYMBOL_UNDERLINE || c == SYMBOL_POINT) {
					prevIsUnderline = (j != 0);
				} else {
					temp[j++] = prevIsUnderline ? Character.toUpperCase(c) : Character.toLowerCase(c);
					prevIsUnderline = false;
				}
			}
			return String.valueOf(temp).trim();
		}
		return name;
	}

	/**
	 * <pre>
	 * 将已分隔符分割的字符串转换为java风格并映射到map集合中
	 * 键为分割的每一个原始字符 值为转换后的字符
	 * </pre>
	 * 
	 * @param str
	 * @param delimiter
	 * @return {column:property}
	 */
	public static final Map<String, String> mapperJavaStyle(String str, String delimiter) {
		Map<String, String> map = new HashMap<String, String>();
		if (!isBlank(str)) {
			String[] strings = str.split(delimiter);
			for (String temp : strings) {
				map.put(temp, toJavaStyle(temp));
			}
		}
		return map;
	}

	/**
	 * <pre>
	 * 判断某个数字num的二进制表示的第place位是否为1；
	 * 位置从0开始
	 * </pre>
	 * 
	 * @param num
	 * @param place
	 * @return
	 */
	public static final boolean isBitSet(Long num, int place) {
		return num != null && (((num >> place) & 1) == 1);
	}

	/**
	 * <pre>
	 * 格式化日期
	 * 形如：yyyy-MM-dd hh:mm:ss
	 * </pre>
	 * 
	 * @param calendar
	 * @return
	 */
	public static final String formatDate(Calendar calendar) {
		return getDateFormat().format(calendar.getTime());
	}

	/**
	 * <pre>
	 * 判定一个对象是否为八种基础类型
	 * 或者是否为字符序列
	 * </pre>
	 * 
	 * @param object
	 * @return
	 */
	public static final boolean isPremitive(Object object) {
		Class<? extends Object> clazz = object.getClass();
		return Number.class.isAssignableFrom(clazz) || Boolean.class.isAssignableFrom(clazz)
				|| Character.class.isAssignableFrom(clazz) || CharSequence.class.isAssignableFrom(clazz);
	}

	/**
	 * <pre>
	 * 判定一个对象是否为八种基础类型
	 * 或者是否为字符序列
	 * </pre>
	 * 
	 * @param object
	 * @return
	 */
	public static final boolean isPremitive(Class<?> clazz) {
		return Number.class.isAssignableFrom(clazz) || Boolean.class.isAssignableFrom(clazz)
				|| Character.class.isAssignableFrom(clazz) || CharSequence.class.isAssignableFrom(clazz);
	}

	public static final Long dateToTime(String datetime) {
		if (isBlank(datetime)) {
			return null;
		}
		try {
			return getDateFormat().parse(datetime).getTime();
		} catch (ParseException e) {
			LOG.error(e);
			throw new IllegalArgumentException("无效参数：" + datetime, e);
		}
	}

	/**
	 * <pre>
	 * 将形如：年-月-日 时：分：秒 的字符串转换为毫秒
	 * 除了年不可省略，其他都可省略（只能从右往左省略）
	 * </pre>
	 * 
	 * @param datetime
	 * @return
	 */
	public static final long stringToTime(String datetime) {
		if (isBlank(datetime)) {
			return 0l;
		}

		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(0l);

		String[] vals = datetime.split(" ");

		String[] date = vals[0].split("-");
		calendar.set(Calendar.YEAR, Integer.parseInt(date[0]));
		if (date.length > 1) {
			calendar.set(Calendar.MONTH, Integer.parseInt(date[1]) - 1);
		}
		if (date.length > 2) {
			calendar.set(Calendar.DATE, Integer.parseInt(date[2]));
		}

		if (vals.length > 1) {
			String[] time = vals[1].split(":");
			calendar.set(Calendar.HOUR_OF_DAY, Integer.parseInt(time[0]));
			if (time.length > 1) {
				calendar.set(Calendar.MINUTE, Integer.parseInt(time[1]));
			}
			if (time.length > 2) {
				// String time2 = time[2].split(".")[0];
				calendar.set(Calendar.SECOND, Integer.parseInt(time[2]));
			}
		}
		return calendar.getTimeInMillis();
	}

	private static final SimpleDateFormat getDateFormat() {
		SimpleDateFormat simpleDateFormat = simpleDateFormatThreadLocal.get();
		if (simpleDateFormat == null) {
			simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			simpleDateFormatThreadLocal.set(simpleDateFormat);
		}
		return simpleDateFormat;
	}

	/**
	 * <pre>
	 * 判定一个字符串的开头是否为指定字符串
	 * 不区分大小写
	 * </pre>
	 * 
	 * @param src
	 * @param dest
	 * @return
	 */
	public static final boolean startsIgnoreCase(String src, String dest) {
		return src.substring(0, dest.length()).equalsIgnoreCase(dest);
	}

	/**
	 * 毫秒转纳秒
	 * 
	 * @param miliSeconds
	 * @return
	 */
	public static final long timeMili2Nano(long miliSeconds) {
		return miliSeconds * TIME_NANO_MILI;
	}

	public static final <V> V getOrDefault(Map<? extends Object, V> map, Object key, V defaultValue,
			Class<V> valueClaz) {
		if (map.containsKey(key)) {
			V value = map.get(key);
			return (value == null ? defaultValue : value);
		}
		return defaultValue;
	}

	/**
	 * <pre>
	 * 转换为key
	 * </pre>
	 * 
	 * @param url
	 * @param params
	 * @return
	 */
	public static String toKey(String base, Object params) {
		StringBuilder result = new StringBuilder(base);
		if (params != null) {
			JSONObject json = JSONObject.parseObject(JSONObject.toJSONString(params));
			Object[] keys = json.keySet().toArray();
			Arrays.sort(keys);
			for (Object key : keys) {
				result.append(key).append(json.get(key));
			}
		}
		return result.toString();
	}

	public static boolean contains(String src, String target) {
		if (src == null || target == null) {
			return false;
		}
		char sc, tc;
		int offset = 'a' - 'A';
		for (int i = 0, iLen = src.length(), j = 0, jLen = target.length(); i < iLen; i++) {
			sc = src.charAt(i);
			tc = target.charAt(j);
			if (sc == tc) {
				j++;
			} else if (sc >= 'a' && sc <= 'z' && sc == (tc + offset)) {
				j++;
			} else if (sc >= 'A' && sc <= 'Z' && sc == (tc - offset)) {
				j++;
			} else {
				j = 0;
			}
			if (j == jLen) {
				return true;
			}
		}
		return false;
	}
}

package com.wr4.util;

import java.util.Date;

import net.sf.json.JsonConfig;

public class JsonConfigUtil {
	/**
	 * JSON 时间解析器具
	 */
	public static JsonConfig configJson() {
		JsonConfig jsonConfig = new JsonConfig(); 
		jsonConfig.registerJsonValueProcessor(Date.class,new TimestampJsonValueProcessor());
		return jsonConfig;
	}
}

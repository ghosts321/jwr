package com.wr4.util;


import java.text.SimpleDateFormat; 
import java.util.Date; 

import net.sf.json.JsonConfig; 
import net.sf.json.processors.JsonValueProcessor; 
/**
 * 实现JsonValueProcessor接口，将JSON中时间格式转换为yyyy-MM-dd HH:mm:ss
 * @author Administrator
 *
 */
public class TimestampJsonValueProcessor implements JsonValueProcessor { 

    public TimestampJsonValueProcessor() { 
    } 

    public Object processArrayValue(Object value, JsonConfig jsonConfig) { 
        return process(value, jsonConfig); 
    } 

    public Object processObjectValue(String key, Object value, 
            JsonConfig jsonConfig) { 
        return process(value, jsonConfig); 
    } 

    private Object process(Object value, @SuppressWarnings("unused") JsonConfig jsonConfig) { 
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
        return formatter.format((Date) value); 
    } 
}  
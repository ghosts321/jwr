package com.wr4.util;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import net.sf.ezmorph.bean.MorphDynaBean;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;


public class TestJson {
    
    public String getJSONOBJECT(){
        List lists = new ArrayList();
        Map map = new HashMap();
        map.put("key", new Date(123124233544l));
        map.put("ke", new Long(123));
        map.put("k", new Object());
        lists.add(map);
        return JSONArray.fromObject(lists).toString();
    }
    
    @SuppressWarnings({ "unchecked", "deprecation" })
    public List getJSONARRAY(String str){
        return JSONArray.toList(JSONArray.fromObject(str,configJson("yyyy-MM-dd HH:mm:ss")));
    }
    
    public void testJson(){
        List lists = getJSONARRAY(getJSONOBJECT());
        System.out.println(lists.get(0).toString()+"===tostring");
        System.out.println(getJSONARRAY(getJSONOBJECT()));
        
    }
    /**
	 * JSON 时间解析器具
	 */
	public static JsonConfig configJson(@SuppressWarnings("unused") String datePattern) {
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] { "class" });
		jsonConfig.setIgnoreDefaultExcludes(false);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.registerJsonValueProcessor(java.sql.Timestamp.class,new TimestampJsonValueProcessor());
		return jsonConfig;
	}
}


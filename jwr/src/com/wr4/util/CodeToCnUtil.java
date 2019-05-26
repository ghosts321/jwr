package com.wr4.util;

import java.util.HashMap;
import java.util.Map;
/***
 * 根据代码返回名称工具类
 * @author Administrator
 *
 */
public class CodeToCnUtil {
	/***
	 * 业务类型Map
	 */
	private static Map<String, String> bustypeMap = new HashMap<String, String>();
	private static Map<String, String> bustypeMapBack = new HashMap<String, String>();
	/***
	 * 主管机关Map
	 */
	private static Map<String, String> motMap = new HashMap<String, String>();
	private static Map<String, String> motMapBack = new HashMap<String, String>();
	static{
		bustypeMap.put("1","道路运输");
		bustypeMap.put("2","水路运输");
		bustypeMap.put("3","港口运营");
		bustypeMap.put("4","城市客运");
		bustypeMap.put("5","交通运输工程建设");
		bustypeMap.put("6","其他");
		
		bustypeMapBack.put("道路运输","1");
		bustypeMapBack.put("水路运输","2");
		bustypeMapBack.put("港口运营","3");
		bustypeMapBack.put("城市客运","4");
		bustypeMapBack.put("交通运输工程建设","5");
		bustypeMapBack.put("其他","6");
		
		motMap.put("02","北京市");
		motMap.put("03","天津市");
		motMap.put("04","河北省");
		motMap.put("05","山西省");
		motMap.put("06","内蒙古自治区");
		motMap.put("07","辽宁省");
		motMap.put("08","吉林省");
		motMap.put("09","黑龙江省");
		motMap.put("10","上海市");
		motMap.put("11","江苏省");
		motMap.put("12","浙江省");
		motMap.put("13","安徽省");
		motMap.put("14","福建省");
		motMap.put("15","江西省");
		motMap.put("16","山东省");
		motMap.put("17","河南省");
		motMap.put("18","湖北省");
		motMap.put("19","湖南省");
		motMap.put("20","广东省");
		motMap.put("21","海南省");
		motMap.put("22","广西壮族自治区");
		motMap.put("23","重庆市");
		motMap.put("24","四川省");
		motMap.put("25","贵州省");
		motMap.put("26","云南省");
		motMap.put("27","西藏自治区");
		motMap.put("28","陕西省");
		motMap.put("29","甘肃省");
		motMap.put("30","青海省");
		motMap.put("31","宁夏回族自治区");
		motMap.put("32","新疆维吾尔自治区");
		motMap.put("33","新疆生产建设兵团");
		motMap.put("34","长江航务管理局");
		motMap.put("35","珠江航务管理局");
		
	    motMapBack.put("北京市","02");
		motMapBack.put("天津市","03");
		motMapBack.put("河北省","04");
		motMapBack.put("山西省","05");
		motMapBack.put("内蒙古自治区","06");
		motMapBack.put("辽宁省","07");
		motMapBack.put("吉林省","08");
		motMapBack.put("黑龙江省","09");
		motMapBack.put("上海市","10");
		motMapBack.put("江苏省","11");
		motMapBack.put("浙江省","12");
		motMapBack.put("安徽省","13");
		motMapBack.put("福建省","14");
		motMapBack.put("江西省","15");
		motMapBack.put("山东省","16");
		motMapBack.put("河南省","17");
		motMapBack.put("湖北省","18");
		motMapBack.put("湖南省","19");
		motMapBack.put("广东省","20");
		motMapBack.put("海南省","21");
		motMapBack.put("广西壮族自治区","22");
		motMapBack.put("重庆市","23");
		motMapBack.put("四川省","24");
		motMapBack.put("贵州省","25");
		motMapBack.put("云南省","26");
		motMapBack.put("西藏自治区","27");
		motMapBack.put("陕西省","28");
		motMapBack.put("甘肃省","29");
		motMapBack.put("青海省","30");
		motMapBack.put("宁夏回族自治区","31");
		motMapBack.put("新疆维吾尔自治区","32");
		motMapBack.put("新疆生产建设兵团","33");
		motMapBack.put("长江航务管理局","34");
		motMapBack.put("珠江航务管理局","35");
	}
	/***
	 * 主管机关返回中文
	 * @param code 主管机关代码
	 * @return 主管机关名称
	 */
	public static String getMotCnVal(String code){
		return motMap.get(code);
	}
	/***
	 * 主管机关返回代码
	 * @param code 主管机关名称
	 * @return 主管机关代码
	 */
	public static String getMotCode(String cn){
		return motMapBack.get(cn);
	}
	/***
	 * 业务类型返回中文
	 * @param code 业务类型代码
	 * @return 业务类型名称
	 */
	public static String getBustypeCnVal(String code){
		return bustypeMap.get(code);
	}
	/***
	 * 业务类型返回代码
	 * @param code 业务类型名称
	 * @return 业务类型代码
	 */
	public static String getBustypeCode(String cn){
		return bustypeMapBack.get(cn);
	}
	
	public static void main(String args[]){
		System.out.print(CodeToCnUtil.getBustypeCnVal("13"));
	}
}

package com.wr4.util;

public class TestEnApplyData {
	public String getJsonData(){
		StringBuffer sb=new StringBuffer();
		
		 
		for(int i=0;i<100000;i++){
			String str="/* "+i+" */";
			str=sb.toString().replaceAll("str", "");
			sb=null;
			sb=new StringBuffer();
			sb.append(str);
		}
		return sb.toString();
	}
}

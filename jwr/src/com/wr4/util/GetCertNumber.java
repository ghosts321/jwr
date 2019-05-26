package com.wr4.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.wr4.service.OrgService;

public class GetCertNumber {
	private static OrgService orgService;
	public static String curDate;
	public GetCertNumber(){
	}
	public GetCertNumber(OrgService orgService){
		this.orgService = orgService;
	}
	public static String getCertNum(String bussinestype,String adminmot){
		Map<String, String> map = new HashMap<String, String>();
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		curDate=sdf.format(date);
		String certDate=curDate.substring(0, 4);
		map.put("certDate", certDate);
		map.put("curDate", curDate);
		//当日证书号个数
		String NoNum = "";
		try {
			NoNum = orgService.queryNoNum("com.wr4.domain.MotOrgInfo.queryNoNum",map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(NoNum.length()!=6){
			int temp=NoNum.length();
			for(int i=0;i<(6-temp);i++){
				NoNum="0".concat(NoNum);
			}
		}
		return curDate.substring(0, 4)+"-"+bussinestype+"-"+adminmot+"-"+NoNum;
	}
	
}

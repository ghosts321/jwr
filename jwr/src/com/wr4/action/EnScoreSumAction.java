package com.wr4.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.wr4.domain.Examine;
import com.wr4.domain.ExchangeInfo;
import com.wr4.domain.OrgInfo;
import com.wr4.service.EnManageService;
import com.wr4.service.OrgManageService;
import com.wr4.util.DateUtils;

public class EnScoreSumAction extends BaseAction{
	
	private EnManageService enManageService;

	public EnManageService getEnManageService() {
		return enManageService;
	}

	public void setEnManageService(EnManageService enManageService) {
		this.enManageService = enManageService;
	}

	/**
	 * 考评情况汇总菜单跳转
	 */
	public String enScoreSum(){
		return SUCCESS;
	}
	
	/**
	 * 考评情况汇总列表
	 */
	public void getEnScoreSumList(){
		try{
			Map map=new HashMap();
			//pid从session获取
			String pid=request.getSession().getAttribute("paperid").toString();
			map.put("pid", pid);
			List list=enManageService.getEnScoreSumList("com.wr4.domain.enManage.getEnScoreSumList",map);
			writeLigerJson(list, list.size());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}


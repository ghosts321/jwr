package com.wr4.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.wr4.domain.Examine;
import com.wr4.domain.ExchangeInfo;
import com.wr4.domain.MotInfo;
import com.wr4.domain.OrgInfo;
import com.wr4.service.OrgManageService;
import com.wr4.util.DateUtils;

public class BookUpdateAction extends BaseAction{
	
	private OrgManageService orgManageService;
	
	private ExchangeInfo exchange;

	private String s=SUCCESS;
	private String userId;
	
	public String bookUpdate(){
		return s;
	}

	/**
	 *  查询变更列表
	 */
	public void getUpdateList(){
		Map map=new HashMap();
		String userType=request.getParameter("usertype");
		if(userType==null){
			userType="org";
		}
		map.put("userId", userId);
		map.put("type", userType);
		List<ExchangeInfo> list = null;
		try {
			list = orgManageService.getUpdateList("com.wr4.domain.OrgOrgInfo.getUpdateList", map);
			writeLigerJson(list, list.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 根据主管机关code获取name
	 */
	public void getMotByCode(){
		Map map=new HashMap();
		String motcode=request.getParameter("motcode").toString();
		map.put("motcode", motcode);
		try{
			MotInfo motInfo=orgManageService.getMotByCode("com.wr4.domain.OrgOrgInfo.getMotByCode",map);
			JSONArray jsonObject = JSONArray.fromObject(motInfo);
			String js = jsonObject.toString();
			writer(js);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 插入变更内容
	 * @return
	 */
	public String insertUpdateContent(){
		Map map = new HashMap();
		String userId=request.getSession().getAttribute("userid").toString();
		String pid=request.getSession().getAttribute("paperid").toString();
		String adminmot=request.getSession().getAttribute("mot").toString();
		String cdate=DateUtils.getDateFormatString().substring(0, 19);
		map.put("userId", userId);
		map.put("cdate", cdate);
		map.put("pid", pid);
		map.put("adminmot", adminmot);
		map.put("reason", exchange.getReason());
		map.put("content", exchange.getContent());
		map.put("type", exchange.getType());
		map.put("del", "0");
		try {
			orgManageService.insertUpdateContent("com.wr4.domain.OrgOrgInfo.insertUpdateContent", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String str="bookUpdate";
		String type=request.getParameter("type");
		
		if(type==null||!type.equals("en")){
			type="org";
		}else{
			str="enChangeApply";
		}
		return str;
	}
	
	public OrgManageService getOrgManageService() {
		return orgManageService;
	}

	public void setOrgManageService(OrgManageService orgManageService) {
		this.orgManageService = orgManageService;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public ExchangeInfo getExchange() {
		return exchange;
	}

	public void setExchange(ExchangeInfo exchange) {
		this.exchange = exchange;
	}
	
}


package com.wr4.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.wr4.domain.EnInfo;
import com.wr4.service.EnManageService;

/***
 * 考评企业档案管理Action
 * @author Administrator
 *
 */
public class EnFilesManageAction extends BaseAction {
	
	private EnManageService enManageService;

	public EnManageService getEnManageService() {
		return enManageService;
	}

	public void setEnManageService(EnManageService enManageService) {
		this.enManageService = enManageService;
	}
	
	/**
	 * 考评企业档案管理菜单
	 */
	public String enFileManage(){
		return SUCCESS	;
	}
	
	/**
	 * 本考评机构考评过的企业档案
	 */
	public void getEnFileManageList(){
		try{
			Map map=new HashMap();
//			pid从session中取
			String pid=request.getSession().getAttribute("paperid").toString();
			map.put("pid", pid);
			getPageParameter();
			map.put("start", start);
			map.put("pagesize", pagesize);
			List list=enManageService.getEnFileManageList("com.wr4.domain.enManage.getEnFileManageList",map);
			int count = getCount("com.wr4.domain.enManage.getEnFileManageListCount", map);
			writeLigerJson(list, count);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
//	企业详情查看
	public void getEnDetail(){
		try{
			Map map=new HashMap();
			String cid=new String(request.getParameter("cid").getBytes("iso-8859-1"),"utf-8");
			String pid=new String(request.getParameter("pid").getBytes("iso-8859-1"),"utf-8");
			map.put("cid", cid);
			map.put("pid", pid);
			EnInfo enInfo= enManageService.getEnDetail("com.wr4.domain.enManage.getEnDetail",map);
			JSONArray jsonObject = JSONArray.fromObject(enInfo);
			String js = jsonObject.toString();
			writer(js);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}

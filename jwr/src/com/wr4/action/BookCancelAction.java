package com.wr4.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.wr4.domain.CertInfo;
import com.wr4.domain.EnInfo;
import com.wr4.domain.OrgInfo;
import com.wr4.domain.ProblemRec;
import com.wr4.domain.RecNotice;
import com.wr4.service.EnService;
import com.wr4.service.OrgService;

public class BookCancelAction extends BaseAction{
	private EnService enService;
	private OrgService orgService;
	private OrgInfo orgInfo;
	

	public EnService getEnService() {
		return enService;
	}

	public void setEnService(EnService enService) {
		this.enService = enService;
	}
	
	public void getOrgInfo(){
		String certnumber = request.getParameter("certNumber");
		try {
			Map map=new HashMap();
			
			map.put("certnumber", certnumber);
			orgInfo= orgService.getOrgInfo("com.wr4.domain.MotOrgInfo.getOrgInfo", map);
			if (orgInfo != null && !orgInfo.equals("")) {
				JSONArray jsonObject = JSONArray.fromObject(orgInfo);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString()+ "}";
				writer(js);
			}else{
				OrgInfo orgInfo=new OrgInfo();
				JSONArray jsonObject = JSONArray.fromObject(orgInfo);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString() +  "}";
				writer(js);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void saveAdvice(){
		Map map=new HashMap();
		String value = request.getParameter("value");
		String cid = request.getParameter("cid");
		String userId = request.getSession().getAttribute("userid")+"";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String pid=request.getParameter("pid")==null?"":request.getParameter("pid").toString();
		String bustype=request.getParameter("bustype")==null?"":request.getParameter("bustype").toString();
		map.put("status", "已发证");
		map.put("pid", pid);
		map.put("bustype",bustype);
		int result;
		try {
			CertInfo certInfo = new CertInfo();
			certInfo.setCertnumber(cid);
			certInfo.setReason(value);
			certInfo.setUserid(userId);
			//证书设置为无效
			certInfo.setCertstatus("0");
			//判断用户
			//返回1插入成功
			int flag = orgService.updateAdvice("com.wr4.domain.MotOrgInfo.updateAdvice", certInfo,map);
			if(flag==1){
				result=0;
			}else{
				result=1;
			}
			JSONArray jsonObject = JSONArray.fromObject(result);
			String js = jsonObject.toString();
			writer(js);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 企业证书撤销
	 * zhangli
	 * 2014年2月19日 19:22:55
	 */
	public void saveEnAdvice(){
		Map map=new HashMap();
		String value = request.getParameter("value");
		String cid = request.getParameter("cid");
		String userId = request.getSession().getAttribute("userid")+"";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String pid=request.getParameter("pid")==null?"":request.getParameter("pid").toString();
		String bustype=request.getParameter("bustype")==null?"":request.getParameter("bustype").toString();
		String enUserId=request.getParameter("enUserId");
		map.put("status", "已发证");
		map.put("pid", pid);
		map.put("bustype",bustype);
		map.put("id", enUserId);
		int result;
		try {
			CertInfo certInfo = new CertInfo();
			certInfo.setCertnumber(cid);
			certInfo.setReason(value);
			certInfo.setUserid(userId);
			//证书设置为无效
			certInfo.setCertstatus("0");
			//判断用户
			//返回1插入成功
			int flag = orgService.updateEnAdvice("com.wr4.domain.MotOrgInfo.updateAdvice", certInfo,map);
			if(flag==1){
				result=0;
			}else{
				result=1;
			}
			JSONArray jsonObject = JSONArray.fromObject(result);
			String js = jsonObject.toString();
			writer(js);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 考评员证书撤销
	 * zhangli
	 * 2014年2月19日 19:22:55
	 */
	public void savePnAdvice(){
		Map map=new HashMap();
		String value = request.getParameter("value");
		String cid = request.getParameter("cid");
		String userId = request.getSession().getAttribute("userid")+"";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String pid=request.getParameter("pid")==null?"":request.getParameter("pid").toString();
		String bustype=request.getParameter("bustype")==null?"":request.getParameter("bustype").toString();
		String enUserId=request.getParameter("enUserId");
		map.put("status", "已发证");
		map.put("pid", pid);
		map.put("bustype",bustype);
		map.put("id", enUserId);
		String result;
		try {
			CertInfo certInfo = new CertInfo();
			certInfo.setCertnumber(cid);
			certInfo.setReason(value);
			certInfo.setUserid(userId);
			//证书设置为无效
			certInfo.setCertstatus("0");
			//判断用户
			//返回1插入成功
			int flag = orgService.updatePnAdvice("com.wr4.domain.MotOrgInfo.updateAdvice", certInfo,map);
			if(flag==1){
				result="0";
			}else{
				result="1";
			}
		 
			writer(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public OrgService getOrgService() {
		return orgService;
	}

	public void setOrgService(OrgService orgService) {
		this.orgService = orgService;
	}

	public void setOrgInfo(OrgInfo orgInfo) {
		this.orgInfo = orgInfo;
	}
}


package com.wr4.action;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONArray;

import com.mysql.jdbc.Connection;
import com.wr4.domain.OrgInfo;
import com.wr4.domain.OrgList;
import com.wr4.domain.RespOrgApplyDetail;
import com.wr4.service.OrgService;
import com.wr4.service.RespOrgApplyManageService;
import com.wr4.util.ExportUtil;

public class RespOrgApplyManageAction extends BaseAction{

	private RespOrgApplyManageService respOrgService;
	
	/**
	 *跳转到考评机构申请受理页面  
	 */
	public String respOrgApplyManage(){
		return SUCCESS;
	}
	
	/**
	 * 帅选已经申请的考评机构
	 */
	public void getOrgApplyList(){
		try{
		Map map=new HashMap();
		String adminmot1=request.getParameter("adminmot");
		String orgtype=request.getParameter("orgtype");
		String pid=request.getParameter("pid");
		String grade=request.getParameter("grade");
		String orgname=request.getParameter("orgname");
		String resp=request.getParameter("resp");
		if(adminmot1!=null && !"".equals(adminmot1) && !"%".equals(adminmot1)){
			map.put("adminmot1", adminmot1);
		}
		if(orgtype!=null && !"".equals(orgtype)){
			map.put("orgtype", orgtype);
		}
		if(pid!=null && !"".equals(pid)){
			map.put("pid", pid);
		}
		if(grade!=null && !"".equals(grade)){
			map.put("grade", grade);
		}
		if(orgname!=null && !"".equals(orgname)){
			map.put("orgname", orgname);
		}
		if(resp!=null && !"".equals(resp)){
			map.put("resp", resp);
		}
//		String orgid=request.getSession().getAttribute("paperid").toString();	
			String adminmot=request.getSession().getAttribute("mot").toString();
			map.put("adminmot", adminmot);
		getPageParameter();
//		List allList=respOrgService.getOrgApplyList("com.wr4.domain.RespOrg.getOrgApplyList", map);
		int count=getCount("com.wr4.domain.RespOrg.getOrgApplyListCount", map);
		map.put("start", start);
		map.put("pagesize", pagesize);
		
		List list=respOrgService.getOrgApplyAllList("com.wr4.domain.RespOrg.getOrgApplyList", map,offset,limit);
 		writeLigerJson(list,count);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 根据pid和bustype查看考评机构详细信息
	 * @return
	 */
	public void scanOrgDetail(){
		try{
			String id=request.getParameter("id").toString();
			Map map=new HashMap();
			map.put("id", id);
			RespOrgApplyDetail respOrgApplyDetail=respOrgService.scanOrgDetail("com.wr4.domain.RespOrg.scanOrgDetail", map);
			JSONArray jsonObject = JSONArray.fromObject(respOrgApplyDetail);
			String js = jsonObject.toString();
			js = "{Rows: " + jsonObject.toString() + ",Total:"
					+ 0 + "}";
			writer(js);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 删除记录
	 * @return
	 */
	public void delOrgApply(){
		try {
			String id = request.getParameter("id").toString();
			Map map = new HashMap();
			map.put("id", id);
			int result = respOrgService.delOrgApply(
					"com.wr4.domain.RespOrg.delOrgApply", map);
			if (result == 0) {
				writer("error");
			} else {
				writer("ok");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 删除企业换证记录
	 * @return
	 */
	public void delEnApply(){
		try {
			String id = request.getParameter("id").toString();
			Map map = new HashMap();
			map.put("id", id);
			int result = respOrgService.delOrgApply(
					"com.wr4.domain.RespOrg.delEnApply", map);
			if (result == 0) {
				writer("error");
			} else {
				writer("ok");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public RespOrgApplyManageService getRespOrgService() {
		return respOrgService;
	}

	public void setRespOrgService(RespOrgApplyManageService respOrgService) {
		this.respOrgService = respOrgService;
	}
	
	
}

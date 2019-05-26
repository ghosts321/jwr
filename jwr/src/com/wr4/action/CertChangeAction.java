package com.wr4.action;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.wr4.domain.ExchangeInfo;
import com.wr4.domain.OrgInfo;
import com.wr4.domain.OrgList;
import com.wr4.domain.RespOrgApplyDetail;
import com.wr4.service.OrgService;
import com.wr4.service.RespOrgApplyManageService;
import com.wr4.util.DateUtils;
import com.wr4.util.ExportUtil;

public class CertChangeAction extends BaseAction{

	private RespOrgApplyManageService respOrgService;
	
	/**
	 *跳转到考评机构申请受理页面  
	 */
	public String certChange(){
		return SUCCESS;
	}
	
	/**
	 * 获取申请换证列表
	 * @return
	 */
	public void getCertChangeList(){
		try{
			Map map=new HashMap();
			getPageParameter();
			String adminmot=request.getSession().getAttribute("mot").toString();
			//2为换证申请类型
			String applytype="2";
			map.put("adminmot", adminmot);
			map.put("applytype", applytype);
			map.put("start", start);
			map.put("pagesize", pagesize);
			List list=respOrgService.getCertChangeList("com.wr4.domain.RespOrg.getCertChangeList",map,offset,limit);
		//	List allList=respOrgService.getCertChangeList("com.wr4.domain.RespOrg.getCertChangeList",map);
			int count=getCount("com.wr4.domain.RespOrg.getCertChangeListCount",map);
			writeLigerJson(list, count);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 根据id查看考评机构详细信息
	 * @return
	 */
	public void scanCertChangeDetail(){
		try{
			String id=request.getParameter("id").toString();
			Map map=new HashMap();
			map.put("id", id);
			RespOrgApplyDetail respOrgApplyDetail=respOrgService.scanCertChangeDetail("com.wr4.domain.RespOrg.scanCertChangeDetail", map);
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
	 *根据id删除换证申请记录
	 * @return
	 */
	public void delCertChangeById(){
		try{
			String id = request.getParameter("id").toString();
			Map map = new HashMap();
			map.put("id", id);
			int result = respOrgService.delCertChangeById(
					"com.wr4.domain.RespOrg.delCertChangeById", map);
			if (result == 0) {
				writer("error");
			} else {
				writer("ok");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 换证同意
	 * @return
	 */
	public void changeBook(){
		try{
			//修改考评机构换证申请后 不能再次提交申请的 BUG
			String id=request.getParameter("id").toString();
			String cid=request.getParameter("cid").toString();
			String type=request.getParameter("type").toString();
			String bustype=request.getParameter("busType");
			String userid=request.getParameter("userid");
			String grade=request.getParameter("grade");
			String advice = request.getParameter("advice").toString();
			DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
			String respdate= format1.format(new Date());
			String del="1";
			Map map=new HashMap();
			map.put("id", id);
			map.put("cid", cid);
			map.put("del", del);
			map.put("advice", advice);
			map.put("bustype", bustype);
			map.put("userid", userid);
			map.put("grade", grade);
			map.put("respdate", respdate);
			int result=2;
			if("1".equals(type)){
				result = respOrgService.delCertChangeById(map);
			}else if("0".equals(type)){
				map.put("resaultno", "2");
				result = respOrgService.delCertChangeById(map);
			}
			
			if (result == 0) {
				writer("error");
			} else {
				writer("ok");
			}
		}catch(Exception e){
			try {
				writer("error");
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
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

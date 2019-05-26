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
import com.wr4.domain.ExchangeInfo;
import com.wr4.domain.OrgInfo;
import com.wr4.domain.OrgList;
import com.wr4.domain.RespOrgApplyDetail;
import com.wr4.service.OrgService;
import com.wr4.service.RespOrgApplyManageService;
import com.wr4.util.DateUtils;
import com.wr4.util.ExportUtil;

public class OrgExchangeAction extends BaseAction{

	private RespOrgApplyManageService respOrgService;
	
	/**
	 *跳转到考评机构申请受理页面  
	 */
	public String orgExchange(){
		return SUCCESS;
	}
	
	/**
	 * 考评机构变更备案受理列表查询
	 * @return
	 */
	public void getOrgExchangeList(){
		try{
		Map map=new HashMap();
		String adminmot=request.getSession().getAttribute("mot").toString();
		map.put("adminmot", adminmot);
		getPageParameter();
		String type=request.getParameter("type").toString();
		map.put("type", type);
		map.put("start", start);
		map.put("pagesize", pagesize);
		List list=respOrgService.getOrgExchangeList("com.wr4.domain.RespOrg.getOrgExchangeList",map,offset,limit);
//		List allList=respOrgService.getOrgExchangeAllList("com.wr4.domain.RespOrg.getOrgExchangeList",map);
		int count=getCount("com.wr4.domain.RespOrg.getOrgExchangeListCount",map);
		writeLigerJson(list, count);
		}catch(Exception e ){
			e.printStackTrace();
		}
	}
	
	/**
	 * 通过id查询变更
	 * @return
	 */
	public void selectExchangeById(){
		try{
			Map map=new HashMap();
			String id=request.getParameter("id").toString();
			map.put("id", id);
			ExchangeInfo exchangeInfo=respOrgService.selectExchangeById("com.wr4.domain.RespOrg.selectExchangeById",map);
			JSONArray jsonObject = JSONArray.fromObject(exchangeInfo);
			String js = jsonObject.toString();
			writer(js);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public String enExchange(){
		return "enchange";
	}
	
	/**
	 * 根据id更新变更意见
	 * @return
	 */
	public void updateAdviceById(){
		try{
			int result=0;
			Map<String, String> map=new HashMap<String, String>();
			Map<String, String> map1=new HashMap<String, String>();
			String id=request.getParameter("id").toString();
			String flag=request.getParameter("flag").toString();//0:拒绝，1：通过
			String type=request.getParameter("type").toString();//en:企业申请，org:考评机构申请
			String userId=request.getParameter("userId").toString();
			String reason=request.getParameter("reason").toString();
			String content=request.getParameter("content").toString();
			String updatedate=DateUtils.getDateFormatString();
			String handleid=request.getSession().getAttribute("userid").toString();
			String advice = request.getParameter("advice") ;
			map.put("id", id);
			map.put("updatedate", updatedate);
			map.put("handleid", handleid);
			map.put("advice", advice);
			map.put("status", "已处理");
			map.put("userId", userId);
			map1.put("flag", flag);
			map1.put("type", type);
			map1.put("reason", reason);
			map1.put("content", content);
		    result=respOrgService.updateAdviceById("com.wr4.domain.RespOrg.updateAdviceById",map,map1);
			if(result==0){
				writer("error");
			}else{
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

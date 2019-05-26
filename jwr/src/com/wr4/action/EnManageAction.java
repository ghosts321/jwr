package com.wr4.action;

import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONArray;

import com.wr4.domain.OrgInfo;
import com.wr4.service.EnManageService;
import com.wr4.service.OrgService;
import com.wr4.util.ExportUtil;

public class EnManageAction extends BaseAction{
	
	private EnManageService enManageService;
	private OrgService orgService;
	
	private String userId;
	private String busType;
	
	/**
	 * 返回证书制发页面
	 * @return
	 */
	public String enProduce(){
		return SUCCESS;
	}
	
	/**
	 * 证书制发页面列表显示
	 * @return
	 */
	public void getEnProduceList(){
		Map map =new HashMap();
		try{
		String pid=request.getParameter("pid").toString();
//		pid从session中获取，session无数据，暂时写死
		map.put("pid", pid);
		String respReview="同意";
		map.put("respReview", respReview);
		List list=enManageService.getEnProduceList("com.wr4.domain.enManage.getEnProduceList",map);
		writeLigerJson(list, list.size());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 证书制发页面到处电子表格
	 * @return
	 */
	public String exportExcel(){
		List<OrgInfo> list = null;
		Map map = new HashMap();
		String id = request.getParameter("id").toString();
		String pid=request.getParameter("pid").toString();
		map.put("id", id);
//		pid从session中获取，session无数据，暂时写死
		map.put("pid", pid);
		String resp="同意";
		map.put("resp", resp);
		map.put("adminmot", request.getSession().getAttribute("paperid").toString());
		XSSFWorkbook xwb = null;
		String xlsName=ServletActionContext.getServletContext().getRealPath("/");
		String xlsName1=xlsName+"reports/enManageList.xls";
		String prpoFileName=xlsName+"reports/sysList.properties";
		String  str="enManage";
		try {
			list = enManageService.getEnProduceList("com.wr4.domain.enManage.getEnProduceList", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		File sourceFile = new File(xlsName1);
		 //建立导出到这个文件   
		ExportUtil eu=new ExportUtil();
		eu.exportFile(xlsName1, "orgList", list,  prpoFileName,str);
		return null;
	}
	
	
	/**
	 * 发证
	 * @throws Exception 
	 */
	public void grantBook() {
		Map map=new HashMap();
		//pid应从session里获取
		String pid=request.getSession().getAttribute("paperid").toString();
		map.put("pid", pid);
		map.put("userId", userId);
		map.put("busType", busType);
		//生成证书号
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String curDate=sdf.format(date);
		String certDate=curDate.substring(0, 4);
		map.put("certDate", certDate);
		map.put("curDate", curDate);
		//证书状态
		map.put("certstatus", "1");
		//当日证书号个数
		String NoNum;
		try {
			NoNum = orgService.queryNoNum("com.wr4.domain.MotOrgInfo.queryNoNum",map);
		if(NoNum.length()!=3){
			for(int i=0;i<=3-NoNum.length();i++){
				NoNum="0".concat(NoNum);
			}
		}
		//添加记录到证书表
		map.put("NoNum", NoNum);
		//添加证书号到证书表
		orgService.insertCertNo("com.wr4.domain.MotOrgInfo.insertCertNo",map);
		map.put("sqlId", "com.wr4.domain.MotOrgInfo.applyDetail");
		//流程表添加记录 状态为已发证
		orgService.insertExamin("com.wr4.domain.MotOrgInfo.insertExamin",map);
		//申请表加证书号
		enManageService.updateApplyCertNo("com.wr4.domain.enManage.updateApplyCertNo",map);
		map.put("cid", curDate.concat(NoNum));
			JSONArray jsonObject = JSONArray.fromObject(map);
			String js = jsonObject.toString();
			response.setCharacterEncoding("utf-8");
			writer(js);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public EnManageService getEnManageService() {
		return enManageService;
	}

	public void setEnManageService(EnManageService enManageService) {
		this.enManageService = enManageService;
	}

	public OrgService getOrgService() {
		return orgService;
	}

	public void setOrgService(OrgService orgService) {
		this.orgService = orgService;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getBusType() {
		return busType;
	}

	public void setBusType(String busType) {
		this.busType = busType;
	}
	
	
}

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
import com.wr4.service.OrgService;
import com.wr4.service.impl.PnServiceImpl;
import com.wr4.util.ExportUtil;

public class OrgListAction extends BaseAction{
	private OrgList orgList;
	private OrgService<OrgInfo> orgService;
	private String certnumber;
	private OrgInfo orgInfo; 

	/**
	 * 获取资质证书制发列表
	 */
	public void getOrgList(){
		List list = null;
		List list2=null;
		try {
			String adminmot1=request.getParameter("adminmot");
			String entype=request.getParameter("entype");
			String grade=request.getParameter("grade");
			String ename=request.getParameter("ename");
			String cid=request.getParameter("cid");
			String adminmot=request.getSession().getAttribute("mot").toString();
			orgList=new OrgList();
			orgList.setAdminmot(adminmot);
			if(adminmot1 !=null && !"".equals(adminmot1) && !"%".equals(adminmot1)){
				orgList.setFzdate(adminmot1);
			}
			if(entype !=null && !"".equals(entype)){
				orgList.setBustype(entype);
			}
			if(grade !=null && !"".equals(grade)){
				orgList.setGrade(grade);
			}
			if(ename !=null && !"".equals(ename)){
				orgList.setOrgname(ename);
			}
			if(cid !=null && !"".equals(cid)){
				orgList.setCertnumber(cid);
			}
			//getPageParameters();
			getPageParameter();
			orgList.setStart(start);
			orgList.setPagesize(pagesize);
			list = orgService.selecteOrgList("com.wr4.domain.MotOrgInfo.getOrgList", orgList, offset,limit);
			//list2=orgService.selecteOrgList("com.wr4.domain.MotOrgInfo.getOrgList", orgList);
			 
			int count=getCount("com.wr4.domain.MotOrgInfo.getAllOrgList", orgList);
			writeLigerJson(list, count);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//判断是否有此类型证书
	public void getOrgList2(){
		List list = null;
		List list2=null;
		try {
			String adminmot=request.getSession().getAttribute("mot").toString();
			String bustype=request.getParameter("bustype");
			String userid=request.getParameter("userid");
			if(orgList==null){
				orgList=new OrgList();
			}
			orgList.setUserid(userid);
			orgList.setAdminmot(adminmot);
			orgList.setBustype(bustype);
			getPageParameters();
//			list = orgService.selecteOrgList("com.wr4.domain.MotOrgInfo.getOrgList2", orgList, offset,limit);
			list2=orgService.selecteOrgList("com.wr4.domain.MotOrgInfo.getOrgList2", orgList);
			if(list2.size()!=0){
				writer("error");
			}else{
				writer("ok");
			}
//			writeLigerJson(list, list2.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	/**
	 * 根据证书号查看详细信息
	 * @throws Exception 
	 */
	public void scanDetail() throws Exception{
		String id=request.getParameter("id");
		Map map=new HashMap();
		map.put("sqlId", "com.wr4.domain.MotOrgInfo.scanDetail");
		map.put("id", id);
		orgInfo = orgService.scanDetail(map);
		if (orgInfo != null ) {
			JSONArray jsonObject = JSONArray.fromObject(orgInfo);
			String js = jsonObject.toString();
			writer(js);
		}else{
			orgInfo=new OrgInfo();
			JSONArray jsonObject = JSONArray.fromObject(orgInfo);
			String js = jsonObject.toString();
			writer(js);
			}
	}
	
	public String export(){
		List<OrgInfo> list = null;
		XSSFWorkbook xwb = null;
		String xlsName=ServletActionContext.getServletContext().getRealPath("/");
		String xlsName1=xlsName+"reports/orgList.xls";
		String prpoFileName=xlsName+"reports/sysList.properties";
		String  str="org";
		try {
			//list = orgService.selecteOrgList("com.wr4.domain.MotOrgInfo.getOrgList", orgList, offset,limit);
			list = orgService.selecteOrgList("com.wr4.domain.MotOrgInfo.getOrgList1", orgList);
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

	public String getCertnumber() {
		return certnumber;
	}

	public void setCertnumber(String certnumber) {
		this.certnumber = certnumber;
	}

	public OrgService<OrgInfo> getOrgService() {
		return orgService;
	}

	public void setOrgService(OrgService<OrgInfo> orgService) {
		this.orgService = orgService;
	}

	public void setOrgList(OrgList orgList) {
		this.orgList = orgList;
	}


	public OrgInfo getOrgInfo() {
		return orgInfo;
	}


	public void setOrgInfo(OrgInfo orgInfo) {
		this.orgInfo = orgInfo;
	}

	
}

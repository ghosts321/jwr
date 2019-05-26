package com.wr4.action;

import java.awt.Color;
import java.awt.Font;
import java.io.File;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONArray;

import com.wr4.domain.OrgInfo;
import com.wr4.service.OrgService;
import com.wr4.util.CodeToCnUtil;
import com.wr4.util.DateUtils;
import com.wr4.util.ExportUtil;
import com.wr4.util.FontImage;

public class OrgInfoAction extends BaseAction{
	private OrgInfo orgInfo;
	private OrgService<OrgInfo> orgService;
	private String userId;
	private String busType;
	private String certType;

	public OrgInfo getOrgInfo() {
		return orgInfo;
	}

	public void setOrgInfo(OrgInfo orgInfo) {
		this.orgInfo = orgInfo;
	}

	public OrgService<OrgInfo> getOrgService() {
		return orgService;
	}

	public void setOrgService(OrgService<OrgInfo> orgService) {
		this.orgService = orgService;
	}

	/**
	 * 获取资质证书制发列表
	 */
	public void getOrgBookList(){
		List<OrgInfo> list = null;
		String flag = request.getParameter("flag");
		String adminmot=request.getSession().getAttribute("mot").toString();
		if(orgInfo==null){
			orgInfo=new OrgInfo();
		}
		orgInfo.setAdminmot(adminmot);
		int count=0;
		try {
			getPageParameter();
			orgInfo.setStart(start);
			orgInfo.setPagesize(pagesize);
			if("1".equals(flag)){
				list = orgService.selecteOrgBookList("com.wr4.domain.MotOrgInfo.getAuditOrg", orgInfo, offset,limit);
				count=getCount("com.wr4.domain.MotOrgInfo.getAuditOrgCount", orgInfo);
			}else{
				list = orgService.selecteOrgBookList("com.wr4.domain.MotOrgInfo.getOrgApply", orgInfo, offset,limit);
				count=getCount("com.wr4.domain.MotOrgInfo.getOrgApplyCount", orgInfo);
			}
			if (list != null && list.size() > 0) {
				JSONArray jsonObject = JSONArray.fromObject(list);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString() + ",Total:"
						+ count + "}";
				writer(js);
			}else{
				list=new ArrayList();
				JSONArray jsonObject = JSONArray.fromObject(list);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString() + ",Total:"
						+ count + "}";
				writer(js);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 根据用户id和业务类型查看详细信息
	 * @throws Exception 
	 */
	public void applyDetail() {
		Map map=new HashMap();
		map.put("sqlId", "com.wr4.domain.MotOrgInfo.applyDetail");
		String id=request.getParameter("id").toString();
		map.put("id", id);
		try{
		orgInfo = orgService.applyDetail(map);
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
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	
	/**
	 * 发证
	 * @throws Exception 
	 */
	public void grantBook() {
		try{
		Map map=new HashMap();
//		申请表userid
		map.put("userId", userId);
//		当前用户userid
		map.put("userid", request.getSession().getAttribute("userid").toString());
		String bustype=CodeToCnUtil.getBustypeCnVal(busType.trim());
		map.put("bustype", bustype);
		map.put("busType", busType);
		String usertype=request.getSession().getAttribute("usertype").toString();
		String pid=request.getParameter("pid");
		String applyid=request.getParameter("applyid").toString();
		String grade=request.getParameter("grade").toString();
		String copy=request.getParameter("copy").toString();
		String orgname=request.getParameter("orgname");
		String cid=request.getParameter("cid");
		String cdate=request.getParameter("cdate");
		String adminmot=request.getSession().getAttribute("mot").toString();
		map.put("grade", grade);
		map.put("usertype", usertype);
		map.put("pid", pid);
		map.put("applyid", applyid);
		map.put("copy", copy);
		map.put("orgname", orgname);
		map.put("adminmot", adminmot);
		map.put("cid", cid);
		map.put("cdate", cdate);
		List list=null;
		//查看证书号是否已被使用
		list= orgService.getMotYearReportAllList("com.wr4.domain.MotOrgInfo.selecteCertnumber", map);
		if(list.size()>0){
			writer("error");
		}else{
			Map mapResult=orgService.updateApplyCertNo("", orgService, map);
			String gradeCert="";
			String copyCert="";
			if("2".equals(mapResult.get("grade"))){
				gradeCert="二级";
			}else if("3".equals(mapResult.get("grade"))){
				gradeCert="三级";
			}
			if("1".equals(mapResult.get("copy"))){
				copyCert="正文";
			}else if("2".equals(mapResult.get("copy"))){
				copyCert="副本";
			}
			
			Calendar cal = Calendar.getInstance();//使用默认时区和语言环境获得一个日历。   
			
			//通过格式化输出日期   
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
			Date date1=null;
			date1 = format.parse(cdate);
			cal.setTime(date1);
			cal.add(Calendar.YEAR, 3);
			String endDate=format.format(cal.getTime());   
			SimpleDateFormat formats = new SimpleDateFormat("yyyyMMdd");  
			Date starts=formats.parse(((String) mapResult.get("cdate")).replaceAll("-", "")); 
			String dt=format.format(starts.getTime()) +" 至  "+endDate;
			 String realpath = ServletActionContext.getServletContext().getRealPath("/file");
			 String text[]={(String) mapResult.get("orgname"),(String) mapResult.get("bustype")
					 ,gradeCert,(String) mapResult.get("cid"),dt
					 ,(String) mapResult.get("cdate"),copyCert};
			 String sourceFilePath=realpath+File.separator+"cert-org.jpg";
			 Date date=new Date();
			 
			 String fileName=date.getTime()+".jpg";
			 String targetFilePath=realpath+File.separator+fileName;
			 //向图片上写字
			 FontImage.pressTextGroup(text ,targetFilePath,sourceFilePath, "宋体", Font.BOLD,  Color.BLACK,34);
			 mapResult.put("fileName", fileName);
				JSONArray jsonObject = JSONArray.fromObject(mapResult);
				String js = jsonObject.toString();
				response.setCharacterEncoding("utf-8");
				writer(js);
		}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void getOrgList(){
		List<OrgInfo> list = null;
		try {
			String para = new String(request.getParameter("orgName").getBytes("iso-8859-1"),"UTF-8");
			OrgInfo oi = new OrgInfo();
			oi.setOrgname(para);
			list = orgService.selectOrgList("com.wr4.domain.ProblemRec.getOrgInfo", oi);
			if (list != null && list.size()>0) {
				JSONArray jsonObject = JSONArray.fromObject(list);
				String js = jsonObject.toString();
				writer(js);
			}else{
				list = new ArrayList();
				JSONArray jsonObject = JSONArray.fromObject(list);
				String js = jsonObject.toString();
				writer(js);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public String export(){
		List<OrgInfo> list = null;
		XSSFWorkbook xwb = null;
		String xlsName=ServletActionContext.getServletContext().getRealPath("/");
		String xlsName1=xlsName+"reports/orgList.xls";
		String prpoFileName=xlsName+"reports/sysList.properties";
		String  str="orginfo";
		try {
			list = orgService.selecteOrgBookList("com.wr4.domain.MotOrgInfo.getOrgApply", orgInfo, offset,limit);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		File sourceFile = new File(xlsName1);
		 //建立导出到这个文件   
		ExportUtil eu=new ExportUtil();
		for(int i=0;i<list.size();i++){
			if("2".equals(list.get(i).getGrade())){
				list.get(i).setGrade("二级");
			}else if("3".equals(list.get(i).getGrade())){
				list.get(i).setGrade("三级");
			}
		}
		eu.exportFile(xlsName1, "orgList", list,  prpoFileName,str);
		return null;
	}
	/***
	 * 考评员登录，考评机构基本信息查询
	 */
	public void orgBaseInfo(){
		Map map = new HashMap();
		String orgname= request.getParameter("orgname");
		String orgcid=request.getParameter("orgcid");
		getPageParameter();
		if(!"".equals(orgname)&&!"".equals(orgcid)&&!"--".equals(orgcid)){
			map.put("orgname", orgname.trim());
			map.put("cid", orgcid.trim());
		}else{
			if("".equals(orgname)&&"".equals(orgcid)){
				map.put("orgname", orgname);
				map.put("cid", orgcid);
			}else if("".equals(orgname)&&!"".equals(orgcid)){
				map.put("orgname", null);
				map.put("cid", orgcid);
			}else if(!"".equals(orgname)&&"".equals(orgcid)){
				map.put("orgname", orgname);
				map.put("cid", null);
			}else if(!"".equals(orgname)&&"--".equals(orgcid)){
				map.put("orgname", orgname);
				map.put("cid", null);
			}
		}
		List listAll = null;
		List list =null;
		int count=0;
		try {
//			listAll = orgService.getOrgByConAll("com.wr4.domain.MotOrgInfo.getOrgByUserIdAndBustype", map);
			count=getCount("com.wr4.domain.MotOrgInfo.getOrgByUserIdAndBustypeCount", map);
			map.put("start", start);
			map.put("pagesize", pagesize);
			list = orgService.getOrgByCon("com.wr4.domain.MotOrgInfo.getOrgByUserIdAndBustype", map, offset, limit);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeLigerJson(list,count);
	}
	public void grantEnBook() {
		Map map=new HashMap();
//		申请表userid
		map.put("userId", userId);
//		当前用户userid
		map.put("auditername",request.getSession().getAttribute("username").toString());
		map.put("auditerdate",DateUtils.getDateFormatStr());
		map.put("userid", request.getSession().getAttribute("userid").toString());
		map.put("adminmot", request.getSession().getAttribute("mot").toString());
		map.put("filetype", "busclass");
		map.put("busType", busType);
		map.put("advice", request.getParameter("remark"));
		try {
		String	bustype=orgService.selecteBusName("com.wr4.domain.MotOrgInfo.selecteBusName",map);
		map.put("bustype", bustype);
		String usertype=request.getSession().getAttribute("usertype").toString();
		String pid=request.getParameter("pid");
		String cid=request.getParameter("cid");
		String cdate=request.getParameter("cdate");
		String applyid=request.getParameter("applyid").toString();
		String grade=request.getParameter("grade").toString();
		String copy=request.getParameter("copy").toString();
		String enname=request.getParameter("enname").toString();
		String respdate=request.getParameter("respdate").toString();
		map.put("grade", grade);
		map.put("usertype", usertype);
		map.put("pid", pid);
		map.put("cid", cid);
		map.put("cdate", cdate);
		map.put("copy", copy);
		map.put("enname", enname);
		map.put("applyid", applyid);
		SimpleDateFormat smdf = new SimpleDateFormat( "yyyy-MM-dd "); 
		Date start=smdf.parse(respdate);
		Date end=new Date();
		List list=null;
		//查看证书号是否已被使用
		list= orgService.getMotYearReportAllList("com.wr4.domain.MotOrgInfo.selecteCertnumber", map);
		if(list.size()>0){
			writer("errore");
		}else{
			//与受理日期相差天数
			long days=(end.getTime()-start.getTime())/86400000;
			if(days>7){
				Map mapResult=orgService.updateEnApplyCertNo("", orgService, map);
				String gradeCert="";
				String copyCert="";
				if("2".equals(mapResult.get("grade"))){
					gradeCert="二级";
				}else if("3".equals(mapResult.get("grade"))){
					gradeCert="三级";
				}
				if("1".equals(mapResult.get("copy"))){
					copyCert="正文";
				}else if("2".equals(mapResult.get("copy"))){
					copyCert="副本";
				}
				Calendar cal = Calendar.getInstance();//使用默认时区和语言环境获得一个日历。   
				
				//通过格式化输出日期   
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");  
				Date date1=null;
				date1 = format.parse(cdate);
				cal.setTime(date1);
				cal.add(Calendar.YEAR, 3);
				String endDate=format.format(cal.getTime());   
				SimpleDateFormat formats = new SimpleDateFormat("yyyyMMdd");  
				Date starts=formats.parse(((String) mapResult.get("cdate")).replaceAll("-", "")); 
				String dt=format.format(starts.getTime()) +" 至  "+endDate;
				 String realpath = ServletActionContext.getServletContext().getRealPath("/file");
				 String text[]={(String) mapResult.get("enname"),(String) mapResult.get("bustype")
						 ,gradeCert,(String) mapResult.get("cid"),dt
						 ,(String) mapResult.get("cdate"),copyCert};
				 String sourceFilePath=realpath+File.separator+"cert-en.jpg";
				 Date date=new Date();
				 
				 String fileName=date.getTime()+".jpg";
				 String targetFilePath=realpath+File.separator+fileName;
				 //向图片上写字
				 FontImage.pressTextGroup(text ,targetFilePath,sourceFilePath, "宋体", Font.BOLD,  Color.BLACK,34);
				 mapResult.put("fileName", fileName);
				
					JSONArray jsonObject = JSONArray.fromObject(mapResult);
					String js = jsonObject.toString();
					response.setCharacterEncoding("utf-8");
					writer(js);
			}else{
				//受理天数至今少于7天
				writer("error");
			}
		}
		
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 聘用考评员
	 * zhangli 
	 * 更新考评员申请表    所属考评机构  专职还是兼职
	 */
	public void employPn(){
		try{
			String isbol=request.getParameter("isbol");//是否兼职     PARTTIME
			String id=request.getParameter("id");//主键  id
			String attrorg=request.getSession().getAttribute("paperid").toString();
			String parttime="";
			//  专职  兼职
 			if("0".equals(isbol)){
 				parttime="专职";
			}else{
				parttime="兼职";	
			}
 			Map map=new HashMap();
 			map.put("parttime", parttime);
 			map.put("attrorg", attrorg);
 			map.put("employdate", DateUtils.getDateFormatString());
 			map.put("id", id);
 			int i=(Integer) orgService.updateEmployPn("com.wr4.domain.MotOrgInfo.updateEmployPn",  map);
 			if(i>0){
 				writer("yes");
 			}else{
 				writer("聘用失败，请重试！");
 			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 *  解聘考评员
	 * zhangli 
	 *  
	 */
	public void unEmployPn(){
		try{
//			String isbol=request.getParameter("isbol");//是否兼职     PARTTIME
			String id=request.getParameter("id");//主键  id
			String attrorg=request.getSession().getAttribute("paperid").toString();
			String parttime="";
			//  专职  兼职
// 			if("0".equals(isbol)){
// 				parttime="专职";
//			}else{
//				parttime="兼职";	
//			}
 			Map map=new HashMap();
 			map.put("parttime", parttime);
 			map.put("attrorg", attrorg);
 			map.put("employdate", DateUtils.getDateFormatString());
 			map.put("id", id);
 			int i=(Integer) orgService.updateEmployPn("com.wr4.domain.MotOrgInfo.updateUnEmployPn",  map);
 			if(i>0){
 				writer("yes");
 			}else{
 				writer("聘用失败，请重试！");
 			}
		}catch(Exception e){
			e.printStackTrace();
		}
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

	public String getCertType() {
		return certType;
	}

	public void setCertType(String certType) {
		this.certType = certType;
	}
	
}

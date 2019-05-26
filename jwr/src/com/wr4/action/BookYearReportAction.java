package com.wr4.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONArray;

import com.wr4.domain.Examine;
import com.wr4.domain.ExchangeInfo;
import com.wr4.domain.OrgInfo;
import com.wr4.domain.OrgYearReport;
import com.wr4.service.OrgManageService;
import com.wr4.util.DateUtils;

public class BookYearReportAction extends BaseAction{
	
	private OrgManageService orgManageService;
	
	private OrgYearReport orgYearReport;
	
	private String s=SUCCESS;
	
	/**
	 * 返回到bookInfo.jsp
	 * @return
	 */
	public String bookYearReport(){
		return s;
	}

	/**
	 * 获取年度工作报告列表
	 */
	public void getBookYearReportList(){
		String adminmot=request.getSession().getAttribute("mot").toString();
		String userid=request.getSession().getAttribute("userid").toString();
		Map map=new HashMap();
		map.put("adminmot", adminmot);
		map.put("userid", userid);
		List list;
		try {
			getPageParameters();
			list = orgManageService.getBookYearReportList("com.wr4.domain.OrgOrgInfo.getBookYearReportList",map,offset,limit);
			int count=getCount("com.wr4.domain.OrgOrgInfo.getBookYearReportListCount",map);
			//调用公共方法组合 json向前台输出
			writeLigerJson(list,count);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 考评机构自身获取年度工作报告列表
	 */
	public void getBookYearReportListByUserId(){
		String adminmot=request.getSession().getAttribute("mot").toString();
		String userid=request.getSession().getAttribute("userid").toString();
		Map map=new HashMap();
		map.put("adminmot", adminmot);
		map.put("userid", userid);
		List list;
		try {
			getPageParameter();
			map.put("start", start);
			map.put("pagesize", pagesize);
			list = orgManageService.getBookYearReportList("com.wr4.domain.OrgOrgInfo.getBookYearReportListByUserId",map,offset,limit);
			int count=getCount("com.wr4.domain.OrgOrgInfo.getBookYearReportListByUserIdCount",map);
			//调用公共方法组合 json向前台输出
			writeLigerJson(list,count);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 保存年度工作 报告
	 * @return
	 */
	public String saveYearReport(){
		try {
			System.out.println("dsadasdas");
			orgYearReport=new OrgYearReport();
			String fileName=request.getParameter("fileName");
			String createdate=DateUtils.getDateFormatString().substring(0,19);
//			String realpath = ServletActionContext.getServletContext().getRealPath("/images");
//			String url=realpath+"\\"+fileName;
			//pid session中获取 
			String pid=request.getSession().getAttribute("userid").toString();
			String year=DateUtils.getThisYear();
			orgYearReport.setCreatedate(createdate);
			orgYearReport.setFreport(fileName);
			orgYearReport.setUserid(pid);
			orgYearReport.setYear(year);
			orgManageService.saveYearReport("com.wr4.domain.OrgOrgInfo.saveYearReport",orgYearReport);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "save";
	}
	
	/**
	 * 下载年度工作报告
	 * @return
	 */
	public void downloadReport(){
		try {
	    String realpath = ServletActionContext.getServletContext().getRealPath("/images");
        //D:\apache-tomcat-6.0.18\webapps\struts2_upload\images
		String fileName=new String(request.getParameter("fileName").getBytes("iso-8859-1"),"utf-8").toString();
		File file = new File(realpath+File.separator+fileName);// path是根据日志路径和文件名拼接出来的
	    String filename = file.getName();// 获取日志文件名称
	    InputStream fis = new BufferedInputStream(new FileInputStream(realpath+File.separator+fileName));
	    byte[] buffer = new byte[fis.available()];
	    fis.read(buffer);
	    fis.close();
	    response.reset();
//	     先去掉文件名称中的空格,然后转换编码格式为utf-8,保证不出现乱码,这个文件名称用于浏览器的下载框中自动显示的文件名
	    response.addHeader("Content-Disposition", "attachment;filename=" + new String(filename.replaceAll(" ", "").getBytes("iso8859-1"),"utf-8"));
	    response.addHeader("Content-Length", "" + file.length());
	    OutputStream os = new BufferedOutputStream(response.getOutputStream());
	    response.setContentType("application/octet-stream");
	    os.write(buffer);// 输出文件
	    os.flush();
	    os.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public OrgManageService getOrgManageService() {
		return orgManageService;
	}

	public void setOrgManageService(OrgManageService orgManageService) {
		this.orgManageService = orgManageService;
	}

	public OrgYearReport getOrgYearReport() {
		return orgYearReport;
	}

	public void setOrgYearReport(OrgYearReport orgYearReport) {
		this.orgYearReport = orgYearReport;
	}

}


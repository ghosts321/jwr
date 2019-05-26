package com.wr4.action;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.wr4.domain.NameReport;
import com.wr4.service.NameReportService;
import com.wr4.util.DateUtils;

public class NameReportAction extends BaseAction{
	private NameReport nameReport;
	private NameReportService<NameReport> nameReportService;
	public void setNameReport(NameReport nameReport) {
		this.nameReport = nameReport;
	}
	public NameReport getNameReport() {
		return nameReport;
	}
	public void setNameReportService(NameReportService<NameReport> nameReportService) {
		this.nameReportService = nameReportService;
	}
	public NameReportService<NameReport> getNameReportService() {
		return nameReportService;
	}
	
	/**
	 * 跳转到list页面
	 * @return
	 */
	public String motList(){
		
		return "nameReportList";
	}
	public String getNameReportList(){
		List<NameReport> list = null;
		
		Map map = new HashMap();
		map.put("adminmot", request.getSession().getAttribute("mot").toString());
		try{	
			getPageParameters();
			//list =nameReportService.getNameReportList("com.wr4.domain.NameReport.selectNameReport", map, offset, limit);
			List listall =nameReportService.getNameReportList("com.wr4.domain.NameReport.selectNameReport", map);
			writeLigerJson(listall, listall.size());
		}catch(Exception e){
			e.printStackTrace();
			
		}
		return null;
		
	}
	/**
	 * 新增实名举报
	 * @return
	 */
	public String nameReportInsert(){
		try{
			//String userid=request.getSession().getAttribute("userid").toString();
			String userid=request.getSession().getAttribute("userid") ==null ?"":request.getSession().getAttribute("userid").toString();
			nameReport.setUserid(userid);
			nameReport.setCreatedate(DateUtils.getDateFormatString());
//			String adminmot = request.getParameter("adminmot") == null?"":request.getParameter("adminmot").toString();
//			nameReport.setAdminmot(adminmot);
			int i = nameReportService.NReportAdd("com.wr4.domain.NameReport.insertNameReport", nameReport);
			if(i>0){
				request.setAttribute("msg", "yes");
//				writer("ok");
			}else{
				request.setAttribute("msg", "添加失败，请联系系统管理员！");
//				writer("no");
			}
			
		}catch(Exception e){
			request.setAttribute("msg", "添加失败，请联系系统管理员！");
			e.printStackTrace();
		}
		return "addNameReport";
	}
	/**
	 * 查看实名举报信息
	 * @return
	 */
	public void nameReportDetail(){
		try{
			Map map = new HashMap();
			String id=request.getParameter("id").toString();
			map.put("id", id);
			NameReport nameReport  = nameReportService.selectNameReportById("com.wr4.domain.NameReport.getNameReportDetail", map);
			JSONArray jsonObject = JSONArray.fromObject(nameReport);
			String js = jsonObject.toString();
			writer(js);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void updateNReportById(){
		try{
			Map map = new HashMap();
			String id=request.getParameter("id").toString();
//			String advice = request.getParameter("advice");
			String advice =  request.getParameter("advice");
			String createdate = DateUtils.getDateFormatString();
			String zforg = request.getParameter("zforg");
			map.put("id", id);
			map.put("advice", advice);
			map.put("createdate", createdate);
			map.put("zforg", zforg);
			int result  = nameReportService.updateNameReportById("com.wr4.domain.NameReport.updateNameReport", map);
			if(result==0){
				writer("error");
			}else{
				writer("ok");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}

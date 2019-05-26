package com.wr4.action;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import com.wr4.domain.EnInfo;
import com.wr4.domain.YearReport;
import com.wr4.service.EnService;

public class EnYearReportAction extends BaseAction{
	private EnService<EnInfo> enService;
	private YearReport yearReport;

	public EnService<EnInfo> getEnService() {
		return enService;
	}

	public void setEnService(EnService<EnInfo> enService) {
		this.enService = enService;
	}
	
	public YearReport getYearReport() {
		return yearReport;
	}

	public void setYearReport(YearReport yearReport) {
		this.yearReport = yearReport;
	}

	public void getYearReportList(){
		List<EnInfo> list = null;
		try {
			getPageParameter();
			if(yearReport==null){
				yearReport=new YearReport();
			}
			String userId=request.getSession().getAttribute("userid").toString();
			yearReport.setUserId(userId);
			yearReport.setAdminmot(request.getSession().getAttribute("mot").toString());
			yearReport.setStart(start);
			yearReport.setPagesize(pagesize);
			list = enService.getYearReport("com.wr4.domain.YearReport.getYearReport", yearReport, offset,limit);
			int count=getCount("com.wr4.domain.YearReport.getYearReportCount", yearReport);
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
	public void getYearReportListByUserid(){
		List<EnInfo> list = null;
		try {
			getPageParameter();
			if(yearReport==null){
				yearReport=new YearReport();
			}
			String userId=request.getSession().getAttribute("userid").toString();
			yearReport.setUserId(userId);
			yearReport.setAdminmot(request.getSession().getAttribute("mot").toString());
			yearReport.setStart(start);
			yearReport.setPagesize(pagesize);
			list = enService.getYearReport("com.wr4.domain.YearReport.getYearReportByUserId", yearReport, offset,limit);
			int count=getCount("com.wr4.domain.YearReport.getYearReportByUserIdCount", yearReport);
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
	 * 企业上传年度工作报告
	 */
	public String enYearReport() {
		return  "enYearPort";
	}
}

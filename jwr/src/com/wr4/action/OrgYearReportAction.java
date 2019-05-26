package com.wr4.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.wr4.domain.EnInfo;
import com.wr4.domain.OrgYearReport;
import com.wr4.domain.YearReport;
import com.wr4.service.EnService;
import com.wr4.service.OrgService;

public class OrgYearReportAction extends BaseAction{
	private OrgService orgService;
	private OrgYearReport orgYearReport;

	public void getYearReportList(){
		List list = null;
		try {
			getPageParameters();
			list = orgService.getYearReport("com.wr4.domain.MotOrgInfo.getYearReport", orgYearReport, offset,limit);
			int count=getCount("com.wr4.domain.MotOrgInfo.getYearReportCount", orgYearReport);
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
	 * 主管机关获取年度报告
	 * @return
	 */
	public void getMotYearReportList(){
		List list = null;
		List allList=null;
		try {
			getPageParameter();
			Map map=new HashMap();
			map.put("start", start);
			map.put("pagesize", pagesize);
			map.put("adminmot", request.getSession().getAttribute("mot").toString());
			list = orgService.getMotYearReportList("com.wr4.domain.MotOrgInfo.getMotYearReportList", map, offset,limit);
//			allList=orgService.getMotYearReportAllList("com.wr4.domain.MotOrgInfo.getMotYearReportList", map);
			int count=getCount("com.wr4.domain.MotOrgInfo.getMotYearReportListCount", map);
			writeLigerJson(list,count);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 *考评情况汇总
	 * @return
	 */
	public void getWorkProList(){
		List list = null;
		List allList=null;
		try{
			getPageParameter();
			Map map=new HashMap();
			String adminmot=request.getSession().getAttribute("mot").toString();
			map.put("adminmot", adminmot);
			map.put("start", start);
			map.put("pagesize", pagesize);
			list = orgService.getWorkProList("com.wr4.domain.MotOrgInfo.getWorkProList", map, offset,limit);
//			allList=orgService.getWorkProAllList("com.wr4.domain.MotOrgInfo.getWorkProList", map);
			int count=getCount("com.wr4.domain.MotOrgInfo.getWorkProListCount", map);
			writeLigerJson(list, count);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public OrgService getOrgService() {
		return orgService;
	}

	public void setOrgService(OrgService orgService) {
		this.orgService = orgService;
	}

	public OrgYearReport getOrgYearReport() {
		return orgYearReport;
	}

	public void setOrgYearReport(OrgYearReport orgYearReport) {
		this.orgYearReport = orgYearReport;
	}
}

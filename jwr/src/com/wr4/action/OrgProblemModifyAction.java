package com.wr4.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.wr4.domain.EnInfo;
import com.wr4.domain.OrgInfo;
import com.wr4.domain.ProblemRec;
import com.wr4.domain.RecNotice;
import com.wr4.service.EnService;
import com.wr4.service.OrgService;
import com.wr4.util.DateUtils;

public class OrgProblemModifyAction extends BaseAction{
	private EnService enService;
	private OrgService orgService;
	private ProblemRec problemRec;
	private OrgInfo orgInfo;
	

	public EnService getEnService() {
		return enService;
	}

	public void setEnService(EnService enService) {
		this.enService = enService;
	}
	
	public ProblemRec getProblemRec() {
		return problemRec;
	}

	public void setProblemRec(ProblemRec problemRec) {
		this.problemRec = problemRec;
	}

	public void getOrgInfo(){
		String certnumber = request.getParameter("certNumber");
		try {
			Map map=new HashMap();
			map.put("certnumber", certnumber);
			orgInfo= orgService.getOrgInfo("com.wr4.domain.MotOrgInfo.getOrgInfo", map);
			if (orgInfo != null && !orgInfo.equals("")) {
				JSONArray jsonObject = JSONArray.fromObject(orgInfo);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString()+ "}";
				writer(js);
			}else{
				OrgInfo orgInfo=new OrgInfo();
				JSONArray jsonObject = JSONArray.fromObject(orgInfo);
				String js = jsonObject.toString();
				js = "";
				writer(js);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void saveProblem(){
		String value = request.getParameter("value").toString();
		String pid = request.getParameter("userid").toString();
		String userid = request.getParameter("userid").toString();
//		String tzusertype=request.getParameter("tzusertype");
		String userId = request.getSession().getAttribute("userid")+"";
//		String userId = request.getParameter("userid")+"";
		String usertype = request.getSession().getAttribute("usertype")+"";
		String curDate=DateUtils.getDateFormatString();
		String motPid=request.getSession().getAttribute("paperid").toString();
		int result;
		try {
			RecNotice rec = new RecNotice();
			rec.setAdmin_userId(userId);
			rec.setCreateDate(curDate);
			rec.setUserId(pid);
			rec.setUserType(usertype);
			rec.setAdvice_Refine(value);
			rec.setAdminmot(motPid);
			rec.setTzusertype("org") ;
			//返回1插入成功
			int flag = orgService.saveRecNotice("com.wr4.domain.MotOrgInfo.saveProblem", rec);
			if(flag==1){
				result=0;
			}else{
				result=1;
			}
			JSONArray jsonObject = JSONArray.fromObject(result);
			String js = jsonObject.toString();
			writer(js);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public OrgService getOrgService() {
		return orgService;
	}

	public void setOrgService(OrgService orgService) {
		this.orgService = orgService;
	}

	public void setOrgInfo(OrgInfo orgInfo) {
		this.orgInfo = orgInfo;
	}
}


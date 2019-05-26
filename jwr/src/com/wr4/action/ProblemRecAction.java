package com.wr4.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;

import com.wr4.domain.EnInfo;
import com.wr4.domain.ProblemRec;
import com.wr4.domain.RecNotice;
import com.wr4.service.EnService;
import com.wr4.util.DateUtils;

public class ProblemRecAction extends BaseAction{
	private EnService enService;
	private ProblemRec problemRec;

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

	public void getEnInfo(){
		String para = request.getParameter("certNumber");
		try {
			ProblemRec pr = new ProblemRec();
			pr.setCid(para);
			pr= enService.getEnInfo("com.wr4.domain.ProblemRec.getEnInfo", pr);
			if (pr != null && !pr.equals("")) {
				JSONArray jsonObject = JSONArray.fromObject(pr);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString()+ "}";
				writer(js);
			}else{
				ProblemRec pr1=new ProblemRec();
				JSONArray jsonObject = JSONArray.fromObject(pr1);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString() +  "}";
				writer(js);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void getCertInfo(){
		try {
			String para = new String(request.getParameter("certNumber").getBytes("iso-8859-1"),"utf-8");
			String mot = request.getSession().getAttribute("mot")+"";
			List list;
			ProblemRec pr = new ProblemRec();
			pr.setCid(para);
			pr.setAdminMot(mot);
			list = enService.getCertInfo("com.wr4.domain.ProblemRec.getCertInfo", pr);
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
	
	/**
	 * 考评机构从联想查询
	 */
	public void getCertInfo1(){
		try {
			String para = new String(request.getParameter("certNumber").getBytes("iso-8859-1"),"utf-8");
			List list;
			ProblemRec pr = new ProblemRec();
			String logincode=request.getSession().getAttribute("mot").toString();
			pr.setCid(para);
			pr.setAdminMot(logincode);
			list = enService.getCertInfo("com.wr4.domain.ProblemRec.getCertInfo1", pr);
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
	
	public void getOrgInfo(){
		String para = request.getParameter("certNumber");
		List list;
		try {
			ProblemRec pr = new ProblemRec();
			pr.setCid(para);
			list = enService.getCertInfo("com.wr4.domain.ProblemRec.getOrgInfo", pr);
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
	public void saveProblemRec(){
		String value = request.getParameter("value");
		String cid = request.getParameter("cid");
		String tzusertype=request.getParameter("tzusertype");
		String userId = request.getSession().getAttribute("userid")+"";
		String userType = request.getSession().getAttribute("usertype")+"";
		String userid=request.getParameter("userId");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		int result;
		try {
			RecNotice rec = new RecNotice();
			rec.setAdminmot(request.getSession().getAttribute("mot").toString());
			rec.setAdmin_userId(userId);
			rec.setCreateDate(DateUtils.getDateFormatString());
			rec.setUserId(userid);
			rec.setUserType(userType);
			rec.setAdvice_Refine(value);
			rec.setTzusertype("en") ;
			boolean flag = enService.saveRecNotice("com.wr4.domain.ProblemRec.save", rec);
			if(flag==true){
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
	public void getRecInfos(){
		List list;
		String userId = request.getSession().getAttribute("userid")+"";
		String userType = request.getSession().getAttribute("usertype")+"";
		RecNotice rec = new RecNotice();
		try {
			rec.setUserId(userId);
			rec.setTzusertype(userType);
			list = enService.getRecListInfos("com.wr4.domain.ProblemRec.getRecList", rec);
			if (list != null && list.size()>0) {
				JSONArray jsonObject = JSONArray.fromObject(list);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString()+ "}";
				writer(js);
			}else{
				list = new ArrayList();
				JSONArray jsonObject = JSONArray.fromObject(list);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString()+ "}";
				writer(js);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void saveRecReport(){
		try {
			String id = request.getParameter("stid");
			String fileName = new String(request.getParameter("fileName").getBytes("iso-8859-1"),"utf-8").toString();
			RecNotice rec = new RecNotice();
			rec.setRefine_doc(fileName);
			rec.setId(Integer.parseInt(id));
			rec.setRespdate_Refine(DateUtils.getDateFormatString());
			boolean bol=enService.saveRecReport("com.wr4.domain.ProblemRec.saveRecReport", rec);
			if(bol){
				this.writer("yes");
			}else{
				this.writer("提交失败，请与系统管理员联系");
			}
		} catch (Exception e) {
			try {
				this.writer("提交失败，请与系统管理员联系");
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
	}
	
}


package com.wr4.action;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.wr4.domain.EnInfo;
import com.wr4.domain.PnApply;
import com.wr4.service.CertificateService;
import com.wr4.service.IExchangeCertService;
import com.wr4.util.CodeToCnUtil;
import com.wr4.util.DateUtils;

public class ExchangeCertAction extends BaseAction {
	private IExchangeCertService iExchangeCertService;
	private CertificateService certificateService;
	
	public CertificateService getCertificateService() {
		return certificateService;
	}
	public void setCertificateService(CertificateService certificateService) {
		this.certificateService = certificateService;
	}
	public IExchangeCertService getiExchangeCertService() {
		return iExchangeCertService;
	}
	public void setiExchangeCertService(IExchangeCertService iExchangeCertService) {
		this.iExchangeCertService = iExchangeCertService;
	}
	/***
	 * 考评员换证申请拥有证书列表
	 */
	public void getCertByUserId(){
		String userid = request.getSession().getAttribute("userid").toString();
		try {
			List list = iExchangeCertService.getCertByUserid("certrevocation.getCertByUserId", userid);
			if (list != null && list.size() > 0) {
				JSONArray jsonObject = JSONArray.fromObject(list);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString() + ",Total:"
						+ list.size() + "}";
				writer(js);
			} else {
				list = new ArrayList();
				JSONArray jsonObject = JSONArray.fromObject(list);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString() + ",Total:"
						+ list.size() + "}";
				writer(js);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/***
	 * 考评员换证申请已申请换证列表
	 */
	public void applyedData(){
		String userid = request.getSession().getAttribute("userid").toString();
		try {
			List list = iExchangeCertService.getCertByUserid("certrevocation.applyedData", userid);
			if (list != null && list.size() > 0) {
				JSONArray jsonObject = JSONArray.fromObject(list);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString() + ",Total:"
						+ list.size() + "}";
				System.out.println(js);
				writer(js);
			} else {
				list = new ArrayList();
				JSONArray jsonObject = JSONArray.fromObject(list);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString() + ",Total:"
						+ list.size() + "}";
				writer(js);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/***
	 * 企业换证申请拥有证书列表
	 */
	public void getEnCertByUserId(){
		String userid = request.getSession().getAttribute("userid").toString();
		try {
			List list = iExchangeCertService.getCertByUserid("certrevocation.getEnCertByUserId", userid);
			if (list != null && list.size() > 0) {
				JSONArray jsonObject = JSONArray.fromObject(list);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString() + ",Total:"
						+ list.size() + "}";
				writer(js);
			} else {
				list = new ArrayList();
				JSONArray jsonObject = JSONArray.fromObject(list);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString() + ",Total:"
						+ list.size() + "}";
				writer(js);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/***
	 * 企业换证申请已申请换证列表
	 */
	public void enapplyedData(){
		String userid = request.getSession().getAttribute("userid").toString();
		try {
			List list = iExchangeCertService.getCertByUserid("certrevocation.enapplyedData", userid);
			if (list != null && list.size() > 0) {
				JSONArray jsonObject = JSONArray.fromObject(list);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString() + ",Total:"
						+ list.size() + "}";
				writer(js);
			} else {
				list = new ArrayList();
				JSONArray jsonObject = JSONArray.fromObject(list);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString() + ",Total:"
						+ list.size() + "}";
				writer(js);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/*
	 * 考评员换证申请提交
	 */
	public void exchangeSubmit(){
		String userid = request.getParameter("userid");
		String record = request.getParameter("record");
		JSONObject json = JSONObject.fromObject(record);
		System.out.println(json.toString());
		String bustype ="";
		String changereason = "";
		try {
			bustype = URLDecoder.decode(request.getParameter("bustype"),"UTF-8");
			bustype = CodeToCnUtil.getBustypeCode(bustype)==null?bustype:CodeToCnUtil.getBustypeCode(bustype);
			changereason = URLDecoder.decode(request.getParameter("changereason"),"UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		Map map = new HashMap();
		map.put("userid", userid);
		map.put("bustype", bustype);
		map.put("changereason", changereason);
		
		map.put("beginfile",json.get("beginfile"));
		map.put("cid",json.get("cid"));
		map.put("workdoc",json.get("workdoc"))     ;
		map.put("fromaddress",json.get("fromaddress")) ;
		map.put("city",json.get("city")) ;
		map.put("createdate",json.get("cdate"))  ;
		map.put("adminmot2",json.get("admin2"))   ;
		map.put("pcode",json.get("pcode"))       ;
		map.put("proof",json.get("proof"))       ;
		map.put("edu",json.get("edu"))         ;
		map.put("pid",json.get("pid"))         ;
		map.put("pnname",json.get("pnname"))      ;
		map.put("train",json.get("train"))       ;
		map.put("proofmobile ",json.get("proofmobile"));
		map.put("prof",json.get("prof"))        ;
		map.put("org",json.get("org"))         ;
		map.put("photo",json.get("photo"))       ;
		map.put("title",json.get("title"))       ;
		map.put("import_date ",json.get("import_date"));
		map.put("begindate",json.get("begindate"))   ;
		map.put("perf",json.get("perf"))        ;
		map.put("titlefile",json.get("titlefile"))   ;
		map.put("proof2",json.get("proof2"))      ;
		map.put("perf2",json.get("perf2"))       ;
		map.put("proof3",json.get("proof3"))      ;
		map.put("email",json.get("email"))       ;
		map.put("bussinestype",json.get("certtype"));
		map.put("fax",json.get("fax"))         ;
		map.put("major",json.get("major"))       ;
		map.put("prooforg",json.get("prooforg"))    ;
		map.put("address",json.get("address"))     ;
		map.put("mobile",json.get("mobile"))      ;
		map.put("from2",json.get("from2"))       ;
		map.put("proofname",json.get("proofname"))   ;
		map.put("adminmot",json.get("adminmot"))    ;
		map.put("tel",json.get("tel"))         ;
		map.put("userid",json.get("userid"))      ;
		map.put("attrorg",json.get("attrorg"))     ;
		map.put("employdate",json.get("employdate"))  ;
		map.put("unemploydate",json.get("unemploydate"));
		map.put("parttime",json.get("parttime"))    ;
		map.put("applytype","2")   ;//定死2代表换证申请
		map.put("proofb",json.get("proofb"))      ;
		map.put("renew",changereason)      ;
		boolean flag = false;
		String msg = "yes";
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			flag = iExchangeCertService.exchangeSubmit("com.wr4.domain.PnInfo.insertPnApply", map);
			if(!flag){
				msg = "no";
			}
		} catch (Exception e) {
			msg = "no";
			e.printStackTrace();
		}
		request.setAttribute("msg", msg);
		pw.write(msg);
	}
	/*
	 * 企业换证申请提交
	 */
	public void enexchangeSubmit(){
		String indexdata = request.getParameter("indexdata");
		 JSONObject js=JSONObject.fromObject(indexdata);
		 EnInfo enin=(EnInfo) JSONObject.toBean(js,EnInfo.class );
		  String renew=request.getParameter("renew");
		  enin.setReNew(renew);
		 enin.setApplyType("2");
		 enin.setOrgId(js.getString("orgid"));
		 enin.setOrgId1(js.getString("orgid1"));
		 enin.setUserId(js.getString("userid"));
		 enin.setCid(js.getString("certnumber"));
		 enin.setDate(DateUtils.getDateFormatString());
		boolean flag = false;
		String msg = "yes";
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			flag = iExchangeCertService.enexchangeSubmit("com.wr4.domain.MotEnInfo.insertEnExchangeApply", enin);
			if(!flag){
				msg = "no";
			}
		} catch (Exception e) {
			msg = "no";
			e.printStackTrace();
		}
		request.setAttribute("msg", msg);
		pw.write(msg);
	}
	/***
	 * 考评员资质申请详细信息
	 */
	public void getDetialById(){
		String id = request.getParameter("id");
		try {
			PnApply pnApply = iExchangeCertService.getDetialById("com.wr4.domain.CertificateInfo.getDetialById", id);
			if (pnApply != null) {
				JSONArray jsonObject = JSONArray.fromObject(pnApply);
				String js = jsonObject.toString();
				writer(js);
			} else {
				PnApply pnApply1 = new PnApply();
				JSONArray jsonObject = JSONArray.fromObject(pnApply1);
				String js = jsonObject.toString();
				writer(js);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

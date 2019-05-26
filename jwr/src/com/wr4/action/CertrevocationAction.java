package com.wr4.action;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;


import com.wr4.domain.CertInfo;
import com.wr4.domain.PnInfo;
import com.wr4.domain.ProblemRec;
import com.wr4.service.ICertrevocationService;

public class CertrevocationAction extends BaseAction{
	private String certnumber;
	private CertInfo certInfo = new CertInfo();
	private PnInfo pnInfo;
	private List<CertInfo> list;
	private ICertrevocationService<CertInfo> iCertrevocationService;
	
	public String getCertnumber() {
		return certnumber;
	}

	public void setCertnumber(String certnumber) {
		this.certnumber = certnumber;
	}

	public CertInfo getCertInfo() {
		return certInfo;
	}

	public void setCertInfo(CertInfo certInfo) {
		this.certInfo = certInfo;
	}

	public List<CertInfo> getList() {
		return list;
	}

	public void setList(List<CertInfo> list) {
		this.list = list;
	}

	public ICertrevocationService<CertInfo> getiCertrevocationService() {
		return iCertrevocationService;
	}

	public void setiCertrevocationService(
			ICertrevocationService<CertInfo> iCertrevocationService) {
		this.iCertrevocationService = iCertrevocationService;
	}
	/***
	 * 证书撤销联想列表Action
	 */
	public void certrevocation(){
		try {
			String para = new String(request.getParameter("certnumber").getBytes("iso-8859-1"),"utf-8");
			String logincode=request.getSession().getAttribute("mot").toString();
			certInfo.setCertnumber(para);
			certInfo.setLogincode(logincode);
			list = iCertrevocationService.selectCertByCid("certrevocation.getCertInfo", certInfo);
			if (list != null && list.size()>0) {
				JSONArray jsonObject = JSONArray.fromObject(list);
				String js = jsonObject.toString();
				writer(js);
			}else{
				list = new ArrayList<CertInfo>();
				JSONArray jsonObject = JSONArray.fromObject(list);
				String js = jsonObject.toString();
				writer(js);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/***
	 * （主管机关登录）考评员证书撤销点击查询时下面详细信息action
	 */
	public void getPnInfo(){
		String para = request.getParameter("certnumber");
		/*if(para.split(":")[1]!=null){
			para=para.split(":")[1];
		}*/
		certInfo.setCertnumber(para);
		try {
			pnInfo = iCertrevocationService.selectPnInfo("certrevocation.getPnInfo", certInfo);
			if (pnInfo != null && !pnInfo.equals("")) {
				JSONArray jsonObject = JSONArray.fromObject(pnInfo);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString()+ "}";
				writer(js);
			}else{
				/*PnInfo pnInfo=new PnInfo();
				JSONArray jsonObject = JSONArray.fromObject(pnInfo);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString() +  "}";*/
				writer("");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}


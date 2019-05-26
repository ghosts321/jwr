package com.wr4.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.wr4.domain.CertInfo;
import com.wr4.domain.MotInfo;
import com.wr4.domain.OrgInfo;
import com.wr4.domain.ValueTextBustype;
import com.wr4.service.IMotService;
import com.wr4.service.OrgManageService;

public class BookInfoAction extends BaseAction{
	
	private OrgManageService orgManageService;
	private IMotService<MotInfo> motService;
	
	private String s=SUCCESS;
	
	public IMotService<MotInfo> getMotService() {
		return motService;
	}

	public void setMotService(IMotService<MotInfo> motService) {
		this.motService = motService;
	}
	/**
	 * 返回到bookInfo.jsp
	 * @return
	 */
	public String bookInfo(){
		return s;
	}

	/**
	 * 获取换证列表
	 */
	public String getBookList(){
		//pid应在sessio获取
		String pid=request.getSession().getAttribute("paperid").toString();
		Map map=new HashMap();
		map.put("pid", pid);
		List<OrgInfo> list = null;
		try {
			getPageParameters();
			list = orgManageService.getBookChange("com.wr4.domain.OrgOrgInfo.getBookChange", map, offset,limit);
			int count=getCount("com.wr4.domain.OrgOrgInfo.getBookCountChange", map);
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
		return null;
	}
	
	/**
	 *获取证书变更列表信息 
	 */
	public void getBookDetailList(){
		List<OrgInfo> list = null;
		Map map = new HashMap();
		map.put("cid", request.getParameter("certnumber").toString());
		map.put("pid", request.getSession().getAttribute("paperid").toString());
		try {
			getPageParameters();
			list = orgManageService.getBookChange("com.wr4.domain.OrgOrgInfo.getBookDetailList", map, offset,limit);
			int count=getCount("com.wr4.domain.OrgOrgInfo.getBookCountDetailList", map);
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
	 * 获取所有证书
	 */
	public String getAllBookList(){
		//pid应在sessio获取
		String pid=request.getSession().getAttribute("paperid").toString();
		Map map=new HashMap();
		map.put("pid", pid);
		List<CertInfo> list = null;
		List allList=null;
		try {
			getPageParameters();
			list = orgManageService.getBookChange("com.wr4.domain.OrgOrgInfo.getAllBookList", map, offset,limit);
			int count=getCount("com.wr4.domain.OrgOrgInfo.getCountAllBookList", map);
			List<CertInfo> certList = new ArrayList<CertInfo>();
			if(list !=null){
				for(int i=0;i<list.size();i++){
					CertInfo c =(CertInfo) list.get(i);
					Map m=new HashMap();
					//给业务类别字段filetext 赋值
					m.put("bustype", "bustype");
					List busTypelist  = motService.fileText("com.wr4.domain.OrgRespInfo.getBusType", m);
					for(int y=0;y<busTypelist.size();y++){
						ValueTextBustype valueText= (ValueTextBustype)busTypelist.get(y);
						if(c.getCerttype().equals(valueText.getFileid())){
							c.setFiletext(valueText.getFiletext());
						}
					}
					certList.add(c);
					
				};
				
			}
			if (certList != null && certList.size() > 0) {
				JSONArray jsonObject = JSONArray.fromObject(certList);
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
		return null;
	}
	
	public OrgManageService getOrgManageService() {
		return orgManageService;
	}

	public void setOrgManageService(OrgManageService orgManageService) {
		this.orgManageService = orgManageService;
	}

}


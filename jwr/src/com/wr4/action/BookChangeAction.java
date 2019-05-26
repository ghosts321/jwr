package com.wr4.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.wr4.domain.Examine;
import com.wr4.domain.ExchangeInfo;
import com.wr4.domain.OrgInfo;
import com.wr4.service.OrgManageService;
import com.wr4.util.DateUtils;

public class BookChangeAction extends BaseAction{
	
	private OrgManageService orgManageService;
	
	private String s=SUCCESS;
	
	/**
	 * 返回到bookChange.jsp
	 * @return
	 */
	public String changeBook(){
		return s;
	}

	/**
	 * 获取换证列表
	 */
	public String getBookChange(){
		//pid应在sessio获取
		String pid=request.getSession().getAttribute("paperid").toString();
		Map map=new HashMap();
		map.put("pid", pid);
		List<OrgInfo> list = null;
		try {
			getPageParameter();
			map.put("start", start);
			map.put("pagesize", pagesize);
			list = orgManageService.getBookChange("com.wr4.domain.OrgOrgInfo.getBookChange", map, offset,limit);
			//List allList=orgManageService.getAllBookChange("com.wr4.domain.OrgOrgInfo.getBookChange", map);
			int count=getCount("com.wr4.domain.OrgOrgInfo.getBookCountChange", map);
			writeLigerJson(list, count);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 获取换证列表
	 */
	public String getBookChange1(){
		//pid应在sessio获取
		String pid=request.getSession().getAttribute("paperid").toString();
		Map map=new HashMap();
		map.put("pid", pid);
		List<OrgInfo> list = null;
		try {
			getPageParameters();
			list = orgManageService.getBookChange("com.wr4.domain.OrgOrgInfo.getBookChange1", map, offset,limit);
			//List allList=orgManageService.getAllBookChange("com.wr4.domain.OrgOrgInfo.getBookChange", map);
			int count=getCount("com.wr4.domain.OrgOrgInfo.getBookCountChange1", map);
			writeLigerJson(list, count);
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
			writeLigerJson(list,count);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 考评机构换证详细信息列表
	 */
	public void getBookDetailList1(){
		List<OrgInfo> list = null;
		Map map = new HashMap();
		map.put("cid", request.getParameter("certnumber").toString());
		map.put("orgid", request.getParameter("orgid").toString());
		map.put("pid", request.getSession().getAttribute("paperid").toString());
		try {
			getPageParameters();
			list = orgManageService.getBookChange("com.wr4.domain.OrgOrgInfo.getBookDetailList1", map, offset,limit);
			int count=getCount("com.wr4.domain.OrgOrgInfo.getBookCountDetailList1", map);
			writeLigerJson(list,count);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 更新换证原因
	 * @return
	 */
	public void updateReason(){
		try{
			Map map=new HashMap();
			String id=request.getParameter("id").toString();
			String userid=request.getSession().getAttribute("userid").toString();
			String cid=request.getParameter("certnumber").toString();
			String reason=request.getParameter("reason").toString();
			String createdate=DateUtils.getDateFormatString().substring(0, 19);
			//更新申请类型为换证
			String applyType="2";
			map.put("id", id);
			map.put("userid", userid);
			map.put("cid", cid);
			map.put("reason", reason);
			map.put("applyType", applyType);
			map.put("createdate", createdate);
			int result=orgManageService.updateReason("com.wr4.domain.OrgOrgInfo.updateReason",map);
			if(result==0){
				writer("error");
			}else{
				writer("ok");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public OrgManageService getOrgManageService() {
		return orgManageService;
	}

	public void setOrgManageService(OrgManageService orgManageService) {
		this.orgManageService = orgManageService;
	}

}


package com.wr4.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.wr4.domain.Examine;
import com.wr4.domain.OrgInfo;
import com.wr4.service.OrgManageService;
import com.wr4.util.DateUtils;

public class BookApplyAction extends BaseAction{
	
	private OrgManageService orgManageService;
	private OrgInfo orgInfo;
	private String userId;
	private Examine examine;
	
	public String bookApply(){
		return "success";
	}
	
	/**
	 * 证书申请列表
	 */
	public void getBookApply(){
		List<OrgInfo> list = null;
		Map map=new HashMap();
		map.put("userId", userId);
		try {
			getPageParameter();
			map.put("start", start);
			map.put("pagesize", pagesize);
			list = orgManageService.getBookApplyList("com.wr4.domain.OrgOrgInfo.getBookApply", map, offset,limit);
			//List allList=orgManageService.getBookApplyAllList("com.wr4.domain.OrgOrgInfo.getBookApply", map);
			int count=getCount("com.wr4.domain.OrgOrgInfo.getBookCountApply", map);
			writeLigerJson(list, count);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 证书申请列表
	 */
	public void getBookChangesApply(){
		List<OrgInfo> list = null;
		Map map=new HashMap();
		map.put("userId", userId);
		try {
			getPageParameters();
			list = orgManageService.getBookApplyList("com.wr4.domain.OrgOrgInfo.getBookApply", map, offset,limit);
			//List allList=orgManageService.getBookApplyAllList("com.wr4.domain.OrgOrgInfo.getBookApply", map);
			int count=getCount("com.wr4.domain.OrgOrgInfo.getBookCountApply", map);
			writeLigerJson(list, count);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 *证书申请  提交插入方法
	 */
	/**
	 * @return
	 */
	public String orgReg(){
		String s=SUCCESS;
		orgInfo.setCreatedate(DateUtils.getDateFormatString().substring(0, 19));
		orgInfo.setUserId(request.getSession().getAttribute("userid").toString());
		orgInfo.setApplytype("1");
		orgInfo.setDel("0");
		orgInfo.setResp("尚未处理");
		//插入申请表数据
		try {
			//先判断申请表中是否有此种类型申请
//			OrgInfo org=orgManageService.getOrgApplyId("com.wr4.domain.OrgOrgInfo.getOrgApplyId",orgInfo);
//			if(org!=null){
//				return "error";
//			}else{
				Map map=new HashMap();
				map.put("userId", orgInfo.getUserId());
				map.put("bustype", orgInfo.getBusType());
				map.put("grade", orgInfo.getGrade());
				List list = orgManageService.getBookApplyList("com.wr4.domain.OrgOrgInfo.getBookApplyIsBol", map, offset,limit);
				if(list !=null&&list.size()>0){
					request.setAttribute("msg","不能重复申请，请联系主管机关！");
					request.setAttribute("orgInfo", orgInfo);
					return "applyTwo";
				}
				// 插入申请表
				int result=orgManageService.orgReg("com.wr4.domain.OrgOrgInfo.orgReg",orgInfo);
				//获取申请表id，插入流程表
				OrgInfo org1=orgManageService.getOrgApplyId("com.wr4.domain.OrgOrgInfo.getOrgApplyId1",orgInfo);
				examine=new Examine();
				examine.setApplyId(String.valueOf(org1.getId()));
				examine.setUserid(request.getSession().getAttribute("userid").toString());
				examine.setUsertype(request.getSession().getAttribute("usertype").toString());
				examine.setStatus("已申请");
				examine.setAuditdate(DateUtils.getDateFormatString().substring(0, 19));
				examine.setBustype(orgInfo.getBusType());
				examine.setAuditerMot(orgInfo.getAdminmot());
				examine.setBustype(orgInfo.getBusType());
				examine.setPid(orgInfo.getPid());
				//插入流程表数据
				orgManageService.orgRegExm("com.wr4.domain.OrgOrgInfo.orgRegExm",examine);
//			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return s;
	}
	
	
	public OrgManageService getOrgManageService() {
		return orgManageService;
	}

	public void setOrgManageService(OrgManageService orgManageService) {
		this.orgManageService = orgManageService;
	}

	public OrgInfo getOrgInfo() {
		return orgInfo;
	}

	public void setOrgInfo(OrgInfo orgInfo) {
		this.orgInfo = orgInfo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Examine getExamine() {
		return examine;
	}

	public void setExamine(Examine examine) {
		this.examine = examine;
	}
	
}


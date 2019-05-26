package com.wr4.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wr4.service.IEnFileManageService;
import com.wr4.util.JsonConfigUtil;

public class EnFileManageAction extends BaseAction {
	private IEnFileManageService iEnFileManageService;
	private Map map = new HashMap();
	public IEnFileManageService getiEnFileManageService() {
		return iEnFileManageService;
	}
	public void setiEnFileManageService(IEnFileManageService iEnFileManageService) {
		this.iEnFileManageService = iEnFileManageService;
	}
	//本机构专兼职考评员
	public void parttimeData(){
		String userid = request.getSession().getAttribute("userid").toString();
		String paperid = request.getSession().getAttribute("paperid").toString();
		map.put("userid", userid);
		map.put("paperid", paperid);
		try {
			List list = iEnFileManageService.parttimeData("com.wr4.domain.MotOrgInfo.parttimeData",map);
			writeLigerJson(list,0,JsonConfigUtil.configJson());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//考评员学历一览
	public void pneduData(){
		String userid = request.getSession().getAttribute("userid").toString();
		String paperid = request.getSession().getAttribute("paperid").toString();
		map.put("userid", userid);
		map.put("paperid", paperid);
		try {
			List list = iEnFileManageService.pneduData("com.wr4.domain.MotOrgInfo.pneduData",map);
			writeLigerJson(list,0,JsonConfigUtil.configJson());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//考评员培训考试
	public void pnTrainData(){
		String userid = request.getSession().getAttribute("userid").toString();
		String paperid = request.getSession().getAttribute("paperid").toString();
		map.put("userid", userid);
		map.put("paperid", paperid);
		try {
			List list = iEnFileManageService.pnTrainData("com.wr4.domain.MotOrgInfo.pnTrainData",map);
			writeLigerJson(list,0,JsonConfigUtil.configJson());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

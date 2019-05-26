package com.wr4.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import com.wr4.domain.Examine;
import com.wr4.service.IPnApplyAccepService;
import com.wr4.util.CodeToCnUtil;
import com.wr4.util.JsonConfigUtil;
import com.wr4.util.TimestampJsonValueProcessor;

/***
 * 考评员申请受理Action
 * @author Administrator
 *
 */
public class PnApplyAccepAction extends BaseAction {
	private IPnApplyAccepService iPnApplyAccepService;
	public IPnApplyAccepService getiPnApplyAccepService() {
		return iPnApplyAccepService;
	}
	public void setiPnApplyAccepService(IPnApplyAccepService iPnApplyAccepService) {
		this.iPnApplyAccepService = iPnApplyAccepService;
	}
	public void pnApplyAccept(){
		String adminmot = request.getParameter("adminmot");
		String pid = request.getParameter("pid");
		String pnname = request.getParameter("pnname");
		String resp = request.getParameter("resp");
		String mot  = request.getSession().getAttribute("mot").toString();
		Map map = new HashMap();
		map.put("mot", mot);
		if(adminmot!=null && !"".equals(adminmot) && !"%".equals(adminmot)){
			map.put("adminmot", adminmot);
		}
		if(pnname!=null && !"".equals(pnname)){
			map.put("pnname", pnname);
		}
		if(resp!=null && !"".equals(resp)){
			map.put("resp", resp);
		}
		if(pid!=null && !"".equals(pid)){
			map.put("pid", pid);
		}
		try {
			getPageParameter();
			//总条数
//			List list = iPnApplyAccepService.pnApplyAccept("com.wr4.domain.PnInfo.pnApplyAccept",map);
			int count=getCount("com.wr4.domain.PnInfo.pnApplyAcceptCount",map);
			//分页
			map.put("start", start);
			map.put("pagesize", pagesize);
			List list1 = iPnApplyAccepService.pnApplyAccept("com.wr4.domain.PnInfo.pnApplyAccept",map,offset,limit);
			writeLigerJson(list1,count);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 查询出考评员换证申请
	 */
	public void applyChange(){
		try{
			//取出当前登陆人所属主管机关以便根据 本级及下级查询
			String adminmot = request.getParameter("adminmot");
			String pid = request.getParameter("pid");
			String pnname = request.getParameter("pnname");
			String resp = request.getParameter("resp");
			String mot  = request.getSession().getAttribute("mot").toString();
			Map map = new HashMap();
			map.put("mot", mot);
			if(adminmot!=null && !"".equals(adminmot) && !"%".equals(adminmot)){
				map.put("adminmot", adminmot);
			}
			if(pnname!=null && !"".equals(pnname)){
				map.put("pnname", pnname);
			}
			if(resp!=null && !"".equals(resp)){
				map.put("resp", resp);
			}
			if(pid!=null && !"".equals(pid)){
				map.put("pid", pid);
			}
			getPageParameter();
//			List list = iPnApplyAccepService.pnApplyAccept("com.wr4.domain.PnInfo.applyChange",map);
			int count=getCount("com.wr4.domain.PnInfo.applyChangeCount",map);
			map.put("start", start);
			map.put("pagesize", pagesize);
			List list1 = iPnApplyAccepService.pnApplyAccept("com.wr4.domain.PnInfo.applyChange",map,offset,limit);
			writeLigerJson(list1,count);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 跳转考评员换证申请
	 */
	public String applyChangeSend(){
		 return "applyChangeSend";
	}
	/**
	 * 考评员换证申请详情
	 */
	public void applyAcceptChangeDetail(){
		String adminmot = request.getParameter("adminmot");
		String bustype = request.getParameter("bustype");
		String userid = request.getParameter("userid");
		Map map = new HashMap();
		map.put("adminmot", adminmot);
		map.put("bustype", bustype);
		map.put("userid", userid);
		try {
			List one = iPnApplyAccepService.applyAcceptGetTrain("com.wr4.domain.PnTrainInfo.applyAcceptGetTrain",map);
			if (one != null && one.size() > 0) {
				JSONArray jsonObject = JSONArray.fromObject(one,configJson());
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString() + ",Total:"
						+ one.size() + "}";
				try {
					writer(js);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else{
				String js = "{Rows: [],Total:"
						+ 0 + "}";
				try {
					writer(js);
				} catch (Exception e) {
					e.printStackTrace();
				} 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 考评员申请详情
	 */
	public void applyAcceptGetTrain(){
		String adminmot = request.getParameter("adminmot");
		String bustype = request.getParameter("bustype");
		String userid = request.getParameter("userid");
		Map map = new HashMap();
		map.put("adminmot", adminmot);
		map.put("bustype", bustype);
		map.put("userid", userid);
		try {
			List one = iPnApplyAccepService.applyAcceptGetTrain("com.wr4.domain.PnTrainInfo.applyAcceptGetTrain",map);
			if (one != null && one.size() > 0) {
				JSONArray jsonObject = JSONArray.fromObject(one,configJson());
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString() + ",Total:"
						+ one.size() + "}";
				try {
					writer(js);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else{
			 
				String js  = "{Rows: [],Total:"
						+ 0 + "}";
				try {
					writer(js);
				} catch (Exception e) {
					e.printStackTrace();
				} 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	 
	/**
	 * JSON 时间解析器具
	 */
	public static JsonConfig configJson() {
		JsonConfig jsonConfig = new JsonConfig(); 
		jsonConfig.registerJsonValueProcessor(Date.class,new TimestampJsonValueProcessor());
		return jsonConfig;
	}
}

package com.wr4.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;



import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import com.wr4.domain.PnOrgTrain;
import com.wr4.domain.PnTrainInfo;
import com.wr4.service.IPnTrainService;
import com.wr4.util.CodeToCnUtil;
import com.wr4.util.TimestampJsonValueProcessor;
/***
 * 考评员考试列表Action
 * @author Administrator
 *
 */
public class PnTrainAction extends BaseAction {
	private IPnTrainService<PnTrainInfo> iPnTrainService;
	private List<PnTrainInfo> pnTrainList;
	private PnTrainInfo pnTrainInfo;

	public IPnTrainService<PnTrainInfo> getiPnTrainService() {
		return iPnTrainService;
	}
	public void setiPnTrainService(IPnTrainService<PnTrainInfo> iPnTrainService) {
		this.iPnTrainService = iPnTrainService;
	}
	public List<PnTrainInfo> getPnTrainList() {
		return pnTrainList;
	}
	public void setPnTrainList(List<PnTrainInfo> pnTrainList) {
		this.pnTrainList = pnTrainList;
	}
	public PnTrainInfo getPnTrainInfo() {
		return pnTrainInfo;
	}
	public void setPnTrainInfo(PnTrainInfo pnTrainInfo) {
		this.pnTrainInfo = pnTrainInfo;
	}


	/***
	 * 已录入考评员列表
	 */
	public void getAllTrain() {
		try {
			getPageParameter();
			String mot = request.getSession().getAttribute("mot").toString();
			String userid=request.getSession().getAttribute("userid").toString();
			if(pnTrainInfo==null){
				pnTrainInfo = new PnTrainInfo();
			}
			pnTrainInfo.setUserid(userid);
			pnTrainInfo.setAdminmot(mot);
//			List all = iPnTrainService.selectPnTrainAll("com.wr4.domain.PnTrainInfo.selectAll", pnTrainInfo);
			int count=getCount("com.wr4.domain.PnTrainInfo.selectAllCount", pnTrainInfo);
			pnTrainInfo.setStart(start);
			pnTrainInfo.setPagesize(pagesize);
			List list = iPnTrainService.selectPnTrain(
					"com.wr4.domain.PnTrainInfo.selectAll", pnTrainInfo, offset, limit);
			if (list != null && list.size() > 0) {
				JSONArray jsonObject = JSONArray.fromObject(list);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString() + ",Total:"
						+ count + "}";
				writer(js);
			} else {
				list = new ArrayList();
				JSONArray jsonObject = JSONArray.fromObject(list);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString() + ",Total:"
						+ count+ "}";
				writer(js);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/***
	 * 培训考试情况
	 */
	public void selectAll() {
		try {
			String adminmot = request.getSession().getAttribute("mot").toString();
			String userid = request.getSession().getAttribute("userid").toString();
			String name = request.getParameter("name");
			String type = request.getParameter("type");
			String trainid = request.getParameter("train_id");
			type =CodeToCnUtil.getBustypeCode(type);
			System.out.println("adminmot==========="+adminmot);
			Map map = new HashMap();
			if(userid!=""&&userid!=null){
				map.put("userid", userid);
			}else{
				map.put("userid", null);
			}
			if(adminmot!=""&&adminmot!=null){
				map.put("adminmot", adminmot);
			}else{
				map.put("adminmot", null);
			}
			if(name!=""&&name!=null){
				map.put("pnname", name.trim());
			}else{
				map.put("pnname", null);
			}
			if(type!=""&&type!=null){
				map.put("bustype", type.trim());
			}else{
				map.put("bustype", null);
			}
			if(trainid!=""&&trainid!=null){
				map.put("train_id", trainid.trim());
			}else{
				map.put("train_id", null);
			}
			getPageParameters();
			//查询所有条数用于分页
//			List list = iPnTrainService.selectAllCount("com.wr4.domain.PnTrainInfo.selectAll", map);
			int count=getCount("com.wr4.domain.PnTrainInfo.selectAllCount", pnTrainInfo);
			//查询当前页数的记录
			pnTrainList = iPnTrainService.selectAll(
					"com.wr4.domain.PnTrainInfo.selectAll", map, offset, limit);
			if (pnTrainList != null && pnTrainList.size() > 0) {
				JSONArray jsonObject = JSONArray.fromObject(pnTrainList,configJson());
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString() + ",Total:"
						+ count + "}";
				writer(js);
			} else {
				pnTrainList = new ArrayList();
				JSONArray jsonObject = JSONArray.fromObject(pnTrainList);
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
	 * 考评员培训考试
	 */
	public void selectAllpn() {
		try {
			String adminmot = request.getSession().getAttribute("mot").toString();
			String userid = request.getSession().getAttribute("userid").toString();
			String name = request.getParameter("name");
			String type = request.getParameter("type");
			String trainid = request.getParameter("train_id");
			System.out.println("adminmot==========="+adminmot);
			Map map = new HashMap();
			if(userid!=""&&userid!=null){
				map.put("userid", userid);
			}else{
				map.put("userid", null);
			}
			if(adminmot!=""&&adminmot!=null){
				map.put("adminmot", adminmot);
			}else{
				map.put("adminmot", null);
			}
			if(name!=""&&name!=null){
				map.put("pnname", name.trim());
			}else{
				map.put("pnname", null);
			}
			if(type!=""&&type!=null){
				map.put("bustype", type.trim());
			}else{
				map.put("bustype", null);
			}
			if(trainid!=""&&trainid!=null){
				map.put("train_id", trainid.trim());
			}else{
				map.put("train_id", null);
			}
			getPageParameter();
			//查询所有条数用于分页
//			List list = iPnTrainService.selectAllCount("com.wr4.domain.PnTrainInfo.selectAllpn", map);
			int count=getCount("com.wr4.domain.PnTrainInfo.selectAllpnCount", map);
			
			map.put("start", start);
			map.put("pagesize", pagesize);
			//查询当前页数的记录
			pnTrainList = iPnTrainService.selectAll(
					"com.wr4.domain.PnTrainInfo.selectAllpn", map, offset, limit);
			if (pnTrainList != null && pnTrainList.size() > 0) {
				JSONArray jsonObject = JSONArray.fromObject(pnTrainList,configJson());
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString() + ",Total:"
						+ count + "}";
				writer(js);
			} else {
				pnTrainList = new ArrayList();
				JSONArray jsonObject = JSONArray.fromObject(pnTrainList);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString() + ",Total:"
						+ count + "}";
				writer(js);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/***
	 * 考评机构考评员考试情况
	 */
	public void orgPnTrain() {
		try {
			String orgcode = request.getSession().getAttribute("paperid").toString();
			getPageParameter();
			pnTrainInfo = new PnTrainInfo();
			pnTrainInfo.setStart(start);
			pnTrainInfo.setPagesize(pagesize);
			pnTrainInfo.setByzd(orgcode);
//			List allList = iPnTrainService.orgPnTrainAll("com.wr4.domain.PnTrainInfo.orgPnTrain", orgcode);
			int count=getCount("com.wr4.domain.PnTrainInfo.orgPnTrainCount", pnTrainInfo);
			pnTrainList = iPnTrainService.orgPnTrain(
					"com.wr4.domain.PnTrainInfo.orgPnTrain", pnTrainInfo, offset, limit);
			writeLigerJson(pnTrainList,count,configJson());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/***
	 * 尚无培训、考试记录的考评员
	 */
	public void getAllNoTrain() {
		try {
			String mot=request.getSession().getAttribute("mot").toString();
			Map map = new HashMap();
			map.put("mot", mot);
			getPageParameter();
//			List allList = iPnTrainService.getAllNoTrainCount("com.wr4.domain.PnTrainInfo.getAllNoTrain",map);
			int count=getCount("com.wr4.domain.PnTrainInfo.getAllNoTrainCount",map);
			map.put("start", start);
			map.put("pagesize", pagesize);
			List list = iPnTrainService.getAllNoTrain(
					"com.wr4.domain.PnTrainInfo.getAllNoTrain", map, offset, limit);
			writeLigerJson(list,count,configJson());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/***
	 * 录入考评员培训及考试结果
	 */
	public void pnTrainSave(){
		String username = request.getParameter("username");
		String bustype = request.getParameter("bustype");
		String admin = request.getParameter("admin");
		String train_start = request.getParameter("train_start");
		String train_end = request.getParameter("train_end");
		String train_hour = request.getParameter("train_hour");
		String train_id = request.getParameter("train_id");
		String exam_date = request.getParameter("exam_date");
		String exam_score = request.getParameter("exam_score");
		String userid = request.getParameter("userid");
		String pnid = request.getParameter("pnid");
		int back = 0;
		String msg = "no";
		try {
			Map map = new HashMap();
			map.put("username", username);
			map.put("bustype", bustype);
			map.put("admin", admin);
			map.put("train_start", train_start);
			map.put("train_end", train_end);
			map.put("train_hour", train_hour);
			map.put("train_id", train_id);
			map.put("exam_date", exam_date);
			map.put("exam_score", exam_score);
			map.put("userid", userid);
			map.put("usertype", "pn");
			map.put("pnid", pnid);
			back = iPnTrainService.pnTrainSave("com.wr4.domain.PnTrainInfo.pnTrainSave",map);
			if(back>0){
				msg = "yes";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			writer(msg);
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

package com.wr4.action;

import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import net.sf.json.JSONArray;

import com.wr4.domain.EnApplyDetail;
import com.wr4.domain.EnInfo;
import com.wr4.domain.EnPFInfo;
import com.wr4.domain.OrgReg;
import com.wr4.domain.ValueTextBustype;
import com.wr4.service.EnService;
import com.wr4.service.RespInfoService;
import com.wr4.util.DateUtils;

public class RespInfoAction extends BaseAction{
	
	private RespInfoService respInfoService;
	
	private String admin;
	
	private String s=SUCCESS;
	private EnPFInfo enPFInfo;
	private EnService<EnInfo> enService;
	private OrgReg orgInfo;
	private ValueTextBustype valueText;
	
	/**
	 * 返回到respList.jsp
	 * @return
	 */
	public String respList(){
		return s;
	}
	
	/**
	 * 返回到respWork.jsp
	 * @return
	 */
	public String respWork(){
		return "respWork";
	}
	
	/**
	 * 返回到enRespList.jsp
	 * @return
	 */
	public String enRespList(){
		return s;
	}
	
	/**
	 * 加载申请页面信息
	 */
	public String getOrgRegInfo(){
		try{

			Map map=new HashMap();
			String userid=request.getSession().getAttribute("userid").toString();
			map.put("userid", userid);
			orgInfo=respInfoService.getOrgRegInfo("com.wr4.domain.OrgRespInfo.getOrgRegInfo", map);
			request.setAttribute("orgInfo", orgInfo);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "orgReg";
	}
	
	
	/**
	 * 获取主管机关
	 * @return
	 */
	public void getMot(){
		Map map=new HashMap();
		try{
		String adminmot = request.getSession().getAttribute("mot")+"";
		if(request.getSession().getAttribute("usertype")!=null&&!request.getSession().getAttribute("usertype").equals("mot")){
			adminmot = adminmot.substring(0,2);
			map.put("adminmot", adminmot);
		}else{
			map.put("adminmot", null);
		}
		List list=respInfoService.getMot("com.wr4.domain.OrgRespInfo.getMot", map);
		writeLigerJson(list,list.size());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 通过城市获取主管机关
	 */
	public void getMotByCity(){
		Map map=new HashMap();
		String city=request.getParameter("city");
		try {
			map.put("city", city);
			List list=respInfoService.getMot("com.wr4.domain.OrgRespInfo.getMotByReg",map);
			writeLigerJson(list,list.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 通过城市和当前登录的主管机关获取本级及下级主管机关
	 */
	public void getMotByCityMot(){
		Map map=new HashMap();
		String city=request.getParameter("city");
		String loginMot = request.getSession().getAttribute("mot")+"";
		try {
			if(!"07".equals(city)){
				map.put("city", city);
			}
			map.put("loginMot", loginMot);
			List list=respInfoService.getMot("com.wr4.domain.OrgRespInfo.getMotByCityMot",map);
			writeLigerJson(list,list.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 获取省市
	 * @return
	 */
	public void getQYcode(){
		Map map=new HashMap();
		try{
		map.put("", "");
		List list=respInfoService.getMot("com.wr4.domain.OrgRespInfo.getQYcode",map);
		writeLigerJson(list,list.size());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 获取业务类别
	 * @return
	 */
	public void gettype2(){
		String busType=request.getParameter("busType");
		Map map=new HashMap();
		try{
			map.put("busType", busType);
			List list=respInfoService.getMot("com.wr4.domain.OrgRespInfo.gettype2",map);
			writeLigerJson(list,list.size());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 获取省市中文字段
	 * @return
	 */
	public void getprovince(){
		Map map=new HashMap();
		try{
		map.put("", "");
		List list=respInfoService.getMot("com.wr4.domain.OrgRespInfo.getQYcode",map);
		JSONArray jsonObject = JSONArray.fromObject(list);
		String js = jsonObject.toString();
		writer(js);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 获取市中文字段
	 * @return
	 */
	public void getcitys(){
		Map map=new HashMap();
		try{
		map.put("", "");
		List list=respInfoService.getMot("com.wr4.domain.OrgRespInfo.getcitys",map);
		JSONArray jsonObject = JSONArray.fromObject(list);
		String js = jsonObject.toString();
		writer(js);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 获取市
	 * @return
	 */
	public void getcity(){
		Map map=new HashMap();
		String sprovince = request.getParameter("sprovince");
		try{
			if(StringUtils.isEmpty(sprovince)){
				List list=respInfoService.getMot("com.wr4.domain.OrgRespInfo.getAllCitys",map);
				writeLigerJson(list,list.size());
			}else{
				map.put("sprovince",sprovince);
				List list=respInfoService.getMot("com.wr4.domain.OrgRespInfo.getcity",map);
				writeLigerJson(list,list.size());
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	 
	/**
	 * 获取userid
	 */
	public void getUserId(){
		String msg = "yes";
		Map map=new HashMap();
		String userid= request.getParameter("userid");
		String usertype= request.getParameter("usertype");
		List listpn=null;
		List listen=null;
		List listmot=null;
		List listorg=null;
		try {
			map.put("userid", userid);
			listpn=respInfoService.getMot("com.wr4.domain.OrgRespInfo.getpnUserId", map);
			listen=respInfoService.getMot("com.wr4.domain.OrgRespInfo.getenUserId", map);
			listorg=respInfoService.getMot("com.wr4.domain.OrgRespInfo.getorgUserId", map);
			listmot=respInfoService.getMot("com.wr4.domain.OrgRespInfo.getmotUserId", map);
			if(listpn.size()>0 || listen.size()>0 || listorg.size()>0 || listmot.size()>0){
				msg = "yes";
			}else{
				msg = "no";
			}
			writer(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 获取pid身份证号
	 */
	public void getpid(){
		String msg = "yes";
		Map map=new HashMap();
		String pid= request.getParameter("pid");
		String usertype= request.getParameter("usertype");
		List list=null;
		try {
			map.put("pid", pid);
			if(usertype!=null && usertype.equals("pn")){
				list=respInfoService.getMot("com.wr4.domain.OrgRespInfo.getpnpid", map);
			}else if(usertype!=null && usertype.equals("en")){
				list=respInfoService.getMot("com.wr4.domain.OrgRespInfo.getenpid", map);
			}else if(usertype!=null && usertype.equals("org")){
				list=respInfoService.getMot("com.wr4.domain.OrgRespInfo.getorgpid", map);
			}else if(usertype!=null && usertype.equals("mot")){
				list=respInfoService.getMot("com.wr4.domain.OrgRespInfo.getmotpid", map);
			}
			
			if(list.size()>=1){
				msg = "yes";
			}else{
				msg = "no";
			}
			writer(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 获取组织机构代码
	 */
	public void getorgCode(){
		String msg = "yes";
		Map map=new HashMap();
		String pid= request.getParameter("orgCode");
		String usertype= request.getParameter("usertype");
		List list=null;
		try {
			map.put("pid", pid);
			if(usertype!=null && usertype.equals("en")){
				list=respInfoService.getMot("com.wr4.domain.OrgRespInfo.getenorgCode", map);
			}else if(usertype!=null && usertype.equals("org")){
				list=respInfoService.getMot("com.wr4.domain.OrgRespInfo.getorgorgCode", map);
			}else if(usertype!=null && usertype.equals("mot")){
				list=respInfoService.getMot("com.wr4.domain.OrgRespInfo.getmotorgCode", map);
			}
			if(list!=null){
				if(list.size()>=1){
					msg = "yes";
				}else{
					msg = "no";
				}
			}else{
				msg = "no";
			}
			writer(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	/**
	 * 主管机关、企业、考评机构、考评员申请进度查询
	 */
	public void jdcx(){
		try {
			String userid = request.getParameter("userid");
			String type = request.getParameter("type");
			String password = request.getParameter("password");
			String md5Pass = md5(password);
			Map map=new HashMap();
			map.put("userid", userid);
			map.put("type", type);
			map.put("md5Pass", md5Pass);
			List list=null;
			if(type!=null&&type.equals("mot")){
				list=respInfoService.getMot("com.wr4.domain.OrgRespInfo.getmotjd", map);
			}else if(type!=null&&type.equals("en")){
				list=respInfoService.getMot("com.wr4.domain.OrgRespInfo.getenjd", map);
			}else if(type!=null&&type.equals("org")){
				list=respInfoService.getMot("com.wr4.domain.OrgRespInfo.getorgjd", map);
			}else if(type!=null&&type.equals("pn")){
				list=respInfoService.getMot("com.wr4.domain.OrgRespInfo.getpnjd", map);
			}
			writeLigerJson(list,list.size());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 获取业务类型
	 */
	public void getBusType(){
		Map map=new HashMap();
		try{
		String bustype="bustype";
		map.put("bustype", bustype);
		List list=respInfoService.getBusType("com.wr4.domain.OrgRespInfo.getBusType", map);
		writeLigerJson(list, list.size());
//		request.setAttribute("valueText", valueText);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 *  通过主管机关获取企业申请列表
	 * @return
	 */
	public void getListByMot(){
		try{
		Map map=new HashMap();
		String para=request.getParameter("admin");
		String ftype=request.getParameter("ftype");
		if("admin".equals(ftype)){
			map.put("adminmot", para);
		}else if("name".equals(ftype)){
			map.put("name", para);
		}else if("pid".equals(ftype)){
			map.put("pid", para);
		}else if("resp".equals(ftype)){
			if("尚未处理".equals(para.trim())){
				map.put("resp", "resp");
			}else if("同意".equals(para.trim())){
				map.put("resp", "1");
			}else if("不同意".equals(para.trim())){
				map.put("resp", "0");
			}
		}else if("province".equals(ftype)){
			map.put("province", para);
		}else if("grade".equals(ftype)){
			map.put("grade", para);
		}
		String auditer=request.getSession().getAttribute("paperid").toString();	
		map.put("auditer", auditer);
		int count=getCount("com.wr4.domain.OrgRespInfo.getListByMotCount", map);
		getPageParameter();
		map.put("start", start);
		map.put("pagesize", pagesize);
		List list=respInfoService.getListByMot("com.wr4.domain.OrgRespInfo.getListByMot", map);
		writeLigerJson(list,count);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 查看企业详细信息
	 * @return
	 */
	public void getEnDetail(){
		try{
			String enUserid=request.getParameter("enUserid").toString();
			String respReview=request.getParameter("respReview").toString();
			String type2=request.getParameter("enBusType").toString();
			String applyId=request.getParameter("applyId").toString();
			Map map = new HashMap();
			map.put("enUserid", enUserid);
			map.put("enBusType", type2);
			map.put("applyId", applyId);
			map.put("kpjgUserid", request.getSession().getAttribute("userid").toString());
			EnApplyDetail enApplyDetail=null;
//			if("".equals(respReview)){
				enApplyDetail=respInfoService.getEnDetail("com.wr4.domain.enManage.getEnApplyDetail2",map);
//			}else{
//				enApplyDetail=respInfoService.getEnDetail("com.wr4.domain.enManage.getEnApplyDetail",map);
//			}
			JSONArray jsonObject = JSONArray.fromObject(enApplyDetail);
			String js = jsonObject.toString();
			writer(js);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	/**
	 * 查询本机构下的考评员
	 * @return
	 */
	public void getPnListByPid(){
		String pid=request.getParameter("pid");
		String userId=request.getParameter("userId");
		//pid=request.getSession().getAttribute("paperid").toString();
		try{
			Map map=new HashMap();
			map.put("adminmot", pid);
			map.put("userId", userId);
			List list=respInfoService.getPnListByPid("com.wr4.domain.enManage.getPnListByPid",map);
			writeLigerJson(list, list.size());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 保存修改意见及评分
	 * @return
	 */
	public String saveAdvice(){
		enPFInfo=new EnPFInfo();
		String adviceText=request.getParameter("adviceText").toString();
		String cardNo=request.getParameter("cardNo").toString();
		String type2=request.getParameter("type2").toString();
		String grade=request.getParameter("grade").toString();
		String sum=request.getParameter("sum").toString();
		//1同意0不同意
		String flagType=request.getParameter("flagType").toString().trim();
		String applyId=request.getParameter("applyId").toString();
		 String    createuser=request.getSession().getAttribute("userid")==null?"zhangli1":request.getSession().getAttribute("userid").toString();  //创建人
	     String    createpid=request.getSession().getAttribute("paperid")==null?"zhangli1":request.getSession().getAttribute("paperid").toString();  //创建人所属组织机构代码
	     String    scoreDetail=request.getParameter("score");      //评分细则   对应 json  {0:5}
	     String    busClass=request.getParameter("type2");//业务类别
	     enPFInfo.setApplyId(applyId);
	     enPFInfo.setScoresum(sum);
	     enPFInfo.setLeval(grade);
	     enPFInfo.setCreateuser(createuser);
	     enPFInfo.setScore(scoreDetail);
	     enPFInfo.setCreatepid(createpid);
	     enPFInfo.setBusclass(type2);
	     enPFInfo.setCreatedate(DateUtils.getDateFormatString());
	     enPFInfo.setKpresult("同意");
	     enPFInfo.setKpadvice(adviceText);
		try{
			Map map=new HashMap();
			map.put("cardNo", cardNo);
			map.put("adviceText", adviceText);
			map.put("applyId", applyId);
			map.put("type2", type2);
			map.put("respReview", "同意");
			map.put("kpjg", createuser);
			map.put("advice", adviceText);
			map.put("flagType", flagType);
			map.put("auditername", request.getSession().getAttribute("username").toString());
			map.put("auditerdate", DateUtils.getDateFormatStr());
			map.put("respdate", DateUtils.getDateFormatString().subSequence(0, 19));
			respInfoService.saveAdvice("com.wr4.domain.enManage.saveAdvice",map,enService,enPFInfo);
			writer("ok");
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	public String getS() {
		return s;
	}

	public void setS(String s) {
		this.s = s;
	}

	public RespInfoService getRespInfoService() {
		return respInfoService;
	}

	public void setRespInfoService(RespInfoService respInfoService) {
		this.respInfoService = respInfoService;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public EnPFInfo getEnPFInfo() {
		return enPFInfo;
	}

	public void setEnPFInfo(EnPFInfo enPFInfo) {
		this.enPFInfo = enPFInfo;
	}

	public EnService<EnInfo> getEnService() {
		return enService;
	}

	public void setEnService(EnService<EnInfo> enService) {
		this.enService = enService;
	}

	public OrgReg getOrgInfo() {
		return orgInfo;
	}

	public void setOrgInfo(OrgReg orgInfo) {
		this.orgInfo = orgInfo;
	}


	
}


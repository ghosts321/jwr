package com.wr4.action;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.wr4.domain.EnRegInfo;
import com.wr4.domain.MotRegInfo;
import com.wr4.service.IRegRespService;
/**
 * 代办事宜 初次申请Action
 * @author Administrator
 *
 */
public class RegAction extends BaseAction {
	private MotRegInfo motRegInfo;
	private EnRegInfo enRegInfo;	
	private IRegRespService regRespService;
	
	
	public EnRegInfo getEnRegInfo() {
		return enRegInfo;
	}

	public void setEnRegInfo(EnRegInfo enRegInfo) {
		this.enRegInfo = enRegInfo;
	}

	public IRegRespService getRegRespService() {
		return regRespService;
	}

	public void setRegRespService(IRegRespService regRespService) {
		this.regRespService = regRespService;
	}

	public MotRegInfo getMotRegInfo() {
		return motRegInfo;
	}

	public void setMotRegInfo(MotRegInfo motRegInfo) {
		this.motRegInfo = motRegInfo;
	}
	/**
	 * 待办事宜情况一览
	 * 查询数据然后跳转页面
	 * @return
	 */
	public String regResp(){
		
		return "regResp";
	}
	/**
	 * 报名申请初审
	 * @return
	 */
	public String regApplication(){
		
		
		return "regApplication";
		
	}
	
	/**
	 * 报名申请统计
	 * @return
	 */
	public String regRespSum(){
		List motList = null;
		List motListAll = null;
		List enList = null;
		List enListAll = null;
		try {
		 
			getPageParameters();
			// System.out.println(page);
			motList = regRespService.queryMotReg(
					"com.wr4.domain.MotInfo.motRegResp", motRegInfo, offset,
					limit);
			motListAll = regRespService.queryMotReg(
					"com.wr4.domain.MotInfo.motRegRespAll", motRegInfo, offset,
					limit);
			enList = regRespService.queryEnReg(
							"com.wr4.domain.MotInfo.enRegResp", enRegInfo, offset,
							limit);
			enListAll = regRespService.queryEnReg(
					"com.wr4.domain.MotInfo.enRegRespAll", enRegInfo, offset,
					limit);
			this.writeLigerJson(motList,motListAll,enList,enListAll);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return "motRegResp";
	}
	/**
	 * 主管机关报名申请
	 * @return
	 */
	public void motRegResp(){
		List motList = null;
		try {
		 
			getPageParameters();
			// System.out.println(page);
			motList = regRespService.queryMotReg( "com.wr4.domain.MotInfo.motRegRespAll", motRegInfo, offset, limit);
			int count=getCount( "com.wr4.domain.MotInfo.motRegRespAllCount", motRegInfo);
			super.writeLigerJson(motList,count);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	/**
	 * 主管机关报名申请详细信息
	 * @return
	 */
	public String motRegRespDetail(){
		try {
		 
			getPageParameters();
			String pid=request.getParameter("pid");
			if (!"".equals(pid)){
			}else{
				pid="";
			}
			// System.out.println(page);
			motRegInfo =(MotRegInfo) regRespService.queryMotRegDetail(
					"com.wr4.domain.User.getMotDetail",pid );
			JSONObject js=JSONObject.fromObject(motRegInfo);
			request.setAttribute("js", js.toString());
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return "motRegRespDetail";
	}
	
	/**
	 * 主管机关报名申请审批信息
	 * @return
	 */
	public String motRegRespUpdate(){
		try {
		 
			getPageParameters();
			String pid=request.getParameter("pid");
			if (!"".equals(pid)){
			}else{
				pid="";
			}
			if(motRegInfo==null){
				motRegInfo=new MotRegInfo();
				motRegInfo.setCpid(pid);
			}
			// System.out.println(page);
			int bol =  regRespService.regRespUpdate("com.wr4.domain.User.getMotDetail",motRegInfo );
//			if(bol){
//			}
			JSONObject js=JSONObject.fromObject(motRegInfo);
			request.setAttribute("js", js.toString());
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return "motRegRespDetail";
	}
	/**
	 * 企业报名申请审批信息
	 * @return
	 */
	public String enRegRespUpdate(){
		try {
		 
			getPageParameters();
			String pid=request.getParameter("pid");
			if (!"".equals(pid)){
			}else{
				pid="";
			}
			// System.out.println(page);
			motRegInfo =(MotRegInfo) regRespService.queryMotRegDetail(
					"com.wr4.domain.User.getMotDetail",pid );
			JSONObject js=JSONObject.fromObject(motRegInfo);
			request.setAttribute("js", js.toString());
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return "motRegRespDetail";
	}
	/**
	 * 考评员报名申请
	 * @return
	 */
	public String pnRegResp(){
		return "pnRegResp";
	}
	/**
	 * 考评机构报名申请
	 * @return
	 */
	public String orgRegResp(){
		return "orgRegResp";
	}
	/**
	 * 企业报名申请
	 * @return
	 */
	public void enRegResp(){
		List list = null;
		try {
		 
			getPageParameters();
			// System.out.println(page);
			list = regRespService.queryEnReg( "com.wr4.domain.MotInfo.enRegRespAll", enRegInfo, offset, limit);
			int count=getCount( "com.wr4.domain.MotInfo.motRegRespAllCount", motRegInfo);
			super.writeLigerJson(list,list.size());
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	/**
	 * 返回ligerjson
	 */
	public void writeLigerJson(List motList,List motListAll,List enList,List enListAll
			
			){
		 
			String js ="{";
			if(motList!=null){
				js+="motSize:"+motList.size();
			}else{
				js+="motSize:0";
			}
			if(motListAll!=null){
				js+=",motAllSize:"+motListAll.size();
			}else{
				js+=",motAllSize:0";
			}
			if( enList!=null){
				js+=",enSize:"+ enList.size();
			}else{
				js+=",enSize:0";
			}
			if( enListAll!=null){
				js+=",enAllSize:"+ enListAll.size();
			}else{
				js+=",enAllSize:0";
			}
			
			js+="}";
			
			try {
				writer(js);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
	}
}

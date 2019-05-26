package com.wr4.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wr4.domain.EnRegInfo;
import com.wr4.domain.MotRegInfo;
import com.wr4.domain.OrgRegInfo;
import com.wr4.domain.PnRegInfo;
import com.wr4.service.IRegService;
import com.wr4.service.RespInfoService;
import com.wr4.util.DataValidate;
import com.wr4.util.DateUtils;

public class UserRegAction extends BaseAction {
	private MotRegInfo motRegInfo;  //主管机关用户注册
	private EnRegInfo enRegInfo;    //企业用户
	private OrgRegInfo orgRegInfo;	//考评机构
	private PnRegInfo  pnRegInfo;  //考评员
	private RespInfoService respInfoService;
	
	
	public PnRegInfo getPnRegInfo() {
		return pnRegInfo;
	}

	public void setPnRegInfo(PnRegInfo pnRegInfo) {
		this.pnRegInfo = pnRegInfo;
	}

	public OrgRegInfo getOrgRegInfo() {
		return orgRegInfo;
	}

	public void setOrgRegInfo(OrgRegInfo orgRegInfo) {
		this.orgRegInfo = orgRegInfo;
	}

	public EnRegInfo getEnRegInfo() {
		return enRegInfo;
	}

	public void setEnRegInfo(EnRegInfo enRegInfo) {
		this.enRegInfo = enRegInfo;
	}


	private IRegService regService;
	
	public IRegService getRegService() {
		return regService;
	}

	public void setRegService(IRegService regService) {
		this.regService = regService;
	}

	public MotRegInfo getMotRegInfo() {
		return motRegInfo;
	}

	public void setMotRegInfo(MotRegInfo motRegInfo) {
		this.motRegInfo = motRegInfo;
	}
	
	
	public String motReg(){
		String s="motReg";
		Map map=new HashMap();
		try{
			DataValidate dv = new DataValidate();
			//校验组织机构代码
			/*boolean b = dv.isValidOrgCode(motRegInfo.getPid());
			map.put("pid", motRegInfo.getPid());
			List list = respInfoService.getMot("com.wr4.domain.OrgRespInfo.getmotorgCode", map);*/
			
			//校验身份证号
			boolean cpidB = dv.isValidatedAllIdcard(motRegInfo.getCpid());
			map.put("pid", motRegInfo.getCpid());
			List cpidList = respInfoService.getMot("com.wr4.domain.OrgRespInfo.getmotpid", map);
			
			/*if(!b){
				request.setAttribute("msg", "组织机构代码格式不正确，请检查！");
			}else if(list != null && list.size()>0){
				request.setAttribute("msg", "组织机构代码已经存在，请检查！");
			}else */if(!cpidB){
				request.setAttribute("msg", "身份证号码不正确，请检查！");
			}else if(cpidList != null && cpidList.size()>0){
				request.setAttribute("msg", "身份证号码已经存在，请检查！");
			}else{
				motRegInfo.setCreatedate(DateUtils.getDateFormatString());
				motRegInfo.setUserpass(md5(motRegInfo.getUserpass()));
				int i=regService.motReg("com.wr4.domain.User.motReg",motRegInfo );
				if(i<1){
					request.setAttribute("msg", "注册失败，请重试！");
				}else{
					request.setAttribute("msg", "yes");
				}
			}
		}catch(Exception e){
			request.setAttribute("msg", "注册失败，请重试！");
			e.printStackTrace();
		}
		return s;
	}
	/**
	 * 主管机关报名信息修改
	 * @return
	 */
	public String updatemotreg(){
		String s="updatemotreg";
		Map map=new HashMap();
		try{
			DataValidate dv = new DataValidate();
			//校验组织机构代码
			/*boolean b = dv.isValidOrgCode(motRegInfo.getPid());
			map.put("pid", motRegInfo.getPid());
			List list = respInfoService.getMot("com.wr4.domain.OrgRespInfo.getmotorgCode", map);*/
			
			//校验身份证号
			boolean cpidB = dv.isValidatedAllIdcard(motRegInfo.getCpid());
			map.put("pid", motRegInfo.getCpid());
			List cpidList = respInfoService.getMot("com.wr4.domain.OrgRespInfo.getmotpid", map);
			
			/*if(!b){
				request.setAttribute("msg", "组织机构代码格式不正确，请检查！");
			}else if(list != null && list.size()>0){
				request.setAttribute("msg", "组织机构代码已经存在，请检查！");
			}else */if(!cpidB){
				request.setAttribute("msg", "身份证号码不正确，请检查！");
			}else if(cpidList != null && cpidList.size()>0){
				request.setAttribute("msg", "身份证号码已经存在，请检查！");
			}else{
				motRegInfo.setCreatedate(DateUtils.getDateFormatString());
				int i=regService.motReg("com.wr4.domain.User.updatemotreg",motRegInfo );
				if(i<1){
					request.setAttribute("msg", "修改失败，请重试！");
				}else{
					request.setAttribute("msg", "yes");
				}
			}
		}catch(Exception e){
			request.setAttribute("msg", "修改失败，请重试！");
			e.printStackTrace();
		}
		return s;
	}
	/**
	 * 企业报名信息修改
	 * @return
	 */
	public String updateenReg(){
		String s="updateenReg";
		Map map=new HashMap();
		try{
			DataValidate dv = new DataValidate();
			//校验组织机构代码
			/*boolean b = dv.isValidOrgCode(enRegInfo.getPid());
			map.put("pid", enRegInfo.getPid());
			List list=respInfoService.getMot("com.wr4.domain.OrgRespInfo.getenorgCode", map);*/
			
			//校验身份证号
			boolean cpidB = dv.isValidatedAllIdcard(enRegInfo.getCpid());
			map.put("pid", enRegInfo.getCpid());
			List cpidList = respInfoService.getMot("com.wr4.domain.OrgRespInfo.getenpid", map);
			
			/*if(!b){
				request.setAttribute("msg", "组织机构代码格式不正确，请检查！");
			}else if(list != null && list.size()>0){
				request.setAttribute("msg", "组织机构代码已经存在，请检查！");
			}else */if(!cpidB){
				request.setAttribute("msg", "身份证号码不正确，请检查！");
			}else if(cpidList != null && cpidList.size()>0){
				request.setAttribute("msg", "身份证号码已经存在，请检查！");
			}else{
				enRegInfo.setCreatedate(DateUtils.getDateFormatString());
				int i=regService.enReg("com.wr4.domain.User.updateenReg",enRegInfo );
				if(i<1){
					request.setAttribute("msg", "修改失败，请重试！");
				}else{
					request.setAttribute("msg", "yes");
				}
			}
		}catch(Exception e){
			request.setAttribute("msg", "修改失败，请重试！");
			e.printStackTrace();
		}
		return s;
	}
	/**
	 * 考评机构报名信息修改
	 * @return
	 */
	public String updateorgreg(){
		String s="updateorgreg";
		Map map=new HashMap();
		try{
			DataValidate dv = new DataValidate();
			//校验组织机构代码
			/*boolean b = dv.isValidOrgCode(orgRegInfo.getPid());
			map.put("pid", orgRegInfo.getPid());
			List list = respInfoService.getMot("com.wr4.domain.OrgRespInfo.getorgorgCode", map);*/
			//校验身份证号
			boolean cpidB = dv.isValidatedAllIdcard(orgRegInfo.getCpid());
			map.put("pid", orgRegInfo.getCpid());
			List cpidList=respInfoService.getMot("com.wr4.domain.OrgRespInfo.getorgpid", map);
			
			/*if(!b){
				request.setAttribute("msg", "组织机构代码格式不正确，请检查！");
			}else if(list != null && list.size()>0){
				request.setAttribute("msg", "组织机构代码已经存在，请检查！");
			}else */if(!cpidB){
				request.setAttribute("msg", "身份证号码不正确，请检查！");
			}else if(cpidList != null && cpidList.size()>0){
				request.setAttribute("msg", "身份证号码已经存在，请检查！");
			}else{
				orgRegInfo.setCreatedate(DateUtils.getDateFormatString());
				int i=regService.orgReg("com.wr4.domain.User.updateorgreg",orgRegInfo );
				if(i<1){
					request.setAttribute("msg", "修改失败，请重试！");
				}else{
					request.setAttribute("msg", "yes");
				}
			}
		}catch(Exception e){
			request.setAttribute("msg", "修改失败，请重试！");
			e.printStackTrace();
		}
		return s;
	}
	/**
	 * 考评员报名信息修改
	 * @return
	 */
	public String updatepnreg(){
		String s="updatepnreg";
		Map map=new HashMap();
		try{
			//校验身份证号
			DataValidate dv = new DataValidate();
			boolean b = dv.isValidatedAllIdcard(pnRegInfo.getPid());
			map.put("pid", pnRegInfo.getPid());
			List list = respInfoService.getMot("com.wr4.domain.OrgRespInfo.getpnpid", map);
			if(!b){
				request.setAttribute("msg", "身份证号码不正确，请检查！");
			}else if(list != null && list.size()>0){
				request.setAttribute("msg", "身份证号码已经存在，请检查！");
			}else{
				int i=regService.pnReg("com.wr4.domain.User.updatepnreg",pnRegInfo );
				if(i<1){
					request.setAttribute("msg", "修改失败，请重试！");
				}else{
					request.setAttribute("msg", "yes");
				}
			}
		}catch(Exception e){
			request.setAttribute("msg", "修改失败，请重试！");
			e.printStackTrace();
		}
		return s;
	}
	public String enReg(){
		String s="enReg";
		Map map=new HashMap();
		try{
			DataValidate dv = new DataValidate();
			//校验组织机构代码
			/*boolean b = dv.isValidOrgCode(enRegInfo.getPid());
			map.put("pid", enRegInfo.getPid());
			List list=respInfoService.getMot("com.wr4.domain.OrgRespInfo.getenorgCode", map);*/
			
			//校验身份证号
			boolean cpidB = dv.isValidatedAllIdcard(enRegInfo.getCpid());
			map.put("pid", enRegInfo.getCpid());
			List cpidList = respInfoService.getMot("com.wr4.domain.OrgRespInfo.getenpid", map);
			
			/*if(!b){
				request.setAttribute("msg", "组织机构代码格式不正确，请检查！");
			}else if(list != null && list.size()>0){
				request.setAttribute("msg", "组织机构代码已经存在，请检查！");
			}else */if(!cpidB){
				request.setAttribute("msg", "身份证号码不正确，请检查！");
			}else if(cpidList != null && cpidList.size()>0){
				request.setAttribute("msg", "身份证号码已经存在，请检查！");
			}else{
				enRegInfo.setCreatedate(DateUtils.getDateFormatString());
				enRegInfo.setUserpass(md5(enRegInfo.getUserpass()));
				int i=regService.enReg("com.wr4.domain.User.enReg",enRegInfo );
				if(i<1){
					request.setAttribute("msg", "注册失败，请重试！");
				}else{
					request.setAttribute("msg", "yes");
				}
			}
		}catch(Exception e){
			request.setAttribute("msg", "注册失败，请重试！");
			e.printStackTrace();
		}
		return s;
	}
	
	public String orgReg(){
		String s="orgReg";
		Map map=new HashMap();
		try{
			DataValidate dv = new DataValidate();
			//校验组织机构代码
			/*boolean b = dv.isValidOrgCode(orgRegInfo.getPid());
			map.put("pid", orgRegInfo.getPid());
			List list = respInfoService.getMot("com.wr4.domain.OrgRespInfo.getorgorgCode", map);*/
			//校验身份证号
			boolean cpidB = dv.isValidatedAllIdcard(orgRegInfo.getCpid());
			map.put("pid", orgRegInfo.getCpid());
			List cpidList=respInfoService.getMot("com.wr4.domain.OrgRespInfo.getorgpid", map);
			/*if(!b){
				request.setAttribute("msg", "组织机构代码格式不正确，请检查！");
			}else if(list != null && list.size()>0){
				request.setAttribute("msg", "组织机构代码已经存在，请检查！");
			}else */if(!cpidB){
				request.setAttribute("msg", "身份证号码不正确，请检查！");
			}else if(cpidList != null && cpidList.size()>0){
				request.setAttribute("msg", "身份证号码已经存在，请检查！");
			}else{
				orgRegInfo.setCreatedate(DateUtils.getDateFormatString());
				orgRegInfo.setUserpass(md5(orgRegInfo.getUserpass()));
				int i=regService.orgReg("com.wr4.domain.User.orgReg",orgRegInfo );
				if(i<1){
					request.setAttribute("msg", "注册失败，请重试！");
				}else{
					
					request.setAttribute("msg", "yes");
				}
			}
		}catch(Exception e){
			request.setAttribute("msg", "注册失败，请重试！");
			e.printStackTrace();
		}
		return s;
	}
	
	public String pnReg(){
		String s="pnReg";
		Map map=new HashMap();
		try{
			//校验身份证号
			DataValidate dv = new DataValidate();
			boolean b = dv.isValidatedAllIdcard(pnRegInfo.getPid());
			map.put("pid", pnRegInfo.getPid());
			List list = respInfoService.getMot("com.wr4.domain.OrgRespInfo.getpnpid", map);
			if(!b){
				request.setAttribute("msg", "身份证号码不正确，请检查！");
			}else if(list != null && list.size()>0){
				request.setAttribute("msg", "身份证号码已经存在，请检查！");
			}else{
				pnRegInfo.setCdate(DateUtils.getDateFormatString());
				pnRegInfo.setUserpass(md5(pnRegInfo.getUserpass()));
				int i=regService.pnReg("com.wr4.domain.User.pnReg",pnRegInfo );
				if(i<1){
					request.setAttribute("msg", "注册失败，请重试！");
				}else{
					request.setAttribute("msg", "yes");
				}
			}
		}catch(Exception e){
			request.setAttribute("msg", "注册失败，请重试！");
			e.printStackTrace();
		}
		return s;
	}

	public RespInfoService getRespInfoService() {
		return respInfoService;
	}

	public void setRespInfoService(RespInfoService respInfoService) {
		this.respInfoService = respInfoService;
	}
}

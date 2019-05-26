package com.wr4.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wr4.domain.EnRegInfo;
import com.wr4.domain.Examine;
import com.wr4.domain.MotRegInfo;
import com.wr4.domain.OrgRegInfo;
import com.wr4.domain.PnApply;
import com.wr4.domain.PnRegInfo;
import com.wr4.domain.PnTrain;
import com.wr4.service.IPnPageService;
import com.wr4.util.DateUtils;

 
public class PnPageAction extends BaseAction {
	private PnTrain pnTrain;
	private PnApply pnApply;
	private String num;
	private PnRegInfo pnRegInfo;
	private EnRegInfo enRegInfo;
	private MotRegInfo motRegInfo;
	private OrgRegInfo orgRegInfo;
	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}
	private IPnPageService pnPageService;
	
	 
	public IPnPageService getPnPageService() {
		return pnPageService;
	}

	public void setPnPageService(IPnPageService pnPageService) {
		this.pnPageService = pnPageService;
	}

	public PnApply getPnApply() {
		return pnApply;
	}

	public void setPnApply(PnApply pnApply) {
		this.pnApply = pnApply;
	}

	public PnTrain getPnTrain() {
		return pnTrain;
	}

	public void setPnTrain(PnTrain pnTrain) {
		this.pnTrain = pnTrain;
	}
	
	public EnRegInfo getEnRegInfo() {
		return enRegInfo;
	}

	public void setEnRegInfo(EnRegInfo enRegInfo) {
		this.enRegInfo = enRegInfo;
	}

	public MotRegInfo getMotRegInfo() {
		return motRegInfo;
	}

	public void setMotRegInfo(MotRegInfo motRegInfo) {
		this.motRegInfo = motRegInfo;
	}

	public OrgRegInfo getOrgRegInfo() {
		return orgRegInfo;
	}

	public void setOrgRegInfo(OrgRegInfo orgRegInfo) {
		this.orgRegInfo = orgRegInfo;
	}

	/***
	 * 考评员登录，资格申请查询当前申请次数
	 * @return 此考评员已经申请过证书的次数
	 */
	public String certApply() {
		String s = SUCCESS;
		String userid = (String)request.getSession().getAttribute("userid");
		String adminmot = (String)request.getSession().getAttribute("mot");
		Map map = new HashMap();
		map.put("userid", userid);
		map.put("adminmot", adminmot);
		String num = "0";
		try {
			num = pnPageService.selectByUserId(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("num", num);
		return s;
	}

	public String train() {
		String s = SUCCESS;
		return s;
	}

	public String exchangeCert() {
		String s = SUCCESS;
		return s;
	}
	//考评员申请受理跳转页面
	public String applyAccept() {
		String s = SUCCESS;
		return s;
	}
	//考评员换证申请受理跳转页面
	public String exchangeCertAccept() {
		String s = SUCCESS;
		return s;
	}

	public String signOrg() {
		String s = SUCCESS;
		return s;
	}

	public String help() {
		String s = SUCCESS;
		return s;
	}

	public String orgQuery() {
		String s = SUCCESS;
		return s;
	}

	public String enQuery() {
		String s = SUCCESS;
		return s;
	}

	public String userInfo() {
		String s = SUCCESS;
		return s;
	}
	
	public String pnFirstApply() {
		String s = SUCCESS;
		String userid = request.getSession().getAttribute("userid").toString();
		try {
			pnRegInfo = pnPageService.selectByone("com.wr4.domain.PnTrain.selectBycertUserId", userid );
			request.setAttribute("pnRegInfo", pnRegInfo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return s;
	}
	public String regUpdata(){
		String s = SUCCESS;
		String userid = orgRegInfo.getUserid()==null?"":orgRegInfo.getUserid();
		String password = orgRegInfo.getUserpass()==null?"":orgRegInfo.getUserpass();
		String md5Pass = md5(password);
		String code = orgRegInfo.getCpid()==null?"":orgRegInfo.getCpid();
		String type = request.getParameter("type");
		Map map=new HashMap();
		map.put("userid", userid);
		map.put("md5Pass", md5Pass);
		map.put("code", code);
		map.put("type", type);
		request.setAttribute("ms", "yes");
		try {
			if(type!=null && type.equals("mot")){
				motRegInfo = (MotRegInfo) pnPageService.selectByone("com.wr4.domain.PnTrain.selectmot", map);
				if(null!=motRegInfo){
					if(!"".equals(motRegInfo.getRegresp()) && null !=motRegInfo.getRegresp() && motRegInfo.getRegresp().equals("1")){
						request.setAttribute("userid", userid);
						request.setAttribute("password", password);
						request.setAttribute("code", code);
						request.setAttribute("type", type);
						request.setAttribute("ms", "该用户已经被受理，不能在修改信息！");
						 s="error";
					}else{
						motRegInfo.setUserpass("");
						request.setAttribute("motRegInfo", motRegInfo);
						 s="motRegInfo";
					}
				}else{
					//先保存表单
					request.setAttribute("userid", userid);
					request.setAttribute("password", password);
					request.setAttribute("code", code);
					request.setAttribute("type", type);
					request.setAttribute("ms", "用户名、密码或身份证号输入不正确！请重新输入！");
					 s="error";
				}
			}else if(type!=null && type.equals("en")){
				enRegInfo = (EnRegInfo) pnPageService.selectByone("com.wr4.domain.PnTrain.selecten", map);
				if(null!=enRegInfo){
					if(!"".equals(enRegInfo.getRegresp()) && null !=enRegInfo.getRegresp() && enRegInfo.getRegresp().equals("1")){
						request.setAttribute("userid", userid);
						request.setAttribute("password", password);
						request.setAttribute("code", code);
						request.setAttribute("type", type);
						request.setAttribute("ms", "该用户已经被受理，不能在修改信息！");
						 s="error";
					}else{
						enRegInfo.setUserpass("");
						request.setAttribute("enRegInfo", enRegInfo);
						 s="enRegInfo";
					}
				}else{
					request.setAttribute("userid", userid);
					request.setAttribute("password", password);
					request.setAttribute("code", code);
					request.setAttribute("type", type);
					request.setAttribute("ms", "用户名、密码或身份证号输入不正确！请重新输入！");
					 s="error";
				}
			}else if(type!=null && type.equals("org")){
				orgRegInfo = (OrgRegInfo) pnPageService.selectByone("com.wr4.domain.PnTrain.selectorg", map);
				if(null!=orgRegInfo){
					if(!"".equals(orgRegInfo.getRegresp()) && null !=orgRegInfo.getRegresp() && orgRegInfo.getRegresp().equals("1")){
						request.setAttribute("userid", userid);
						request.setAttribute("password", password);
						request.setAttribute("code", code);
						request.setAttribute("type", type);
						request.setAttribute("ms", "该用户已经被受理，不能在修改信息！");
						 s="error";
					}else{
						orgRegInfo.setUserpass("");
						request.setAttribute("orgRegInfo", orgRegInfo);
						 s="orgRegInfo";
					}
				}else{
					request.setAttribute("userid", userid);
					request.setAttribute("password", password);
					request.setAttribute("code", code);
					request.setAttribute("type", type);
					request.setAttribute("ms", "用户名、密码或身份证号输入不正确！请重新输入！");
					 s="error";
				}
			}else if(type!=null && type.equals("pn")){
				pnRegInfo = (PnRegInfo) pnPageService.selectByone("com.wr4.domain.PnTrain.selectpn", map);
				if(null!=pnRegInfo){
					if(!"".equals(pnRegInfo.getRegresp()) && null !=pnRegInfo.getRegresp() && pnRegInfo.getRegresp().equals("1")){
						request.setAttribute("userid", userid);
						request.setAttribute("password", password);
						request.setAttribute("code", code);
						request.setAttribute("type", type);
						request.setAttribute("ms", "该用户已经被受理，不能在修改信息！");
						 s="error";
					}else{
						pnRegInfo.setUserpass("");
						request.setAttribute("pnRegInfo", pnRegInfo);
						 s="pnRegInfo";
					}
				}else{
					request.setAttribute("userid", userid);
					request.setAttribute("password", password);
					request.setAttribute("code", code);
					request.setAttribute("type", type);
					request.setAttribute("ms", "用户名、密码或身份证号输入不正确！请重新输入！");
					 s="error";
				}
			}
			
			
			
		} catch (Exception e) {
			request.setAttribute("ms", "系统异常！请联系管理员！");
			e.printStackTrace();
		}
		return s;
		 
	}
	
	/**
	 * 提交正式申请前 验证是否已有两张证书
	 */
	public void isTwoCert(){
		try{
			String userpid = request.getSession().getAttribute("paperid").toString();
			int i= (Integer) pnPageService.selectCountCert("com.wr4.domain.PnTrain.isTwoCert", userpid );
			if (i>=2) {
				writer("true");
			}else {
				writer("false");
			}
		}catch(Exception e){
			try {
				writer("error");
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		
	}
	
	
	/***
	 * 考评员登录 资格申请action
	 * @return
	 */
	public String pnApplyInsert() {
		String s = SUCCESS;
		Examine examine = new Examine();
		examine.setUserid(request.getSession().getAttribute("userid").toString());
		examine.setUsertype(request.getSession().getAttribute("usertype").toString());
		examine.setStatus("已申请");
		examine.setAuditdate(DateUtils.getDateFormatString());
		examine.setBustype(pnApply.getBussinestype());
		examine.setPid(pnApply.getPid());
		pnApply.setCreatedate(DateUtils.getDateFormatString().substring(0, 19));
		pnApply.setResp_reg("同意");
//		int  num1 = Integer.parseInt(num);
		boolean bol1 =false;
		try{
			Map map=new HashMap();
			map.put("bussinestype", pnApply.getBussinestype());
			map.put("userid", pnApply.getUserid());
			List list =   pnPageService.selectList( "com.wr4.domain.PnTrain.pnApplyListIsBol", map)==null?new ArrayList():pnPageService.selectList( "com.wr4.domain.PnTrain.pnApplyListIsBol", map);
			if(list!=null && list.size()>0){
				request.setAttribute("msg", "不能重复申请，请联系主管机关！");
				return s;
			}
			boolean bol =pnPageService.insertPnApply("com.wr4.domain.PnTrain.pnApplyInsert", pnApply);
//			if(num1!=0){
				bol1 = pnPageService.insertExam("com.wr4.domain.PnTrain.examInsert", examine);
//			}
			if(bol&&bol1){
				request.setAttribute("msg", "申请成功");
			}else{
				//需要保存表单
				request.setAttribute("pnApply", pnApply);
				request.setAttribute("msg", "申请失败,请检查!");
			}
		}catch(Exception e){
			request.setAttribute("msg", "申请失败,请检查!");
			e.printStackTrace();
		}
		return s;
	}

	public PnRegInfo getPnRegInfo() {
		return pnRegInfo;
	}

	public void setPnRegInfo(PnRegInfo pnRegInfo) {
		this.pnRegInfo = pnRegInfo;
	}
	
}

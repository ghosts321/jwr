package com.wr4.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.wr4.domain.EnRegInfo;
import com.wr4.domain.MotRegInfo;
import com.wr4.domain.OrgRegInfo;
import com.wr4.domain.PnRegInfo;
import com.wr4.domain.StatisticsInfo;
import com.wr4.domain.TaskAssignation;
import com.wr4.domain.User;
import com.wr4.service.IRegRespService;
import com.wr4.service.TaskAssignationService;
/**
 * 代办事宜 初次申请Action
 * @author Administrator
 *
 */
public class RegRespAction extends BaseAction {
	private MotRegInfo motRegInfo;
	private EnRegInfo enRegInfo;
	private OrgRegInfo orgRegInfo;
	private PnRegInfo pnRegInfo;
	private IRegRespService regRespService;
	private TaskAssignationService taskAssignationService;
	
	
	public OrgRegInfo getOrgRegInfo() {
		return orgRegInfo;
	}

	public void setOrgRegInfo(OrgRegInfo orgRegInfo) {
		this.orgRegInfo = orgRegInfo;
	}

	public PnRegInfo getPnRegInfo() {
		return pnRegInfo;
	}

	public void setPnRegInfo(PnRegInfo pnRegInfo) {
		this.pnRegInfo = pnRegInfo;
	}

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
	 * 根据当前用户权限 查看未处理的工作
	 */
	public void getDataForChart(){
		String loginMotCode = request.getSession().getAttribute("mot")+"";
		Map map = new HashMap();
		map.put("motcode",loginMotCode);
		String resultData = "";
		try {
			Map<String,String> respMap = regRespService.queryRespSum("com.wr4.domain.OrgRespInfo.getRespSum", map);
			String respSum = respMap.get("motname") == null ? 20+"":respMap.get("motname")+"";
			String respReviewSum = respMap.get("motupper") == null ? 30+"":respMap.get("motupper")+"";
			resultData = "["+respSum+","+respReviewSum+"]";
			writer(resultData);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void getRegDataForChart(){
		String loginMotCode = request.getSession().getAttribute("mot")+"";
		Map map = new HashMap();
		map.put("motcode",loginMotCode);
		String resultData = "";
		try {
			Map<String,String> respMap = regRespService.queryRegRespSum("com.wr4.domain.OrgRespInfo.getRegRespSum", map);
			String regMot = respMap.get("motname") == null ? 5+"":respMap.get("motname")+"";
			String regPn = respMap.get("motcode") == null ? 10+"":respMap.get("motcode")+"";
			String respOrg = respMap.get("motupper") == null ? 15+"":respMap.get("motupper")+"";
			String respEn = respMap.get("del") == null ? 20+"":respMap.get("del")+"";
			resultData = "["+regMot+","+regPn+","+respOrg+","+respEn+"]";
			writer(resultData);
		} catch (Exception e) {
			e.printStackTrace();
		}
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
		return "motRegResp";
	}
	public void  regRespTj(){
		List motList = null;
		List motListAll = null;
		List enList = null;
		List enListAll = null;
		List orgList=null;
		List orgListAll=null;
		List pnList=null;
		List pnListAll=null;
		try {
			//if(motRegInfo==null){
				motRegInfo=new MotRegInfo();
			//}
			String loginMotCode = request.getSession().getAttribute("mot")+"";
			motRegInfo.setLoginMotCode(loginMotCode);
			//if(enRegInfo==null){
				enRegInfo=new EnRegInfo();
			//}
			enRegInfo.setLoginMot(loginMotCode);
			//if(orgRegInfo==null){
				orgRegInfo=new OrgRegInfo();
			//}
			orgRegInfo.setLoginMotCode(loginMotCode);
			//if(pnRegInfo==null){
				pnRegInfo=new PnRegInfo();
			//}
			pnRegInfo.setLoginMotCode(loginMotCode);
			// System.out.println(page);
			//主管机关总共有多少条报名申请数据
//			motListAll = regRespService.queryMotReg( "com.wr4.domain.MotInfo.motRegRespAll", motRegInfo);
			int countMotAll=getCount( "com.wr4.domain.MotInfo.motRegRespAllCount", motRegInfo);
			//主管机关总共有多少条需处理的报名申请数据
			int countMot=getCount( "com.wr4.domain.MotInfo.motRegRespDclCount", motRegInfo);
//			motList = regRespService.queryMotReg( "com.wr4.domain.MotInfo.motRegRespDcl", motRegInfo);
//			enList = regRespService.queryEnReg( "com.wr4.domain.MotInfo.enRegRespDcl", enRegInfo);
			int countenList= 0;//getCount( "com.wr4.domain.MotInfo.enRegRespDclCount", enRegInfo);
			//int count = 0;
			List list = null;
			Map map = new HashMap();
			map.put("motcode", enRegInfo.getLoginMot());
			List<TaskAssignation> TaskList = taskAssignationService.queryTaskInfo("com.wr4.domain.TaskAssignation.getFileId",map);
			if(TaskList != null && TaskList.size() >0){
				String areaCode = TaskList.get(0).getAreaCode();		//区域code
				String motCode = TaskList.get(0).getMotCode();			//主管机关code
				String fileIds = TaskList.get(0).getFileId();			//专业id
				if(motCode.length() == 2){  //超级用户(不分区域和专业)
					countenList=getCount( "com.wr4.domain.MotInfo.enRegRespCount1_1", enRegInfo);
				}else if(motCode.length() == 4 && areaCode.length() == 2){ //省专业局(分专业 不分区域)
					enRegInfo.setAddress(fileIds); //借用address字段把fileid存入
					countenList=getCount( "com.wr4.domain.MotInfo.enRegRespCount1_1", enRegInfo);
				}else if(motCode.length() == 4 && areaCode.length() == 7){ //地市业务局(分区域 不分专业)
					enRegInfo.setCity(areaCode);
					countenList=getCount( "com.wr4.domain.MotInfo.enRegRespCount1_1", enRegInfo);
				}else if(motCode.length() == 6){	//地市专业局(分区域 分专业)
					enRegInfo.setCity(areaCode);
					enRegInfo.setAddress(fileIds); //借用address字段把fileid存入
					countenList=getCount( "com.wr4.domain.MotInfo.enRegRespCount1_1", enRegInfo);
				}
			}
			int countenAllList=getCount( "com.wr4.domain.MotInfo.enRegRespCount1", enRegInfo);
//			enListAll = regRespService.queryEnReg( "com.wr4.domain.MotInfo.enRegResp", enRegInfo );
			int countorgList=getCount( "com.wr4.domain.MotInfo.orgRegRespDclCount", orgRegInfo);
			int countorgListAll=getCount( "com.wr4.domain.MotInfo.orgRegRespCount", orgRegInfo);
//			orgList    = regRespService.queryRegList( "com.wr4.domain.MotInfo.orgRegRespDcl", orgRegInfo);
//			orgListAll = regRespService.queryRegList( "com.wr4.domain.MotInfo.orgRegResp", orgRegInfo);
			int countpnList=getCount( "com.wr4.domain.MotInfo.pnRegRespDclCount", pnRegInfo);
			int countpnListAll=getCount( "com.wr4.domain.MotInfo.pnRegRespCount", pnRegInfo);
//			pnListAll = regRespService.queryRegList( "com.wr4.domain.MotInfo.pnRegResp", pnRegInfo);
//			pnList = regRespService.queryRegList( "com.wr4.domain.MotInfo.pnRegRespDcl", pnRegInfo);
			String json="{ motALL: "+countMotAll+"";
			json+=",mot:"+countMot+"";
			json+=",enALL:"+countenAllList+"";
			json+=",en:"+countenList+"";
			json+=",orgALL:"+countorgListAll+"";
			json+=",org:"+countorgList+"";
			json+=",pnALL:"+countpnListAll+"";
			json+=",pn:"+countpnList+"}";
			writer(json);
		} catch (Exception e) {
			try {
				writer("error");
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		} 
	}
	
	/**
	 * 报名申请初审计算总数
	 */
	public void  regRespTjAll(){
		List motList = null;
		List motListAll = null;
		List enList = null;
		List enListAll = null;
		List orgList=null;
		List orgListAll=null;
		List pnList=null;
		List pnListAll=null;
		try {
			//if(motRegInfo==null){
				motRegInfo=new MotRegInfo();
			//}
			motRegInfo.setLoginMotCode(request.getSession().getAttribute("mot").toString());
			//if(enRegInfo==null){
				enRegInfo=new EnRegInfo();
			//}
			enRegInfo.setLoginMot(request.getSession().getAttribute("mot").toString());
			//if(orgRegInfo==null){
				orgRegInfo=new OrgRegInfo();
			//}
			orgRegInfo.setLoginMotCode(request.getSession().getAttribute("mot").toString());
			//if(pnRegInfo==null){
				pnRegInfo=new PnRegInfo();
			//}
			pnRegInfo.setLoginMotCode(request.getSession().getAttribute("mot").toString());
			Map map=new HashMap();
			map.put("mot", request.getSession().getAttribute("mot").toString());
			//考评机构
			map.put("type", "org");
			//换证申请
			map.put("applytype", "2");
			// System.out.println(page);
			//主管机关总共有多少条报名申请数据
//			
//			motListAll = regRespService.queryMotReg( "com.wr4.domain.MotInfo.motRegRespAll", motRegInfo);
//			//主管机关总共有多少条需处理的报名申请数据
//			motList = regRespService.queryMotReg( "com.wr4.domain.MotInfo.motRegRespDcl", motRegInfo);
//			enList = regRespService.queryEnReg( "com.wr4.domain.MotInfo.enRegRespDcl", enRegInfo);
//			enListAll = regRespService.queryEnReg( "com.wr4.domain.MotInfo.enRegResp", enRegInfo );
//			orgList    = regRespService.queryRegList( "com.wr4.domain.MotInfo.orgRegRespDcl", orgRegInfo);
//			orgListAll = regRespService.queryRegList( "com.wr4.domain.MotInfo.orgRegResp", orgRegInfo);
//			pnListAll = regRespService.queryRegList( "com.wr4.domain.MotInfo.pnRegResp", pnRegInfo);
//			pnList = regRespService.queryRegList( "com.wr4.domain.MotInfo.pnRegRespDcl", pnRegInfo);
			int countMotAll=getCount( "com.wr4.domain.MotInfo.motRegRespAllCount", motRegInfo);
			//主管机关总共有多少条需处理的报名申请数据
			int countMot=getCount( "com.wr4.domain.MotInfo.motRegRespDclCount", motRegInfo);
			int countenList=getCount( "com.wr4.domain.MotInfo.enRegRespDclCount", enRegInfo);
			int countenAllList=getCount( "com.wr4.domain.MotInfo.enRegRespCount", enRegInfo);
			int countorgList=getCount( "com.wr4.domain.MotInfo.orgRegRespDclCount", orgRegInfo);
			int countorgListAll=getCount( "com.wr4.domain.MotInfo.orgRegRespCount", orgRegInfo);
			int countpnList=getCount( "com.wr4.domain.MotInfo.pnRegRespDclCount", pnRegInfo);
			int countpnListAll=getCount( "com.wr4.domain.MotInfo.pnRegRespCount", pnRegInfo);
			int allList=countMotAll+countenAllList+countorgListAll+countpnListAll;
			int respList=countMot+countenList+countorgList+countpnList;
			//考评员申请受理
			int countpnApply=getCount( "com.wr4.domain.MotInfo.getPnApplyAllListCount", map);
			int countpnApplyResp=getCount( "com.wr4.domain.MotInfo.getPnApplyRespListCount", map);
			//List pnApplyAll = regRespService.selectCommon("com.wr4.domain.MotInfo.getPnApplyAllList",map);
			//List pnApplyResp = regRespService.selectCommon("com.wr4.domain.MotInfo.getPnApplyRespList",map);
			//考评员换证申请受理
			
			//List pnChangeAll = regRespService.selectCommon("com.wr4.domain.MotInfo.getPnChangeAllList",map);
			int countpnChange=getCount( "com.wr4.domain.MotInfo.getPnChangeCount", map);
			int countpnChangeResp=getCount( "com.wr4.domain.MotInfo.getPnChangeRespListCount", map);
			//List pnChangeResp = regRespService.selectCommon("com.wr4.domain.MotInfo.getPnChangeRespList",map);
			//考评机构申请受理
			int countorgApplyAll=getCount( "com.wr4.domain.MotInfo.getOrgApplyAllListCount", map);
			int countorgApplyAllResp=getCount( "com.wr4.domain.MotInfo.getOrgApplyRespListCount", map);
//			List orgApplyAll = regRespService.selectCommon("com.wr4.domain.MotInfo.getOrgApplyAllList",map);
//			List orgApplyResp = regRespService.selectCommon("com.wr4.domain.MotInfo.getOrgApplyRespList",map);
			//考评机构变更备案受理
			//List orgExchangeAll = regRespService.selectCommon("com.wr4.domain.MotInfo.getOrgExchangeAllList",map);
			int orgExchangeAll = getCount("com.wr4.domain.MotInfo.getOrgExchangeAllListCount",map);
//			List orgExchangeResp = regRespService.selectCommon("com.wr4.domain.MotInfo.getOrgExchangeRespList",map);
			int orgExchangeResp = getCount("com.wr4.domain.MotInfo.getOrgExchangeRespListCount",map);
			//考评机构换证申请受理
//			List orgChangeAll = regRespService.selectCommon("com.wr4.domain.MotInfo.getOrgChangeAllList",map);
			int orgChangeAll =getCount("com.wr4.domain.MotInfo.getOrgChangeAllListCount",map);
//			List orgChangeResp = regRespService.selectCommon("com.wr4.domain.MotInfo.getOrgChangeRespList",map);
			int orgChangeResp =getCount("com.wr4.domain.MotInfo.getOrgChangeRespListCount",map);
			//企业初次申请受理
//			List enFirstApplyAll = regRespService.selectCommon("com.wr4.domain.MotInfo.getEnFirstApplyAllList",map);
//			List enFirstApplyResp = regRespService.selectCommon("com.wr4.domain.MotInfo.getEnFirstApplyRespList",map);
//			List enFirstApplyAll=enFirstApplyResp;
			int enFirstApplyResp = getCount("com.wr4.domain.MotInfo.getEnFirstApplyRespListCount",map);
			int enFirstApplyAll =getCount("com.wr4.domain.MotInfo.getEnFirstApplyRespAllListCount",map);
			//企业考评结论审核
			int enScanAll = getCount("com.wr4.domain.MotInfo.getEnScanAllListCount",map);
			int enScanResp = getCount("com.wr4.domain.MotInfo.getEnScanRespListCount",map);
			//企业变更备案申请受理
			int enExchangeAll = getCount("com.wr4.domain.MotInfo.getEnExchangeAllListCount",map);
			int enExchangeResp =getCount("com.wr4.domain.MotInfo.getEnExchangeRespListCount",map);
			//企业换证申请受理
			int enChangeAll = getCount("com.wr4.domain.MotInfo.getEnChangeAllListCount",map);
			int enChangeResp = getCount("com.wr4.domain.MotInfo.getEnChangeRespListCount",map);
			//投诉举报受理
			int nameReportAll = getCount("com.wr4.domain.MotInfo.getNameReportAllListCount",map);
			int nameReportResp = getCount("com.wr4.domain.MotInfo.getNameReportRespListCount",map);
			String json="{ allList:"+allList+"";
			json+=",respList:"+respList+"";
			json+=",pnApplyAll:"+countpnApply+"";
			json+=",pnApplyResp:"+countpnApplyResp+"";
			json+=",pnChangeAll:"+countpnChange+"";
			json+=",pnChangeResp:"+countpnChangeResp+"";
			json+=",orgApplyAll:"+countorgApplyAll+"";
			json+=",orgApplyResp:"+countorgApplyAllResp+"";
			json+=",orgExchangeAll:"+orgExchangeAll+"";
			json+=",orgExchangeResp:"+orgExchangeResp+"";
			json+=",orgChangeAll:"+orgChangeAll+"";
			json+=",orgChangeResp:"+orgChangeResp+"";
			json+=",enFirstApplyAll:"+enFirstApplyAll+"";
			json+=",enFirstApplyResp:"+enFirstApplyResp+"";
			json+=",enExchangeAll:"+enExchangeAll+"";//此处开始SQL 需要继续优化
			json+=",enExchangeResp:"+enExchangeResp+"";
			json+=",enChangeAll:"+enChangeAll+"";
			json+=",enChangeResp:"+enChangeResp+"";
			json+=",enScanAll:"+enScanAll+"";
			json+=",enScanResp:"+enScanResp+"";
			json+=",nameReportAll:"+nameReportAll+"";
			json+=",nameReportResp:"+nameReportResp+"";
			json+="}";
			writer(json);
		} catch (Exception e) {
			try {
				writer("error");
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		} 
	}
	
	/**
	 * 企业报名申请审批信息
	 * @return
	 */
	public void deleteRegResp(){
		try {
			getPageParameters();
			//实际传值为  id 主键
			String pid=request.getParameter("pid");
			String deleteUserType=request.getParameter("usertype");
			if (!"".equals(pid)){
			}else{
				pid="";
			}
			Map map=new HashMap();
			map.put("id",Integer.parseInt(pid));
			int i =0;
			if(deleteUserType.equals("mot")){
				i=	regRespService.regRespDelete( "com.wr4.domain.MotInfo.deleteMotRegById",map );
			}else if(deleteUserType.equals("en")){
				i=	regRespService.regRespDelete( "com.wr4.domain.MotInfo.deleteEnRegById",map );
			}else if(deleteUserType.equals("org")){
				i=	regRespService.regRespDelete( "com.wr4.domain.MotInfo.deleteOrgRegById",map );
			}else if(deleteUserType.equals("pn")){
				i=	regRespService.regRespDelete( "com.wr4.domain.MotInfo.deletePnRegById",map );
			}
			if(i>0){
				writer("yes");
				enRegInfo=null;
			}else{
				writer("删除失败,请重试!");
			}
		} catch (Exception e) {
			try {
				writer("删除失败,请联系系统管理员!");
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		} 
	}
	
	
	/**
	 * 主管机关报名申请
	 * @return
	 */
	public void motRegResp(){
		List motList = null;
		List motAllList = null;
		try {
			// mot，用户主管机关代码
			String loginMot=request.getSession().getAttribute("mot").toString();
			String admin = request.getParameter("admin");
			String cid = request.getParameter("cid");
			String motname = request.getParameter("motname");
			String resp = request.getParameter("resp");
			motRegInfo=new MotRegInfo();
			if (admin != null && !"".equals(admin) && !"%".equals(admin)) {
				motRegInfo.setAdminmot(admin);
			}
			if (motname != null && !"".equals(motname) ) {
				motRegInfo.setMotname(motname);
			}
			if (cid != null && !"".equals(cid)) {
				motRegInfo.setPid(cid);
			}
			if (resp != null && !"".equals(resp)) {
				motRegInfo.setRegresp(resp);
			}
			motRegInfo.setLoginMotCode(loginMot);
			getPageParameter();
			motRegInfo.setStart(start);
			motRegInfo.setPagesize(pagesize);
			motList = regRespService.queryMotReg(
					"com.wr4.domain.MotInfo.motRegRespAll", motRegInfo, offset,
					limit);
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
			String id=request.getParameter("pid");
			if (!"".equals(id)){
			}else{
				id="";
			}
			// System.out.println(page);
			motRegInfo =(MotRegInfo) regRespService.queryMotRegDetail(
					"com.wr4.domain.User.getMotDetail",id );
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
			//实际传值为  id 主键
			String pid=request.getParameter("pid");
			if (!"".equals(pid)){
			}else{
				pid="";
			}
			//审批之前 先 验证是否已存在 重复的 组织机构代码  或者  userid
			/*User user2 = (User)regRespService.queryMotRegDetail("com.wr4.domain.User.isMotUserBol", pid);
			if(user2!=null){
				request.setAttribute("msg","审批失败,该用户已有报名申请通过.请检查！");
				return "motRegRespDetail";
			}*/
			
			motRegInfo.setRegrespuser(request.getSession().getAttribute("userid").toString());
			motRegInfo.setId(Integer.parseInt(pid));
			int i =regRespService.regRespUpdate( "com.wr4.domain.User.updateMotRegById",motRegInfo );
			if(i>0){
				request.setAttribute("msg", "yes");
				motRegInfo=null;
			}else{
				request.setAttribute("msg","审批失败,请重试!");
			}
		} catch (Exception e) {
			try {
				request.setAttribute("msg","审批失败,请联系系统管理员!");
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		} 
		return "motRegRespDetail";
	}
	
	/**
	 * 主管机关报名申请审批信息
	 * @return
	 */
	public void motRegRespUpdateAjax(){
		try {
		 
			getPageParameters();
			//实际传值为  id 主键
			String pid=request.getParameter("pid");
			if (!"".equals(pid)){
			}else{
				pid="";
			}
			//审批之前 先 验证是否已存在 重复的 组织机构代码  或者  userid
			User user2 = (User)regRespService.queryMotRegDetail("com.wr4.domain.User.isMotUserBol", pid);
			if(user2!=null){
				writer("审批失败,该用户已有报名申请通过.请检查！");
			}
			//用于区分是否直接通过表格按钮提交的同意
			if(motRegInfo==null||motRegInfo.getRegresp()==null){
				motRegInfo=new MotRegInfo();
				motRegInfo.setRegresp("1");
				motRegInfo.setId(Integer.parseInt(pid));
				motRegInfo.setRegrespuser(request.getSession().getAttribute("userid").toString());
			} 
				motRegInfo.setId(Integer.parseInt(pid));
			int i =regRespService.regRespUpdate( "com.wr4.domain.User.updateMotRegById",motRegInfo );
			if(i>0){
				writer("yes");
				motRegInfo=null;
			}else{
				writer("审批失败,请重试!");
			}
		} catch (Exception e) {
			try {
				writer("审批失败,请联系系统管理员!");
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		} 
	}
	/**
	 * 企业报名申请详细信息
	 * @return
	 */
	public String enRegRespDetail(){
		try {
		 
			getPageParameters();
			String id=request.getParameter("pid");
			if (!"".equals(id)){
			}else{
				id="";
			}
			// System.out.println(page);
			enRegInfo =(EnRegInfo) regRespService.queryMotRegDetail( "com.wr4.domain.MotInfo.getEnDetail",id );
			JSONObject js=JSONObject.fromObject(enRegInfo);
			request.setAttribute("js", js.toString());
		} catch (Exception e) {
			request.setAttribute("msg", "获取不到数据！");
			e.printStackTrace();
		} 
		return "enRegRespDetail";
	}
	
	/**
	 * 企业报名申请审批信息
	 * @return
	 */
	public String enRegRespUpdate(){
		try {
			getPageParameters();
			//实际传值为  id 主键
			String pid=request.getParameter("pid");
			if (!"".equals(pid)){
			}else{
				pid="";
			}
			//审批之前 先 验证是否已存在 重复的 组织机构代码  或者  userid
			/*User user2 = (User)regRespService.queryMotRegDetail("com.wr4.domain.User.isEnUserBol", pid);
			if(user2!=null){
				request.setAttribute("msg","审批失败,该用户已有报名申请通过.请检查！");
				return "enRegRespDetail";
			}*/
			enRegInfo.setId(Integer.parseInt(pid));
			enRegInfo.setRegrespuser(request.getSession().getAttribute("userid").toString());
			int i =regRespService.regRespUpdate( "com.wr4.domain.MotInfo.updateEnRegById",enRegInfo );
			if(i>0){
				request.setAttribute("msg", "yes");
				enRegInfo=null;
			}else{
				request.setAttribute("msg","审批失败,请重试!");
			}
		} catch (Exception e) {
			try {
				request.setAttribute("msg","审批失败,请联系系统管理员!");
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		} 
		return "enRegRespDetail";
	}
	/**
	 * 企业报名申请审批信息
	 * @return
	 */
	public void enRegRespUpdateAjax(){
		try {
			getPageParameters();
			//实际传值为  id 主键
			String pid=request.getParameter("pid");
			if (!"".equals(pid)){
			}else{
				pid="";
			}
			//审批之前 先 验证是否已存在 重复的 组织机构代码  或者  userid
			User user2 = (User)regRespService.queryMotRegDetail("com.wr4.domain.User.isEnUserBol", pid);
			if(user2!=null){
				writer("审批失败,该用户已有报名申请通过.请检查！");
			}
			//用于区分是否直接通过表格按钮提交的同意
			if(enRegInfo==null){
				enRegInfo=new EnRegInfo();
			}
			enRegInfo.setRegresp("1");
			enRegInfo.setId(Integer.parseInt(pid));
			enRegInfo.setRegrespremark("");
			enRegInfo.setRegrespuser(request.getSession().getAttribute("userid").toString());
			int i =regRespService.regRespUpdate( "com.wr4.domain.MotInfo.updateEnRegById",enRegInfo );
			if(i>0){
				writer("yes");
				enRegInfo=null;
			}else{
				writer("审批失败,请重试!");
			}
		} catch (Exception e) {
			try {
				writer("审批失败,请联系系统管理员!");
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		} 
	}
	/**
	 * 企业报名申请列表
	 * @return
	 */
	public void enRegResp(){
		List list = null;
		List allList=null;
		try {
			// mot，用户主管机关代码
			String loginMot=request.getSession().getAttribute("mot").toString();
			String admin = request.getParameter("admin");
			String enpid = request.getParameter("enpid");
			String enname = request.getParameter("enname");
			String enresp = request.getParameter("enresp");
			String entype = request.getParameter("entype");
			String engrade = request.getParameter("engrade");
			enRegInfo=new EnRegInfo();
			if (admin != null && !"".equals(admin) && !"%".equals(admin)) {
				enRegInfo.setAdminmot(admin);
			}
			if (enname != null && !"".equals(enname)) {
				enRegInfo.setUsername(enname);
			}
			if (enpid != null && !"".equals(enpid)) {
				enRegInfo.setPid(enpid);
			}
			if (enresp != null && !"".equals(enresp)) {
				enRegInfo.setRegresp(enresp);
			}
			if(entype != null && !"".equals(entype)){
				enRegInfo.setBustype(entype);
			}
			if(engrade != null && !"".equals(engrade)){
				enRegInfo.setGrade(engrade);
			}
			enRegInfo.setLoginMot(loginMot);
			getPageParameter();
			enRegInfo.setStart(start);
			enRegInfo.setPagesize(pagesize);
//			//判断当前所属主管部门
//			if(enRegInfo.getAdminmot().length() == 2){  //省 
//				
//			}else if(enRegInfo.getAdminmot().length() == 4){  //市
//				
//			}else{
//				
//			}
			
//			list = regRespService.queryEnReg( "com.wr4.domain.MotInfo.enRegResp", enRegInfo, offset, limit);
			
			int count = 0;
			Map map = new HashMap();
			map.put("motcode", enRegInfo.getLoginMot());
			List<TaskAssignation> TaskList = taskAssignationService.queryTaskInfo("com.wr4.domain.TaskAssignation.getFileId",map);
			if(TaskList != null && TaskList.size() >0){
				String areaCode = TaskList.get(0).getAreaCode();		//区域code
				String motCode = TaskList.get(0).getMotCode();			//主管机关code
				String fileIds = TaskList.get(0).getFileId();			//专业id
				if(motCode.length() == 2){  //超级用户(不分区域和专业)
					list = regRespService.queryEnReg( "com.wr4.domain.MotInfo.enRegResp1", enRegInfo, offset, limit);
					count=getCount( "com.wr4.domain.MotInfo.enRegRespCount1", enRegInfo);
				}else if(motCode.length() == 4 && areaCode.length() == 2){ //省专业局(分专业 不分区域)
					enRegInfo.setAddress(fileIds); //借用address字段把fileid存入
					list = regRespService.queryEnReg( "com.wr4.domain.MotInfo.enRegResp1", enRegInfo, offset, limit);
					count=getCount( "com.wr4.domain.MotInfo.enRegRespCount1", enRegInfo);
				}else if(motCode.length() == 4 && areaCode.length() == 7){ //地市业务局(分区域 不分专业)
					enRegInfo.setCity(areaCode);
					list = regRespService.queryEnReg( "com.wr4.domain.MotInfo.enRegResp1", enRegInfo, offset, limit);
					count=getCount( "com.wr4.domain.MotInfo.enRegRespCount1", enRegInfo);
				}else if(motCode.length() == 6){	//地市专业局(分区域 分专业)
					enRegInfo.setCity(areaCode);
					enRegInfo.setAddress(fileIds); //借用address字段把fileid存入
					list = regRespService.queryEnReg( "com.wr4.domain.MotInfo.enRegResp1", enRegInfo, offset, limit);
					count=getCount( "com.wr4.domain.MotInfo.enRegRespCount1", enRegInfo);
				}
			}
			super.writeLigerJson(list,count);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	/**
	 * 考评员报名申请列表
	 * @return
	 */
	public void pnRegResp(){
		List list = null;
		List allList=null;
		try {
			// mot，用户主管机关代码
			String loginMot=request.getSession().getAttribute("mot").toString();
			String admin = request.getParameter("admin");
			String pnpid = request.getParameter("pnpid");
			String pnname = request.getParameter("pnname");
			String pnresp = request.getParameter("pnresp");
			String pntype = request.getParameter("pntype");
			pnRegInfo=new PnRegInfo();
			if (admin !=null && !"".equals(admin) && !"%".equals(admin)) {
				pnRegInfo.setAdmin(admin);
			}
			if (pnname != null && !"".equals(pnname)) {
				pnRegInfo.setUsername(pnname);
			}
			if (pnpid != null && !"".equals(pnpid)) {
				pnRegInfo.setPid(pnpid);
			}
			if (pnresp != null && !"".equals(pnresp)) {
				pnRegInfo.setRegresp(pnresp);
			}
			if(pntype != null && !"".equals(pntype)){
				pnRegInfo.setType(pntype);
			}
			pnRegInfo.setLoginMotCode(loginMot);
			getPageParameter();
			pnRegInfo.setStart(start);
			pnRegInfo.setPagesize(pagesize);
			list = regRespService.queryRegList( "com.wr4.domain.MotInfo.pnRegResp", pnRegInfo, offset, limit);
			int count=getCount( "com.wr4.domain.MotInfo.pnRegRespCount", pnRegInfo);
			super.writeLigerJson(list,count);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	/**
	 * 考评员报名申请详细信息
	 * @return
	 */
	public String pnRegRespDetail(){
		try {
		 
			getPageParameters();
			String id=request.getParameter("pid");
			if (!"".equals(id)){
			}else{
				id="";
			}
			// System.out.println(page);
			pnRegInfo =(PnRegInfo) regRespService.queryMotRegDetail( "com.wr4.domain.MotInfo.getPnDetail",id );
			JSONObject js=JSONObject.fromObject(pnRegInfo);
			request.setAttribute("js", js.toString());
		} catch (Exception e) {
			request.setAttribute("msg", "获取不到数据！");
			e.printStackTrace();
		} 
		return "pnRegRespDetail";
	}
	
	/**
	 * 考评员报名申请审批信息
	 * @return
	 */
	public String pnRegRespUpdate(){
		try {
			getPageParameters();
			//实际传值为  id 主键
			String pid=request.getParameter("pid");
			if (!"".equals(pid)){
			}else{
				pid="";
			}
			//审批之前 先 验证是否已存在 重复的 组织机构代码  或者  userid
			User user2 = (User)regRespService.queryMotRegDetail("com.wr4.domain.User.isPnUserBol", pid);
			if(user2!=null){
				request.setAttribute("msg","审批失败,该用户已有报名申请通过.请检查！");
				return "pnRegRespDetail";
			}
			pnRegInfo.setId(Integer.parseInt(pid));
			pnRegInfo.setRegrespuser(request.getSession().getAttribute("userid").toString());
			//审批同意之前验证是否已存在此用户
			Map map=new HashMap();
			//map 中  tablename  为  要查询的表    column 为 where column 字段    param  为字段值
			map.put("tablename", "userregister");
			map.put("column", "user_id");
			map.put("param", pnRegInfo.getUserid());
//			int z=regRespService.regRespUpdate( "com.wr4.domain.MotInfo.getTableByColumn",map );
//			if(z>1){
//				request.setAttribute("msg","该用户已存在，请确认!");
//				return "pnRegRespDetail";
//			}
			int i =regRespService.regRespUpdate( "com.wr4.domain.MotInfo.updatePnRegById",pnRegInfo );
			if(i>0){
				request.setAttribute("msg", "yes");
				request.setAttribute("js", "");
				pnRegInfo=null;
			}else{
				request.setAttribute("msg","审批失败,请重试!");
				return "pnRegRespDetail";
			}
		} catch (Exception e) {
			try {
				request.setAttribute("msg","审批失败,请联系系统管理员!");
				e.printStackTrace();
				
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		} 
		return "pnRegRespDetail";
	}
	/**
	 * 考评员报名申请审批信息
	 * @return
	 */
	public void pnRegRespUpdateAjax(){
		try {
			getPageParameters();
			//实际传值为  id 主键
			String pid=request.getParameter("pid");
			if (!"".equals(pid)){
			}else{
				pid="";
			}
			//审批之前 先 验证是否已存在 重复的 组织机构代码  或者  userid
			User user2 = (User)regRespService.queryMotRegDetail("com.wr4.domain.User.isPnUserBol", pid);
			if(user2!=null){
				writer("审批失败,该用户已有报名申请通过.请检查！");
			}
			//用于区分是否直接通过表格按钮提交的同意
			if(pnRegInfo==null){
				pnRegInfo=new PnRegInfo();
			}
			pnRegInfo.setRegresp("1");
			pnRegInfo.setId(Integer.parseInt(pid));
			pnRegInfo.setRegrespremark("");
			pnRegInfo.setRegrespuser(request.getSession().getAttribute("userid").toString());
			int i =regRespService.regRespUpdate( "com.wr4.domain.MotInfo.updatePnRegById",pnRegInfo );
			if(i>0){
				writer("yes");
				pnRegInfo=null;
			}else{
				writer("审批失败,请重试!");
			}
		} catch (Exception e) {
			try {
				writer("审批失败,请联系系统管理员!");
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		} 
	}
	/**
	 * 考评机构报名申请列表
	 * @return
	 */
	public void orgRegResp(){
		List list = null;
		List allList=null;
		try {
			// mot，用户主管机关代码
			String loginMot=request.getSession().getAttribute("mot").toString();
			String admin = request.getParameter("admin");
			String orgpid = request.getParameter("orgpid");
			String orgname = request.getParameter("orgname");
			String orgresp = request.getParameter("orgresp");
			String orgtype = request.getParameter("orgtype");
			String orggrade = request.getParameter("orggrade");
			orgRegInfo=new OrgRegInfo();
			if (admin != null && !"".equals(admin) && !"%".equals(admin)) {
				orgRegInfo.setAdminmot(admin);
			}
			if (orgname != null && !"".equals(orgname)) {
				orgRegInfo.setOrgname(orgname);
			}
			if (orgpid != null && !"".equals(orgpid)) {
				orgRegInfo.setPid(orgpid);
			}
			if (orgresp != null && !"".equals(orgresp)) {
				orgRegInfo.setRegresp(orgresp);
			}
			if(orgtype != null && !"".equals(orgtype)){
				orgRegInfo.setBustype(orgtype);
			}
			if(orggrade != null && !"".equals(orggrade)){
				orgRegInfo.setGrade(orggrade);
			}
			orgRegInfo.setLoginMotCode(loginMot);
			getPageParameter();
			orgRegInfo.setStart(start);
			orgRegInfo.setPagesize(pagesize);
			list = regRespService.queryRegList( "com.wr4.domain.MotInfo.orgRegResp", orgRegInfo, offset, limit);
//			allList = regRespService.queryRegList( "com.wr4.domain.MotInfo.orgRegResp", orgRegInfo);
			int count=getCount( "com.wr4.domain.MotInfo.orgRegRespCount", orgRegInfo);
			super.writeLigerJson(list,count);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	/**
	 * 考评机构报名申请详细信息
	 * @return
	 */
	public String orgRegRespDetail(){
		try {
		 
			getPageParameters();
			String id=request.getParameter("pid");
			if (!"".equals(id)){
			}else{
				id="";
			}
			// System.out.println(page);
			orgRegInfo =(OrgRegInfo) regRespService.queryMotRegDetail( "com.wr4.domain.MotInfo.getOrgDetail",id );
			JSONObject js=JSONObject.fromObject(orgRegInfo);
			request.setAttribute("js", js.toString());
		} catch (Exception e) {
			request.setAttribute("msg", "获取不到数据！");
			e.printStackTrace();
		} 
		return "orgRegRespDetail";
	}
	
	/**
	 * 考评机构报名申请审批信息
	 * @return
	 */
	public String orgRegRespUpdate(){
		try {
			getPageParameters();
			//实际传值为  id 主键
			String pid=request.getParameter("pid");
			if (!"".equals(pid)){
			}else{
				pid="";
			}
			//审批之前 先 验证是否已存在 重复的 组织机构代码  或者  userid
			/*User user2 = (User)regRespService.queryMotRegDetail("com.wr4.domain.User.isOrgUserBol", pid);
			if(user2!=null){
				request.setAttribute("msg","审批失败,该用户已有报名申请通过.请检查！");
				return "orgRegRespDetail";
			}*/
			orgRegInfo.setRegrespuser(request.getSession().getAttribute("userid").toString());
			orgRegInfo.setId(Integer.parseInt(pid));
			int i =regRespService.regRespUpdate( "com.wr4.domain.MotInfo.updateOrgRegById",orgRegInfo );
			if(i>0){
				request.setAttribute("msg", "yes");
				orgRegInfo=null;
			}else{
				request.setAttribute("msg","审批失败,请重试!");
			}
		} catch (Exception e) {
			try {
				request.setAttribute("msg","审批失败,请联系系统管理员!");
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		} 
		return "orgRegRespDetail";
	}
	/**
	 * 考评机构报名申请审批信息
	 * @return
	 */
	public void orgRegRespUpdateAjax(){
		try {
			getPageParameters();
			//实际传值为  id 主键
			String pid=request.getParameter("pid");
			if (!"".equals(pid)){
			}else{
				pid="";
			}
			//审批之前 先 验证是否已存在 重复的 组织机构代码  或者  userid
			User user2 = (User)regRespService.queryMotRegDetail("com.wr4.domain.User.isOrgUserBol", pid);
			if(user2!=null){
				writer("审批失败,该用户已有报名申请通过.请检查！");
			}
			//用于区分是否直接通过表格按钮提交的同意
			if(orgRegInfo.getRegresp()==null){
				orgRegInfo=new OrgRegInfo();
				orgRegInfo.setRegresp("1");
				orgRegInfo.setRegrespremark("");
				orgRegInfo.setRegrespuser(request.getSession().getAttribute("userid").toString());
			}
			orgRegInfo.setId(Integer.parseInt(pid));
			int i =regRespService.regRespUpdate( "com.wr4.domain.MotInfo.updateOrgRegById",orgRegInfo );
			if(i>0){
				writer("yes");
				orgRegInfo=null;
			}else{
				writer("审批失败,请重试!");
			}
		} catch (Exception e) {
			try {
				writer("审批失败,请联系系统管理员!");
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		} 
	}
	
	/**
	 * 获取日志列表
	 */
	public void getLogList(){
		try{
			getPageParameter();
			String loginMot=request.getSession().getAttribute("mot").toString();
			String admin = request.getParameter("admin");
			String type = request.getParameter("type");
			String grade = request.getParameter("grade");
			Map map=new HashMap();
			map.put("motcode", loginMot);
			//通过页面传参 来区分 是 查询登录的 还是查询 注册申请的
			map.put("type", "登录");
			if (admin!=null&& !"".equals(admin) ) {
				map.put("type", admin);
			}
			if (type!=null&&!"".equals(type)  ) {
				map.put("createdate", type);
			}
			if (grade!=null&&!"".equals(grade) ) {
				map.put("pid", grade);
			}
			map.put("start", start);
			map.put("pagesize", pagesize);
			List logList=regRespService.queryRegList( "com.wr4.domain.MotInfo.getLogList",map,  offset,  limit);
//			List logListAll=regRespService.queryRegList( "com.wr4.domain.MotInfo.getLogList",map );
			int count=getCount( "com.wr4.domain.MotInfo.getLogListCount", map);
			writeLigerJson(logList, count);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void getLogListtj(){
		
		try{
			String loginMot=request.getSession().getAttribute("mot").toString();
			String admin = request.getParameter("admin");
			String type = request.getParameter("type");
			String grade = request.getParameter("grade");
			Map map=new HashMap();
			map.put("motcode", loginMot);
			//通过页面传参 来区分 是 查询登录的 还是查询 注册申请的
			map.put("type", "登录");
			if (admin!=null&& !"".equals(admin) ) {
				map.put("type", admin);
			}
			if (type!=null&&!"".equals(type)  ) {
				map.put("createdate", type);
			}
			if (grade!=null&&!"".equals(grade) ) {
				map.put("pid", grade);
			}
			List list=regRespService.queryRegList( "com.wr4.domain.MotInfo.getTotal",map );
			if (list != null && list.size() > 0) {
				String head = "{",category="category: [",total = "total:[",foot = "}";
				for(int i=0;i<list.size();i++){
					StatisticsInfo m=(StatisticsInfo)list.get(i);
					category+="'"+m.getDimension()+"',";
					total+=m.getTotal()+",";
				}
				category = category.substring(0, category.length()-1)+"],";
				total = total.substring(0, total.length()-1)+"]";
				String js = head+category+total+foot;
				writer(js);
			}else{
				writer(list.toString());
			}
			
		}catch(Exception e){
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

	public TaskAssignationService getTaskAssignationService() {
		return taskAssignationService;
	}

	public void setTaskAssignationService(
			TaskAssignationService taskAssignationService) {
		this.taskAssignationService = taskAssignationService;
	}
}

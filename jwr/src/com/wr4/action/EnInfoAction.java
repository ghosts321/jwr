package com.wr4.action;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import com.wr4.domain.CheckOrg;
import com.wr4.domain.EnApplyDetail;
import com.wr4.domain.EnInfo;
import com.wr4.domain.EnPFInfo;
import com.wr4.domain.Examine;
import com.wr4.domain.FieldValueInfo;
import com.wr4.domain.TaskAssignation;
import com.wr4.service.EnService;
import com.wr4.service.IPnPageService;
import com.wr4.service.OrgService;
import com.wr4.service.TaskAssignationService;
import com.wr4.util.DateUtils;
import com.wr4.util.ExportUtil;

import freemarker.template.SimpleDate;
/**
 * 用于企业相干的操作
 * @author yangzhuo
 *
 */
public class EnInfoAction extends BaseAction{
	private EnInfo enInfo;
	private FieldValueInfo fileValue;
	private String num;
	
	private EnService<EnInfo> enService;
	private IPnPageService pnPageService;
	private EnPFInfo enPFInfo;
	private OrgService orgService;
	private TaskAssignationService taskAssignationService;
	
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public EnPFInfo getEnPFInfo() {
		return enPFInfo;
	}
	public void setEnPFInfo(EnPFInfo enPFInfo) {
		this.enPFInfo = enPFInfo;
	}
	public FieldValueInfo getFileValue() {
		return fileValue;
	}
	public void setFileValue(FieldValueInfo fileValue) {
		this.fileValue = fileValue;
	}
	public EnInfo getEnInfo() {
		return enInfo;
	}
	public void setEnInfo(EnInfo enInfo) {
		this.enInfo = enInfo;
	}
	public EnService<EnInfo> getEnService() {
		return enService;
	}
	public void setEnService(EnService<EnInfo> enService) {
		this.enService = enService;
	}

	public IPnPageService getPnPageService() {
		return pnPageService;
	}
	public void setPnPageService(IPnPageService pnPageService) {
		this.pnPageService = pnPageService;
	}
	
	public OrgService getOrgService() {
		return orgService;
	}
	public void setOrgService(OrgService orgService) {
		this.orgService = orgService;
	}
	public void getEnList(){
		List<EnInfo> list = null;
		String mot = request.getSession().getAttribute("mot")+"";
		String adminmot=request.getParameter("adminmot");
		String entype=request.getParameter("entype");
		String grade=request.getParameter("grade");
		String ename=request.getParameter("ename");
		String cid=request.getParameter("cid");
		EnInfo en = new EnInfo();
		if(adminmot != null && !"".equals(adminmot) && !"%".equals(adminmot)){
			en.setAdminMotName(adminmot);
		}
		if(entype != null && !"".equals(entype)){
			en.setBustype(entype);
		}
		if(grade != null && !"".equals(grade)){
			en.setGrade(grade);
		}
		if(ename != null && !"".equals(ename)){
			en.setEnname(ename);
		}
		if(cid != null && !"".equals(cid)){
			en.setCid(cid);
		}
		en.setAdminmot(mot);
		try {
			getPageParameters();
			list = enService.selecteEnList("com.wr4.domain.MotEnInfo.getEnList", en, offset,limit);
			int count=getCount("com.wr4.domain.MotEnInfo.getEnListCount", en);
			writeLigerJson(list, count);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void getEnApplyList(){
		List<EnInfo> list = null;
		String userid = request.getSession().getAttribute("userid")+"";
		EnInfo en = new EnInfo();
		en.setUserId(userid);
		try {
			getPageParameters();
			list = enService.selecteEnList("com.wr4.domain.MotEnInfo.getEnApplyList", en, offset,limit);
//			int count = enService.getCount("com.wr4.domain.MotEnInfo.getEnApplyList", en);
			int count=getCount("com.wr4.domain.MotEnInfo.getEnApplyListCount", en);
			writeLigerJson(list, count);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void getApplyList(){
		List<EnInfo> list = null;
		String mot = request.getSession().getAttribute("mot")+"";
		String orgId = request.getSession().getAttribute("orgId")+"";
		EnInfo en = new EnInfo();
		String adminmot1=request.getParameter("admin");
		String pid=request.getParameter("pid");
		String grade=request.getParameter("grade");
		String enname=request.getParameter("enname");
		String type2=request.getParameter("type2");
		String resp=request.getParameter("resp");
		//辽宁省特殊要求0702 只想看到道路运输和水路运输的数据   0703只想看到熟路运输和港口运营的数据 0704 只想看到交通运输工程建设的数据
//		if(mot.equals("0702")){
//			en.setAdminmot("07");
//			en.setUno("0702");
//		}else if(mot.equals("0703")){
//			en.setAdminmot("07");
//			en.setUno("0703");
//		}else if(mot.equals("0704")){
//			en.setAdminmot("07");
//			en.setUno("0704");
//		}else{
//			en.setAdminmot(mot);
//		}
		en.setAdminmot(mot);
		if(adminmot1!=null && !"".equals(adminmot1)&& !"%".equals(adminmot1)){
			en.setAdminMotName(adminmot1);
		}
		if(pid!=null && !"".equals(pid)){
			en.setPid(pid);
		}
		if(grade!=null && !"".equals(grade)){
			en.setGrade(grade);
		}
		if(enname!=null && !"".equals(enname)){
			en.setEnname(enname);
		}
		if(resp!=null && !"".equals(resp)){
			en.setResp(resp);
		}
		if(type2!=null && !"".equals(type2)){
			en.setType2(type2);
		}
		try {
//			if(orgId==null||orgId.equals("")){
//				list=new ArrayList();
//				JSONArray jsonObject = JSONArray.fromObject(list);
//				String js = jsonObject.toString();
//				js = "{Rows: " + jsonObject.toString() + ",Total:"
//						+ list.size() + "}";
//				writer(js);
//			}
			getPageParameter();
			Map map = new HashMap();
			map.put("motcode", mot);
			List<TaskAssignation> TaskList = taskAssignationService.queryTaskInfo("com.wr4.domain.TaskAssignation.getFileId",map);
			if(TaskList != null && TaskList.size() >0){
				String areaCode = TaskList.get(0).getAreaCode();		//区域code
				String motCode = TaskList.get(0).getMotCode();			//主管机关code
				String fileIds = TaskList.get(0).getFileId();			//专业id
				map.clear();
				//超级用户(不分区域和专业)
				if(motCode.length() == 4 && areaCode.length() == 2){ //省专业局(分专业 不分区域)
					en.setType2(fileIds);
				}else if(motCode.length() == 4 && areaCode.length() == 7){ //地市业务局(分区域 不分专业)
					en.setCity(areaCode);
				}else if(motCode.length() == 6){	//地市专业局(分区域 分专业)
					en.setType2(fileIds);
					en.setCity(areaCode);
				}else{
					en.setAdminmot(null);
				}
			}else{
				en.setType2("null");
				en.setCity("null");
			}
			en.setStart(start);
			en.setPagesize(pagesize);
			list = enService.selecteEnList("com.wr4.domain.MotEnInfo.getApplyList", en, offset,limit);
			int count=getCount("com.wr4.domain.MotEnInfo.getApplyListCount", en);
			writeLigerJson(list, count);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void showOrgAdvice(){
		List<EnPFInfo> list = null;
		String applyId = request.getParameter("applyId");
		Map map = new HashMap();
		map.put("applyId", applyId);
		try {
			list = enService.showOrgAdvice("com.wr4.domain.MotEnInfo.getExamineByApplyId", map);
			writeLigerJson(list, list.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void getEnDetail(){
		EnInfo enDetail ;
		String para = request.getParameter("certNumber");
		try {
			EnInfo en = new EnInfo();
			en.setCid(para);
			enDetail = enService.getEnDetail("com.wr4.domain.MotEnInfo.getEnDetail", en);
			JSONArray jsonObject = JSONArray.fromObject(enDetail);
			String js = jsonObject.toString();
			js = "{Rows: " + jsonObject.toString()+ "}";
			writer(js);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String export() throws Exception{
		List<EnInfo> list = null;
		String mot = request.getSession().getAttribute("mot")+"";
		EnInfo en = new EnInfo();
		en.setAdminmot(mot);
		XSSFWorkbook xwb = null;
		String xlsName=ServletActionContext.getServletContext().getRealPath("/");
		String xlsName1=xlsName+"reports/orgList.xls";
		String prpoFileName=xlsName+"reports/sysList.properties";
		String  str="en";
		//list = enService.selecteEnList("com.wr4.domain.MotEnInfo.getEnList", en, offset,limit);
		list = enService.selecteEnList("com.wr4.domain.MotEnInfo.getEnList", en);
//		File sourceFile = new File(xlsName1);
		 //建立导出到这个文件   
		ExportUtil eu=new ExportUtil();
		eu.exportFile(xlsName1, "orgList", list,  prpoFileName,str);
		return null;
	}
	public String exportStander() throws Exception{
		List<EnInfo> list = null;
		XSSFWorkbook xwb = null;
		String xlsName=ServletActionContext.getServletContext().getRealPath("/");
		String xlsName1=xlsName+"reports/orgList.xls";
		String prpoFileName=xlsName+"reports/sysList.properties";
		String  str="en";
		list = enService.selecteEnList("com.wr4.domain.MotEnInfo.getEnApply", enInfo, offset,limit);
//		File sourceFile = new File(xlsName1);
		 //建立导出到这个文件   
		ExportUtil eu=new ExportUtil();
		eu.exportFile(xlsName1, "orgList", list,  prpoFileName,str);
		return null;
	}
	public String gradeApply() {
		String s = SUCCESS;
		String paperid = (String)request.getSession().getAttribute("paperid");
		EnInfo  en = new EnInfo();
		int num = 0;
		try {
			en.setPid(paperid);
			num = enService.getApplyNum("com.wr4.domain.MotEnInfo.selectByPid", en);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("num", num);
		return s;
	}
	public void submitAuditOrgs(){
		String userId = request.getSession().getAttribute("userid")+"";
		String[] cids = request.getParameterValues("cids");
		String pids;
		if(cids.length>1){
			pids = cids[0]+","+cids[1];
		}else{
			pids =cids[0];
		}
		int result;
		boolean flag = false;
		try {
			EnInfo enInfo = new EnInfo();
			enInfo.setUserId(userId);
			enInfo.setOrgId(pids);
			flag = enService.checkOrg("com.wr4.domain.MotEnInfo.checkOrg", enInfo);
			if(flag==true){
				result=0;
			}else{
				result=1;
			}
			JSONArray jsonObject = JSONArray.fromObject(result);
			String js = jsonObject.toString();
			writer(js);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 查询企业选择的考评机构对应的名字
	 */
	public void getOrgName(){
		try{
			String s="";
			String json="";
			String sorg=request.getParameter("orgid1").trim();//企业选择的考评机构
			//获取到的 有可能是两个
			String []sorgs=sorg.split(",");
			json+="[";
			if(sorgs.length>1){
				json+="{name:'";
				for(int i=0;i<sorgs.length;i++){
					List list=  (List) enService.getOrgName("com.wr4.domain.MotEnInfo.getOrgName", sorgs[i]);
//					if(i==sorgs.length-1){
//						json+="{name:'"+list.get(0)+"',id1:'"+sorgs[i]+"'}";
//					}else{
//						json+="{name:'"+list.get(0)+"',id1:'"+sorgs[i]+"'},";
//					}
					if(i==sorgs.length-1){
						json+=list.get(0);
					}else{
						json+=list.get(0)+",";
					}
				}
				json+="'}";
			}else{
				List list=  (List) enService.getOrgName("com.wr4.domain.MotEnInfo.getOrgName", sorg);
				if(list.size()>0){
					json+="{name:'"+list.get(0)+"',id1:'"+sorg+"'}";
				}
				
			}
			json+="]";
			writer(json);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 查询企业选择的考评机构对应的名字
	 */
	public void getAppOrgName(){
		try{
			String s="";
			String json="";
			String sorg=URLDecoder.decode(request.getParameter("orgid1").trim(),"utf-8");//企业选择的考评机构
			
			//获取到的 有可能是两个
			String []sorgs=sorg.split(",");
			if(sorgs.length>1){
				for(int i=0;i<sorgs.length;i++){
					List list=  (List) enService.getOrgName("com.wr4.domain.MotEnInfo.getOrgName", sorgs[i]);
					if(i==sorgs.length-1){
						json+= list.get(0);
					}else{
						json+=list.get(0)+",";
					}
				}
			}else{
				List list=  (List) enService.getOrgName("com.wr4.domain.MotEnInfo.getOrgName", sorg);
				if(list.size()>0){
					json+= list.get(0);
				}
				
			}
			writer(json);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/***
	 * 考评员登录，企业基本信息查询
	 * @throws Exception 
	 */
	public void enBaseInfo() throws Exception{
		Map map = new HashMap();
		String enname= request.getParameter("enname");
		String encid=request.getParameter("encid");
		getPageParameters();
		if(!"".equals(enname)&&!"".equals(encid)&&!"--".equals(encid)){
			map.put("enname", enname.trim());
			map.put("cid", encid.trim());
		}else{
			if("".equals(enname)&&"".equals(encid)){
				map.put("enname", enname);
				map.put("cid", encid);
			}else if("".equals(enname)&&!"".equals(encid)&&!"--".equals(encid)){
				map.put("enname", null);
				map.put("cid", encid);
			}else if(!"".equals(enname)&&"".equals(encid)){
				map.put("enname", enname);
				map.put("cid", null);
			}else if(!"".equals(enname)&&"--".equals(encid)){
				map.put("enname", enname);
				map.put("cid", null);
			}else if("".equals(enname)&&"--".equals(encid)){
				map.put("enname", null);
				map.put("cid", null);
			}
		}
		getPageParameter();
		map.put("start", start);
		map.put("pagesize", pagesize);
		List listAll = enService.getEnByConAll("com.wr4.domain.MotEnInfo.getEnByUserIdAndBustype", map);
		List list = enService.getEnByCon("com.wr4.domain.MotEnInfo.getEnByUserIdAndBustype", map,offset,limit);
		writeLigerJson(list,listAll.size());
	}
	public String goDbZp(){
		return "goDbZp";
	}
	
	
	/**
	 * 获取企业自评报告列表
	 * author：zhangli
	 */
	public void getEnClass(){
		try{
			//此方法通用 返回List
			String fileType="busclass"; //获取什么类型的  值列表
			List  list=enService.selecteFileList("com.wr4.domain.MotEnInfo.getFileClass",fileType);
			writeLigerJson(list,list.size());
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	/**
	 * 获取企业所有业务类别
	 */
	public void getEnZpList(){
		try{
			//此方法通用 返回List
			String userid=request.getSession().getAttribute("userid")==null?"":request.getSession().getAttribute("userid").toString();
			
			List  list=enService.selecteFileList("com.wr4.domain.MotEnInfo.getEnZpList", userid);
			writeLigerJson(list,list.size());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 获取企业对应业务类别评分
	 */
	public void getEndbZp(){
		@SuppressWarnings("unused")
		String s="";
		try{
			//根据业务类别获取相对应业务规则数据
			String busclass=request.getParameter("type");
			
			//此方法通用 返回List
			String pid=request.getSession().getAttribute("paperid")==null?"":request.getSession().getAttribute("paperid").toString();
			List  cell1=enService.selecteFileList("com.wr4.domain.MotEnInfo.getTd1Name", busclass);
			List  cell2=enService.selecteFileList("com.wr4.domain.MotEnInfo.getTd2Name", busclass);
			List  cell3=enService.selecteFileList("com.wr4.domain.MotEnInfo.getTd3Name", busclass);
			List  cell4=enService.selecteFileList("com.wr4.domain.MotEnInfo.getTd4Name", busclass);
			List  td1rowspan=enService.selecteFileList("com.wr4.domain.MotEnInfo.getTd1Rowspan", busclass);
			List  td2rowspan=enService.selecteFileList("com.wr4.domain.MotEnInfo.getTd2Rowspan", busclass);
			//详情 记录分
			List  getDetailScore=enService.selecteFileList("com.wr4.domain.MotEnInfo.getDetailScore", busclass);
			if(cell1!=null&&cell2!=null&&cell3!=null&&td1rowspan!=null){
				//第一列数据
				JSONArray jsonObject=JSONArray.fromObject(cell1);
				//第二列数据
				JSONArray jsonObject2=JSONArray.fromObject(cell2);
				//第三列数据
				JSONArray jsonObject3=JSONArray.fromObject(cell3);
				JSONArray jsonObject4=JSONArray.fromObject(cell4);
				//第一列合并行数
				JSONArray jsonRowspan=JSONArray.fromObject(td1rowspan);
				//第二列合并行数
				JSONArray jsonRowspan2=JSONArray.fromObject(td2rowspan);
				StringBuffer ss=new StringBuffer();
				
				ss.append("[{cell1:"+jsonObject.toString()+"},");
				ss.append("{cell2:"+jsonObject2.toString()+"},");
				ss.append("{cell3:"+jsonObject3.toString()+"},");
				ss.append("{cell4:"+jsonObject4.toString()+"},");
				ss.append("{td1rowspan:"+jsonRowspan.toString()+"},");
				ss.append("{td2rowspan:"+jsonRowspan2.toString()+"}");
				ss.append("]");
				//往页面输出json  由js组装表单
				writer(ss.toString());
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	//--------------------------------------------指标维护begin------------------------------------------
	
	//获取指标相关信息
	public void enZbwhList(){
		//根据业务类别获取相对应业务规则数据
		String busclass=request.getParameter("type");
		String i=request.getParameter("i");
		String j=request.getParameter("j");
		String k=request.getParameter("k");
		Map map=new HashMap<String, String>();
		List  cell1=null;
		List  cell2=null;
		StringBuffer sb=new StringBuffer();
		try {
			 if((busclass!=null && !"".equals(busclass)) && (i!=null && !"".equals(i)) 
					&& (j!=null && !"".equals(j)) ){
				map.put("busclass", busclass);
				map.put("i", i);
				map.put("j", j);
				cell1=enService.selecteEnList("com.wr4.domain.MotEnInfo.getKhydyouByPid", map);
				cell2=enService.selecteEnList("com.wr4.domain.MotEnInfo.getKpxzByPid", map);
			}else if((busclass!=null && !"".equals(busclass)) && (i!=null && !"".equals(i)) ){
				map.put("busclass", busclass);
				map.put("i", i);
				cell1=enService.selecteEnList("com.wr4.domain.MotEnInfo.getKhydzuoByPid", map);
			}else if(busclass!=null && !"".equals(busclass)){
				cell1=enService.selecteFileList("com.wr4.domain.MotEnInfo.getTd1Name", busclass);
			}
			if(cell1!=null && cell2!=null){
				JSONArray jsonObject=JSONArray.fromObject(cell1);
				JSONArray jsonObject2=JSONArray.fromObject(cell2);
				sb.append("[{cell1:"+jsonObject.toString()+"},");
				sb.append("{cell2:"+jsonObject2.toString()+"},");
				sb.append("]");
				writer(sb.toString());
			}else if(cell1!=null){
				JSONArray jsonObject=JSONArray.fromObject(cell1);
				sb.append(jsonObject.toString());
				writer(sb.toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//修改指标维护
	public void updateZbwh(){
		String busclass=request.getParameter("type");
		String i=request.getParameter("i");
		String j=request.getParameter("j");
		String k=request.getParameter("k");
		String fs=request.getParameter("fs");
		String xj=request.getParameter("xj");
		String khyd=request.getParameter("khyd");
		String kpxz=request.getParameter("kpxz");
		
		Map map1=new HashMap<String, String>(); //考核要点
		map1.put("khyd", khyd);
		map1.put("busclass", busclass);
		map1.put("i", i);
		map1.put("j", j);
		map1.put("k", k);
		map1.put("fs", fs);
		map1.put("xj", xj);
		
		Map map2=new HashMap<String, String>(); //考评细则
		map2.put("kpxz", kpxz);
		map2.put("busclass", busclass);
		map2.put("i", i);
		map2.put("j", j);
		map2.put("k", k);
		
		try {
			boolean b1=enService.updateKhyd("com.wr4.domain.MotEnInfo.updateKhyd", map1);
			
			boolean b2=enService.updateKpxz("com.wr4.domain.MotEnInfo.updateKpxz", map2);
			
			if(b1 && b2){
				logger.info("考核要点，考评细则修改成功");
				writer("true");
			}
		} catch (Exception e) {
			try {
				writer("false");
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		
		
	}
	//添加
    public void addEnZbwh(){
    	String busclass=request.getParameter("type");
		String i=request.getParameter("i");
		String j=request.getParameter("j");
		String k=request.getParameter("k");
		String fs=request.getParameter("fs");
		String xj=request.getParameter("xj");
		String khyd=request.getParameter("khyd");
		String kpxz=request.getParameter("kpxz");
    	
		
		Map map1=new HashMap<String, String>(); //考核要点
		map1.put("khyd", khyd);
		map1.put("busclass", busclass);
		map1.put("i", i);
		map1.put("j", j);
		map1.put("k", k);
		map1.put("fs", fs);
		map1.put("xj", xj);
		
		Map map2=new HashMap<String, String>(); //考评细则
		map2.put("kpxz", kpxz);
		map2.put("busclass", busclass);
		map2.put("i", i);
		map2.put("j", j);
		map2.put("k", k);
		
		try {
			boolean b1=enService.addKhyd("com.wr4.domain.MotEnInfo.insertKhyd", map1);
			
			boolean b2=enService.addKpxz("com.wr4.domain.MotEnInfo.insertKpxz", map2);
			
			if(b1 && b2){
				logger.info("考核要点，考评细则添加成功");
				writer("true");
			}
		} catch (Exception e) {
			try {
				writer("false");
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
    }
    
    //删除
    public void deleteEnZbwh(){
    	
    	String busclass=request.getParameter("type");
		String i=request.getParameter("i");
		String j=request.getParameter("j");
		String k=request.getParameter("k");
    	
		Map map=new HashMap<String, String>(); //考核要点
		map.put("busclass", busclass);
		map.put("i", i);
		map.put("j", j);
		map.put("k", k);
		try {
			boolean b1=enService.deleteKhyd("com.wr4.domain.MotEnInfo.deleteKhyd", map);
			
			boolean b2=enService.deleteKpxz("com.wr4.domain.MotEnInfo.deleteKpxz", map);
			
			if(b1 && b2){
				logger.info("考核要点，考评细则删除成功");
				writer("true");
			}
		} catch (Exception e) {
			try {
				writer("false");
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
    	
    }
	
	//--------------------------------------------指标维护end------------------------------------------
	/**
	 * 获取企业对应业务类别评分
	 */
	public void getEndbZpDetail(){
		@SuppressWarnings("unused")
		String s="";
		try{
			//根据业务类别获取相对应业务规则数据
			String busclass=request.getParameter("type");
			
			//此方法通用 返回List
			String pid=request.getSession().getAttribute("paperid")==null?"zhangli":request.getSession().getAttribute("paperid").toString();
			List  cell1=enService.selecteFileList("com.wr4.domain.MotEnInfo.getTd1Name", busclass);
			List  cell2=enService.selecteFileList("com.wr4.domain.MotEnInfo.getTd2Name", busclass);
			List  cell3=enService.selecteFileList("com.wr4.domain.MotEnInfo.getTd3Name", busclass);
			List  cell4=enService.selecteFileList("com.wr4.domain.MotEnInfo.getTd4Name", busclass);
			List  td1rowspan=enService.selecteFileList("com.wr4.domain.MotEnInfo.getTd1Rowspan", busclass);
			List  td2rowspan=enService.selecteFileList("com.wr4.domain.MotEnInfo.getTd2Rowspan", busclass);
			//详情 记录分
			enPFInfo= enService.selecteEnPfDetail("com.wr4.domain.MotEnInfo.getDetailScore", pid);
			if(cell1!=null&&cell2!=null&&cell3!=null&&td1rowspan!=null){
				//第一列数据
				JSONArray jsonObject=JSONArray.fromObject(cell1);
				//第二列数据
				JSONArray jsonObject2=JSONArray.fromObject(cell2);
				//第三列数据
				JSONArray jsonObject3=JSONArray.fromObject(cell3);
				JSONArray jsonObject4=JSONArray.fromObject(cell4);
				//第一列合并行数
				JSONArray jsonRowspan=JSONArray.fromObject(td1rowspan);
				//第二列合并行数
				JSONArray jsonRowspan2=JSONArray.fromObject(td2rowspan);
				//具体评分记录
				JSONObject scoreList=JSONObject.fromObject(enPFInfo);
				String scoresum=scoreList.get("scoresum").toString();
				String score=scoreList.get("score").toString();
				if(score!=null&&!score.equals("")){
					score=score.substring(0,score.length()-1);
				}
				StringBuffer ss=new StringBuffer();
				
				ss.append("[{cell1:"+jsonObject.toString()+"},");
				ss.append("{cell2:"+jsonObject2.toString()+"},");
				ss.append("{cell3:"+jsonObject3.toString()+"},");
				ss.append("{cell4:"+jsonObject4.toString()+"},");
				ss.append("{td1rowspan:"+jsonRowspan.toString()+"},");
				ss.append("{td2rowspan:"+jsonRowspan2.toString()+"},");
				ss.append("{scoreList:["+score+"]},");
				ss.append("{scoresum:"+scoresum+"},");
				String namereport="";
				if(null==scoreList.get("reportname")||"".equals(scoreList.get("reportname"))){
					namereport="";
				}else{
					namereport=scoreList.get("reportname").toString();
				}
				
				ss.append("{reportname:\""+namereport+"\"}");
				ss.append("]");
				//往页面输出json  由js组装表单
				writer(ss.toString());
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 自评分提交
	 * author：zhanlgi
	 */
	public String insertPingfen(){
		  String    pare="";//业务类别
		try{
			Map map=new HashMap();
		     String    createuser=request.getSession().getAttribute("userid")==null?"zhangli":request.getSession().getAttribute("userid").toString();  //创建人
		     String    createpid=request.getSession().getAttribute("paperid")==null?"zhangli":request.getSession().getAttribute("paperid").toString();  //创建人所属组织机构代码
		     String    scoreDetail=request.getParameter("score");      //评分细则   对应 json  {0:5}
		     String    busClass=request.getParameter("type");//业务类别
		     pare=request.getParameter("pare");//业务类别
		     enPFInfo.setCreateuser(createuser);
		     enPFInfo.setScore(scoreDetail);
		     enPFInfo.setCreatepid(createpid);
		     enPFInfo.setBusclass(busClass);
		     enPFInfo.setCreatedate(DateUtils.getDateFormatString());
			boolean bol=enService.savePingFen("com.wr4.domain.MotEnInfo.insertPingfen", enPFInfo);
			if(bol){
				request.setAttribute("returnValue", "yes");
			}else{
				request.setAttribute("returnValue", "提交失败，请检查或联系系统管理员！");
			}
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("returnValue", "提交失败，请检查或联系系统管理员！");
		}
		if("org".equals(pare)){
			return "orgDbzpAdd";
		}else{
			return "enDbzpAdd";
		}
	}
	public String enFirstApply() {
		String s = SUCCESS;
		String userid = request.getSession().getAttribute("userid").toString();
		try {
			EnInfo enDetail = new EnInfo();
			enDetail.setUserId(userid);
			EnInfo en = enService.getEnDetail("com.wr4.domain.MotEnInfo.getEnRegInfo", enDetail);
			request.setAttribute("enInfo", en);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}
	
	public void getQypf_tables(){
		String userid = request.getSession().getAttribute("userid").toString();
		String type2=request.getParameter("type2");
		String grade=request.getParameter("grade");
		Map map = new HashMap();
		map.put("userid", userid);
		map.put("type2", type2);
		map.put("grade", grade);
		try {
			int i = getCount("com.wr4.domain.MotEnInfo.getQypf_tables", map);
			if(i>0){
				writer("1");
			}else{
				writer("0");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public String enUpdateApply() {
		String s = SUCCESS;
		String  id = request.getParameter("id")==null?"0":request.getParameter("id").toString();
		try {
			EnInfo enDetail = new EnInfo();
			enDetail.setId(Integer.parseInt(id));
			EnInfo en = enService.getEnDetail("com.wr4.domain.MotEnInfo.getEnDetailFromId", enDetail);
			request.setAttribute("enInfo", en);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}
	/***
	 * 企业 资格申请修改action
	 * @return
	 */
	public String enApplyUpdate() {
		String s = "enApplyUpdate";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String userId = request.getSession().getAttribute("userid").toString();
		String mot = request.getSession().getAttribute("mot").toString();
		Examine examine = new Examine();
		examine.setUserid(userId);
		examine.setUsertype(request.getSession().getAttribute("usertype").toString());
		examine.setStatus("已申请");
		examine.setBustype(enInfo.getType2());
		examine.setPid(request.getSession().getAttribute("paperid").toString());
		examine.setAuditerMot(mot);
		enInfo.setUserId(userId);
		enInfo.setPid(enInfo.getPid().substring(2));
		if(enInfo.getApporg()==null||"".equals(enInfo.getApporg())){
			enInfo.setBustype(enInfo.getBusType()==null||"".equals(enInfo.getBusType())
					?enInfo.getBustype():enInfo.getBusType());
			//需要保存表单
			request.setAttribute("enInfo", enInfo);
			request.setAttribute("msg", "还未选择考评机构,请选择考评机构!");
		}
		//时间错误 引用 UTIL中  带  毫秒是时间
		enInfo.setDate(DateUtils.getDateFormatString());
//		int  num1 = Integer.parseInt(num);
		try{
//			//获取是否有初审未同意的数据 如果有  那 可以再次提交申请
//			List list = enService.selecteEnList("com.wr4.domain.MotEnInfo.getEnApplyIsBolList", enInfo, offset,limit);
//			//获取是否有审核未同意的数据 如果有  那 可以再次提交申请
//			List shlist = enService.selecteEnList("com.wr4.domain.MotEnInfo.getEnApplyShIsBolList", enInfo);
//			if(list!=null&&list.size()>0){
//				
//				if(shlist!=null&&shlist.size()>0){
//					
//				}else{
//					//需要保存表单
//					request.setAttribute("enInfo", enInfo);
//					request.setAttribute("msg", "不能重复提交，请联系主管机关处理!");
//					return s;
//				}
//				
//			}
//			if(num1==0){
				boolean bol =enService.updateEnApply("", enInfo, examine);
				this.applyId=String.valueOf(enInfo.getId());
				if(bol){
					request.setAttribute("msg", "yes");
				}else{
					enInfo.setBustype(enInfo.getBusType()==null||"".equals(enInfo.getBusType())
							?enInfo.getBustype():enInfo.getBusType());
					//需要保存表单
					request.setAttribute("enInfo", enInfo);
					request.setAttribute("msg", "修改失败,请检查!");
					return s;
				}
			
		}catch(Exception e){
			request.setAttribute("msg", "修改失败,请检查!");
			e.printStackTrace();
		}
		return s;
	}
	/**
	 * 验证是否已经进行达标自评
	 */
	public void  isDbzp(){
		try {
			EnInfo en=new EnInfo();
			String busclass=request.getParameter("busclass");
			String grade=request.getParameter("grade");
			String userid = request.getSession().getAttribute("userid").toString();
			en.setUserId(userid);
			en.setType2(busclass);
			en.setGrade(grade);
			List  zplist=enService.selecteEnList("com.wr4.domain.MotEnInfo.getEnZpListIsBol", en);
			if(zplist!=null &&zplist.size()>0){
				writer("yes");
			}else{
				writer("您还没有进行达标自评或您申请的等级或业务类型不符!请检查是否已正确提交达标自评。");
			}
		} catch (Exception e) {
			logger.error("读取是否已达标失败；method :isDbzp");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private String applyId;
	/***
	 * 企业 资格申请action
	 * @return
	 */
	public String enApplyInsert() {
		String s = SUCCESS;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String userId = request.getSession().getAttribute("userid").toString();
		String mot = request.getSession().getAttribute("mot").toString();
		Examine examine = new Examine();
		examine.setUserid(userId);
		examine.setUsertype(request.getSession().getAttribute("usertype").toString());
		examine.setStatus("已申请");
		examine.setBustype(enInfo.getType2());
		examine.setPid(request.getSession().getAttribute("paperid").toString());
		examine.setAuditerMot(mot);
		enInfo.setUserId(userId);
		enInfo.setPid(enInfo.getPid().substring(2));
		if(enInfo.getApporg()==null||"".equals(enInfo.getApporg())){
			//需要保存表单
			request.setAttribute("enInfo", enInfo);
			request.setAttribute("msg", "还未选择考评机构,请选择考评机构!");
		}
		//时间错误 引用 UTIL中  带  毫秒是时间
		enInfo.setDate(DateUtils.getDateFormatString());
//		int  num1 = Integer.parseInt(num);
		try{
//			//获取是否有初审未同意的数据 如果有  那 可以再次提交申请
			List list = enService.selecteEnList("com.wr4.domain.MotEnInfo.getEnApplyIsBolList", enInfo, offset,limit);
			//获取是否有审核未同意的数据 如果有  那 可以再次提交申请
			List shlist = enService.selecteEnList("com.wr4.domain.MotEnInfo.getEnApplyShIsBolList", enInfo);
			if(list!=null&&list.size()>0){
				
				if(shlist!=null&&shlist.size()>0){
					
				}else{
					//需要保存表单
					request.setAttribute("enInfo", enInfo);
					request.setAttribute("msg", "不能重复提交，请联系主管机关处理!");
					return s;
				}
				
			}
//			if(num1==0){
				boolean bol =enService.saveEnApply("", enInfo, examine);
				this.applyId=String.valueOf(enInfo.getId());
				if(bol){
					request.setAttribute("msg", "申请成功");
				}else{
					//需要保存表单
					request.setAttribute("enInfo", enInfo);
					request.setAttribute("msg", "申请失败,请检查!");
					return s;
				}
			
		}catch(Exception e){
			request.setAttribute("msg", "申请失败,请检查!");
			e.printStackTrace();
		}
		return s;
	}
	public String enDoFirstApply(){
		return "apply";
	}
	/**
	 * 生成企业申请流水号
	 * @param motcode
	 * @param type
	 * @param grade
	 * @return
	 */
	public String createEnNum(String motcode,String type,String grade){
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String curDate=sdf.format(date);
		String certDate=curDate.substring(2, 4);
		Map map = new HashMap();
		String applyno =certDate+type+grade;
		map.put("applyno", applyno);
		String NoNum;
		try {
			NoNum = enService.queryNoNum("com.wr4.domain.MotOrgInfo.queryNoNum",map);
			if(NoNum.length()!=4){
				int temp=NoNum.length();
				for(int i=0;i<(4-temp);i++){
					NoNum="0".concat(NoNum);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "";
	}
	public void submitAudit(){
		String advice = request.getParameter("advice");
		String applyId = request.getParameter("applyId");
		String id = request.getParameter("id");
		String grade = request.getParameter("grade");  //企业等级
		String motCity = request.getParameter("motCity");
		String enCity = request.getParameter("enCity");
		String type = request.getParameter("type");//1同意 0不同意
		String pid = request.getParameter("pid").trim();
		String busType = request.getParameter("busType").trim();
		String mot = request.getParameter("adminmot").trim();
		String dataUserId=request.getParameter("userid")==null?"":request.getParameter("userid");
		String dataBusType=request.getParameter("uppername")==null?"":request.getParameter("uppername");
		String orgId = request.getParameter("orgId")==null?"":request.getParameter("orgId").trim();
		String userId = request.getSession().getAttribute("userid").toString();
		String motCode = request.getSession().getAttribute("mot").toString();
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String curDate=DateUtils.getDateFormatString().substring(0, 19);
		//String userType = request.getSession().getAttribute("usertype").toString();//当前登录人的用户类型
		String usertype = request.getParameter("usertype");//前台提交记录的用户类型
		String userSessionType= request.getSession().getAttribute("usertype").toString();//当前登录人的用户类型
		//考评员直接颁发字段
		String passdirect = request.getParameter("passdirect");//前台提交记录的是否直接颁发
		String directtitle = request.getParameter("directtitle");//前台提交记录的直接颁发人职务
		String directname =request.getParameter("directname");//前台提交记录的直接颁发人姓名 
		 
		Examine examine = new Examine();
		examine.setPid(pid);
		examine.setAdvice(advice);
		boolean flag=false;
		try {
			if("pn".equals(usertype)){
				examine.setOldStatus("已处理");
				examine.setNextStatus("已申请");
				examine.setUserid(userId);
				examine.setUsertype(usertype);
				examine.setStatus("待考评");
				examine.setAuditdate(curDate);
				examine.setBustype(busType);
				examine.setAuditerMot(mot);
				examine.setResults(type);
				examine.setApplyId(id);
				examine.setAuditer(userId);
				examine.setAuditdate(DateUtils.getDateFormatString());
				examine.setDirectjon(directtitle);
				examine.setPass_direct(passdirect);
				examine.setDirectname(directname);
				
				flag = enService.submitExam("", examine,usertype,"");
			}else{
				
				if(StringUtils.isNotBlank(orgId) && "2".equals(grade)){
					examine.setNextStatus("已初受理");
					//表示当前企业是省直管
					if(2 == enCity.length()){
						examine.setNextStatus("已申请");
					}
				}else{
					examine.setNextStatus("已申请");
				}
				examine.setUserid(userId);
				examine.setUsertype(userSessionType);
				if("org".equals(usertype)){
					examine.setStatus("待发证");
				}else{
					examine.setStatus("待考评");
					examine.setAuditername(request.getSession().getAttribute("username").toString());
					examine.setAuditerdate(DateUtils.getDateFormatStr());
				}
				//当前登录用户code长度为4；企业等级为2；考评机构为空 (表示2级企业初次受理)
				if(StringUtils.isBlank(orgId) && "2".equals(grade) && motCode.length() == 4){
					examine.setOldStatus("已初受理");
					examine.setStatus("待终受理");
				}else{
					examine.setOldStatus("已处理");
				}
				
				examine.setAuditdate(curDate);
				examine.setBustype(busType);
				examine.setAuditerMot(mot);
				examine.setAuditer(orgId);
				examine.setResults(type);
				examine.setApplyId(applyId);
				examine.setBeiyong4(dataUserId);
				examine.setBeiyong3(dataBusType);
				flag = enService.submitExam("", examine,usertype,"");
			}
			if(flag==true){
				writer("0");
			}else{
				writer("1");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 换证申请提交
	 */
	public void submitAuditChange(){
		String advice = request.getParameter("advice");
		String type = request.getParameter("type");//1同意 0不同意
		String pid = request.getParameter("pid");
		String id=request.getParameter("id");
		String auditer = request.getSession().getAttribute("userid")==null?"":request.getSession().getAttribute("userid").toString();
		String userid = request.getParameter("userid");
		String busType=request.getParameter("busType");
		String usertype = request.getParameter("usertype");//前台提交记录的用户类型
		Examine examine = new Examine();
		boolean flag=false;
		try {
			examine.setPid(pid);
			examine.setAdvice(advice);
			examine.setOldStatus("已处理");
			examine.setNextStatus("已申请");
			examine.setStatus("待考评");
			examine.setAuditdate(DateUtils.getDateFormatString());
			examine.setResults(type);
			examine.setApplyId(id);
			examine.setBustype(busType);
			examine.setAuditer(auditer);
			examine.setUserid(userid);
			flag = enService.submitExam("com.wr4.domain.PnTrain.updateChangeApply", examine,"pn1","");
			if(flag==true){
				writer("0");
			}else{
				writer("1");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 换证申请提交
	 */
	public void submitAuditChangeCert(){
		String cid=request.getParameter("cid");
		String isSure=request.getParameter("type");
		String changereason=request.getParameter("changereason");
		String id=request.getParameter("id");
		try{
			Map map=new HashMap();
			map.put("cid", cid);
			map.put("changeresault", isSure);
			map.put("changedate", DateUtils.getDateFormatString());
			map.put("changereason", changereason==null?"":changereason);
			map.put("id", id);
			//不同意
			if("0".equals(isSure)){
				//此处 传入的sqlid  做废  在 service中另写
				 boolean bol=enService.submitAuditChangeCert("com.wr4.domain.MotEnInfo.getEnAuditList", map);
				 if(bol){
					 writer("0");
				 }else{
					 writer("系统数据异常，请联系系统管理员！");
				 }
			}else if("1".equals(isSure)){//同意
				//此处 传入的sqlid  做废  在 service中另写
			 boolean bol=enService.submitAuditChangeCert("com.wr4.domain.MotEnInfo.getEnAuditList", map);
			 if(bol){
				 writer("0");
			 }else{
				 writer("系统数据异常，请联系系统管理员！");
			 }
			}
		}catch(Exception e){
			 try {
				writer("系统异常，请联系系统管理员！");
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
	}
	public String enAudit(){
		return "audit";
	}
	public void delApplyInfo(){
		String applyId = request.getParameter("applyId");
		boolean flag=false;
		try {
			flag=enService.delEnApplyInfo("com.wr4.domain.MotEnInfo.delApplyInfo", Integer.parseInt(applyId));
			if(flag==true){
				writer("0");
			}else{
				writer("1");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void getEnAuditList(){
		List<EnInfo> list = null;
		String mot = request.getSession().getAttribute("mot")+"";
		EnInfo en = new EnInfo();
		//辽宁省特殊要求0702 只想看到道路运输和水路运输的数据   0703只想看到熟路运输和港口运营的数据 0704 只想看到交通运输工程建设的数据
//		if(mot.equals("0702")){
//			en.setAdminmot("07");
//			en.setUno("0702");
//		}else if(mot.equals("0703")){
//			en.setAdminmot("07");
//			en.setUno("0703");
//		}else if(mot.equals("0704")){
//			en.setAdminmot("07");
//			en.setUno("0704");
//		}else{
//			en.setAdminmot(mot);
//		}
		try {
			getPageParameter();
			Map map = new HashMap();
			map.put("motcode", mot);
			en.setAdminmot(mot);
			List<TaskAssignation> TaskList = taskAssignationService.queryTaskInfo("com.wr4.domain.TaskAssignation.getFileId",map);
			if(TaskList != null && TaskList.size() >0){
				String areaCode = TaskList.get(0).getAreaCode();		//区域code
				String motCode = TaskList.get(0).getMotCode();			//主管机关code
				String fileIds = TaskList.get(0).getFileId();			//专业id
				map.clear();
				//超级用户(不分区域和专业)
				if(motCode.length() == 4 && areaCode.length() == 2){ //省专业局(分专业 不分区域)
					en.setType2(fileIds);
				}else if(motCode.length() == 4 && areaCode.length() == 7){ //地市业务局(分区域 不分专业)
					en.setCity(areaCode);
				}else if(motCode.length() == 6){	//地市专业局(分区域 分专业)
					en.setType2(fileIds);
					en.setCity(areaCode);
				}else{
					en.setAdminmot(null);
				}
			}else{
				en.setType2("null");
				en.setCity("null");
			}
			en.setStart(start);
			en.setPagesize(pagesize);
			list = enService.selecteEnList("com.wr4.domain.MotEnInfo.getEnAuditList", en, offset,limit);
			int count=getCount("com.wr4.domain.MotEnInfo.getEnAuditListCount", en);
			writeLigerJson(list, count);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void submitResultAudit(){
		String examFlag = "0";			//判断是否要复审   0：否  1：是
		String advice = request.getParameter("advice");
		String applyId = request.getParameter("applyId");
		String grade = request.getParameter("grade");  //企业等级
		String auditResult = request.getParameter("auditResult");  //审核结果
		String type = request.getParameter("type");//1同意 0不同意
		String pid = request.getParameter("pid");
		String busType = request.getParameter("busType");
		String mot = request.getParameter("adminmot");
		String userId = request.getSession().getAttribute("userid").toString();
		String orgId = request.getParameter("orgId");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String userType = request.getSession().getAttribute("usertype").toString();//当前登录人的用户类型
		String usertype = request.getParameter("usertype");//前台提交记录的用户类型
		
		String loginMot = request.getSession().getAttribute("mot")+"";
		String loginCity = request.getSession().getAttribute("motCity")+"";
		
		Examine examine = new Examine();
		boolean flag=false;
		try {
			examine.setPid(pid);
			examine.setAdvice(advice);
			//判断当前是二级主管机关初审核
			if("2".equals(grade) && loginMot.length() == 4 && loginCity.length()>2){
				examFlag = "1";
				examine.setOldStatus("待审核");
			}else{
				examine.setOldStatus("已审核");
			}
			//判断当前是终审核
//			if("2".equals(auditResult) && "2".equals(grade)){
//				examine.setNextStatus("已初审核");
//			}else{
//			}
			examine.setNextStatus("待审核");
			examine.setUserid(userId);
			examine.setUsertype(userType);
			examine.setStatus("待发证");
			examine.setAuditdate(sdf.format(new Date()));
			examine.setBustype(busType);
			examine.setAuditerMot(mot);
			examine.setAuditer(orgId);
			examine.setResults(type);
			examine.setApplyId(applyId);
			examine.setAuditername(request.getSession().getAttribute("username").toString());
			examine.setAuditerdate(DateUtils.getDateFormatStr());
			examine.setExamType("1");
			flag = enService.submitExam("", examine,usertype,examFlag);
			if(flag==true){
				writer("0");
			}else{
				writer("1");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void getEnProduceList(){
		List<EnInfo> list = null;
		String paperid = request.getSession().getAttribute("paperid")+"";
		EnInfo en = new EnInfo();
		en.setPid(paperid);
		try {
			getPageParameter();
			en.setStart(start);
			en.setPagesize(pagesize);
			list = enService.selecteEnList("com.wr4.domain.MotEnInfo.getEnProduceList", en, offset,limit);
			int count=getCount("com.wr4.domain.MotEnInfo.getEnProduceListCount", en);
			writeLigerJson(list, count);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/***
	 * 考评机构登录，考评员基本信息查询
	 * @throws Exception 
	 */
	public void pnBaseInfo() throws Exception{
		Map map = new HashMap();
		request.setCharacterEncoding("UTF-8");
		String enname= URLDecoder.decode(request.getParameter("enname").toString(), "UTF-8");
		String encid=request.getParameter("encid").trim();
		getPageParameter();
		if(!"".equals(enname)&&!"".equals(encid)&&!"---".equals(encid)){
			map.put("enname", enname.trim());
			map.put("cid", encid.trim());
		}else{
			if("".equals(enname)&&"".equals(encid)){
				map.put("enname", enname);
				map.put("cid", encid);
			}else if("".equals(enname)&&!"".equals(encid)&&!"---".equals(encid)){
				map.put("enname", null);
				map.put("cid", encid.trim());
			}else if(!"".equals(enname)&&"".equals(encid)){
				map.put("enname", enname);
				map.put("cid", null);
			}else if(!"".equals(enname)&&"---".equals(encid)){
				map.put("enname", enname);
				map.put("cid", null);
			}else if("".equals(enname)&&"---".equals(encid)){
				map.put("enname", null);
				map.put("cid", null);
			}
		}
		map.put("start", start);
		map.put("pagesize", pagesize);
//		List listAll = enService.getPnByConAll("com.wr4.domain.MotEnInfo.getPnByUserIdAndBustype", map);
		int count=getCount("com.wr4.domain.MotEnInfo.getPnByUserIdAndBustypeCount", map);
		List list = enService.getPnByCon("com.wr4.domain.MotEnInfo.getPnByUserIdAndBustype", map,offset,limit);
		writeLigerJson(list,count);
	}
	public void getScheduleList(){
		List<EnInfo> list = null;
		String paperid = request.getSession().getAttribute("paperid")+"";
		String applyId = request.getParameter("applyId");
		Examine ex = new Examine();
		ex.setApplyId(applyId);
		ex.setPid(paperid);
		ex.setBustype(request.getParameter("bustype"));
		try {
			getPageParameters();
			list = enService.getSchedule("com.wr4.domain.MotEnInfo.getSchedule", ex);
			if (list != null && list.size() > 0) {
				JSONArray jsonObject = JSONArray.fromObject(list);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString() + ",Total:"
						+ list.size() + "}";
				writer(js);
			}else{
				list=new ArrayList();
				JSONArray jsonObject = JSONArray.fromObject(list);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString() + ",Total:"
						+ list.size() + "}";
				writer(js);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 获取企业对应业务类别的评分   submitResultAudit
	 */
	public void getEnZpListByClass(){
		try{
			//此方法通用 返回List
			String enuserid=request.getParameter("userid");
			String enclass=request.getParameter("type");
			Map map=new HashMap();
			map.put("userid", enuserid);
			map.put("type2", enclass);
			List  list=enService.getPnByConAll("com.wr4.domain.MotEnInfo.getEnZpListByBusClass", map);
			writeLigerJson(list,list.size());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 获取企业对应业务类别的评分   submitResultAudit
	 */
	public void getEnKpListByClass(){
		try{
			//此方法通用 返回List
			String enuserid=request.getParameter("orgid");
			String enclass=request.getParameter("type");
			String applyid=request.getParameter("applyid");
			Map map=new HashMap();
			map.put("userid", enuserid);
			map.put("type2", enclass);
			map.put("applyid", applyid);
			List  list=enService.getPnByConAll("com.wr4.domain.MotEnInfo.getEnKpListByBusClass", map);
			writeLigerJson(list,list.size());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 获取企业提交的换证申请列表
	 */
	public void getEnChangeAppList(){
		List<EnInfo> list = null;
		String mot = request.getSession().getAttribute("mot")+"";
		EnInfo en = new EnInfo();
		en.setAdminmot(mot);
		try {
			getPageParameters();
			list = enService.selecteEnList("com.wr4.domain.MotEnInfo.getEnChangeList", en );
			writeLigerJson(list, list.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 根据企业证书号获取相对应的考评机构列表
	 */
	
	public void getOrgListByEnCert(){
		List list=null;
		try{
			String certnumber=request.getParameter("certnumber");
			Map map=new HashMap();
			map.put("adminmot", request.getSession().getAttribute("mot").toString());
			map.put("certnumber", certnumber);
			list = enService.selecteEnList("com.wr4.domain.MotOrgInfo.getCertOrgByEn", map );
			JSONArray jsonObject = JSONArray.fromObject(list);
			writer(jsonObject.toString());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 根据企业生产经营类别获取相对应的考评机构列表
	 */
	
	public void getOrgListByEnClass(){
		List list=null;
		try{
			String bustype=request.getParameter("bustype");
			String grade=request.getParameter("grade");
			Map map=new HashMap();
			map.put("grade", grade);
			map.put("adminmot", request.getSession().getAttribute("mot").toString());
			map.put("bustype", bustype);
			list = enService.selecteEnList("com.wr4.domain.MotOrgInfo.getCertOrgByEnBusType", map );
			JSONArray jsonObject = JSONArray.fromObject(list);
			writer(jsonObject.toString());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 获得证书编号
	 */
	public void getCertDate(){
		String adminmot = request.getParameter("motnum");//主管机关编号
		String usertype = request.getParameter("usertype");//主管机关编号
		String bussinestype = request.getParameter("bussinestype");//主管机关编号
		//生成证书号
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String curDate = sdf.format(date);
		String certDate = curDate.substring(0,4);
		Map map = new HashMap();
		map.put("certDate",certDate);
		map.put("curDate",curDate);
		//当日证书号的个数
		try {
			if("pn".equals(usertype)){
				certDate=certDate+"-"+bussinestype+"-"+adminmot;
				map.put("certDate",certDate);
			}else{
				certDate=certDate+"-"+adminmot;
				map.put("certDate",certDate);
			}
			String NoNum = orgService.queryNoNum("com.wr4.domain.MotOrgInfo.queryNoNum", map);
			if(NoNum.length()!=6){
				int temp = NoNum.length();
				for(int i = 0;i<(6-temp);i++){
					NoNum="0".concat(NoNum);
				}
			}
			certDate=certDate+"-"+NoNum;
			writer(certDate);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 插入附加考评流程
	 * @param sqlId
	 * @param object
	 * @return
	 * @throws Exception
	 */
	public void  insertAddedExamine(){
		try{
			String certnumber=request.getParameter("certnumber");
			String auditerMot=request.getParameter("auditermot");
			String auditer=request.getParameter("auditer");
		
			String addedremark=request.getParameter("addedremark");//附加考评意见
			String addedreason=request.getParameter("addedreason");//附加考评原因
			String bustype=request.getParameter("bustype");
			String userid =request.getSession().getAttribute("userid").toString();
			String usertype=request.getSession().getAttribute("usertype").toString();
			Map map=new HashMap();
			map.put("adminmot", request.getSession().getAttribute("mot").toString());
			map.put("certnumber", certnumber);
			map.put("userid", userid);
			map.put("usertype", usertype);
			map.put("auditer", auditer);
			map.put("auditermot", auditerMot);
			map.put("auditdate", DateUtils.getDateFormatString());
			map.put("examtype", "502");
			map.put("handletype", "en");
			map.put("addedreason", addedreason);
			map.put("addedremark", addedremark);
		 
			map.put("status", "待考评");
			boolean bol= enService.insertAddedExamine("com.wr4.domain.MotOrgInfo.insertAddedExamine", map );
			 if(bol){
				 writer("yes");
			 }else{
				 writer("附加考评失败,请联系系统管理员！");
			 }
			
		}catch(Exception e){
			try {
				writer("系统异常,请联系系统管理员！");
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		
	}
	/**
	 * 获取企业公示的列表
	 */
	public void getEnPublicityList(){
		List<EnInfo> list = null;
		String mot = request.getSession().getAttribute("mot")+"";
		String ename = request.getParameter("ename");
		String entype = request.getParameter("entype");
		String grade = request.getParameter("grade");
		String resp = request.getParameter("resp");
		String respreview = request.getParameter("respreview");
		String resprevel = request.getParameter("resprevel");
		EnInfo en = new EnInfo();
		if(mot.equals("null") || "".equals(mot)){
			en.setAdminmot("07");
		}else{
			en.setAdminmot(mot);
		}
		if (ename !=null && !"".equals(ename)) {
			en.setEnname(ename);
		}
		if(entype !=null && !"".equals(entype)){
			en.setBustype(entype);
		}
		if(grade !=null && !"".equals(grade)){
			en.setGrade(grade);
		}
		if(resp !=null && !"".equals(resp)){
			en.setResp(resp);
		}
		if(respreview !=null && !"".equals(respreview)){
			en.setRespReview(respreview);
		}
		if(resprevel !=null && !"".equals(resprevel)){
			en.setResp_eval(resprevel);
		}
		try {
			getPageParameter();
			en.setStart(start);
			en.setPagesize(pagesize);
			list = enService.selecteEnList("com.wr4.domain.MotEnInfo.getEnPublicityList", en, offset,limit);
			int count=getCount("com.wr4.domain.MotEnInfo.getEnPublicityListCount", en);
			writeLigerJson(list, count);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 导出企业公示的列表
	 * @return
	 */
	public String exportEnpublicity() throws Exception{
		List<EnInfo> list = null;
		String mot = request.getSession().getAttribute("mot")+"";
		EnInfo en = new EnInfo();
		if(mot.equals("null") || "".equals(mot)){
			en.setAdminmot("07");
		}else{
			en.setAdminmot(mot);
		}
		XSSFWorkbook xwb = null;
		String xlsName = ServletActionContext.getServletContext().getRealPath("/");
		String xlsName1 = xlsName + "reports/orgList.xls";
		String prpoFileName = xlsName+"reports/sysList.properties";
		String str = "en";
		list = enService.selecteEnList("com.wr4.domain.MotEnInfo.getEnPublicityList1",en,0,99999999);
		
		//企业名称：EnInfo.enname;业务类别：filetext；达标等级：grade；考评机构：。。。；自评分数：selfScore；考评分数：kaoScore
		List<EnInfo> newList = new ArrayList<EnInfo>();
		if(list != null){
			for(int i = 0;i<list.size();i++){
				EnInfo e = list.get(i);
				//更换级别的显示
				if(e.getGrade().equals("1")){
					e.setGrade("一级");
				}else if(e.getGrade().equals("2")){
					e.setGrade("二级");
				}else if(e.getGrade().equals("3")){
					e.setGrade("三级");
				}
				//显示考评机构
				//OrgInfo orgInfo = orgService.getOrgBypid("com.wr4.domain.MotOrgInfo.selectOrg",e.getApporg());
				//e.setApporg(orgInfo.getOrgname());
				newList.add(e);
			}
		}
		
		 //建立导出到这个文件   
		ExportUtil eu=new ExportUtil();
		eu.exportFile(xlsName1, "enList", newList,  prpoFileName,str);
		return null;
	}
	public TaskAssignationService getTaskAssignationService() {
		return taskAssignationService;
	}
	public void setTaskAssignationService(
			TaskAssignationService taskAssignationService) {
		this.taskAssignationService = taskAssignationService;
	}
}

package com.wr4.action;

import java.io.File;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import sun.rmi.runtime.Log;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.wr4.domain.EnInfo;
import com.wr4.domain.IndexInfo;
import com.wr4.domain.MotInfo;
import com.wr4.domain.OrgInfo;
import com.wr4.domain.User;
import com.wr4.service.EnService;
import com.wr4.service.IMotService;
import com.wr4.service.OrgService;
import com.wr4.util.DateUtils;
import com.wr4.util.ZipUtils;

public class MotAction extends BaseAction {
	
	private MotInfo motInfo;
	private User user;
	private IMotService<MotInfo>  motService;
	private IndexInfo  indexInfo;
	private EnService<EnInfo>   enService;
	private OrgService<OrgInfo> orgService;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public IndexInfo getIndexInfo() {
		return indexInfo;
	}
	public void setIndexInfo(IndexInfo indexInfo) {
		this.indexInfo = indexInfo;
	}
	public MotInfo getMotInfo() {
		return motInfo;
	}
	public void setMotInfo(MotInfo motInfo) {
		this.motInfo = motInfo;
	}
	public IMotService<MotInfo> getMotService() {
		return motService;
	}
	public void setMotService(IMotService<MotInfo> motService) {
		this.motService = motService;
	}
	public EnService<EnInfo> getEnService() {
		return enService;
	}
	public void setEnService(EnService<EnInfo> enService) {
		this.enService = enService;
	}
	public OrgService<OrgInfo> getOrgService() {
		return orgService;
	}
	public void setOrgService(OrgService<OrgInfo> orgService) {
		this.orgService = orgService;
	}
	/**
	 * 跳转到list页面
	 * @return
	 */
	public String motList(){
		
		return "motList";
	}
	public void getMotList(){
		List<MotInfo> list = null;
		try {
			String motCode=request.getSession().getAttribute("mot") == null ?"" :request.getSession().getAttribute("mot").toString()  ;
			if(motInfo==null){
				motInfo=new MotInfo();
			}
			motInfo.setMotcode(motCode);
			list = motService.selectMot("com.wr4.domain.MotInfo.selectMotList2", motInfo, offset,limit);
			int i = motService.selectCount("com.wr4.domain.MotInfo.selectMotListCount2", motInfo);
			//调用公共方法组合 json向前台输出
			writeLigerJson(list,i);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * 获取最新motcode
	 */
	public void getNowMotCode(){
		List<MotInfo> list = null;
		try {
			list = motService.selectMot("com.wr4.domain.MotInfo.selectMotList2", motInfo, offset,limit);
			String lastMotCode=list.get(list.size()-1).getMotcode();
			//motcode+1返回
			String nowMotCode="0"+(new Integer(lastMotCode)+1);
			writer(nowMotCode);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 删除下级主管机关
	 */
	public void motUpdateDel(){
		List<MotInfo> list = null;
		try {
			String mot=request.getParameter("json");
			if (motInfo==null){
				motInfo=new MotInfo();
			}
			JSONObject js=JSONObject.fromObject(mot);
			motInfo=(MotInfo) js.toBean(js,motInfo.getClass());
			int i = motService.motUpdate("com.wr4.domain.MotInfo.deleteMotById", motInfo);
			if(i>0){
				writer("yes");
			}else{
				writer("删除主管机关失败，请与管理员联系");
			}
		} catch (Exception e) {
			try {
				writer("修改主管机关失败，请与管理员联系");
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
	}
	/**
	 * 修改下级主管机关
	 */
	public void motUpdate(){
		List<MotInfo> list = null;
		try {
			String mot=request.getParameter("json");
			if (motInfo==null){
				motInfo=new MotInfo();
			}
			JSONObject js=JSONObject.fromObject(mot);
			motInfo=(MotInfo) js.toBean(js,motInfo.getClass());
			int i = motService.motUpdate("com.wr4.domain.MotInfo.updateMotById", motInfo);
			if(i>0){
				writer("yes");
			}else{
				writer("修改主管机关失败，请与管理员联系");
			}
		} catch (Exception e) {
			try {
				writer("修改主管机关失败，请与管理员联系");
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
	}
	
	/**
	 * 新增下级主管机关
	 */
	public void motAdd(){
		List<MotInfo> list = null;
		try {
			String mot=request.getParameter("json");
			if (motInfo==null){
				motInfo=new MotInfo();
			}
			JSONObject js=JSONObject.fromObject(mot);
			motInfo=(MotInfo) js.toBean(js,motInfo.getClass());
			int i = motService.motAdd("com.wr4.domain.MotInfo.insertMot", motInfo);
			if(i>0){
				writer("yes");
			}else{
				writer("新增主管机关失败，请与管理员联系");
			}
		} catch (Exception e) {
			try {
				writer("新增主管机关失败，请与管理员联系");
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
	}
	public void getMotCodeIsRealy(){
		
		try {
			String motCode=request.getParameter("motcode");
			motInfo.setMotupper(motCode);
			motInfo.setMotcode(motCode);
			motInfo = motService.selectMotOne("com.wr4.domain.MotInfo.selectMotList", motInfo);
			if(motInfo!=null&&motInfo.getMotcode()!=null){
				writer( "yes");
			}
			writer( "no");
		} catch (Exception e) {
			try {
				writer( "系统操作异常，请联系系统管理员！");
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
	}
	public String getMotDetail(){
		
		try {
			getPageParameters();
			String motCode=request.getSession().getAttribute("mot") == null ?"" :request.getSession().getAttribute("mot").toString()  ;
			motInfo.setMotupper(motCode);
			motInfo = motService.selectMotOne("com.wr4.domain.MotInfo.selectMotList", motInfo);
			JSONObject js=JSONObject.fromObject(motInfo);
			request.setAttribute("js", js.toString());
		} catch (Exception e) {
			request.setAttribute("msg", "获取数据失败，请重试！");
			e.printStackTrace();
		}
		return "motList";
	}
	/**
	 * 首页内容维护
	 * @return
	 */
	public String indexMotInsert(){
		try{
			String userid=request.getSession().getAttribute("userid").toString();
			//创建人为当前登录人
			indexInfo.setUserid(userid);
			if(StringUtils.isEmpty(indexInfo.getPno())){
				indexInfo.setPno("0");
			}
			//创建时间
			indexInfo.setCreatedate(DateUtils.getDateFormatString());
			//制定固定的访问地址
		    indexInfo.setLinkhref(request.getContextPath()+"/JSP/mot/content.jsp");
			int i=motService.indexMotInsert("com.wr4.domain.MotInfo.insertIndex", indexInfo);
			if(i>0){
				request.setAttribute("msg", "添加成功！");
			}else{
				request.setAttribute("msg", "添加失败，请联系系统管理员！");
			}
		}catch(Exception e){
			request.setAttribute("msg", "添加失败，请联系系统管理员！");
			e.printStackTrace();
		}
	
		return "indexMotEdit";
	}
	
	/**
	 * 查询首页内容
	 */
	public void getIndexList(){
		List<IndexInfo> list = null;
		try {
			list = motService.getIndexList("com.wr4.domain.MotInfo.getIndexList");
			//调用公共方法组合 json向前台输出
			writeLigerJson(list,list.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 查看首页内容
	 */
	public void getIndexDetail(){
		try {
			String id=request.getParameter("id");
			indexInfo = motService.getIndexData("com.wr4.domain.MotInfo.getIndexById", id);
			//判断indexInfo是否为空 为空 查询出错
			if(indexInfo!=null){
				JSONObject json=JSONObject.fromObject(indexInfo);
				writer(json.toString());
			}else{
				writer( "查询首页内容出错，请确认是否已删除！");
			}
		} catch (Exception e) {
			try {
				writer( "查询首页内容出错，请与系统管理员联系！");
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 查看首页内容
	 */
	public String getIndexData(){
		try {
			String id=request.getParameter("id");
			indexInfo = motService.getIndexData("com.wr4.domain.MotInfo.getIndexData", id);
			//判断indexInfo是否为空 为空 查询出错
			if(indexInfo!=null){
				request.setAttribute("indexInfo",indexInfo);
			}else{
				request.setAttribute("msg", "查询首页内容出错，请确认是否已删除！");
			}
		} catch (Exception e) {
			request.setAttribute("msg", "查询首页内容出错，请与系统管理员联系！");
			e.printStackTrace();
			return "getIndexData";
		}
		return "getIndexData";
	}
	
	/**
	 * 修改首页内容
	 */
	public String updateIndexData(){
		try {
			boolean bol = motService.updateIndexData("com.wr4.domain.MotInfo.updateIndexData", indexInfo);
			//判断indexInfo是否为空 为空 查询出错
			if(bol){
				request.setAttribute("msg", "yes");
			}else{
				request.setAttribute("msg", "修改首页内容出错，请确认是否已删除");
			}
		} catch (Exception e) {
			try {
				request.setAttribute("msg", "修改首页内容出错，请联系系统管理员！");
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
			return "updateIndexData";
		}
		return "updateIndexData";
	}
	/**
	 * 删除首页内容
	 */
	public void deleteIndexData(){
		try {
			String id=request.getParameter("id");
			indexInfo.setId(Integer.parseInt(id));
			//逻辑删除后台更新  del字段状态为1
			boolean bol = motService.updateIndexData("com.wr4.domain.MotInfo.deleteIndexData", indexInfo);
			//判断indexInfo是否为空 为空 查询出错
			if(bol){
				this.writer("yes");
			}else{
				this.writer("删除首页内容出错，请确认是否已删除");
			}
		} catch (Exception e) {
			try {
				this.writer("删除首页内容出错，请与系统管理员联系！");
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
	}
	/**
	 * 根据栏目内容获取展示首页内容
	 */
	public void getIndexListFromType(){
		List<IndexInfo> list = null;
		try {
			//String type=request.getParameter("type") == null ?"" :request.getParameter("type").toString()  ;
			list = motService.getIndexList("com.wr4.domain.MotInfo.getIndexList");
			//调用公共方法组合 json向前台输出
			writeLigerJson(list,list.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 获取用户列表
	 */
	 
	public void getMotUserList(){
		List<MotInfo> list = null;
		try {
			getPageParameter();
			String admin = request.getParameter("admin");
			String motname = request.getParameter("motname");
			String pid = request.getParameter("pid");
			String motCode=request.getSession().getAttribute("mot") == null ?"" :request.getSession().getAttribute("mot").toString()  ;
			motInfo=new MotInfo();
			motInfo.setMotcode(motCode);
			if (admin!=null&& !"".equals(admin) ) {
				motInfo.setAdmin(admin);
			}
			if (motname!=null&& !"".equals(motname) ) {
				motInfo.setMotname(motname);
			}
			if (pid!=null&& !"".equals(pid) ) {
				motInfo.setUserId(pid);
			}
			motInfo.setStart(start);
			motInfo.setPagesize(pagesize);
			list = motService.selectMot("com.wr4.domain.MotInfo.getUserList", motInfo, offset,limit);
			//List listAll = motService.selectMot("com.wr4.domain.MotInfo.getUserList", motInfo,0,0);
			int count=getCount("com.wr4.domain.MotInfo.getUserListCount", motInfo);
			//调用公共方法组合 json向前台输出
			writeLigerJson(list,count);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 重置密码
	 */
	public void resetPwd(){
		String username=request.getParameter("username").toString().trim();
		String pwd=md5("000000");
		Map map=new HashMap();
		map.put("username", username);
		map.put("pwd", pwd);
		try{
		int temp=motService.resetPwd("com.wr4.domain.MotInfo.resetPwd",map);
		if(temp>0){
			writer("1");
		}else{
			writer("0");
		}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 去查看内容页面
	 */
	public void toContent(){
		try {
			Map map = new HashMap();
			String id=request.getParameter("id");
			map.put("id", id);
			indexInfo = motService.getIndexInfoById("com.wr4.domain.MotInfo.getIndexById", map);
			
			String fileName=indexInfo.getFilename();
			System.out.println("fileName:"+fileName);
			if(!"".equals(fileName)){
				
				//得到文件类型
				String indexInfoFileType=fileName.substring(fileName.lastIndexOf(".")+1);
				//得到文件名称
				String indexInfoFileName=fileName.substring(0, fileName.indexOf("."));
				
				String fileNames="";
				if(indexInfoFileType.equals("zip") || indexInfoFileType.equals("rar")){
					
					String realpath = ServletActionContext.getServletContext().getRealPath("\\images");
					
					String ziprealPath=realpath+"\\"+indexInfoFileName+"\\";
					//解压文件
					ZipUtils zipUtils=new ZipUtils();
				    zipUtils.unZip(realpath+"\\"+fileName, ziprealPath);
					
					File file=new File(ziprealPath);
					for(File f:file.listFiles()){
						fileNames+=ziprealPath+f.getName()+",";
					}
					fileNames=fileNames.substring(0, fileNames.length()-1);
				    logger.info("fileNames="+fileNames);
				    
				    indexInfo.setFilename(fileNames);
				}
			}
			
			//判断indexInfo是否为空 为空 查询出错
			if(indexInfo!=null){
				JSONObject json=JSONObject.fromObject(indexInfo);
				writer(json.toString());
			}else{
				request.setAttribute("msg", "查询首页内容出错，请确认是否已删除！");
			}
		} catch (Exception e) {
			request.setAttribute("msg", "查询首页内容出错，请与系统管理员联系！");
			e.printStackTrace();
		}
	}
	
	/**
	 * 删除用户表信息
	 */
	public void mdelete(){
		
		String username=request.getParameter("username").toString().trim();
	
		String id =request.getParameter("id");
		logger.info(username+"删除ID为。"+id+"    企业==方法进入");
		Map map=new HashMap();
		map.put("id", id);
		try {
			int temp=motService.resetPwd("com.wr4.domain.MotInfo.mdelete",map);
			if(temp>0){
				writer("1");
				logger.info(username+"删除ID为。"+id+"    企业==方法成功");
			}else{
				writer("0");
				logger.info(username+"删除ID为。"+id+"    企业==方法失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 获取用户详细信息
	 */
	public void getUserDetail(){
		List<MotInfo> list = null;
		try {
			String id=request.getParameter("id");
			 
			User user =   motService.selectUserDetail("com.wr4.domain.MotInfo.getUserDetail", id);
			//调用公共方法组合 json向前台输出
			JSONArray jsonObject = JSONArray.fromObject(user);
			String js = jsonObject.toString();
			writer(js);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String updateUser(){
		List<MotInfo> list = null;
		try {
			 
			int i =   motService.updateObject("com.wr4.domain.MotInfo.updateUser", user);
			
			if(i>0 ) {
				request.setAttribute("msg", "yes"); 
			}else{
				request.setAttribute("msg", "更新用户失败，请重试！");
			}
			//调用公共方法组合 json向前台输出
		} catch (Exception e) {
			try {
				request.setAttribute("msg", "系统异常，请联系系统管理员！");
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		return "updateUserDetail";
	}
	/**
	 * 获取业务类型  对应中文
	 * 获取业务类别   对应中文
	 */
	public void getFileIdText(){
		try{
			Map map = new HashMap();
			String filetype=request.getParameter("filetype");
			map.put("bustype", filetype);
			List list  = motService.fileText("com.wr4.domain.OrgRespInfo.getBusType", map);
			JSONArray jsonObject = JSONArray.fromObject(list);
			String js = jsonObject.toString();
			writer(js);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 首页内容详情
	 */
	public void motIndexDetail(){
		try{
			Map map = new HashMap();
			String id=request.getParameter("id").toString();
			map.put("id", id);
			IndexInfo indexInfo  = motService.getIndexInfoById("com.wr4.domain.MotInfo.getIndexById", map);
			JSONArray jsonObject = JSONArray.fromObject(indexInfo);
			String js = jsonObject.toString();
			writer(js);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 删除首页内容
	 */
	public void deleteIndexById(){
		try {
			String id=request.getParameter("id");
			Map map = new HashMap();
			map.put("id", id);
			//逻辑删除后台更新  del字段状态为1
			int bol = motService.updateIndexInfoById("com.wr4.domain.MotInfo.deleteIndexById", map);
			//判断indexInfo是否为空 为空 查询出错
			if(bol!=0){
				this.writer("yes");
			}else{
				this.writer("删除首页内容出错，请确认是否已删除");
			}
		} catch (Exception e) {
			try {
				this.writer("删除首页内容出错，请与系统管理员联系！");
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
	}
	/***
	 * 考评机构基本信息查询
	 */
	public void orgquery(){
		Map map = new HashMap();
		String orgname= request.getParameter("orgname");
		String orgcid=request.getParameter("orgcid");
		getPageParameter();
		map.put("start", start);
		map.put("pagesize", pagesize);
		if(!"".equals(orgname)&&!"".equals(orgcid)&&!"--".equals(orgcid)){
			map.put("orgname", orgname.trim());
			map.put("cid", orgcid.trim());
		}else{
			if("".equals(orgname)&&"".equals(orgcid)){
				map.put("orgname", orgname);
				map.put("cid", orgcid);
			}else if("".equals(orgname)&&!"".equals(orgcid)&&!"--".equals(orgcid)){
				map.put("orgname", null);
				map.put("cid", orgcid);
			}else if(!"".equals(orgname)&&"".equals(orgcid)){
				map.put("orgname", orgname);
				map.put("cid", null);
			}else if(!"".equals(orgname)&&"--".equals(orgcid)){
				map.put("orgname", orgname);
				map.put("cid", null);
			}
		}
		List listAll = null;
		List list =null;
		int count=0;
		try {
//			listAll = orgService.getOrgByConAll("com.wr4.domain.MotOrgInfo.getOrgByUserIdAndBustype", map);
			
			count=getCount("com.wr4.domain.MotOrgInfo.getOrgByUserIdAndBustypeCount", map);
			list = orgService.getOrgByCon("com.wr4.domain.MotOrgInfo.getOrgByUserIdAndBustype", map, offset, limit);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeLigerJson(list,count);
	}
	/**
	 * 考评员基本信息查询
	 */
	public void pnquery(){
		Map map = new HashMap();
		try {
		request.setCharacterEncoding("UTF-8");
		String enname= URLDecoder.decode(request.getParameter("enname").toString(), "UTF-8");
		String encid=request.getParameter("encid").trim();
		getPageParameter();
		map.put("start", start);
		map.put("pagesize", pagesize);
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
			List listAll;
//			listAll = enService.getPnByConAll("com.wr4.domain.MotEnInfo.getPnByUserIdAndBustype", map);
			int count=getCount("com.wr4.domain.MotEnInfo.getPnByUserIdAndBustypeCount", map);
			List list = enService.getPnByCon("com.wr4.domain.MotEnInfo.getPnByUserIdAndBustype", map,offset,limit);
			writeLigerJson(list,count);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 企业基本信息查询
	 */
	public void enquery(){
		try {
		Map map = new HashMap();
		String enname= request.getParameter("enname");
		String encid=request.getParameter("encid");
		getPageParameter();
		map.put("start", start);
		map.put("pagesize", pagesize);
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
			List listAll;
//			listAll = enService.getEnByConAll("com.wr4.domain.MotEnInfo.getEnByUserIdAndBustype", map);
			int count=getCount("com.wr4.domain.MotEnInfo.getEnByUserIdAndBustypeCount", map);
			List list = enService.getEnByCon("com.wr4.domain.MotEnInfo.getEnByUserIdAndBustype", map,offset,limit);
			writeLigerJson(list,count);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public static void main(String[] args) {
		String s="0321";
		String ss="0"+(new Integer(s)+1);
		System.out.println(ss);
	}
}

package com.wr4.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import com.wr4.domain.MotInfo;
import com.wr4.domain.PnApply;
import com.wr4.domain.PnInfo;
import com.wr4.domain.ValueTextBustype;
import com.wr4.service.IMotService;
import com.wr4.service.IPnManagerService;
import com.wr4.util.ExportUtil;
/***
 * 考评员列表Action
 * @author Administrator
 *
 */
public class PnListAction extends BaseAction {
	
	private IPnManagerService iPnManagerService;
	private List pnList;
	private PnInfo pnInfo;

	private IMotService<MotInfo> motService;

	public IMotService<MotInfo> getMotService() {
		return motService;
	}

	public void setMotService(IMotService<MotInfo> motService) {
		this.motService = motService;
	}

	public PnInfo getPnInfo() {
		return pnInfo;
	}

	public void setPnInfo(PnInfo pnInfo) {
		this.pnInfo = pnInfo;
	}

	public List<PnInfo> getPnList() {
		return pnList;
	}

	public void setPnList(List<PnInfo> pnList) {
		this.pnList = pnList;
	}

	public IPnManagerService getiPnManagerService() {
		return iPnManagerService;
	}

	public void setiPnManagerService(IPnManagerService iPnManagerService) {
		this.iPnManagerService = iPnManagerService;
	}
	/***
	 * 考评员列表
	 */
	public void findAllPn() {
		try {
			getPageParameter();
			pnInfo = new PnInfo();
			pnInfo.setAdminmot(request.getSession().getAttribute("mot").toString());
			String mot = request.getParameter("mot");
			String name = request.getParameter("name");
			String type = request.getParameter("type");
			String cid = request.getParameter("cid");
			if(mot!=null && !"".equals(mot) && !"%".equals(mot)){
				pnInfo.setAdmin(mot);
			}
			if(name!=null && !"".equals(name)){
				pnInfo.setPnname(name);
			}
			if(type!=null && !"".equals(type)){
				pnInfo.setBustype(type);
			}
			if(cid!=null && !"".equals(cid)){
				pnInfo.setCid(cid);
			}
//			List allList = iPnManagerService.selectePnListAll("com.wr4.domain.PnInfo.selectAll", pnInfo);
			int count=getCount("com.wr4.domain.PnInfo.selectAllCount", pnInfo);
			pnInfo.setStart(start);
			pnInfo.setPagesize(pagesize);
			pnList = iPnManagerService.selectePnList(
					"com.wr4.domain.PnInfo.selectAll", pnInfo, offset, limit);
			if (pnList != null && pnList.size() > 0) {
				JSONArray jsonObject = JSONArray.fromObject(pnList);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString() + ",Total:"
						+ count + "}";
				writer(js);
			} else {
				pnList = new ArrayList();
				JSONArray jsonObject = JSONArray.fromObject(pnList);
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
	 * 考评员导出
	 */
	public String exportAllPn() {
		List list = null;
		XSSFWorkbook xwb = null;
		String xlsName=ServletActionContext.getServletContext().getRealPath("/");
		String xlsName1=xlsName+"reports/orgList.xls";
		String prpoFileName=xlsName+"reports/sysList.properties";
		String  str="pnlist";
		try {
			//pnList = iPnManagerService.selectePnList("com.wr4.domain.PnInfo.selectAll1", pnInfo, offset, 99999999);
			pnList = iPnManagerService.selectePnListAll("com.wr4.domain.PnInfo.selectAll1", pnInfo);
			/*MotInfo motInfo=new MotInfo();
			
				//循环 LIST 把所有的 业务类型 和 主管机关 都替换
			List<PnApply> newPnList=new ArrayList<PnApply>();
			if(pnList!=null){
				for(int i=0;i<pnList.size();i++){
					PnApply pn=(PnApply)pnList.get(i);
					motInfo.setMotcode(pn.getAdminmot());
					//注意 需要将 applicationContext-action.xml 中 当前类的action 配置中 注入 motService
					//此处获取主管机关的名称
					String motName = motService.selectMotOne("com.wr4.domain.MotInfo.selectMot", motInfo).getMotname();
					pn.setAdminmot(motName);
					 
					//查询对应业务类型
					Map map=new HashMap();
					//企业中如果是 需要业务类别   map.put("bustype", "busclass");
					map.put("bustype", "bustype");
					List busTypelist  = motService.fileText("com.wr4.domain.OrgRespInfo.getBusType", map);
					for(int y=0;y<busTypelist.size();y++){
						ValueTextBustype valueText= (ValueTextBustype)busTypelist.get(y);
						if(pn.getBussinestype().equals(valueText.getFileid())){
							pn.setBussinestype(valueText.getFiletext());
						}
					}
					newPnList.add(pn);
					//然后将替换好的 newPnList 传给exportFile  替换之前传入的 list
				}
			}*/
			
//			File sourceFile = new File(xlsName1);
			 //建立导出到这个文件   
			ExportUtil eu=new ExportUtil();
			eu.exportFile(xlsName1, "pnList", pnList,  prpoFileName,str);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	/***
	 * 考评员详情
	 */
	public void pnTail() {
		try {
			getPageParameters();
			pnInfo = iPnManagerService.selecteOne(pnInfo);
			if (pnInfo != null) {
				JSONArray jsonObject = JSONArray.fromObject(pnInfo);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString() + "}";
				writer(js);
			} else {
				pnInfo = new PnInfo();
				JSONArray jsonObject = JSONArray.fromObject(pnInfo);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString() + "}";
				writer(js);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/***
	 * 签约考评机构
	 */
	public void signOrg() {
		try {
			getPageParameters();
			String userid = request.getSession().getAttribute("userid").toString();
			List list = iPnManagerService.selecteSignOrg(userid);
			if (list != null) {
				JSONArray jsonObject = JSONArray.fromObject(list);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString() + "}";
				writer(js);
			} else {
				list = new ArrayList();
				JSONArray jsonObject = JSONArray.fromObject(list);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString() + "}";
				writer(js);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/***
	 * 考评机构考评员列表
	 */
	public void selectAllInOrg() {
		try {
			String orgid = request.getSession().getAttribute("paperid").toString();
			String cid=request.getParameter("cid");
			Map map =new HashMap();
			map.put("orgid", orgid);
			map.put("adminmot", request.getSession().getAttribute("mot").toString());
			if(cid!=null&&!"".equals(cid)){
				map.put("cid", cid);
			}else{
				map.put("cid", null);
			}
			getPageParameter();
			map.put("start", start);
			map.put("pagesize", pagesize);
//			List allList = iPnManagerService.selectAllInOrgAll("com.wr4.domain.PnInfo.selectAllInOrg", map);
			int count=getCount("com.wr4.domain.PnInfo.selectAllInOrgCount", map);
			List pnapplyList = iPnManagerService.selectAllInOrg(
					"com.wr4.domain.PnInfo.selectAllInOrg", map, offset, limit);
			if (pnapplyList != null && pnapplyList.size() > 0) {
				JSONArray jsonObject = JSONArray.fromObject(pnapplyList);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString() + ",Total:"
						+ count + "}";
				writer(js);
			} else {
				pnapplyList = new ArrayList();
				JSONArray jsonObject = JSONArray.fromObject(pnapplyList);
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
	 * 修改密码验证原密码是否正确
	 */
	public void isPwd(){
		String username=request.getParameter("userid");
		String pwd=md5(request.getParameter("pwd"));
		try{
			Map map=new HashMap();
			map.put("username", username);
			map.put("pwd", pwd);
			List list=iPnManagerService.isPwd("com.wr4.domain.PnInfo.isPwd",map);
			if(list!=null&&list.size()!=0){
				writer("ok");
			}else{
				writer("error");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 修改密码
	 */
	public void resetPwd(){
		String username=request.getParameter("userid");
		String pwd=md5(request.getParameter("pwd"));
		String usertype=request.getSession().getAttribute("usertype").toString();
		try{
			Map map=new HashMap();
			map.put("username", username);
			map.put("pwd", pwd);
			map.put("usertype", usertype);
			int temp=iPnManagerService.resetPwd("com.wr4.domain.PnInfo.resetPwd",map);
			int temp2=iPnManagerService.resetPwd("com.wr4.domain.PnInfo.resetPwd2",map);
			if(temp==1&&temp2==1){
				writer("ok");
			}else{
				writer("error");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
}

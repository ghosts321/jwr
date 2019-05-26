package com.wr4.action;

import java.awt.Color;
import java.awt.Font;
import java.io.File;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONArray;

import com.wr4.domain.CertificateInfo;
import com.wr4.domain.MotInfo;
import com.wr4.domain.OrgInfo;
import com.wr4.domain.PnApply;
import com.wr4.domain.ValueTextBustype;
import com.wr4.service.CertificateService;
import com.wr4.service.IMotService;
import com.wr4.service.OrgService;
import com.wr4.util.CodeToCnUtil;
import com.wr4.util.ExportUtil;
import com.wr4.util.FontImage;
import com.wr4.util.GetCertNumber;

/***
 * 资格证书制发Action
 * @author Administrator
 *
 */
public class CertificateAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private CertificateService certificateService;
	private List<CertificateInfo> certificateInfoList;
	private CertificateInfo certificateInfo = new CertificateInfo();
	private String userid;
	private String bussinestype;
	private String certtype;
	private OrgInfo orgInfo;
	private OrgService<OrgInfo> orgService;
	private IMotService<MotInfo> motService;
	
	
	public IMotService<MotInfo> getMotService() {
		return motService;
	}
	public void setMotService(IMotService<MotInfo> motService) {
		this.motService = motService;
	}
	public String getCerttype() {
		return certtype;
	}
	public void setCerttype(String certtype) {
		this.certtype = certtype;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getBussinestype() {
		return bussinestype;
	}
	public void setBussinestype(String bussinestype) {
		this.bussinestype = bussinestype;
	}
	public OrgInfo getOrgInfo() {
		return orgInfo;
	}
	public void setOrgInfo(OrgInfo orgInfo) {
		this.orgInfo = orgInfo;
	}
	public OrgService<OrgInfo> getOrgService() {
		return orgService;
	}
	public void setOrgService(OrgService<OrgInfo> orgService) {
		this.orgService = orgService;
	}
	
	public List<CertificateInfo> getCertificateInfoList() {
		return certificateInfoList;
	}
	public void setCertificateInfoList(List<CertificateInfo> certificateInfoList) {
		this.certificateInfoList = certificateInfoList;
	}
	public CertificateInfo getCertificateInfo() {
		return certificateInfo;
	}
	public void setCertificateInfo(CertificateInfo certificateInfo) {
		this.certificateInfo = certificateInfo;
	}
	public CertificateService getCertificateService() {
		return certificateService;
	}
	public void setCertificateService(CertificateService certificateService) {
		this.certificateService = certificateService;
	}
	//资质证书列表
	public void certificate(){
		getPageParameter();
		try {
			certificateInfo.setStart(start);
			certificateInfo.setPagesize(pagesize);
			certificateInfo.setAdminmot(request.getSession().getAttribute("mot").toString());
			certificateInfoList = certificateService.selectAll("com.wr4.domain.CertificateInfo.selectAll", certificateInfo, offset, limit);
			int count=getCount("com.wr4.domain.CertificateInfo.selectAllCount", certificateInfo);
			if (certificateInfoList != null && certificateInfoList.size() > 0) {
				JSONArray jsonObject = JSONArray.fromObject(certificateInfoList);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString() + ",Total:"
						+ count + "}";
				writer(js);
			} else {
				certificateInfoList = new ArrayList<CertificateInfo>();
				JSONArray jsonObject = JSONArray.fromObject(certificateInfoList);
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
	 * 导出
	 */
	public String certificateExp(){
		List<OrgInfo> list = null;
		XSSFWorkbook xwb = null;
		String xlsName=ServletActionContext.getServletContext().getRealPath("/");
		String xlsName1=xlsName+"reports\\orgList.xls";
		String prpoFileName=xlsName+"reports\\sysList.properties";
		String  str="pn";
		try {
			certificateInfoList = certificateService.selectAll("com.wr4.domain.CertificateInfo.selectAll", certificateInfo, offset, 999999999);
			MotInfo motInfo=new MotInfo();
			List<CertificateInfo> newPnList=new ArrayList<CertificateInfo>();
			if(certificateInfoList!=null){
				for(int i=0;i<certificateInfoList.size();i++){
					CertificateInfo pn=(CertificateInfo)certificateInfoList.get(i);
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
			}
//			File sourceFile = new File(xlsName1);
			 //建立导出到这个文件   
			ExportUtil eu=new ExportUtil();
			eu.exportFile(xlsName1, "certificateInfoList", newPnList,  prpoFileName,str);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/***
	 * 资质证书详情
	 */
	public void certificateTail(){
		getPageParameters();
		try {
			getPageParameters();
			if(certificateInfo==null){
				certificateInfo =new CertificateInfo();
			}
			certificateInfo.setBussinestype(URLDecoder.decode(certificateInfo.getBussinestype(),"UTF-8") );
			certificateInfo = certificateService.selectOne("com.wr4.domain.CertificateInfo.selectOne", certificateInfo);
			if (certificateInfo != null) {
				JSONArray jsonObject = JSONArray.fromObject(certificateInfo);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString() + "}";
				writer(js);
			} else {
				certificateInfo = new CertificateInfo();
				JSONArray jsonObject = JSONArray.fromObject(certificateInfo);
				String js = jsonObject.toString();
				js = "{Rows: " + jsonObject.toString() + "}";
				writer(js);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/***
	 * 发证
	 */
	public void getCert(){
		String msg = "yes";
		PrintWriter writer=null;
		try {
			writer = response.getWriter();
			String pnname=request.getParameter("pnname") ;
			String photo=request.getParameter("photo") ;
			String createdate=request.getParameter("createdate") ;
			String certnum=request.getParameter("cid")==null?"":request.getParameter("cid").toString() ;
			//是否直接发证
			String isdirect=request.getParameter("isdirect");
			//生成证书号
			//String certnum = new GetCertNumber(orgService).getCertNum(bussinestype,request.getSession().getAttribute("mot").toString());
			String usertype = request.getSession().getAttribute("usertype").toString();
			String id=request.getParameter("id")==null?"0":request.getParameter("id");
			String pid=request.getParameter("pid")==null?"0":request.getParameter("pid");
			certificateInfo =new CertificateInfo();
			certificateInfo.setCertnumber(certnum);
			String curData=	"";
			Date datea=new Date();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			curData=sdf.format(datea);
			certificateInfo.setFzdate(curData);
			certificateInfo.setUserid(userid);  
			certificateInfo.setId(Integer.parseInt(id));  
			certificateInfo.setPid(pid);
			certificateInfo.setBussinestype(bussinestype);
			certificateInfo.setPhoto(photo);
			certificateInfo.setPnname(pnname);
			certificateInfo.setCtreatedate(createdate);
			certificateInfo.setUsertype(request.getSession().getAttribute("usertype").toString());
			//添加证书前先判断是否已经拥有证书
			CertificateInfo ss=certificateService.selectOne("com.wr4.domain.CertificateInfo.isHaveCert",  certificateInfo);
			if(ss!=null){
				writer.write("no");
				return ;
			}
			Map mapResult=new HashMap();
			//添加证书记录到证书表
			certificateService.insertCertNo("com.wr4.domain.CertificateInfo.insertCertNo","com.wr4.domain.CertificateInfo.selectOne","com.wr4.domain.CertificateInfo.insertExam","com.wr4.domain.CertificateInfo.updateApply",certificateInfo,certnum,usertype);
			if(isdirect!=null){
			}else{
				
			
			Calendar cal = Calendar.getInstance();//使用默认时区和语言环境获得一个日历。   
			cal.add(Calendar.YEAR, 3);
			//通过格式化输出日期   
			SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日");  
			String endDate=format.format(cal.getTime());   
			String startDate=format.format(new Date());
			String dt="有效期："+ startDate+"至"+endDate;
			String bust=CodeToCnUtil.getBustypeCnVal(certificateInfo.getBussinestype());
			 String realpath = ServletActionContext.getServletContext().getRealPath("/file");
			 //获取照片
			 String manProofPath=ServletActionContext.getServletContext().getRealPath("/images")+File.separator+certificateInfo.getPhoto();
			 String text[]={manProofPath,certificateInfo.getPnname(),certificateInfo.getPid()
					 ,certificateInfo.getCertnumber(),bust,dt};
			 String sourceFilePath=realpath+File.separator+"cert-pn.jpg";
			 Date date=new Date();
			 
			 String fileName=date.getTime()+".jpg";
			 String targetFilePath=realpath+File.separator+fileName;
			 //向图片上写字
			 FontImage.pressTextGroup(text ,targetFilePath,sourceFilePath, "宋体", Font.BOLD,  Color.BLACK,34);
			 mapResult.put("fileName", fileName);
				JSONArray jsonObject = JSONArray.fromObject(mapResult);
				String js = jsonObject.toString();
				response.setCharacterEncoding("utf-8");
				writer(js);
			//流程表添加记录 状态为已发证
//			certificateInfo = certificateService.selectOne("com.wr4.domain.CertificateInfo.selectOne", certificateInfo);
//			certificateInfo.setUsertype(request.getSession().getAttribute("usertype").toString());
//			certificateService.insertCertNo("com.wr4.domain.CertificateInfo.insertExam",certificateInfo);
//			//申请表加证书号
//			if(certificateInfo.getCertnumber()==null||"".equals(certificateInfo.getCertnumber())){
//				certificateInfo.setCertnumber(certnum);
//			}
//			certificateService.updateApply("com.wr4.domain.CertificateInfo.updateApply", certificateInfo);
		
		}
		writer.write(msg);
		writer.flush();
		writer.close();
		} catch (Exception e) {
			writer.close();
			writer=null;
			msg = "no";
			e.printStackTrace();
		}
	}
	public String changeAudit(){
		return "success";
	}
}

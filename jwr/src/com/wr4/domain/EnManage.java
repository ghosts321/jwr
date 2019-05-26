package com.wr4.domain;

import java.io.Serializable;

public class EnManage implements Serializable{
	
	private static final long serialVersionUID = 1L;

	/**
	 *  license String 字段经营许可证            
	 */
	private String license;
	/**
	 *  tax String 字段传真                  
	 */
	private String tax;
	/**
	 *  createdate String 字段日期                  
	 */
	private String createdate;
	/**
	 *  cdate String 字段发证时间              
	 */
	private String cdate;
	/**
	 *  remarks String 字段备注                  
	 */
	private String remarks;
	/**
	 *  orgid1 String 字段指定的考评机构        
	 */
	private String orgid1;
	/**
	 *  advice String 字段处理意见              
	 */
	private String advice;
	/**
	 *  pid String 字段证件号                
	 */
	private String pid;
	/**
	 *  del String 字段删除标志              
	 */
	private String del;
	/**
	 *  enname String 字段名称                  
	 */
	private String enname;
	/**
	 *  safe String 字段安全生产组织架构      
	 */
	private String safe;
	/**
	 *  renew String 字段换证原因（仅换证申请）
	 */
	private String renew;
	/**
	 *  zpreport String 字段标准化达标自评报告    
	 */
	private String zpreport;
	/**
	 *  province String 字段所在省市              
	 */
	private String province;
	private String provinceName;
	/**
	 *  cid String 字段证书号                
	 */
	private String cid;
	/**
	 *  legalp String 字段法人代表              
	 */
	private String legalp;
	/**
	 *  grade String 字段等级                  
	 */
	private String grade;
	/**
	 *  email String 字段联系人邮箱            
	 */
	private String email;
	/**
	 *  bustype String 字段业务类型              
	 */
	private String bustype;
	/**
	 *  resp String 字段受理结果              
	 */
	private String resp;
	/**
	 *  respdateReview String 字段审核日期              
	 */
	private String respdateReview;
	/**
	 *  type2 String 字段业务类别              
	 */
	private String type2;
	/**
	 *  contact String 字段联系人姓名            
	 */
	private String contact;
	/**
	 *  adviceReview String 字段审核意见              
	 */
	private String adviceReview;
	/**
	 *  address String 字段通讯地址              
	 */
	private String address;
	/**
	 *  mobile String 字段手机                  
	 */
	private String mobile;
	/**
	 *  qual String 字段企业法人资格证件      
	 */
	private String qual;
	/**
	 *  adminmot String 字段主管机关              
	 */
	private String adminmot;
	private String adminMotName;
	/**
	 *  respReview String 字段审核结果              
	 */
	private String respReview;
	/**
	 *  tel String 字段联系电话              
	 */
	private String tel;
	/**
	 *  respdate String 字段受理日期              
	 */
	private String respdate;
	/**
	 *  orgid String 字段所选考评机构
	 */
	private String orgid;
	/**
	 *  userid String 字段用户ID
	 */
	private String userid;
	/**
	 *  applytype String 字段申请标示（0表示初次申请，1表示证书申请）
	 */
	private String applytype;
	/**
	 *  id Double 字段ID
	 */
	private Double id;
	/**
	 *  zpscore String 字段企业自评分
	 */
	private String zpscore;
	private String kpscore;
	private String busType;
	private String filetext;
	private String uppername;
	private String auditdate;
	private String kpadvice;
	private String kpdate;
	private String kpresult;
	private String auditAdvice;
	private String respAdvice;
	private String sladvice;
	private String sldate;
	private String slresult;
	private String shadvice;
	private String shdate;
	private String shresult;
	private int rn;
	public String getKpdate() {
		return kpdate;
	}
	public void setKpdate(String kpdate) {
		this.kpdate = kpdate;
	}
	public String getKpresult() {
		return kpresult;
	}
	public void setKpresult(String kpresult) {
		this.kpresult = kpresult;
	}
	/**
	 * 
	 */
	private String results;



	

	public String getResults() {
		return results;
	}
	public void setResults(String results) {
		this.results = results;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	/**
	* 返回经营许可证            属性的值
	* @return String
	*/ 
	public String getLicense() {
		return this.license;
	}
	/**
	 * 设置license的值
	 * @param license String
	 */
	public void setLicense(String license) {
		this.license = license;
	}
	/**
	* 返回传真                  属性的值
	* @return String
	*/ 
	public String getTax() {
		return this.tax;
	}
	/**
	 * 设置tax的值
	 * @param tax String
	 */
	public void setTax(String tax) {
		this.tax = tax;
	}
	/**
	* 返回日期                  属性的值
	* @return String
	*/ 
	public String getCreatedate() {
		return this.createdate;
	}
	/**
	 * 设置createdate的值
	 * @param createdate String
	 */
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	/**
	* 返回发证时间              属性的值
	* @return String
	*/ 
	public String getCdate() {
		return this.cdate;
	}
	/**
	 * 设置cdate的值
	 * @param cdate String
	 */
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	/**
	* 返回备注                  属性的值
	* @return String
	*/ 
	public String getRemarks() {
		return this.remarks;
	}
	/**
	 * 设置remarks的值
	 * @param remarks String
	 */
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	/**
	* 返回指定的考评机构        属性的值
	* @return String
	*/ 
	public String getOrgid1() {
		return this.orgid1;
	}
	/**
	 * 设置orgid1的值
	 * @param orgid1 String
	 */
	public void setOrgid1(String orgid1) {
		this.orgid1 = orgid1;
	}
	/**
	* 返回处理意见              属性的值
	* @return String
	*/ 
	public String getAdvice() {
		return this.advice;
	}
	/**
	 * 设置advice的值
	 * @param advice String
	 */
	public void setAdvice(String advice) {
		this.advice = advice;
	}
	/**
	* 返回证件号                属性的值
	* @return String
	*/ 
	public String getPid() {
		return this.pid;
	}
	/**
	 * 设置pid的值
	 * @param pid String
	 */
	public void setPid(String pid) {
		this.pid = pid;
	}
	/**
	* 返回删除标志              属性的值
	* @return String
	*/ 
	public String getDel() {
		return this.del;
	}
	/**
	 * 设置del的值
	 * @param del String
	 */
	public void setDel(String del) {
		this.del = del;
	}
	/**
	* 返回名称                  属性的值
	* @return String
	*/ 
	public String getEnname() {
		return this.enname;
	}
	/**
	 * 设置enname的值
	 * @param enname String
	 */
	public void setEnname(String enname) {
		this.enname = enname;
	}
	/**
	* 返回安全生产组织架构      属性的值
	* @return String
	*/ 
	public String getSafe() {
		return this.safe;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	/**
	 * 设置safe的值
	 * @param safe String
	 */
	public void setSafe(String safe) {
		this.safe = safe;
	}
	/**
	* 返回换证原因（仅换证申请）属性的值
	* @return String
	*/ 
	public String getRenew() {
		return this.renew;
	}
	/**
	 * 设置renew的值
	 * @param renew String
	 */
	public void setRenew(String renew) {
		this.renew = renew;
	}
	/**
	* 返回标准化达标自评报告    属性的值
	* @return String
	*/ 
	public String getZpreport() {
		return this.zpreport;
	}
	/**
	 * 设置zpreport的值
	 * @param zpreport String
	 */
	public void setZpreport(String zpreport) {
		this.zpreport = zpreport;
	}
	/**
	* 返回所在省市              属性的值
	* @return String
	*/ 
	public String getProvince() {
		return this.province;
	}
	/**
	 * 设置province的值
	 * @param province String
	 */
	public void setProvince(String province) {
		this.province = province;
	}
	/**
	* 返回证书号                属性的值
	* @return String
	*/ 
	public String getCid() {
		return this.cid;
	}
	/**
	 * 设置cid的值
	 * @param cid String
	 */
	public void setCid(String cid) {
		this.cid = cid;
	}
	/**
	* 返回法人代表              属性的值
	* @return String
	*/ 
	public String getLegalp() {
		return this.legalp;
	}
	/**
	 * 设置legalp的值
	 * @param legalp String
	 */
	public void setLegalp(String legalp) {
		this.legalp = legalp;
	}
	/**
	* 返回等级                  属性的值
	* @return String
	*/ 
	public String getGrade() {
		return this.grade;
	}
	/**
	 * 设置grade的值
	 * @param grade String
	 */
	public void setGrade(String grade) {
		this.grade = grade;
	}
	/**
	* 返回联系人邮箱            属性的值
	* @return String
	*/ 
	public String getEmail() {
		return this.email;
	}
	/**
	 * 设置email的值
	 * @param email String
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	* 返回业务类型              属性的值
	* @return String
	*/ 
	public String getBustype() {
		return this.bustype;
	}
	/**
	 * 设置bustype的值
	 * @param bustype String
	 */
	public void setBustype(String bustype) {
		this.bustype = bustype;
	}
	/**
	* 返回受理结果              属性的值
	* @return String
	*/ 
	public String getResp() {
		return this.resp;
	}
	/**
	 * 设置resp的值
	 * @param resp String
	 */
	public void setResp(String resp) {
		this.resp = resp;
	}
	/**
	* 返回审核日期              属性的值
	* @return String
	*/ 
	public String getRespdateReview() {
		return this.respdateReview;
	}
	/**
	 * 设置respdateReview的值
	 * @param respdateReview String
	 */
	public void setRespdateReview(String respdateReview) {
		this.respdateReview = respdateReview;
	}
	/**
	* 返回业务类别              属性的值
	* @return String
	*/ 
	public String getType2() {
		return this.type2;
	}
	/**
	 * 设置type2的值
	 * @param type2 String
	 */
	public void setType2(String type2) {
		this.type2 = type2;
	}
	/**
	* 返回联系人姓名            属性的值
	* @return String
	*/ 
	public String getContact() {
		return this.contact;
	}
	/**
	 * 设置contact的值
	 * @param contact String
	 */
	public void setContact(String contact) {
		this.contact = contact;
	}
	/**
	* 返回审核意见              属性的值
	* @return String
	*/ 
	public String getAdviceReview() {
		return this.adviceReview;
	}
	/**
	 * 设置adviceReview的值
	 * @param adviceReview String
	 */
	public void setAdviceReview(String adviceReview) {
		this.adviceReview = adviceReview;
	}
	/**
	* 返回通讯地址              属性的值
	* @return String
	*/ 
	public String getAddress() {
		return this.address;
	}
	/**
	 * 设置address的值
	 * @param address String
	 */
	public void setAddress(String address) {
		this.address = address;
	}
	/**
	* 返回手机                  属性的值
	* @return String
	*/ 
	public String getMobile() {
		return this.mobile;
	}
	/**
	 * 设置mobile的值
	 * @param mobile String
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	/**
	* 返回企业法人资格证件      属性的值
	* @return String
	*/ 
	public String getQual() {
		return this.qual;
	}
	/**
	 * 设置qual的值
	 * @param qual String
	 */
	public void setQual(String qual) {
		this.qual = qual;
	}
	/**
	* 返回主管机关              属性的值
	* @return String
	*/ 
	public String getAdminmot() {
		return this.adminmot;
	}
	/**
	 * 设置adminmot的值
	 * @param adminmot String
	 */
	public void setAdminmot(String adminmot) {
		this.adminmot = adminmot;
	}
	/**
	* 返回审核结果              属性的值
	* @return String
	*/ 
	public String getRespReview() {
		return this.respReview;
	}
	/**
	 * 设置respReview的值
	 * @param respReview String
	 */
	public void setRespReview(String respReview) {
		this.respReview = respReview;
	}
	/**
	* 返回联系电话              属性的值
	* @return String
	*/ 
	public String getTel() {
		return this.tel;
	}
	/**
	 * 设置tel的值
	 * @param tel String
	 */
	public void setTel(String tel) {
		this.tel = tel;
	}
	/**
	* 返回受理日期              属性的值
	* @return String
	*/ 
	public String getRespdate() {
		return this.respdate;
	}
	/**
	 * 设置respdate的值
	 * @param respdate String
	 */
	public void setRespdate(String respdate) {
		this.respdate = respdate;
	}
	/**
	* 返回所选考评机构属性的值
	* @return String
	*/ 
	public String getOrgid() {
		return this.orgid;
	}
	/**
	 * 设置orgid的值
	 * @param orgid String
	 */
	public void setOrgid(String orgid) {
		this.orgid = orgid;
	}
	/**
	* 返回用户ID属性的值
	* @return String
	*/ 
	public String getUserid() {
		return this.userid;
	}
	/**
	 * 设置userid的值
	 * @param userid String
	 */
	public void setUserid(String userid) {
		this.userid = userid;
	}
	/**
	* 返回申请标示（0表示初次申请，1表示证书申请）属性的值
	* @return String
	*/ 
	public String getApplytype() {
		return this.applytype;
	}
	/**
	 * 设置applytype的值
	 * @param applytype String
	 */
	public void setApplytype(String applytype) {
		this.applytype = applytype;
	}
	/**
	* 返回ID属性的值
	* @return Double
	*/ 
	public Double getId() {
		return this.id;
	}
	/**
	 * 设置id的值
	 * @param id Double
	 */
	public void setId(Double id) {
		this.id = id;
	}
	/**
	* 返回企业自评分属性的值
	* @return String
	*/ 
	public String getZpscore() {
		return this.zpscore;
	}
	/**
	 * 设置zpscore的值
	 * @param zpscore String
	 */
	public void setZpscore(String zpscore) {
		this.zpscore = zpscore;
	}
	public String getProvinceName() {
		return provinceName;
	}
	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}
	public String getAdminMotName() {
		return adminMotName;
	}
	public void setAdminMotName(String adminMotName) {
		this.adminMotName = adminMotName;
	}
	public String getBusType() {
		return busType;
	}
	public void setBusType(String busType) {
		this.busType = busType;
	}
	public String getFiletext() {
		return filetext;
	}
	public void setFiletext(String filetext) {
		this.filetext = filetext;
	}
	public String getUppername() {
		return uppername;
	}
	public void setUppername(String uppername) {
		this.uppername = uppername;
	}
	public String getAuditdate() {
		return auditdate;
	}
	public void setAuditdate(String auditdate) {
		this.auditdate = auditdate;
	}
	public void setKpscore(String kpscore) {
		this.kpscore = kpscore;
	}
	public String getKpscore() {
		return kpscore;
	}
	public void setKpadvice(String kpadvice) {
		this.kpadvice = kpadvice;
	}
	public String getKpadvice() {
		return kpadvice;
	}
	public void setAuditAdvice(String auditAdvice) {
		this.auditAdvice = auditAdvice;
	}
	public String getAuditAdvice() {
		return auditAdvice;
	}
	public String getRespAdvice() {
		return respAdvice;
	}
	public void setRespAdvice(String respAdvice) {
		this.respAdvice = respAdvice;
	}
	public String getSladvice() {
		return sladvice;
	}
	public void setSladvice(String sladvice) {
		this.sladvice = sladvice;
	}
	public String getSldate() {
		return sldate;
	}
	public void setSldate(String sldate) {
		this.sldate = sldate;
	}
	public String getSlresult() {
		return slresult;
	}
	public void setSlresult(String slresult) {
		this.slresult = slresult;
	}
	public String getShadvice() {
		return shadvice;
	}
	public void setShadvice(String shadvice) {
		this.shadvice = shadvice;
	}
	public String getShdate() {
		return shdate;
	}
	public void setShdate(String shdate) {
		this.shdate = shdate;
	}
	public String getShresult() {
		return shresult;
	}
	public void setShresult(String shresult) {
		this.shresult = shresult;
	}


	


	
}

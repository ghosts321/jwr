package com.wr4.domain;

import java.io.Serializable;

public class EnApplyDetail implements Serializable{
	
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
	
	//自评分
	private String selfScore;
	//考评分
	private String kaoScore;
	
	private String kpresult;
	
	private String kpdate;
	
	private String kpadvice;
	
	private int rn;
	
	private String filetext;
	
	private String motname;
	
	private String orgname;
	private String sladvice;
	private String sldate;
	private String slresult;
	private String shadvice;
	private String shdate;
	private String shresult;
	private String apporg;
	private String city;
	private String pncidlist;

	
	public String getPncidlist() {
		return pncidlist;
	}

	public void setPncidlist(String pncidlist) {
		this.pncidlist = pncidlist;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getKpdate() {
		return kpdate;
	}

	public void setKpdate(String kpdate) {
		this.kpdate = kpdate;
	}

	public String getLicense() {
		return license;
	}

	public void setLicense(String license) {
		this.license = license;
	}

	public String getTax() {
		return tax;
	}

	public void setTax(String tax) {
		this.tax = tax;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}

	public String getCdate() {
		return cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getOrgid1() {
		return orgid1;
	}

	public void setOrgid1(String orgid1) {
		this.orgid1 = orgid1;
	}

	public String getAdvice() {
		return advice;
	}

	public void setAdvice(String advice) {
		this.advice = advice;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getDel() {
		return del;
	}

	public void setDel(String del) {
		this.del = del;
	}

	public String getEnname() {
		return enname;
	}

	public void setEnname(String enname) {
		this.enname = enname;
	}

	public String getSafe() {
		return safe;
	}

	public void setSafe(String safe) {
		this.safe = safe;
	}

	public String getRenew() {
		return renew;
	}

	public void setRenew(String renew) {
		this.renew = renew;
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	public String getZpreport() {
		return zpreport;
	}

	public void setZpreport(String zpreport) {
		this.zpreport = zpreport;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getLegalp() {
		return legalp;
	}

	public void setLegalp(String legalp) {
		this.legalp = legalp;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBustype() {
		return bustype;
	}

	public void setBustype(String bustype) {
		this.bustype = bustype;
	}

	public String getResp() {
		return resp;
	}

	public void setResp(String resp) {
		this.resp = resp;
	}

	public String getRespdateReview() {
		return respdateReview;
	}

	public void setRespdateReview(String respdateReview) {
		this.respdateReview = respdateReview;
	}

	public String getType2() {
		return type2;
	}

	public void setType2(String type2) {
		this.type2 = type2;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getAdviceReview() {
		return adviceReview;
	}

	public void setAdviceReview(String adviceReview) {
		this.adviceReview = adviceReview;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getQual() {
		return qual;
	}

	public void setQual(String qual) {
		this.qual = qual;
	}

	public String getAdminmot() {
		return adminmot;
	}

	public void setAdminmot(String adminmot) {
		this.adminmot = adminmot;
	}

	public String getRespReview() {
		return respReview;
	}

	public void setRespReview(String respReview) {
		this.respReview = respReview;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getRespdate() {
		return respdate;
	}

	public void setRespdate(String respdate) {
		this.respdate = respdate;
	}

	public String getOrgid() {
		return orgid;
	}

	public void setOrgid(String orgid) {
		this.orgid = orgid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getApplytype() {
		return applytype;
	}

	public void setApplytype(String applytype) {
		this.applytype = applytype;
	}

	public Double getId() {
		return id;
	}

	public void setId(Double id) {
		this.id = id;
	}

	public String getZpscore() {
		return zpscore;
	}

	public void setZpscore(String zpscore) {
		this.zpscore = zpscore;
	}

	public String getSelfScore() {
		return selfScore;
	}

	public void setSelfScore(String selfScore) {
		this.selfScore = selfScore;
	}

	public String getKaoScore() {
		return kaoScore;
	}

	public void setKaoScore(String kaoScore) {
		this.kaoScore = kaoScore;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getKpresult() {
		return kpresult;
	}

	public void setKpresult(String kpresult) {
		this.kpresult = kpresult;
	}

	public String getKpadvice() {
		return kpadvice;
	}

	public void setKpadvice(String kpadvice) {
		this.kpadvice = kpadvice;
	}

	public String getFiletext() {
		return filetext;
	}

	public void setFiletext(String filetext) {
		this.filetext = filetext;
	}

	public String getMotname() {
		return motname;
	}

	public void setMotname(String motname) {
		this.motname = motname;
	}

	public String getOrgname() {
		return orgname;
	}

	public void setOrgname(String orgname) {
		this.orgname = orgname;
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

	public String getApporg() {
		return apporg;
	}

	public void setApporg(String apporg) {
		this.apporg = apporg;
	}
	
	
}

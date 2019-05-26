package com.wr4.domain;

import java.io.Serializable;

public class EnExchangeCertInfo implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//en_apply表中字段
	private String	license        ;
	private String	tax            ;
	private String	createdate     ;
	private String	cdate          ;
	private String	remarks        ;
	private String	orgid1         ;
	private String	advice         ;
	private String	pid            ;
	private String	del            ;
	private String	enname         ;
	private String	safe           ;
	private String	renew          ;
	private String	zpreport       ;
	private String	province       ;
	private String	cid            ;
	private String	legalp         ;
	private String	grade          ;
	private String	email          ;
	private String	bustype        ;
	private String	resp           ;
	private String	respdate_review;
	private String	type2          ;
	private String	contact        ;
	private String	advice_review  ;
	private String	address        ;
	private String	mobile         ;
	private String	qual           ;
	private String	adminmot       ;
	private String	resp_review    ;
	private String	tel            ;
	private String	respdate       ;
	private String	orgid          ;
	private String	userid         ;
	private String	applytype      ;
	private int	id                 ;
	private String	zpscore        ;
	private String adminmotname;
	private String type2name;
	//cert表中字段
	private String 	certnumber   ;
	private String 	fzdate       ;
	private String 	certtype     ;
	private String 	certstatus   ;
	private String 	reason       ;
	private String 	stopdate     ;
	private String  changeresault;//CHANGERESAULT 换证申请是否成功
	private String  changereason;//CHANGEREASON  换证申请审批意见
	private String  changedate;//换证申请处理时间
	private String city;//所在市
	
	
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getChangeresault() {
		return changeresault;
	}
	public void setChangeresault(String changeresault) {
		this.changeresault = changeresault;
	}
	public String getChangereason() {
		return changereason;
	}
	public void setChangereason(String changereason) {
		this.changereason = changereason;
	}
	public String getChangedate() {
		return changedate;
	}
	public void setChangedate(String changedate) {
		this.changedate = changedate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getAdminmotname() {
		return adminmotname;
	}
	public void setAdminmotname(String adminmotname) {
		this.adminmotname = adminmotname;
	}
	public String getType2name() {
		return type2name;
	}
	public void setType2name(String type2name) {
		this.type2name = type2name;
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
	public String getRespdate_review() {
		return respdate_review;
	}
	public void setRespdate_review(String respdate_review) {
		this.respdate_review = respdate_review;
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
	public String getAdvice_review() {
		return advice_review;
	}
	public void setAdvice_review(String advice_review) {
		this.advice_review = advice_review;
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
	public String getResp_review() {
		return resp_review;
	}
	public void setResp_review(String resp_review) {
		this.resp_review = resp_review;
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
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getZpscore() {
		return zpscore;
	}
	public void setZpscore(String zpscore) {
		this.zpscore = zpscore;
	}
	public String getCertnumber() {
		return certnumber;
	}
	public void setCertnumber(String certnumber) {
		this.certnumber = certnumber;
	}
	public String getFzdate() {
		return fzdate;
	}
	public void setFzdate(String fzdate) {
		this.fzdate = fzdate;
	}
	public String getCerttype() {
		return certtype;
	}
	public void setCerttype(String certtype) {
		this.certtype = certtype;
	}
	public String getCertstatus() {
		return certstatus;
	}
	public void setCertstatus(String certstatus) {
		this.certstatus = certstatus;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getStopdate() {
		return stopdate;
	}
	public void setStopdate(String stopdate) {
		this.stopdate = stopdate;
	}
	
}

package com.wr4.domain;

import java.io.Serializable;

public class BookCancel implements Serializable{
	
	
	/**
	 * 证书撤销
	 */
	private static final long serialVersionUID = 1L;
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	private int id;
	private String createdate;
	private String met;
	private String cdate;
	private String pcode;
	private String remark;
	private String advice;
	private String pid;
	private String orgname;
	private String renew;
	private String startdate;
	private String pns;
	private String province;
	private String cid;
	private String legalp;
	private String grade;
	private String email;
	private String userId;
	private String busType;
	private String resp;
	private String fax;
	private String pnumber;
	private String contact;
	private String address;
	private String mobile;
	private String adminmot;
	private String tel;
	private String pnumber2;
	private String respdate;
	

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getMet() {
		return met;
	}
	public void setMet(String met) {
		this.met = met;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
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
	public String getOrgname() {
		return orgname;
	}
	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}
	public String getRenew() {
		return renew;
	}
	public void setRenew(String renew) {
		this.renew = renew;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getPns() {
		return pns;
	}
	public void setPns(String pns) {
		this.pns = pns;
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getBusType() {
		return busType;
	}
	public void setBusType(String busType) {
		this.busType = busType;
	}
	public String getResp() {
		return resp;
	}
	public void setResp(String resp) {
		this.resp = resp;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getPnumber() {
		return pnumber;
	}
	public void setPnumber(String pnumber) {
		this.pnumber = pnumber;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
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
	public String getAdminmot() {
		return adminmot;
	}
	public void setAdminmot(String adminmot) {
		this.adminmot = adminmot;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPnumber2() {
		return pnumber2;
	}
	public void setPnumber2(String pnumber2) {
		this.pnumber2 = pnumber2;
	}
	public String getRespdate() {
		return respdate;
	}
	public void setRespdate(String respdate) {
		this.respdate = respdate;
	}
	
	
	
}

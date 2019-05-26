package com.wr4.domain;

import java.io.Serializable;

public class CertInfo implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	private int	id;     
	private String	userid;
	private String	certnumber;
	private String	fzdate;
	private String	certtype;
	private String reason;
	private String stopdate;
	private String pid;
	private String certstatus;
	private String grade;
	private String filetext;
	private String logincode;
	private String resp;
	private String orgid;
	
	
	public String getOrgid() {
		return orgid;
	}
	public void setOrgid(String orgid) {
		this.orgid = orgid;
	}
	public String getResp() {
		return resp;
	}
	public void setResp(String resp) {
		this.resp = resp;
	}
	public String getLogincode() {
		return logincode;
	}
	public void setLogincode(String logincode) {
		this.logincode = logincode;
	}
	private int rn;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
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
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getCertstatus() {
		return certstatus;
	}
	public void setCertstatus(String certstatus) {
		this.certstatus = certstatus;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getRn() {
		return rn;
	}
	public String getFiletext() {
		return filetext;
	}
	public void setFiletext(String filetext) {
		this.filetext = filetext;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
}

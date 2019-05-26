package com.wr4.domain;

public class NameReport {
	private int id;
	private String jmessage;
	private String adminmot;
	private String jtype;
	private String contenttext;
	private String createdate;
	private String advice;
	private String zforg;
	private String userid;
	private String orgname;
	
	public String getOrgname() {
		return orgname;
	}
	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId() {
		return id;
	}
	public void setJmessage(String jmessage) {
		this.jmessage = jmessage;
	}
	public String getJmessage() {
		return jmessage;
	}
	public void setAdminmot(String adminmot) {
		this.adminmot = adminmot;
	}
	public String getAdminmot() {
		return adminmot;
	}
	public void setJtype(String jtype) {
		this.jtype = jtype;
	}
	public String getJtype() {
		return jtype;
	}
	public void setContenttext(String contenttext) {
		this.contenttext = contenttext;
	}
	public String getContenttext() {
		return contenttext;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setAdvice(String advice) {
		this.advice = advice;
	}
	public String getAdvice() {
		return advice;
	}
	public void setZforg(String zforg) {
		this.zforg = zforg;
	}
	public String getZforg() {
		return zforg;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserid() {
		return userid;
	}
}

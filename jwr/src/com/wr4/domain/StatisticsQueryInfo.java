package com.wr4.domain;

public class StatisticsQueryInfo {
	private String mot;//当前登录用户名的主管机关
	private String admin;
	private String bustype;
	private String pnname;
	private String certnumber;
	private String grade;
	private String motname;
	
	private int start;
	private int pagesize;
	
	public String getMotname() {
		return motname;
	}
	public void setMotname(String motname) {
		this.motname = motname;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public String getBustype() {
		return bustype;
	}
	public String getMot() {
		return mot;
	}
	public void setMot(String mot) {
		this.mot = mot;
	}
	public void setBustype(String bustype) {
		this.bustype = bustype;
	}
	public String getPnname() {
		return pnname;
	}
	public void setPnname(String pnname) {
		this.pnname = pnname;
	}
	public String getCertnumber() {
		return certnumber;
	}
	public void setCertnumber(String certnumber) {
		this.certnumber = certnumber;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	
}

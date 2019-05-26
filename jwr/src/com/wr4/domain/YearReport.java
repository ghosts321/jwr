package com.wr4.domain;

public class YearReport {
	private int id;
	private String fReport;
	private String userId;
	private String year;
	private String createDate;
	private String enname;
	private String adminmot;
	
	private int start;
	private int pagesize;
	
	
	
	
	public String getAdminmot() {
		return adminmot;
	}
	public void setAdminmot(String adminmot) {
		this.adminmot = adminmot;
	}
	public String getEnname() {
		return enname;
	}
	public void setEnname(String enname) {
		this.enname = enname;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getfReport() {
		return fReport;
	}
	public void setfReport(String fReport) {
		this.fReport = fReport;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
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

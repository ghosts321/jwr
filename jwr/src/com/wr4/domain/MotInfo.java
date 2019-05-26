package com.wr4.domain;

public class MotInfo {
	private String motname;
	private String motcode;
	private String motupper;
	private String admin;
	private String del;
	private int id;
	private String regrespremark;
	private String regresp;
	private String userId;
	
	private String fileid;
	//分页专用
	private int start;
	private int pagesize;
	

	public String getRegrespremark() {
		return regrespremark;
	}

	public void setRegrespremark(String regrespremark) {
		this.regrespremark = regrespremark;
	}

	public String getRegresp() {
		return regresp;
	}

	public void setRegresp(String regresp) {
		this.regresp = regresp;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMotname() {
		return motname;
	}

	public void setMotname(String motname) {
		this.motname = motname;
	}

	public String getMotcode() {
		return motcode;
	}

	public void setMotcode(String motcode) {
		this.motcode = motcode;
	}

	public String getMotupper() {
		return motupper;
	}

	public void setMotupper(String motupper) {
		this.motupper = motupper;
	}

	public String getDel() {
		return del;
	}

	public void setDel(String del) {
		this.del = del;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
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

	public String getFileid() {
		return fileid;
	}

	public void setFileid(String fileid) {
		this.fileid = fileid;
	}
	
}

package com.wr4.domain;

public class RecNotice {
	private int id;
	private String createDate;
	private String advice_Refine;
	private String userId;
	private String admin_userId;
	private String respdate_Refine;
	private String refine_doc;
	private String userType;
	private String adminmot;
	private String tzusertype;
	
	
	public String getTzusertype() {
		return tzusertype;
	}
	public void setTzusertype(String tzusertype) {
		this.tzusertype = tzusertype;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	
	public String getAdvice_Refine() {
		return advice_Refine;
	}
	public void setAdvice_Refine(String advice_Refine) {
		this.advice_Refine = advice_Refine;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
	
	public String getRespdate_Refine() {
		return respdate_Refine;
	}
	public void setRespdate_Refine(String respdate_Refine) {
		this.respdate_Refine = respdate_Refine;
	}
	public String getAdmin_userId() {
		return admin_userId;
	}
	public void setAdmin_userId(String admin_userId) {
		this.admin_userId = admin_userId;
	}
	public String getRefine_doc() {
		return refine_doc;
	}
	public void setRefine_doc(String refine_doc) {
		this.refine_doc = refine_doc;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getAdminmot() {
		return adminmot;
	}
	public void setAdminmot(String adminmot) {
		this.adminmot = adminmot;
	}
	
} 

package com.wr4.domain;

public class ExchangeInfo  {
	
	private static final long serialVersionUID = 1L;
	
	public ExchangeInfo(){
		
	}
	
	/**
	 *  id Double 字段主键
	 */
	private Double id;
	/**
	 *  reason String 字段更改原因
	 */
	private String reason;
	/**
	 *  content String 字段更改内容
	 */
	private String content;
	/**
	 *  pid String 字段机构id
	 */
	private String pid;
	/**
	 *  cdate String 字段更改日期
	 */
	private String cdate;
	/**
	 *  adminmot String 字段主管机关
	 */
	private String adminmot;
	/**
	 *  byzd1 String 用户id
	 */
	private String userid;
	/**
	 *  byzd2 String 受理结果
	 */
	private String resp;
	/**
	 *  byzd3 String 受理状态
	 */
	private String status;
	/**
	 *  byzd4 String 受理意见
	 */
	private String advice;
	/**
	 *机构名称 
	 */
	private String motname;
	private String type;
	private String updateDate;
	
	private String name;
	
	
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	/**
	 *rownum 
	 */
	private int rn;
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public Double getId() {
		return id;
	}
	public void setId(Double id) {
		this.id = id;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public String getAdminmot() {
		return adminmot;
	}
	public void setAdminmot(String adminmot) {
		this.adminmot = adminmot;
	}
	
	public String getResp() {
		return resp;
	}
	public void setResp(String resp) {
		this.resp = resp;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getAdvice() {
		return advice;
	}
	public void setAdvice(String advice) {
		this.advice = advice;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getMotname() {
		return motname;
	}
	public void setMotname(String motname) {
		this.motname = motname;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}


}

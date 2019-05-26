package com.wr4.domain;

public class OrgYearReport {
	
	
	/**
	 *  freport String 字段年报URL
	 */
	private String freport;
	/**
	 *  userid String 字段用户ID 
	 */
	private String userid;
	/**
	 *  year String 字段年份   
	 */
	private String year;
	/**
	 *  createdate String 字段日期   
	 */
	private String createdate;
	/**
	 * id Number id
	 */
	private int id;
	private int rn;
	private String commonname;
	
	/**
	* 返回年报URL属性的值
	* @return String
	*/ 
	public String getFreport() {
		return this.freport;
	}
	/**
	 * 设置freport的值
	 * @param freport String
	 */
	public void setFreport(String freport) {
		this.freport = freport;
	}
	/**
	* 返回用户ID 属性的值
	* @return String
	*/ 
	public String getUserid() {
		return this.userid;
	}
	/**
	 * 设置userid的值
	 * @param userid String
	 */
	public void setUserid(String userid) {
		this.userid = userid;
	}
	/**
	* 返回年份   属性的值
	* @return String
	*/ 
	public String getYear() {
		return this.year;
	}
	/**
	 * 设置year的值
	 * @param year String
	 */
	public void setYear(String year) {
		this.year = year;
	}
	/**
	* 返回日期   属性的值
	* @return String
	*/ 
	public String getCreatedate() {
		return this.createdate;
	}
	/**
	 * 设置createdate的值
	 * @param createdate String
	 */
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public int getId() {
		return id;
	}
	public String getCommonname() {
		return commonname;
	}
	public void setCommonname(String commonname) {
		this.commonname = commonname;
	}
	public void setId(int id) {
		this.id = id;
	}


	


}

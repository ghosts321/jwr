package com.wr4.domain;

import java.io.Serializable;

/***
 * 考评员维度指标分析
 * @author Administrator
 *
 */
public class StatisticsInfo implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String total;//总数
	private String dimension;//按照哪个维度统计的，包括：业务类型，主管机关，文化程度
	private String dimensname;
	private String adminmot;
	private String filetext;
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getDimension() {
		return dimension;
	}
	public String getAdminmot() {
		return adminmot;
	}
	public void setAdminmot(String adminmot) {
		this.adminmot = adminmot;
	}
	public void setDimension(String dimension) {
		this.dimension = dimension;
	}
	public String getFiletext() {
		return filetext;
	}
	public void setFiletext(String filetext) {
		this.filetext = filetext;
	}
	public String getDimensname() {
		return dimensname;
	}
	public void setDimensname(String dimensname) {
		this.dimensname = dimensname;
	}
	
}

package com.wr4.domain;

import java.io.Serializable;

/***
 * 考评员维度指标分析
 * @author Administrator
 *
 */
public class StatisticsInfoList implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String total;//总数
	private String dimension;//按照哪个维度统计的，包括：业务类型，主管机关，文化程度
	private String motname;
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getDimension() {
		return dimension;
	}
	public void setDimension(String dimension) {
		this.dimension = dimension;
	}
	public String getMotname() {
		return motname;
	}
	public void setMotname(String motname) {
		this.motname = motname;
	}
	
}

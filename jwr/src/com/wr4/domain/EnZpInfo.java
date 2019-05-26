package com.wr4.domain;
/**
 * 用于企业自评报告列表
 * @author zhangli
 *2013年12月25日 14:03:13
 */
public class EnZpInfo {
	private String	 createdate; //创建时间
	private String   createpid ;//由 某个企业创建   记录该企业的  pid  组织机构代码
	private String   score     ;//企业自评分数
	private String   busclss   ;//业务类别
	private String   leval     ;//企业等级
	private String   zpreport  ;//企业自评报告
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getCreatepid() {
		return createpid;
	}
	public void setCreatepid(String createpid) {
		this.createpid = createpid;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getBusclss() {
		return busclss;
	}
	public void setBusclss(String busclss) {
		this.busclss = busclss;
	}
	public String getLeval() {
		return leval;
	}
	public void setLeval(String leval) {
		this.leval = leval;
	}
	public String getZpreport() {
		return zpreport;
	}
	public void setZpreport(String zpreport) {
		this.zpreport = zpreport;
	}
	
	
}

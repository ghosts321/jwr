package com.wr4.domain;

/**
 * 用于评分表
 * 
 * @author zhangli
 * 
 */
public class EnPFInfo {
	private String createdate; // 创建时间
	private String createuser; // 创建人
	private String createpid; // 创建人所属组织机构代码
	private String busclass; // 业务类别 可从值列表 获取 valuetext
	private String scoresum; // 评分总分
	private String leval; // 等级
	private String reportname; // 评分报告名称
	private String score; // 评分细则 对应 json {0:5}
	private String bustext; // 业务类别对应中文名
	private String applyId;
	private String kpresult;
	private String kpadvice;
	private String del;
	private String enid;
	private String uno;
	private String stand_comment;
	
	
	
	
	public String getStand_comment() {
		return stand_comment;
	}

	public void setStand_comment(String stand_comment) {
		this.stand_comment = stand_comment;
	}

	public String getEnid() {
		return enid;
	}

	public void setEnid(String enid) {
		this.enid = enid;
	}

	public String getUno() {
		return uno;
	}

	public void setUno(String uno) {
		this.uno = uno;
	}

	public String getDel() {
		return del;
	}

	public void setDel(String del) {
		this.del = del;
	}

	public String getBustext() {
		return bustext;
	}

	public void setBustext(String bustext) {
		this.bustext = bustext;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}

	public String getCreateuser() {
		return createuser;
	}

	public void setCreateuser(String createuser) {
		this.createuser = createuser;
	}

	public String getCreatepid() {
		return createpid;
	}

	public void setCreatepid(String createpid) {
		this.createpid = createpid;
	}

	public String getBusclass() {
		return busclass;
	}

	public void setBusclass(String busclass) {
		this.busclass = busclass;
	}

	public String getScoresum() {
		return scoresum;
	}

	public void setScoresum(String scoresum) {
		this.scoresum = scoresum;
	}

	public String getLeval() {
		return leval;
	}

	public void setLeval(String leval) {
		this.leval = leval;
	}

	public String getReportname() {
		return reportname;
	}

	public void setReportname(String reportname) {
		this.reportname = reportname;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public String getApplyId() {
		return applyId;
	}

	public String getKpresult() {
		return kpresult;
	}

	public void setKpresult(String kpresult) {
		this.kpresult = kpresult;
	}

	public String getKpadvice() {
		return kpadvice;
	}

	public void setKpadvice(String kpadvice) {
		this.kpadvice = kpadvice;
	}

	public void setApplyId(String applyId) {
		this.applyId = applyId;
	}

}

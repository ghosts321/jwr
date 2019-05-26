package com.wr4.domain;

import java.io.Serializable;

public class EnScoreSum implements Serializable{
	private String id;
	private String pid;
	private String cid;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	private String enname;
	private String createdate;
	private String busclass;
	private String grade;
	private String selfScore;
	private String kaoScore;
	
	public String getEnname() {
		return enname;
	}
	public void setEnname(String enname) {
		this.enname = enname;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getBusclass() {
		return busclass;
	}
	public void setBusclass(String busclass) {
		this.busclass = busclass;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getSelfScore() {
		return selfScore;
	}
	public void setSelfScore(String selfScore) {
		this.selfScore = selfScore;
	}
	public String getKaoScore() {
		return kaoScore;
	}
	public void setKaoScore(String kaoScore) {
		this.kaoScore = kaoScore;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	
	
	
}

package com.wr4.domain;

import java.io.Serializable;
import java.util.Date;

public class PnOrgTrain implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int rn;
	private int id;
	private String pn_id;
	private String pnname;
	private String train_start;
	private String train_end;
	private int train_hour;
	private int exam_score;
	private String exam_date;
	private String train_id;
	private String bustype;
	private String adminmot;
	private String del;
	private String userid;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public String getPn_id() {
		return pn_id;
	}
	public void setPn_id(String pn_id) {
		this.pn_id = pn_id;
	}
	public String getPnname() {
		return pnname;
	}
	public void setPnname(String pnname) {
		this.pnname = pnname;
	}
	public int getTrain_hour() {
		return train_hour;
	}
	public void setTrain_hour(int train_hour) {
		this.train_hour = train_hour;
	}
	public int getExam_score() {
		return exam_score;
	}
	public void setExam_score(int exam_score) {
		this.exam_score = exam_score;
	}
	public String getTrain_id() {
		return train_id;
	}
	public void setTrain_id(String train_id) {
		this.train_id = train_id;
	}
	public String getBustype() {
		return bustype;
	}
	public void setBustype(String bustype) {
		this.bustype = bustype;
	}
	public String getAdminmot() {
		return adminmot;
	}
	public void setAdminmot(String adminmot) {
		this.adminmot = adminmot;
	}
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getTrain_start() {
		return train_start;
	}
	public void setTrain_start(String train_start) {
		this.train_start = train_start;
	}
	public String getExam_date() {
		return exam_date;
	}
	public void setExam_date(String exam_date) {
		this.exam_date = exam_date;
	}
	public String getTrain_end() {
		return train_end;
	}
	public void setTrain_end(String train_end) {
		this.train_end = train_end;
	}
}

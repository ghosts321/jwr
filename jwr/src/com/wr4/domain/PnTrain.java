package com.wr4.domain;

public class PnTrain {

	private String adminmot;
	private String bianhao;
	private String del;
	private String exam_date;
	private int exam_score;
	private String id;
	private String name;
	private String train_end;
	private int train_hour;
	private String train_id;
	private String train_start;
	private String type;
	private String pn_id;
	private String trainhour;
	private String examscore;
	private String userid;
	private String bustype;
	private String pid;

	
	
	
	
	
	
	
	
	
	
	
	
	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getBustype() {
		return bustype;
	}

	public void setBustype(String bustype) {
		this.bustype = bustype;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getExamscore() {
		return examscore;
	}

	public void setExamscore(String examscore) {
		this.examscore = examscore;
	}

	public String getTrainhour() {
		return trainhour;
	}

	public void setTrainhour(String trainhour) {
		this.trainhour = trainhour;
	}

	public String getPn_id() {
		return pn_id;
	}

	public void setPn_id(String pn_id) {
		this.pn_id = pn_id;
	}

	
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PnTrain other = (PnTrain) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}



	public String getAdminmot() {
		return adminmot;
	}

	public void setAdminmot(String adminmot) {
		this.adminmot = adminmot;
	}

	public String getBianhao() {
		return bianhao;
	}

	public String getDel() {
		return del;
	}

	public String getExam_date() {
		return exam_date;
	}
	public int getExam_score() {
		return exam_score;
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getTrain_end() {
		return train_end;
	}
	public int getTrain_hour() {
		return train_hour;
	}

	public String getTrain_id() {
		return train_id;
	}

	public String getTrain_start() {
		return train_start;
	}

	public String getType() {
		return type;
	}

	
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}


	public void setBianhao(String bianhao) {
		this.bianhao = bianhao;
	}

	public void setDel(String del) {
		this.del = del;
	}

	public void setExam_date(String exam_date) {
		this.exam_date = exam_date;
	}

	public void setExam_score(int exam_score) {
		this.exam_score = exam_score;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setTrain_end(String train_end) {
		this.train_end = train_end;
	}

	public void setTrain_hour(int train_hour) {
		this.train_hour = train_hour;
	}

	public void setTrain_id(String train_id) {
		this.train_id = train_id;
	}

	public void setTrain_start(String train_start) {
		this.train_start = train_start;
	}

	public void setType(String type) {
		this.type = type;
	}

}

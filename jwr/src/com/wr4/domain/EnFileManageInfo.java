package com.wr4.domain;
/***
 * 考评员档案管理通用返回类型
 * @author Administrator
 *
 */
public class EnFileManageInfo {
	private String parttime;//专兼职
	private String edu;//学历
	private String exam_date;//考试时间
	private String total;//数量小计
	public String getParttime() {
		return parttime;
	}
	public void setParttime(String parttime) {
		this.parttime = parttime;
	}
	public String getEdu() {
		return edu;
	}
	public void setEdu(String edu) {
		this.edu = edu;
	}
	public String getExam_date() {
		return exam_date;
	}
	public void setExam_date(String exam_date) {
		this.exam_date = exam_date;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
}

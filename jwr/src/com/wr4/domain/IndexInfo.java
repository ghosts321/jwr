package com.wr4.domain;
/**
 * 用于首页维护页面
 * @author zhangli
 *
 */
public class IndexInfo {
	private String ptype;         //类型
	private String createdate;   //日期
	private String linkhref; //连接
	private String contenttext; //内容
	private String pno; //排序号
	private String ptitle;//标题 
	private String userid;//创建人
	private String filename;// 上传的附件名称
	private String pdel;//删除标识    1 为删除  0或空 为正常数据
	private int id; //
	public String getPtype() {
		return ptype;
	}
	public void setPtype(String ptype) {
		this.ptype = ptype;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getLinkhref() {
		return linkhref;
	}
	public void setLinkhref(String linkhref) {
		this.linkhref = linkhref;
	}
	public String getContenttext() {
		return contenttext;
	}
	public void setContenttext(String contenttext) {
		this.contenttext = contenttext;
	}
	public String getPno() {
		return pno;
	}
	public void setPno(String pno) {
		this.pno = pno;
	}
	public String getPtitle() {
		return ptitle;
	}
	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getPdel() {
		return pdel;
	}
	public void setPdel(String pdel) {
		this.pdel = pdel;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
}

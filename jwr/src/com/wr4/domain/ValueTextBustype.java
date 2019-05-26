package com.wr4.domain;

import java.io.Serializable;

public class ValueTextBustype implements Serializable{
	
	/**
	 *  filetext String 字段字段中文
	 */
	private String filetext;
	/**
	 *  fileid String 字段字段id
	 */
	private String fileid;
	/**
	 *  filetype String 字段字段类型
	 */
	private String filetype;
	/**
	 *  upperid String 字段字段所属上级字段id
	 */
	private String upperid;
	/**
	 *  uppername String 字段字段所属上级字段名称
	 */
	private String uppername;
	/**
	 *  del String 字段是否删除 1为已删除
	 */
	private String del;
	/**
	 *  createuser String 字段创建人
	 */
	private String createuser;
	/**
	 *  createtime String 字段创建时间
	 */
	private String createtime;
	public String getFiletext() {
		return filetext;
	}
	public void setFiletext(String filetext) {
		this.filetext = filetext;
	}
	public String getFileid() {
		return fileid;
	}
	public void setFileid(String fileid) {
		this.fileid = fileid;
	}
	public String getFiletype() {
		return filetype;
	}
	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}
	public String getUpperid() {
		return upperid;
	}
	public void setUpperid(String upperid) {
		this.upperid = upperid;
	}
	public String getUppername() {
		return uppername;
	}
	public void setUppername(String uppername) {
		this.uppername = uppername;
	}
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	public String getCreateuser() {
		return createuser;
	}
	public void setCreateuser(String createuser) {
		this.createuser = createuser;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	
	
	
}

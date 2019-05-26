package com.wr4.domain;
/**
 * 用于 各种类型的中文对照
 * 值列表（valuetext）
 * @author zhangli
 *
 */
public class FieldValueInfo {
	private String filetext;//字段对应中文
	private String fileid;//字段的id   如  01,02,03
	private String upperid;// 
	private String uppername;// 
	private String filetype;//字段类型   如   业务类型  
	
	
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
	
	
}

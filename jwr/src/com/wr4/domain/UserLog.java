package com.wr4.domain;

import java.io.Serializable;

/**
 * 类说明：用户表
 * 
 * @author 作者: zhangli
 * @version 创建时间：2013年10月29日 15:10:19
 */
public class UserLog implements Serializable {
	private static final long serialVersionUID = -4415990281535582814L;
	public static long getSerialVersionUID() {
		return serialVersionUID;
	}
	private Integer id;
	private String userid;
	private String username; //用户名称
	private String role;   //用户角色，根据usertype来判断进入系统后的菜单显示
	private String pid;//用户所属组织id
	private String createdate;//创建时间
	private String mot;//用户所属的主管机关代码
    private String remark;//用于登录日志 记录信息
    private String no;
    private String uno;
    private String msg;
    private String oid;
    private String date1;
    private String url;
    private String type;

    
    
    
    public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getDate1() {
		return date1;
	}
	public void setDate1(String date1) {
		this.date1 = date1;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getUno() {
		return uno;
	}
	public void setUno(String uno) {
		this.uno = uno;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getMot() {
		return mot;
	}
	public void setMot(String mot) {
		this.mot = mot;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
    
    
}

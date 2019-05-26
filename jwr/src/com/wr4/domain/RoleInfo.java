package com.wr4.domain;

public class RoleInfo {
	 private String roleid;
	 private String rolename;//角色名称
	 private String menuids;//菜单id
	 private String roletype;
	 private String userid;//USERID  用户登录名
	 private String usertype;//USERTYPE 用户类型
	 private int    id;//角色主键
	 private String menuserids;//库中对应字段  用户用户菜单
	 
	 
	public String getMenuserids() {
		return menuserids;
	}
	public void setMenuserids(String menuserids) {
		this.menuserids = menuserids;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRoleid() {
		return roleid;
	}
	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	public String getMenuids() {
		return menuids;
	}
	public void setMenuids(String menuids) {
		this.menuids = menuids;
	}
	public String getRoletype() {
		return roletype;
	}
	public void setRoletype(String roletype) {
		this.roletype = roletype;
	}     
	 
}

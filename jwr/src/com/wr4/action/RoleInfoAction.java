package com.wr4.action;

import com.wr4.domain.RoleInfo;
import com.wr4.service.IRoleService;


public class RoleInfoAction extends BaseAction {
	private IRoleService<RoleInfo> roleService;
	private RoleInfo roleInfo;
	public IRoleService<RoleInfo> getRoleService() {
		return roleService;
	}
	public void setRoleService(IRoleService<RoleInfo> roleService) {
		this.roleService = roleService;
	}
	public RoleInfo getRoleInfo() {
		return roleInfo;
	}
	public void setRoleInfo(RoleInfo roleInfo) {
		this.roleInfo = roleInfo;
	}
	
	
	public  void  roleInsert() {
		try{
			boolean bol=roleService.roleInsert("com.wr4.action.RoleInfoAction.insertRole",roleInfo);
		   if(bol){
			   writer( "添加成功");
		   }else{
			   writer( "添加失败");
		   }
		}catch(Exception e){
			e.printStackTrace();
		} 
	}
	
}

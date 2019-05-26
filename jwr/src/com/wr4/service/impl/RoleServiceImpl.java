package com.wr4.service.impl;

import org.mybatis.spring.SqlSessionTemplate;

import com.wr4.dao.IRoleDao;
import com.wr4.domain.RoleInfo;
import com.wr4.service.IRoleService;

public class RoleServiceImpl<T> implements IRoleService<T> {
	private IRoleDao<T> roleDao;
	
	
	
	public IRoleDao<T> getRoleDao() {
		return roleDao;
	}

	public void setRoleDao(IRoleDao<T> roleDao) {
		this.roleDao = roleDao;
	}

	
	public boolean roleInsert(String sqlId,RoleInfo roleInfo) throws Exception {
		boolean i= roleDao.roleInsert(sqlId,roleInfo);
		if(!i){
			throw new Exception();
		}
		return i;
	}
	
}

package com.wr4.dao;

import com.wr4.domain.RoleInfo;

 

public interface IRoleDao<T> {
	
	/**
	 * 添加角色
	 * @param menuInfo
	 * @return
	 * @throws Exception
	 */
	public  boolean roleInsert(String sqlId,RoleInfo roleInfo) throws Exception;
}

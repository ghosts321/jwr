package com.wr4.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;

import com.wr4.dao.IRoleDao;
import com.wr4.domain.RoleInfo;

public class RoleDaoImpl<T> implements IRoleDao<T> {
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	
	public  boolean roleInsert(String sqlId,RoleInfo roleInfo) throws Exception{
		boolean r=false;
		try{
			int i=	sqlSessionTemplate.insert(sqlId,roleInfo);
			if(i==1){
				r=true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return r; 
	}
}

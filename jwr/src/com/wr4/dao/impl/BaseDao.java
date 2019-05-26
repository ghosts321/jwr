package com.wr4.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;

public class BaseDao {
private SqlSessionTemplate sqlSessionTemplate;
	
	
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}


	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	/**
	 * 用于所有action中查询总数
	 */
	public Object getCount(String sqlId,Object object)throws Exception{
		return sqlSessionTemplate.selectOne(sqlId, object);
	}

}

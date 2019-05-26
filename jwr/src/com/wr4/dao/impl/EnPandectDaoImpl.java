package com.wr4.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.wr4.dao.EnPandectDao;
import com.wr4.domain.EnPandect;

public class EnPandectDaoImpl implements EnPandectDao {

	
	private SqlSessionTemplate sqlSessionTemplate;
	
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	@Override
	public List<EnPandect> getEnPandectList(String sqlId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList(sqlId);
	}

}

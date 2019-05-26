package com.wr4.dao.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.wr4.dao.IEnFileManageDao;

public class EnFileManageDaoImpl implements IEnFileManageDao {
	private SqlSessionTemplate sqlSessionTemplate;
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	
	public List parttimeData(String sqlId, Map map) throws Exception {
		return sqlSessionTemplate.selectList(sqlId, map);
	}

	
	public List pneduData(String sqlId, Map map) throws Exception {
		return sqlSessionTemplate.selectList(sqlId, map);
	}

	
	public List pnTrainData(String sqlId, Map map) throws Exception {
		return sqlSessionTemplate.selectList(sqlId, map);
	}
	
}

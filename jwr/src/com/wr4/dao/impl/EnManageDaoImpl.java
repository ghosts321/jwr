package com.wr4.dao.impl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.wr4.dao.EnDao;
import com.wr4.dao.EnManageDao;
import com.wr4.domain.CheckOrg;
import com.wr4.domain.EnInfo;
import com.wr4.domain.EnPFInfo;
import com.wr4.domain.FieldValueInfo;
import com.wr4.domain.ProblemRec;
import com.wr4.domain.RecNotice;
import com.wr4.domain.YearReport;

public class EnManageDaoImpl<T> implements EnManageDao<T> {
	private SqlSessionTemplate sqlSessionTemplate;
	
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	
	public List getEnProduceList(String sqlId, Map map) throws Exception {
		List list=sqlSessionTemplate.selectList(sqlId, map);
		return list;
	}

	
	public void updateApplyCertNo(String sqlId, Map map) throws Exception {
		sqlSessionTemplate.update(sqlId, map);
	}

	
	public List getEnFileManageList(String sqlId, Map map) throws Exception {
		List list=sqlSessionTemplate.selectList(sqlId, map);
		return list;
	}

	
	public List getEnScoreSumList(String sqlId, Map map) throws Exception {
		List list=sqlSessionTemplate.selectList(sqlId, map);
		return list;
	}

	
	public EnInfo getEnDetail(String sqlId, Map map) throws Exception {
		EnInfo enInfo=sqlSessionTemplate.selectOne(sqlId,map);
		return enInfo;
	}

}

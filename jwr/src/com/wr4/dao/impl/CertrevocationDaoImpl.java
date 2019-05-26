package com.wr4.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.wr4.dao.ICertrevocationDao;
import com.wr4.domain.CertInfo;
import com.wr4.domain.PnInfo;

public class CertrevocationDaoImpl implements ICertrevocationDao {
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	public List<CertInfo> selectCertByCid(String sqlId, CertInfo certInfo) {
		return sqlSessionTemplate.selectList(sqlId, certInfo);
	}

	public PnInfo selectPnInfo(String sqlId, CertInfo certInfo) {
		return sqlSessionTemplate.selectOne(sqlId, certInfo);
	}

}

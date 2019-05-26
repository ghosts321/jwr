package com.wr4.dao.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.wr4.dao.IExchangeCertDao;
import com.wr4.domain.PnApply;

public class IExchangeCertDaoImpl implements IExchangeCertDao {
	private SqlSessionTemplate sqlSessionTemplate;
	
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	
	public List getCertByUserid(String sqlId,String userid) throws Exception {
		return sqlSessionTemplate.selectList(sqlId, userid);
	}

	
	public int exchangeSubmit(String sqlId, Map map) throws Exception {
		return sqlSessionTemplate.update(sqlId, map);
	}
	public int exchangeSubmit(String sqlId, Object object) throws Exception {
		return sqlSessionTemplate.update(sqlId, object);
	}

	
	public PnApply getDetialById(String sqlId, String id) {
		return sqlSessionTemplate.selectOne(sqlId, id);
	}

	
	public int updateCertByUserIdAndCertType(String sqlId, Map map)
			throws Exception {
		return sqlSessionTemplate.update(sqlId, map);
	}

}

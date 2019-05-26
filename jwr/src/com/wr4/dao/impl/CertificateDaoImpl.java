package com.wr4.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.wr4.dao.CertificateDao;
import com.wr4.domain.CertificateInfo;

public class CertificateDaoImpl implements CertificateDao {
	private SqlSessionTemplate sqlSessionTemplate;
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	public List<CertificateInfo> selectAll(String sqlId,
			CertificateInfo certificateInfo, int start, int limit) {
		return sqlSessionTemplate.selectList(sqlId, certificateInfo);
	}
	public CertificateInfo selectOne(String sqlId,
			CertificateInfo certificateInfo) {
		return sqlSessionTemplate.selectOne(sqlId, certificateInfo);
	}
	public int insertCertNo(String sqlId, CertificateInfo certificateInfo) {
		return sqlSessionTemplate.insert(sqlId, certificateInfo);
	}
	public int updateApply(String sqlId, CertificateInfo certificateInfo) {
		return sqlSessionTemplate.update(sqlId, certificateInfo);
	}
	public int updateCertByUserIdAndCertType(String sqlId, Map map) {
		return sqlSessionTemplate.update(sqlId, map);
	}

}

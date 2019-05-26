package com.wr4.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.wr4.dao.EnDao;
import com.wr4.dao.OrgDao;
import com.wr4.dao.RespOrgApplyManageDao;
import com.wr4.domain.CertInfo;
import com.wr4.domain.EnInfo;
import com.wr4.domain.ExchangeInfo;
import com.wr4.domain.OrgInfo;
import com.wr4.domain.OrgList;
import com.wr4.domain.OrgYearReport;
import com.wr4.domain.RecNotice;
import com.wr4.domain.RespOrgApplyDetail;

public class RespOrgApplyManageDaoImpl<T> implements RespOrgApplyManageDao<T> {
	private SqlSessionTemplate sqlSessionTemplate;
	
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	
	public List getOrgApplyList(String sqlId, Map map) throws Exception {
		List list=sqlSessionTemplate.selectList(sqlId, map);
		return list;
	}

	
	public List getOrgApplyAllList(String sqlId, Map map,int start,int limit) throws Exception {
		List<T> list  = sqlSessionTemplate.selectList(sqlId, map);
		return list;
	}

	
	public RespOrgApplyDetail scanOrgDetail(String sqlId, Map map)
			throws Exception {
		RespOrgApplyDetail respOrgApplyDetail=sqlSessionTemplate.selectOne(sqlId,map);
		return respOrgApplyDetail;
	}

	
	public int delOrgApply(String sqlId, Map map) throws Exception {
		int result=sqlSessionTemplate.update(sqlId, map);
		return result;
	}

	
	public List getOrgExchangeList(String sqlId, Map map, int start, int limit)
			throws Exception {
		List list=sqlSessionTemplate.selectList(sqlId, map);
		return list;
	}

	
	public List getOrgExchangeAllList(String sqlId, Map map) throws Exception {
		List list=sqlSessionTemplate.selectList(sqlId, map);
		return list;
	}

	
	public ExchangeInfo selectExchangeById(String sqlId, Map map)
			throws Exception {
		ExchangeInfo exchangeInfo = sqlSessionTemplate.selectOne(sqlId, map);
		return exchangeInfo;
	}

	
	public int updateAdviceById(String sqlId, Map map) throws Exception {
		int result=sqlSessionTemplate.update(sqlId, map);
		return result;
	}

	
	public List getCertChangeList(String sqlId, Map map, int start, int limit)
			throws Exception {
		List list=sqlSessionTemplate.selectList(sqlId, map);
		return list;
	}

	
	public List getCertChangeList(String sqlId, Map map) throws Exception {
		List list=sqlSessionTemplate.selectList(sqlId, map);
		return list;
	}

	
	public com.wr4.domain.RespOrgApplyDetail RespOrgApplyDetail(String sqlId,
			Map map) throws Exception {
		RespOrgApplyDetail respOrgApplyDetail=sqlSessionTemplate.selectOne(sqlId,map);
		return respOrgApplyDetail;
	}

	
	public int delCertChangeById(String sqlId, Map map) throws Exception {
		int result=sqlSessionTemplate.update(sqlId, map	);
		return result;
	}

	
	public int updateRegAndApply(String sqlId, Map map) throws Exception {
		return sqlSessionTemplate.update(sqlId, map);
	}

	
	public int delApply(String sqlId, Map map) throws Exception {
		// TODO Auto-generated method stub\
		return sqlSessionTemplate.update(sqlId, map);
	}

	
	public int delCert(String sqlId, Map map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update(sqlId, map);
	}

}

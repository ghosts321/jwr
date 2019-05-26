package com.wr4.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.wr4.dao.EnDao;
import com.wr4.dao.OrgDao;
import com.wr4.dao.OrgManageDao;
import com.wr4.domain.CertInfo;
import com.wr4.domain.EnInfo;
import com.wr4.domain.Examine;
import com.wr4.domain.MotInfo;
import com.wr4.domain.OrgInfo;
import com.wr4.domain.OrgList;
import com.wr4.domain.OrgYearReport;
import com.wr4.domain.RecNotice;

public class OrgManageDaoImpl<T> implements OrgManageDao<T> {
	private SqlSessionTemplate sqlSessionTemplate;
	
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	
	public List<T> getBookApplyList(String sqlId, Map map, int start,
			int limit) throws Exception{
		List list=sqlSessionTemplate.selectList(sqlId, map);
		return list;
	}

	
	public int orgReg(String sqlId, OrgInfo orgInfo) throws Exception{
		int result=sqlSessionTemplate.insert(sqlId,orgInfo);
		return result;
	}

	
	public int orgRegExm(String sqlId, Examine examine) throws Exception{
		return sqlSessionTemplate.insert(sqlId, examine);
	}

	
	public List getUpdateList(String sqlId, Map map) throws Exception{
		List list=sqlSessionTemplate.selectList(sqlId, map);
		return list;
	}

	
	public int insertUpdateContent(String sqlId, Map map) throws Exception{
		return sqlSessionTemplate.insert(sqlId, map);
	}

	
	public List getBookChange(String sqlId, Map map, int start, int limit)
			throws Exception {
		List list=sqlSessionTemplate.selectList(sqlId, map);
		return list;
	}

	
	public List getBookYearReportList(String sqlId, Map map, int start,
			int limit) throws Exception {
		List list=sqlSessionTemplate.selectList(sqlId, map);
		return list;
	}

	
	public int saveYearReport(String sqlId, OrgYearReport orgYearReport)
			throws Exception {
		return sqlSessionTemplate.insert(sqlId, orgYearReport);
	}

	
	public List getBookApplyAllList(String sqlId, Map map) throws Exception {
		List list=sqlSessionTemplate.selectList(sqlId, map);
		return list;
	}

	
	public OrgInfo getOrgApplyId(String sqlId, OrgInfo orgInfo) throws Exception {
		return  sqlSessionTemplate.selectOne(sqlId,orgInfo);
	}

	
	public MotInfo getMotByCode(String sqlId, Map map) throws Exception {
		MotInfo motInfo =sqlSessionTemplate.selectOne(sqlId, map);
		return motInfo;
	}

	
	public List getAllBookChange(String sqlId, Map map) throws Exception {
		return sqlSessionTemplate.selectList(sqlId, map);
	}

	
	public int updateReason(String sqlId, Map map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert(sqlId, map);
	}

	
	public List getBookChange(String sqlId, Map map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList(sqlId, map);
	}


}

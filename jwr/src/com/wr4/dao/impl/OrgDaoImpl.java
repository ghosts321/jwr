package com.wr4.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.wr4.dao.EnDao;
import com.wr4.dao.OrgDao;
import com.wr4.domain.CertInfo;
import com.wr4.domain.EnInfo;
import com.wr4.domain.OrgInfo;
import com.wr4.domain.OrgList;
import com.wr4.domain.OrgYearReport;
import com.wr4.domain.RecNotice;

public class OrgDaoImpl<T> implements OrgDao<T> {
	private SqlSessionTemplate sqlSessionTemplate;
	
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	
	public List<T> selectOrgBookList(String sqlId, OrgInfo orgInfo, int start,
			int limit) throws Exception{
		List<T> list  = sqlSessionTemplate.selectList(sqlId, orgInfo);
		return list;
	}
	
	
	public List<T> selectOrgList(String sqlId, OrgList orgList, int start,
			int limit) throws Exception{
		List<T> list  = sqlSessionTemplate.selectList(sqlId, orgList);
		return list;
	}

	
	public OrgInfo scanDetail(Map map) throws Exception{
//		Map orgInfoMap=sqlSessionTemplate.sel.selectMap((String)map.get("sqlId"),(String)map.get("certnumber"));
		OrgInfo orgInfo = sqlSessionTemplate.selectOne((String)map.get("sqlId"),(String)map.get("id"));
		return orgInfo;
	}

	
	public OrgInfo applyDetail(Map map) throws Exception{
		OrgInfo orgInfo = sqlSessionTemplate.selectOne((String)map.get("sqlId"),map);
		return orgInfo;
	}

	
	public String queryNoNum(String sqlId, Map map) throws Exception{
		String num=sqlSessionTemplate.selectOne(sqlId, map);
		return num;
	}

	
	public int insertCertNo(String sqlId, Map map) throws Exception{
		return sqlSessionTemplate.insert(sqlId, map);
	}

	
	public int insertExamin(String sqlId, Map map) throws Exception{
		return sqlSessionTemplate.insert(sqlId,map);
	}

	
	public int updateApplyCertNo(String sqlId, Map map) throws Exception{
		return sqlSessionTemplate.update(sqlId, map);
	}

	
	public OrgInfo getOrgInfo(String sqlId, Map map) throws Exception{
		OrgInfo orgInfo = sqlSessionTemplate.selectOne(sqlId, map);
		return orgInfo;
	}

	
	public Integer saveRecNotice(String sqlId, RecNotice recNotice) throws Exception{
		int flag=sqlSessionTemplate.insert(sqlId , recNotice);
		return flag;
	}

	
	public Integer updateAdvice(String sqlId, CertInfo certInfo) throws Exception{
		int flag=sqlSessionTemplate.update(sqlId,certInfo);
		return flag;
	}

	
	public List<T> selectOrgList(String sqlId, OrgInfo orgInfo) throws Exception{
		List<T> list  = sqlSessionTemplate.selectList(sqlId, orgInfo);
		return list;
	}

	
	public List<T> getYearReport(String sqlId, OrgYearReport orgYearReport,
			int start, int limit) throws Exception{
		List<T> list=sqlSessionTemplate.selectList(sqlId, orgYearReport, new RowBounds(start, limit));
		return list;
	}

	
	public List getOrgByCon(String sql, Map map,int start,int limit) {
		return sqlSessionTemplate.selectList(sql, map);
	}

	
	public List getOrgByConAll(String sqlId, Map map) {
		return sqlSessionTemplate.selectList(sqlId, map);
	}

	
	public List<T> selectOrgList(String sqlId, OrgList orgList)
			throws Exception {
		List<T> list  = sqlSessionTemplate.selectList(sqlId, orgList);
		return list;
	}

	
	public List getMotYearReportList(String sql, Map map, int start, int limit)
			throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList(sql, map);
	}

	
	public List getMotYearReportAllList(String sqlId, Map map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList(sqlId, map);
	}

	
	public int updateApply(String sqlId, CertInfo certInfo) throws Exception {
		return sqlSessionTemplate.update(sqlId, certInfo);
	}

	
	public int insertExamine(String sqlId, Map map) throws Exception {
		return sqlSessionTemplate.insert(sqlId,map);
	}

	
	public List getWorkProList(String sql, Map map, int start, int limit)
			throws Exception {
		return sqlSessionTemplate.selectList(sql, map);
	}

	
	public List getWorkProAllList(String sqlId, Map map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList(sqlId,map);
	}
	
	public Object updateEmployPn(String sqlId,Map map) throws Exception{
		return sqlSessionTemplate.update(sqlId,map);
	}

	
	public String selecteBusName(String sqlId, Map map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne(sqlId,map);
	}

}

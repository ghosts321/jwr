package com.wr4.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.wr4.dao.NameReportDao;
import com.wr4.domain.NameReport;

public class NameReportDaoImpl<T> implements NameReportDao<T> {
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}
	
	
	public int NReportAdd(String sqlId, NameReport nameReport) throws Exception {
		return this.sqlSessionTemplate.insert(sqlId, nameReport);
	}

	
	public List<T> selectNReport(String seqId, NameReport nameReport) throws Exception {
		List<T> list = this.sqlSessionTemplate.selectList(seqId, nameReport);
		return list;
	}

	
	public NameReport getNReportData(String sqlId, String id) throws Exception {
		return sqlSessionTemplate.selectOne(sqlId, id);
	}

	
	public List getNameReportList(String sqlId, Map map, int start, int limit)
			throws Exception {
		List list = sqlSessionTemplate.selectList(sqlId, map, new RowBounds(start,limit));
		return list;
	}
	public List getNameReportList(String sqlId, Map map)throws Exception {
		List list = sqlSessionTemplate.selectList(sqlId, map);
		return list;
	}

	
	public NameReport selectNameReportById(String sqlId, Map map)
			throws Exception {
		NameReport nameReport =  sqlSessionTemplate.selectOne(sqlId, map);
		return nameReport;
	}

	
	public int updateNameReportById(String sqlId, Map map) throws Exception {
		int result  = this.sqlSessionTemplate.update(sqlId, map);
		return result;
	}
}

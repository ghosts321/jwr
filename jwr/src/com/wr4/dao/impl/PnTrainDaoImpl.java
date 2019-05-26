package com.wr4.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.wr4.dao.IPnDao;
import com.wr4.dao.IPnTrainDao;
import com.wr4.domain.PnTrain;
import com.wr4.domain.PnTrainInfo;

public class PnTrainDaoImpl<T> implements IPnTrainDao<T> {
	private SqlSessionTemplate sqlSessionTemplate;

	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	// 查询考评员培训考试记录
	
	public List<PnTrainInfo> selectPnTrain(String sqlId, PnTrainInfo pnTrainInfo, int start, int limit) {
		List<PnTrainInfo> list  = sqlSessionTemplate.selectList(sqlId, pnTrainInfo);
		return list;
	}
	
	public List<PnTrainInfo> selectAll(String sqlId, Map map, int start, int limit) {
		List<PnTrainInfo> list  = sqlSessionTemplate.selectList(sqlId, map);
		return list;
	}

	
	public List<PnTrainInfo> orgPnTrain(String sqlId, PnTrainInfo pnTrainInfo,
			int offset, int limit) {
		return sqlSessionTemplate.selectList(sqlId, pnTrainInfo);
	}

	
	public List selectAllCount(String sqlId, Map map) {
		List<PnTrainInfo> list  = sqlSessionTemplate.selectList(sqlId, map);
		return list;
	}

	
	public List selectPnTrainAll(String sqlId, PnTrainInfo pnTrainInfo) {
		return sqlSessionTemplate.selectList(sqlId, pnTrainInfo);
	}

	
	public List<PnTrainInfo> orgPnTrainAll(String sqlId, String orgcode) {
		return sqlSessionTemplate.selectList(sqlId, orgcode);
	}

	
	public List getAllNoTrain(String sqlId, Map map,int start,int limit) throws Exception {
		return sqlSessionTemplate.selectList(sqlId, map);
	}
	
	public List getAllNoTrainCount(String sqlId, Map map) throws Exception {
		return sqlSessionTemplate.selectList(sqlId, map);
	}

	
	public int pnTrainSave(String sqlId, Map map) throws Exception {
		return sqlSessionTemplate.insert(sqlId, map);
	}
}

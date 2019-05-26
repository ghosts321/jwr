package com.wr4.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.wr4.dao.IStatisticsDao;
import com.wr4.domain.PnApply;
import com.wr4.domain.PnTrainInfo;
import com.wr4.domain.StatisticsQueryInfo;

public class StatisticsDaoImpl implements IStatisticsDao {
	private SqlSessionTemplate sqlSessionTemplate;
	
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	
	public List<PnApply> selectPntrain(String sqlId, StatisticsQueryInfo pnTrainInfo, int start, int limit) {
		return sqlSessionTemplate.selectList(sqlId, pnTrainInfo);
	}

	
	public PnTrainInfo pnTrainDetail(String sqlId, PnTrainInfo pnTrainInfo) {
		return sqlSessionTemplate.selectOne(sqlId, pnTrainInfo);
	}

	
	public List selectPntrainAll(String sqlId,
			StatisticsQueryInfo statisticsQueryInfo) {
		return sqlSessionTemplate.selectList(sqlId, statisticsQueryInfo);
	}

	
	public List statisticsByBustype(String sqlId, Map map) {
		return sqlSessionTemplate.selectList(sqlId, map);
	}

	
	public List statisticsByMot(String sqlId, Map map) throws Exception {
		return sqlSessionTemplate.selectList(sqlId, map);
	}

	
	public List statisticsByEdu(String sqlId, Map map) throws Exception {
		return sqlSessionTemplate.selectList(sqlId, map);
	}

	
	public List statisticsPntrain(String sqlId, Map map) throws Exception {
		return sqlSessionTemplate.selectList(sqlId,map);
	}

	
	public List statisticsPntrainLine(String sqlId, Map map) {
		return sqlSessionTemplate.selectList(sqlId,map);
	}

	
	public List getLowerList(String sqlId, Map map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList(sqlId,map);
	}

	
	public List getLowerListCount(String sqlId, Map map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList(sqlId, map);
	}

	
	public List getLowerListFiletext(String sqlId, Map map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList(sqlId,map);
	}
	public Object getMotText(String sqlId,Map map)throws Exception{
		return sqlSessionTemplate.selectOne(sqlId,map);
	}
}

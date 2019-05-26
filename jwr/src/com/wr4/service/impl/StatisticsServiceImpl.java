package com.wr4.service.impl;

import java.util.List;
import java.util.Map;

import com.wr4.dao.IStatisticsDao;
import com.wr4.domain.CertInfo;
import com.wr4.domain.PnApply;
import com.wr4.domain.PnInfo;
import com.wr4.domain.PnTrainInfo;
import com.wr4.domain.StatisticsQueryInfo;
import com.wr4.service.IStatisticsService;

public class StatisticsServiceImpl implements IStatisticsService {
	private IStatisticsDao iStatisticsDao;
	
	public IStatisticsDao getiStatisticsDao() {
		return iStatisticsDao;
	}

	public void setiStatisticsDao(IStatisticsDao iStatisticsDao) {
		this.iStatisticsDao = iStatisticsDao;
	}

	
	public List<PnApply> selectPntrain(String sqlId, StatisticsQueryInfo pnTrainInfo,int start,int limit) throws Exception {
		return iStatisticsDao.selectPntrain(sqlId, pnTrainInfo,start,limit);
	}

	
	public PnTrainInfo pnTrainDetail(String sqlId, PnTrainInfo pnTrainInfo) throws Exception {
		return iStatisticsDao.pnTrainDetail(sqlId, pnTrainInfo);
	}

	
	public List selectPntrainAll(String sqlId,
			StatisticsQueryInfo statisticsQueryInfo) throws Exception {
		return iStatisticsDao.selectPntrainAll(sqlId,statisticsQueryInfo);
	}

	
	public List statisticsByBustype(String string, Map map) throws Exception {
		return iStatisticsDao.statisticsByBustype(string,map);
	}

	
	public List statisticsByMot(String sqlId, Map map) throws Exception {
		return iStatisticsDao.statisticsByMot(sqlId,map);
	}

	
	public List statisticsByEdu(String sqlId, Map map) throws Exception {
		return iStatisticsDao.statisticsByEdu(sqlId,map);
	}

	
	public List statisticsPntrain(String sqlId, Map map) throws Exception {
		return iStatisticsDao.statisticsPntrain(sqlId,map);
	}

	
	public List statisticsPntrainLine(String sqlId, Map map) {
		return iStatisticsDao.statisticsPntrainLine(sqlId,map);
	}

	
	public List getLowerList(String sqlId, Map map) throws Exception {
		// TODO Auto-generated method stub
		return iStatisticsDao.getLowerList(sqlId,map);
	}

	
	public List getLowerListCount(String sqlId, Map map) throws Exception {
		// TODO Auto-generated method stub
		return iStatisticsDao.getLowerListCount(sqlId,map);
	}

	
	public List getLowerListFiletext(String sqlId, Map map) throws Exception {
		// TODO Auto-generated method stub
		return iStatisticsDao.getLowerListFiletext(sqlId,map);
	}
	public Object getMotText(String sqlId,Map map)throws Exception{
		return iStatisticsDao.getMotText(sqlId,map);
	}
}

package com.wr4.service;

import java.util.List;
import java.util.Map;

import com.wr4.domain.PnApply;
import com.wr4.domain.PnTrainInfo;
import com.wr4.domain.StatisticsQueryInfo;

public interface IStatisticsService<T> {
	
	public List<PnApply> selectPntrain(String sqlId, StatisticsQueryInfo pnTrainInfo, int offset, int limit) throws Exception;
	public PnTrainInfo pnTrainDetail(String sqlId, PnTrainInfo pnTrainInfo) throws Exception;
	public List selectPntrainAll(String string,
			StatisticsQueryInfo statisticsQueryInfo) throws Exception;
	public List statisticsByBustype(String sqlId, Map map) throws Exception;
	public List statisticsByMot(String sqlId, Map map) throws Exception;
	public List statisticsByEdu(String sqlId, Map map) throws Exception;
	public List statisticsPntrain(String sqlId, Map map) throws Exception;
	public List statisticsPntrainLine(String sqlId, Map map);
	public List getLowerList(String sqlId,Map map)throws Exception;
	public List getLowerListCount(String sqlId,Map map)throws Exception;
	public List getLowerListFiletext(String sqlId,Map map)throws Exception;
	public Object getMotText(String sqlId,Map map)throws Exception;
}

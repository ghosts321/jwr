package com.wr4.service;

import java.util.List;
import java.util.Map;

import com.wr4.domain.PnTrain;
import com.wr4.domain.PnTrainInfo;

public interface IPnTrainService<T> {
    //查询考评员培训考试记录
	public List<PnTrainInfo> selectPnTrain(String sqlId, PnTrainInfo pnTrainInfo, int start, int limit) throws Exception;
	public List<PnTrainInfo> selectAll(String sqlId, Map map, int start, int limit) throws Exception;
	public List<PnTrainInfo> orgPnTrain(String sqlId, PnTrainInfo pnTrainInfo,
			int offset, int limit) throws Exception;
	public List selectAllCount(String string, Map map) throws Exception;
	public List selectPnTrainAll(String sqlId, PnTrainInfo pnTrainInfo) throws Exception;
	public List<PnTrainInfo> orgPnTrainAll(String sqlId, String orgcode) throws Exception;
	public List getAllNoTrain(String sqlId, Map map, int offset, int limit) throws Exception;
	public List getAllNoTrainCount(String sqlId, Map map) throws Exception;
	public int pnTrainSave(String sqlId, Map map) throws Exception;
}

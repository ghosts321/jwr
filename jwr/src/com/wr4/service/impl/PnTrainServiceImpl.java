package com.wr4.service.impl;

import java.util.List;
import java.util.Map;

import com.wr4.dao.IPnTrainDao;
import com.wr4.domain.PnTrainInfo;
import com.wr4.service.IPnTrainService;

public class PnTrainServiceImpl<T> implements IPnTrainService<T> {
	private IPnTrainDao<T> iPnTrainDao;

	public IPnTrainDao<T> getiPnTrainDao() {
		return iPnTrainDao;
	}
	public void setiPnTrainDao(IPnTrainDao<T> iPnTrainDao) {
		this.iPnTrainDao = iPnTrainDao;
	}

	
	public List<PnTrainInfo> selectPnTrain(String sqlId, PnTrainInfo pnTrainInfo, int start, int limit) throws Exception {
        List<PnTrainInfo> list = iPnTrainDao.selectPnTrain(sqlId, pnTrainInfo, start, limit);
		return list;
	}
	
	public List<PnTrainInfo> selectAll(String sqlId, Map map, int start, int limit) throws Exception {
        List<PnTrainInfo> list = iPnTrainDao.selectAll(sqlId, map, start, limit);
		return list;
	}
	
	public List<PnTrainInfo> orgPnTrain(String sqlId, PnTrainInfo pnTrainInfo,
			int offset, int limit) throws Exception {
		return iPnTrainDao.orgPnTrain(sqlId,pnTrainInfo,offset,limit);
	}
	
	public List selectAllCount(String sqlId, Map map) throws Exception {
		return iPnTrainDao.selectAllCount(sqlId, map);
	}
	
	public List selectPnTrainAll(String sqlId, PnTrainInfo pnTrainInfo) throws Exception {
		return iPnTrainDao.selectPnTrainAll(sqlId, pnTrainInfo);
	}
	
	public List<PnTrainInfo> orgPnTrainAll(String sqlId, String orgcode) throws Exception {
		return iPnTrainDao.orgPnTrainAll(sqlId,orgcode);
	}
	
	public List getAllNoTrain(String sqlId, Map map,int start,int limit)
			throws Exception {
		return iPnTrainDao.getAllNoTrain(sqlId,map,start,limit);
	}
	
	public List getAllNoTrainCount(String sqlId, Map map)
			throws Exception {
		return iPnTrainDao.getAllNoTrainCount(sqlId,map);
	}
	
	public int pnTrainSave(String sqlId, Map map) throws Exception {
		int i= iPnTrainDao.pnTrainSave(sqlId,map);
		if(i<1){
			throw new Exception();
		}
		return i;
	}

}

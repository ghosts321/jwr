package com.wr4.service.impl;

import java.util.List;
import java.util.Map;

import com.wr4.dao.IPnDao;
import com.wr4.domain.PnTrain;
import com.wr4.service.IPnService;

public class PnServiceImpl<T> implements IPnService<T> {
	private IPnDao<T> pnDao;

	public IPnDao<T> getPnDao() {
		return pnDao;
	}

	public void setPnDao(IPnDao<T> pnDao) {
		this.pnDao = pnDao;
	}

	
	public List<T> selectPnTrain(String sqlId, Map map, int start, int limit) throws Exception{
        List<T> list = pnDao.selectPnTrain(sqlId, map, start, limit);
		return list;
	}

}

package com.wr4.service.impl;

import java.util.List;
import java.util.Map;

import com.wr4.dao.IPnApplyAccepDao;
import com.wr4.service.IPnApplyAccepService;

public class PnApplyAccepServiceImpl implements IPnApplyAccepService {
	private IPnApplyAccepDao iPnApplyAccepDao;
	public IPnApplyAccepDao getiPnApplyAccepDao() {
		return iPnApplyAccepDao;
	}
	public void setiPnApplyAccepDao(IPnApplyAccepDao iPnApplyAccepDao) {
		this.iPnApplyAccepDao = iPnApplyAccepDao;
	}
	
	public List pnApplyAccept(String sqlId,Map map) throws Exception {
		return iPnApplyAccepDao.pnApplyAccept(sqlId,map);
	}
	public List pnApplyAccept(String sqlId,Map map,int offset,int limit) throws Exception {
		return iPnApplyAccepDao.pnApplyAccept(sqlId,map,offset,limit);
	}
	
	public List applyAcceptGetTrain(String string, Map map) throws Exception {
		return iPnApplyAccepDao.applyAcceptGetTrain(string,map);
	}

}

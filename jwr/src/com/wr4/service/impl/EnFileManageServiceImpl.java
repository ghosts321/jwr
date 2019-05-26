package com.wr4.service.impl;

import java.util.List;
import java.util.Map;

import com.wr4.dao.IEnFileManageDao;
import com.wr4.service.IEnFileManageService;

public class EnFileManageServiceImpl implements IEnFileManageService {
	private IEnFileManageDao iEnFileManageDao;

	public IEnFileManageDao getiEnFileManageDao() {
		return iEnFileManageDao;
	}
	public void setiEnFileManageDao(IEnFileManageDao iEnFileManageDao) {
		this.iEnFileManageDao = iEnFileManageDao;
	}
	
	public List parttimeData(String sqlId, Map map) throws Exception {
		return iEnFileManageDao.parttimeData(sqlId, map);
	}
	
	public List pneduData(String sqlId, Map map) throws Exception {
		return iEnFileManageDao.pneduData(sqlId, map);
	}
	
	public List pnTrainData(String sqlId, Map map) throws Exception {
		return iEnFileManageDao.pnTrainData(sqlId, map);
	}
	
}

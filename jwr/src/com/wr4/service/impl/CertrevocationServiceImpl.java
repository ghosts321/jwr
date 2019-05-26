package com.wr4.service.impl;

import java.util.List;

import com.wr4.dao.ICertrevocationDao;
import com.wr4.domain.CertInfo;
import com.wr4.domain.PnInfo;
import com.wr4.service.ICertrevocationService;

public class CertrevocationServiceImpl implements ICertrevocationService {
	private ICertrevocationDao<CertInfo> iCertrevocationDao;
	public ICertrevocationDao<CertInfo> getiCertrevocationDao() {
		return iCertrevocationDao;
	}

	public void setiCertrevocationDao(
			ICertrevocationDao<CertInfo> iCertrevocationDao) {
		this.iCertrevocationDao = iCertrevocationDao;
	}

	
	public List<CertInfo> selectCertByCid(String sqlId, CertInfo certInfo) throws Exception {
		return iCertrevocationDao.selectCertByCid(sqlId, certInfo);
	}

	
	public PnInfo selectPnInfo(String sqlId, CertInfo certInfo) throws Exception {
		return iCertrevocationDao.selectPnInfo(sqlId, certInfo);
	}

}

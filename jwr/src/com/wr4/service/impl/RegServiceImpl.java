package com.wr4.service.impl;

import com.wr4.dao.IRegDao;
import com.wr4.domain.EnRegInfo;
import com.wr4.domain.MotRegInfo;
import com.wr4.domain.OrgRegInfo;
import com.wr4.domain.PnRegInfo;
import com.wr4.service.IRegService;

public class RegServiceImpl implements IRegService{
	private IRegDao regDao;
	
	public IRegDao getRegDao() {
		return regDao;
	}

	public void setRegDao(IRegDao regDao) {
		this.regDao = regDao;
	}

	public int motReg(String sqlId,MotRegInfo motRegInfo) throws Exception {
		return regDao.motReg(sqlId, motRegInfo);
	}

	public int enReg(String sqlId,EnRegInfo enRegInfo) throws Exception {
		return regDao.enReg(sqlId, enRegInfo);
	}

	public int orgReg(String sqlId,OrgRegInfo orgRegInfo) throws Exception {
		return regDao.orgReg(sqlId, orgRegInfo);
	}

	public int pnReg(String sqlId,PnRegInfo pnRegInfo) throws Exception {
		return regDao.pnReg(sqlId, pnRegInfo);
	}

}

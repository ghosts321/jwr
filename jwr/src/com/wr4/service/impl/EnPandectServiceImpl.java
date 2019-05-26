package com.wr4.service.impl;

import java.util.List;

import com.wr4.dao.EnPandectDao;
import com.wr4.domain.EnPandect;
import com.wr4.service.EnPandectService;

public class EnPandectServiceImpl implements EnPandectService{
    
	private EnPandectDao enPandectDao;
	
	public EnPandectDao getEnPandectDao() {
		return enPandectDao;
	}
	
	public void setEnPandectDao(EnPandectDao enPandectDao) {
		this.enPandectDao = enPandectDao;
	}

	@Override
	public List<EnPandect> getEnPandectList(String sqlId) throws Exception {
		return enPandectDao.getEnPandectList(sqlId);
	}
	
	
	

}

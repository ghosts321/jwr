package com.wr4.service.impl;

import com.wr4.dao.impl.BaseDao;

public class BaseServiceImpl {
	private BaseDao baseDao;
	
	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	public Object selectCount(String sqlId,Object object)throws Exception{
		int count= (Integer) baseDao.getCount(sqlId,object);
		 return count;
	}
}

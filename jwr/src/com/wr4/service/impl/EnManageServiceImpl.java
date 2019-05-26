package com.wr4.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wr4.dao.EnManageDao;
import com.wr4.dao.IExchangeCertDao;
import com.wr4.dao.ILoginDao;
import com.wr4.domain.EnInfo;
import com.wr4.domain.User;
import com.wr4.service.EnManageService;
import com.wr4.service.ILoginService;

/**
 * 类说明：登录逻辑层Service实现
 * 
 * @author 作者: zhangli
 * @version 创建时间：2013年10月29日 15:11:54
 */
@Service
@Transactional
public class EnManageServiceImpl implements EnManageService {
	
	private EnManageDao enManageDao;

	public EnManageDao getEnManageDao() {
		return enManageDao;
	}

	public void setEnManageDao(EnManageDao enManageDao) {
		this.enManageDao = enManageDao;
	}

	
	public List getEnProduceList(String sqlId, Map map) throws Exception {
		List list=enManageDao.getEnProduceList(sqlId,map);
		return list;
	}

	
	public void updateApplyCertNo(String sqlId, Map map) throws Exception {
		enManageDao.updateApplyCertNo(sqlId,map);
	}

	
	public List getEnFileManageList(String sqlId, Map map) throws Exception {
		List list = enManageDao.getEnFileManageList(sqlId,map);
		return list;
	}

	
	public List getEnScoreSumList(String sqlId, Map map) throws Exception {
		List list=enManageDao.getEnScoreSumList(sqlId,map);
		return list;
	}

	
	public EnInfo getEnDetail(String sqlId, Map map) throws Exception {
		EnInfo enInfo=enManageDao.getEnDetail(sqlId,map);
		return enInfo;
	}


	
}

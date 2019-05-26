package com.wr4.service.impl;

import java.util.List;
import java.util.Map;

import com.wr4.dao.IPnManagerDao;
import com.wr4.domain.PnInfo;
import com.wr4.service.IPnManagerService;

public class PnManagerServiceImpl implements IPnManagerService {
	
	private IPnManagerDao iPnManagerDao;
	public IPnManagerDao getiPnManagerDao() {
		return iPnManagerDao;
	}
	public void setiPnManagerDao(IPnManagerDao iPnManagerDao) {
		this.iPnManagerDao = iPnManagerDao;
	}
	
	public List<PnInfo> selectePnList(String sqlId, PnInfo pnInfo, int start,
			int limit) throws Exception {
		return iPnManagerDao.selectPnList(sqlId, pnInfo, start, limit);
	}
	
	public PnInfo selecteOne(PnInfo pnInfo) throws Exception {
		return (PnInfo) iPnManagerDao.selectOne(pnInfo);
	}
	
	public List selecteSignOrg(String userid) {
		return iPnManagerDao.selecteSignOrg(userid);
	}
	
	public List selectAllInOrg(String sqlid, Map map, int offset,
			int limit) throws Exception {
		return iPnManagerDao.selectAllInOrg(sqlid,map,offset,limit);
	}
	
	public List selectePnListAll(String sqlId, PnInfo pnInfo) throws Exception {
		return iPnManagerDao.selectePnListAll(sqlId, pnInfo);
	}
	
	public List selectAllInOrgAll(String sqlId, Map map) throws Exception {
		return iPnManagerDao.selectAllInOrgAll(sqlId,map);
	}
	public List isPwd(String sqlId, Map map) throws Exception {
		// TODO Auto-generated method stub
		return iPnManagerDao.isPwd(sqlId,map);
	}
	public int resetPwd(String sqlId, Map map) throws Exception {
		// TODO Auto-generated method stub
		int i= iPnManagerDao.resetPwd(sqlId,map);
		if(i<1){
			throw new Exception();
		}
		return i;
	}
}

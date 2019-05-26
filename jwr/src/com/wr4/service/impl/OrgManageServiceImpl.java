package com.wr4.service.impl;

import java.util.List;
import java.util.Map;

import com.wr4.dao.EnDao;
import com.wr4.dao.OrgDao;
import com.wr4.dao.OrgManageDao;
import com.wr4.domain.CertInfo;
import com.wr4.domain.EnInfo;
import com.wr4.domain.Examine;
import com.wr4.domain.MotInfo;
import com.wr4.domain.OrgInfo;
import com.wr4.domain.OrgList;
import com.wr4.domain.OrgYearReport;
import com.wr4.domain.RecNotice;
import com.wr4.service.EnService;
import com.wr4.service.OrgManageService;
import com.wr4.service.OrgService;

public class OrgManageServiceImpl<T> implements OrgManageService<T> {
	private OrgManageDao<T> orgManageDao;

	
	public List getBookApplyList(String sqlId, Map map, int start,
			int limit) throws Exception {
		List list=orgManageDao.getBookApplyList(sqlId, map, start, limit);
		return list;
	}

	public OrgManageDao<T> getOrgManageDao() {
		return orgManageDao;
	}

	public void setOrgManageDao(OrgManageDao<T> orgManageDao){
		this.orgManageDao = orgManageDao;
	}

	
	public int orgReg(String sqlId, OrgInfo orgInfo) throws Exception{
		int result=orgManageDao.orgReg(sqlId,orgInfo);
		if(result<1){
			throw new Exception();
		}
		return result;
	}

	
	public void orgRegExm(String sqlId, Examine examine) throws Exception{
		int result=orgManageDao.orgRegExm(sqlId,examine);
		if(result<1){
			throw new Exception();
		}
	}

	
	public List getUpdateList(String sqlId, Map map) throws Exception{
		List list=orgManageDao.getUpdateList(sqlId,map);
		return list;
	}

	
	public void insertUpdateContent(String sqlId, Map map) throws Exception{
		orgManageDao.insertUpdateContent(sqlId,map);
	}

	
	public List getBookChange(String sqlId, Map map, int start, int limit)
			throws Exception {
		List list=orgManageDao.getBookChange(sqlId, map, start, limit);
		return list;
	}

	
	public List getBookYearReportList(String sqlId, Map map, int start,
			int limit) throws Exception {
		List list=orgManageDao.getBookYearReportList(sqlId, map, start, limit);
		return list;
	}

	
	public void saveYearReport(String sqlId, OrgYearReport orgYearReport)
			throws Exception {
		int result=orgManageDao.saveYearReport(sqlId,orgYearReport);
		if(result<1){
			throw new Exception();
		}
	}

	
	public List getBookApplyAllList(String sqlId, Map map) throws Exception {
		List list=orgManageDao.getBookApplyAllList(sqlId,map);
		return list;
	}

	
	public OrgInfo getOrgApplyId(String sqlId, OrgInfo orgInfo) throws Exception {
		OrgInfo org=orgManageDao.getOrgApplyId(sqlId,orgInfo);
		return org;
	}

	
	public MotInfo getMotByCode(String sqlId, Map map) throws Exception {
		MotInfo motInfo=orgManageDao.getMotByCode(sqlId,map);
		return motInfo;
	}

	
	public List getAllBookChange(String sqlId, Map map) throws Exception {
		return orgManageDao.getAllBookChange(sqlId,map);
	}

	
	public int updateReason(String sqlId, Map map) throws Exception {
		// TODO Auto-generated method stub
		int j;
		int i= orgManageDao.updateReason(sqlId,map);
		if(i<1){
			throw new Exception();
		}else{
			j=orgManageDao.updateReason("com.wr4.domain.OrgOrgInfo.updateOrgcert",map);
		}
		
		
		return j;
	}

	
	public List getBookChange(String sqlId, Map map) throws Exception {
		// TODO Auto-generated method stub
		return orgManageDao.getBookChange(sqlId, map);
	}
	
	

}

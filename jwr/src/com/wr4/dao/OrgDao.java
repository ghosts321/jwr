package com.wr4.dao;

import java.util.List;
import java.util.Map;

import com.wr4.domain.CertInfo;
import com.wr4.domain.EnInfo;
import com.wr4.domain.OrgInfo;
import com.wr4.domain.OrgList;
import com.wr4.domain.OrgYearReport;
import com.wr4.domain.RecNotice;

public interface OrgDao<T> {
	public List<T> selectOrgBookList(String sqlId, OrgInfo orgInfo, int start, int limit) throws Exception;
	
	public List<T> selectOrgList(String sqlId, OrgList orgList, int start, int limit) throws Exception;
	
	public OrgInfo scanDetail(Map map) throws Exception;
	
	public OrgInfo applyDetail(Map map) throws Exception;
	
	public String queryNoNum(String sqlId,Map map) throws Exception;
	
	public int insertCertNo(String sqlId,Map map) throws Exception;
	
	public int insertExamin(String sqlId,Map map) throws Exception;
	
	public int updateApplyCertNo(String sqlId,Map map) throws Exception;
	
	public OrgInfo getOrgInfo(String sqlId,Map map) throws Exception;
	
	public Integer saveRecNotice(String sqlId,RecNotice recNotice) throws Exception;
	
	public Integer updateAdvice(String sqlId,CertInfo certInfo) throws Exception;
	
	public List<T> selectOrgList(String sqlId, OrgInfo orgInfo) throws Exception;
	
	public List<T> getYearReport(String sqlId,OrgYearReport orgYearReport,int start,int limit) throws Exception;
	
	public List getOrgByCon(String sql, Map map, int start, int limit) throws Exception;

	public List getOrgByConAll(String sqlId, Map map) throws Exception;
	
	public List<T> selectOrgList(String sqlId, OrgList orgList) throws Exception;
	
	public List getMotYearReportList(String sql, Map map, int start, int limit) throws Exception;
	
	public List getMotYearReportAllList (String sqlId, Map map) throws Exception;
	
	public int updateApply(String sqlId,CertInfo certInfo) throws Exception;
	
	public int insertExamine(String sqlId,Map map) throws Exception;
	
	public List getWorkProList(String sql, Map map, int start, int limit)throws Exception;
	
	public List getWorkProAllList(String sqlId,Map map)throws Exception;
	
	
	public Object updateEmployPn(String sqlId,Map map) throws Exception;
	
	public String selecteBusName(String sqlId,Map map)throws Exception;
	
}

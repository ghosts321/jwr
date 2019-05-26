package com.wr4.dao;

import java.util.List;
import java.util.Map;

import com.wr4.domain.CertInfo;
import com.wr4.domain.EnInfo;
import com.wr4.domain.Examine;
import com.wr4.domain.MotInfo;
import com.wr4.domain.OrgInfo;
import com.wr4.domain.OrgList;
import com.wr4.domain.OrgYearReport;
import com.wr4.domain.RecNotice;

public interface OrgManageDao<T> {
	
	public List<T> getBookApplyList(String sqlId,Map map, int start, int limit) throws Exception;
	
	public int orgReg(String sqlId,OrgInfo orgInfo) throws Exception;
	
	public int orgRegExm(String sqlId,Examine examine) throws Exception;
	
	public List getUpdateList(String sqlId,Map map) throws Exception;
	
	public int insertUpdateContent(String sqlId,Map map) throws Exception;
	
	public List getBookChange(String sqlId,Map map, int start, int limit) throws Exception;
	
	public List getBookYearReportList(String sqlId,Map map, int start, int limit) throws Exception;
	
	public int saveYearReport(String sqlId,OrgYearReport orgYearReport) throws Exception;
	
	public List getBookApplyAllList(String sqlId,Map map) throws Exception;
	
	public OrgInfo getOrgApplyId(String sqlId,OrgInfo orgInfo) throws Exception;
	
	public MotInfo getMotByCode(String sqlId,Map map) throws Exception;
	
	public List getAllBookChange(String sqlId,Map map)throws Exception;
	
	public int updateReason(String sqlId,Map map)throws Exception;
	
	public List getBookChange(String sqlId,Map map)throws Exception;
}

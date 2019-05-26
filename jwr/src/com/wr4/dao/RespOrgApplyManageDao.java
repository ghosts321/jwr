package com.wr4.dao;

import java.util.List;
import java.util.Map;

import com.wr4.domain.CertInfo;
import com.wr4.domain.EnInfo;
import com.wr4.domain.ExchangeInfo;
import com.wr4.domain.OrgInfo;
import com.wr4.domain.OrgList;
import com.wr4.domain.OrgYearReport;
import com.wr4.domain.RecNotice;
import com.wr4.domain.RespOrgApplyDetail;

public interface RespOrgApplyManageDao<T> {
	
	public List getOrgApplyList(String sqlId,Map map) throws Exception;
	
	public List getOrgApplyAllList(String sqlId,Map map,int start,int limit) throws Exception;
	
	public RespOrgApplyDetail scanOrgDetail(String sqlId,Map map) throws Exception;
	
	public int delOrgApply(String sqlId,Map map) throws Exception;
	
	public List getOrgExchangeList(String sqlId,Map map,int start,int limit) throws Exception;
	
	public List getOrgExchangeAllList(String sqlId,Map map) throws Exception;
	
	public ExchangeInfo selectExchangeById(String sqlId,Map map)throws Exception;
	
	public int updateAdviceById(String sqlId,Map map) throws Exception;
	
	public List getCertChangeList(String sqlId,Map map,int start,int limit) throws Exception;
	
	public List getCertChangeList(String sqlId,Map map) throws Exception;
	
	public RespOrgApplyDetail RespOrgApplyDetail(String sqlId,Map map) throws Exception;
	
	public int delCertChangeById(String sqlId,Map map) throws Exception;
	
	public int updateRegAndApply(String sqlId,Map map)throws Exception;
	
	public int delApply(String sqlId,Map map)throws Exception;
	
	public int delCert(String sqlId,Map map)throws Exception;
}

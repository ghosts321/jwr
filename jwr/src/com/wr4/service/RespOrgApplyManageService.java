package com.wr4.service;

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

public interface RespOrgApplyManageService<T> {
	
	public List getOrgApplyList(String sqlId,Map map) throws Exception;
	
	public List getOrgApplyAllList(String sqlId,Map map,int offset,int limit) throws Exception;
	
	public RespOrgApplyDetail scanOrgDetail(String sqlId,Map map) throws Exception;
	
	public int delOrgApply(String sqlId,Map map	) throws Exception;
	
	public List getOrgExchangeList(String sqlId,Map map,int offset,int limit) throws Exception;
	
	public List getOrgExchangeAllList(String sqlId,Map map) throws Exception;
	
	public ExchangeInfo selectExchangeById(String sqlId,Map map) throws Exception;
	
	public int updateAdviceById(String sqlId,Map map,Map map1)throws Exception;
	
	public List getCertChangeList(String sqlId,Map map,int offset,int limit) throws Exception;
	
	public List getCertChangeList(String sqlId,Map map) throws Exception;
	
	public RespOrgApplyDetail scanCertChangeDetail(String sqlId,Map map) throws Exception;
	
	public int delCertChangeById(String sqlId,Map map) throws Exception;
	
	public Boolean updateRegAndApply(String sqlId,Map map)throws Exception;
	
	public int delCertChangeById(Map map) throws Exception;
}

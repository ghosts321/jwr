package com.wr4.dao;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.wr4.domain.CheckOrg;
import com.wr4.domain.EnInfo;
import com.wr4.domain.EnPFInfo;
import com.wr4.domain.FieldValueInfo;
import com.wr4.domain.ProblemRec;
import com.wr4.domain.RecNotice;
import com.wr4.domain.YearReport;

public interface EnManageDao<T> {
	
	public List getEnProduceList(String sqlId,Map map) throws Exception;
	
	public void updateApplyCertNo(String sqlId,Map map) throws Exception;
	
	public List getEnFileManageList(String sqlId,Map map) throws Exception;
	
	public List getEnScoreSumList(String sqlId,Map map) throws Exception;
	
	public EnInfo getEnDetail(String sqlId,Map map) throws Exception;
}

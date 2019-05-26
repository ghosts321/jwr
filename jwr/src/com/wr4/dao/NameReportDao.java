package com.wr4.dao;

import java.util.List;
import java.util.Map;

import com.wr4.domain.ExchangeInfo;
import com.wr4.domain.IndexInfo;
import com.wr4.domain.NameReport;

public interface NameReportDao<T> {
	public int NReportAdd(String sqlId,NameReport nameReport)throws Exception;
	public List<T> selectNReport(String seqId,NameReport nameReport)throws Exception;
	public NameReport getNReportData(String sqlId,String id)throws Exception;
	public List getNameReportList(String sqlId, Map map, int start, int limit) throws Exception;
	public List getNameReportList(String sqlId, Map map) throws Exception;
	
	public NameReport selectNameReportById(String sqlId,Map map)throws Exception;
	
	public int updateNameReportById(String sqlId,Map map) throws Exception;
}

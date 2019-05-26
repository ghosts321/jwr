package com.wr4.service.impl;

import java.util.List;
import java.util.Map;

import com.wr4.dao.NameReportDao;
import com.wr4.domain.NameReport;
import com.wr4.service.NameReportService;

public class NameReportServiceImpl<T> implements NameReportService<T> {
	private NameReportDao<T> nameReportDao;

	public void setNameReportDao(NameReportDao<T> nameReportDao) {
		this.nameReportDao = nameReportDao;
	}

	public NameReportDao<T> getNameReportDao() {
		return nameReportDao;
	}
	
	public int NReportAdd(String sqlId, NameReport nameReport) throws Exception {
		return nameReportDao.NReportAdd(sqlId, nameReport);
	}

	
	public List<T> selectNReport(String seqId, NameReport nameReport)
			throws Exception {
		
		List<T> list =  nameReportDao.selectNReport(seqId, nameReport);
		return list;
	}

	

	
	public NameReport getNReportData(String sqlId, String id) throws Exception {
		return nameReportDao.getNReportData(sqlId, id);
	}

	
	public List getNameReportList(String sqlId, Map map, int start, int limit)
			throws Exception {
		List list = nameReportDao.getNameReportList(sqlId, map, start, limit);
		return list;
	}
	public List getNameReportList(String sqlId, Map map)throws Exception {
		List list = nameReportDao.getNameReportList(sqlId, map);
		return list;
	}

	
	public NameReport selectNameReportById(String sqlId, Map map)
			throws Exception {
		NameReport nameReport = nameReportDao.selectNameReportById(sqlId, map);
		return nameReport;
	}

	
	public int updateNameReportById(String sqlId, Map map) throws Exception {
		int result = nameReportDao.updateNameReportById(sqlId, map);
		if(result<1){
			throw new Exception();
		}
		return result;
	}
	
	
}

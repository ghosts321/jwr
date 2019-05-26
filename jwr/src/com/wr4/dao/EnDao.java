package com.wr4.dao;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.wr4.domain.CheckOrg;
import com.wr4.domain.EnInfo;
import com.wr4.domain.EnPFInfo;
import com.wr4.domain.Examine;
import com.wr4.domain.FieldValueInfo;
import com.wr4.domain.ProblemRec;
import com.wr4.domain.RecNotice;
import com.wr4.domain.YearReport;

public interface EnDao<T> {
	public List<T> selectEnList(String sqlId, EnInfo enInfo, int start, int limit)throws Exception;
	public List selecteFileList(String sqlId, FieldValueInfo fileValue, int start, int limit)throws Exception;
	public List  selecteFileList(String sqlId, String fileType)throws Exception;
	public List<T> getYearReport(String sqlId, YearReport yearReport, int start, int limit)throws Exception;
	public  ProblemRec getEnInfo(String sqlId, ProblemRec problemRec)throws Exception;
	public  List<T> getCertInfo(String sqlId, ProblemRec problemRec)throws Exception;
	public  int saveRecNotice(String sqlId,RecNotice recNotice)throws Exception;
	public  EnInfo getEnDetail(String sqlId, EnInfo enDetail)throws Exception;
	public  List showOrgAdvice(String sqlId, Map map)throws Exception;
	public int saveOrg(String sqlId, CheckOrg org)throws Exception;
	public int savePingFen(String sqlId, EnPFInfo enPFInfo)throws IOException;
	public List getEnByCon(String sqlId, Map map,int offset,int limit)throws Exception;
	public int getApplyNum(String sqlId,EnInfo enInfo)throws Exception;
	public int insertEnApply(String sqlId, EnInfo enInfo)throws Exception;
	public int updateEnApply(String sqlId, EnInfo enInfo)throws Exception;
	
	public List getEnApplyByCityAndType(String sqlId, Map map)throws Exception;
	/**
	 * 查询详细信息
	 * 
	 */
	public EnPFInfo  selecteEnPfDetail(String sqlId, String pid)throws Exception;
	public List getEnByConAll(String slqId, Map map)throws Exception;
	public List<T> getRecListInfos(String sqlId,RecNotice recNotice)throws Exception;
	public int saveRecReport(String sqlId,RecNotice recNotice)throws Exception;
	public int delEnApplyInfo(String sqlId, int id)throws Exception;
	public int checkOrg(String sqlId,EnInfo enInfo)throws Exception;
	
	public Object selectByone(String sqlId,Object object)throws Exception;
	public List getPnByConAll(String slqId, Map map)throws Exception;
	public List getPnByCon(String sqlId, Map map,int offset,int limit)throws Exception;
	public List<T> getSchedule(String sqlId,Examine ex)throws Exception;
	public List<T> getCount(String sqlId,EnInfo enInfo)throws Exception;
	
	public Object  getOrgName(String sqlId,String sorg)throws Exception;
	public List  selecteEnList(String sqlId, Object object)throws Exception;
	/**
	 * 插入附加考评流程
	 * @param sqlId
	 * @param object
	 * @return
	 * @throws Exception
	 */
	public int  insertAddedExamine(String sqlId, Object object)throws Exception;
	
	public boolean submitAuditChangeCert(String sqlId,Object object)throws Exception;
	public String queryNoNum(String sqlId,Map map)throws Exception;
	
	
	public boolean updateKhyd(String sqlId,Map map) throws Exception;
	public boolean updateKpxz(String sqlId,Map map) throws Exception;
	public boolean addKhyd(String sqlId,Map map) throws Exception;
	public boolean addKpxz(String sqlId,Map map) throws Exception;
	public boolean deleteKhyd(String sqlId,Map map) throws Exception;
	public boolean deleteKpxz(String sqlId,Map map) throws Exception;
}

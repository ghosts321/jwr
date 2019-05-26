package com.wr4.dao.impl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.wr4.dao.EnDao;
import com.wr4.domain.CheckOrg;
import com.wr4.domain.EnInfo;
import com.wr4.domain.EnPFInfo;
import com.wr4.domain.Examine;
import com.wr4.domain.FieldValueInfo;
import com.wr4.domain.ProblemRec;
import com.wr4.domain.RecNotice;
import com.wr4.domain.YearReport;

public class EnDaoImpl<T> implements EnDao<T> {
	private SqlSessionTemplate sqlSessionTemplate;
	
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public List<T> selectEnList(String sqlId, EnInfo enInfo, int start,
			int limit) throws Exception{
		List<T> list  = sqlSessionTemplate.selectList(sqlId, enInfo);
		return list;
	} 
	public List  selecteEnList(String sqlId, Object object) throws Exception{
		List list  = sqlSessionTemplate.selectList(sqlId, object);
		return list;
	}
	/**
	 * 插入附加考评流程
	 * @param sqlId
	 * @param object
	 * @return
	 * @throws Exception
	 */
	public int  insertAddedExamine(String sqlId, Object object)throws Exception{
		 return sqlSessionTemplate.insert(sqlId, object);
	}
	public List  selecteFileList(String sqlId, FieldValueInfo fileValue, int start, int limit)throws Exception{
		List<T> list  = sqlSessionTemplate.selectList(sqlId, fileValue, new RowBounds(start, limit));
		return list;
	}
	public List  selecteFileList(String sqlId, String fileType)throws Exception{
		
		return sqlSessionTemplate.selectList(sqlId,fileType);
	}

	public List<T> getYearReport(String sqlId, YearReport yearReport, int start,
			int limit)throws Exception {
//		List<T> list  = sqlSessionTemplate.selectList(sqlId, yearReport, new RowBounds(start, limit));
		List<T> list  = sqlSessionTemplate.selectList(sqlId, yearReport);
		return list;
	}

	public ProblemRec getEnInfo(String sqlId, ProblemRec problemRec) throws Exception{
		ProblemRec problem = (ProblemRec)sqlSessionTemplate.selectOne(sqlId, problemRec);
		return problem;
	}

	public List<T> getCertInfo(String sqlId, ProblemRec problemRec) throws Exception{
		List<T> list  = sqlSessionTemplate.selectList(sqlId, problemRec);
		return list;
	}

	
	public int saveRecNotice(String sqlId, RecNotice recNotice) throws Exception{
		return this.sqlSessionTemplate.insert(sqlId, recNotice);
	}

	public EnInfo getEnDetail(String sqlId, EnInfo enDetail) throws Exception{
		EnInfo enInfo = (EnInfo)sqlSessionTemplate.selectOne(sqlId, enDetail);
		return enInfo;
	}
	public List showOrgAdvice(String sqlId, Map map) throws Exception{
		List list = sqlSessionTemplate.selectList(sqlId, map);
		return list;
	}

	public int saveOrg(String sqlId, CheckOrg org) throws Exception{
		int i = sqlSessionTemplate.update(sqlId, org);
		return i;
	}
	
	public int savePingFen(String sqlId, EnPFInfo enPFInfo)throws IOException{
		
		int i = sqlSessionTemplate.update(sqlId, enPFInfo);
		return i;
	}
	
	public List getEnByCon(String sqlId, Map map,int offset,int limit) throws Exception{
		return sqlSessionTemplate.selectList(sqlId, map);
	}

	public int getApplyNum(String sqlId, EnInfo enInfo)throws Exception {
		return sqlSessionTemplate.selectOne(sqlId, enInfo);
	}

	public int insertEnApply(String sqlId, EnInfo enInfo) throws Exception{
		return sqlSessionTemplate.insert(sqlId, enInfo);
	}

	/**
	 * 查询详细信息
	 * 
	 */
	public EnPFInfo  selecteEnPfDetail(String sqlId, String pid)throws Exception{
		return sqlSessionTemplate.selectOne(sqlId, pid);
	}
	
	public List getEnByConAll(String slqId, Map map) throws Exception{
		return sqlSessionTemplate.selectList(slqId, map);
	}

	
	public List<T> getRecListInfos(String sqlId, RecNotice recNotice)
			throws Exception {
		return sqlSessionTemplate.selectList(sqlId, recNotice);
	}

	
	public int saveRecReport(String sqlId, RecNotice recNotice)
			throws Exception {
		return sqlSessionTemplate.insert(sqlId, recNotice);
	}

	
	public int delEnApplyInfo(String sqlId, int id) throws Exception {
		return sqlSessionTemplate.update(sqlId, id);
	}

	
	public int checkOrg(String sqlId, EnInfo enInfo) throws Exception {
		return sqlSessionTemplate.update(sqlId, enInfo);
	}

	
	public List getPnByConAll(String slqId, Map map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList(slqId, map);
	}

	
	public List getPnByCon(String sqlId, Map map, int offset, int limit)
			throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList(sqlId, map);
	}

	
	public List<T> getSchedule(String sqlId, Examine ex) throws Exception {
		return sqlSessionTemplate.selectList(sqlId,ex);
	}

	
	public List<T> getCount(String sqlId, EnInfo enInfo) throws Exception {
		return sqlSessionTemplate.selectList(sqlId, enInfo);
	}
	public Object  getOrgName(String sqlId,String sorg)throws Exception{
		return sqlSessionTemplate.selectList(sqlId, sorg);
	}
	
	public Object selectByone(String sqlId,Object object)throws Exception{
		return sqlSessionTemplate.selectList(sqlId, object);
	}
	public boolean submitAuditChangeCert(String sqlId,Object object)throws Exception{
		int i= sqlSessionTemplate.update(sqlId,object);
		boolean bol=false;
		if(i>0){
			bol=true;
		}
		return bol;
	}

	
	public String queryNoNum(String sqlId, Map map) throws Exception {
		String num=sqlSessionTemplate.selectOne(sqlId, map);
		return num;
	}

	public int updateEnApply(String sqlId, EnInfo enInfo) throws Exception{
		return sqlSessionTemplate.update(sqlId, enInfo);
	}

	@Override
	public List getEnApplyByCityAndType(String sqlId, Map map)
			throws Exception {
		return sqlSessionTemplate.selectList(sqlId, map);
	}
	
	@Override
	public boolean updateKhyd(String sqlId, Map map) throws Exception {
		int i= sqlSessionTemplate.update(sqlId,map);
		boolean bol=false;
		if(i>0){
			bol=true;
		}
		return bol;
	}
	@Override
	public boolean updateKpxz(String sqlId, Map map) throws Exception {
		int i= sqlSessionTemplate.update(sqlId,map);
		boolean bol=false;
		if(i>0){
			bol=true;
		}
		return bol;
	}
	
	@Override
	public boolean addKhyd(String sqlId, Map map) throws Exception {
		int i=sqlSessionTemplate.insert(sqlId, map);
		boolean bol=false;
		if(i>0){
			bol=true;
		}
		return bol;
	}
	@Override
	public boolean addKpxz(String sqlId, Map map) throws Exception {
		int i=sqlSessionTemplate.insert(sqlId, map);
		boolean bol=false;
		if(i>0){
			bol=true;
		}
		return bol;
	}
	@Override
	public boolean deleteKhyd(String sqlId, Map map) throws Exception {
		int i=sqlSessionTemplate.delete(sqlId, map);
		boolean bol=false;
		if(i>0){
			bol=true;
		}
		return bol;
	}
	@Override
	public boolean deleteKpxz(String sqlId, Map map) throws Exception {
		int i=sqlSessionTemplate.delete(sqlId, map);
		boolean bol=false;
		if(i>0){
			bol=true;
		}
		return bol;
	}
}

package com.wr4.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.wr4.dao.IPnPageDao;
import com.wr4.domain.Examine;
import com.wr4.domain.PnApply;
import com.wr4.domain.PnRegInfo;

public class PnPageDaoImpl implements IPnPageDao {
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}


	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}


	public int insertPnApply(String sqlId, PnApply pnApply) throws Exception {
		return sqlSessionTemplate.insert(sqlId, pnApply);
	}


	
	public String selectByUserId(Map map) throws Exception {
		return sqlSessionTemplate.selectOne("com.wr4.domain.PnTrain.selectByUserId", map);
	}


	
	public int insertExam(String sqlId, Examine examine) throws Exception {
		return sqlSessionTemplate.insert(sqlId, examine);
	}


	
	public int updateExam(String sqlId, Examine examine) throws Exception {
		return sqlSessionTemplate.update(sqlId, examine);
	}


	
	public int updateOrgApply(String sqlId, Map map) throws Exception {
		return sqlSessionTemplate.update(sqlId, map);
	}


	
	public PnRegInfo query(String sqlId, String userid) {
		return sqlSessionTemplate.selectOne(sqlId, userid);
	}
	public Object selectCountCert(String sqlId,String userpid)throws Exception{
		return sqlSessionTemplate.selectOne(sqlId, userpid);
	}
	/**
	 * 用于所有action中查询总数
	 */
	public Object getCount(String sqlId,Object object)throws Exception{
		return sqlSessionTemplate.selectOne(sqlId, object);
	}
	public List selectList(String sqlId,Object object)throws Exception{
		return  sqlSessionTemplate.selectList(sqlId,object);
	}
}

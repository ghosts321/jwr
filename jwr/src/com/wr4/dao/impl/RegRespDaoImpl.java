package com.wr4.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.wr4.dao.IRegRespDao;
import com.wr4.domain.EnRegInfo;
import com.wr4.domain.MotRegInfo;

public class RegRespDaoImpl implements IRegRespDao {
	private SqlSessionTemplate sqlSessionTemplate;

	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}
    
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public List queryMotReg(String sqlId, MotRegInfo motRegInfo, int start, int limit) throws Exception {
		return sqlSessionTemplate.selectList(sqlId,motRegInfo);
	}
	public List queryMotReg(String sqlId, MotRegInfo motRegInfo) throws Exception {
		return sqlSessionTemplate.selectList(sqlId,motRegInfo);
	}
	public List queryEnReg(String sqlId, EnRegInfo enRegInfo, int start, int limit)
			throws Exception {
		
		return sqlSessionTemplate.selectList(sqlId,enRegInfo);
	}
	public List queryEnReg(String sqlId, EnRegInfo enRegInfo)
			throws Exception {
		
		return sqlSessionTemplate.selectList(sqlId,enRegInfo);
	}
	public List queryRegList(String sqlId, Object object, int start, int limit) throws Exception{
		return sqlSessionTemplate.selectList(sqlId,object);
	}
	public List queryRegList(String sqlId, Object object) throws Exception{
		return sqlSessionTemplate.selectList(sqlId,object);
	}
	
	public Object queryMotRegDetail(String sqlId,String pid) throws Exception{
		
		return sqlSessionTemplate.selectOne(sqlId, pid);
	}
	public int regRespUpdate(String sqlId,Object object) throws Exception{
		return sqlSessionTemplate.update(sqlId,object);
	}
	
	public int regRespDelete(String sqlId, Object object) throws Exception{
		return sqlSessionTemplate.delete(sqlId,object);
	}

	
	public List selectCommon(String sqlId, Map map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList(sqlId, map);
	}

	public Map<String,String> queryRespSum(String sqlId,Map map) throws Exception {
		Map<String,String> map2 = sqlSessionTemplate.selectMap(sqlId, map,"motcode");
		return map2;
	}

	@Override
	public Map<String, String> queryRegRespSum(String sqlId, Map map)
			throws Exception {
		Map<String,String> map2 = sqlSessionTemplate.selectMap(sqlId, map,"motcode");
		return map2;
	}

}

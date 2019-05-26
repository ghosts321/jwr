package com.wr4.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.wr4.dao.IMotDao;
import com.wr4.domain.IndexInfo;
import com.wr4.domain.MotInfo;
import com.wr4.domain.User;

public class MotDaoImpl<T> implements IMotDao<T> {
	private SqlSessionTemplate sqlSessionTemplate;

	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}
    
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	
	public List<T> selectMot(String sqlId, MotInfo motInfo, int start, int limit)throws Exception {
		List  list=null;
		//if(start!=0&&limit!=0){
			//list= sqlSessionTemplate.selectList(sqlId, motInfo);
		//}else{
			list= sqlSessionTemplate.selectList(sqlId, motInfo);
		//}
		
		return list;
	}
	public List<T> selectMot(String sqlId, String motInfo, int start, int limit) throws Exception{
		List<T> list  = sqlSessionTemplate.selectList(sqlId, motInfo, new RowBounds(start, limit));
		return list;
	}
	public List<T> selectMot(String sqlId, MotInfo motInfo) throws Exception{
		List<T> list  = sqlSessionTemplate.selectList(sqlId, motInfo);
		return list;
	}
	public User  selectMot(String sqlId, String id )throws Exception{
		return sqlSessionTemplate.selectOne(sqlId, id);
	}
	
	public MotInfo selectMotOne(String sqlId, MotInfo motInfo)throws Exception {
		MotInfo m = sqlSessionTemplate.selectOne(sqlId, motInfo);
		return m;
	}
	
	public int selectCount(String sqlId, MotInfo motInfo)throws Exception{
		return sqlSessionTemplate.selectOne(sqlId, motInfo);
	}
	
	public int motAdd(String sqlId, MotInfo motInfo)throws Exception{
		return  sqlSessionTemplate.insert(sqlId, motInfo);
	}
	public int motUpdate(String sqlId, MotInfo motInfo)throws Exception{
		return sqlSessionTemplate.update(sqlId, motInfo);
	}
	
	public int indexMotInsert(String sqlId, IndexInfo indexInfo)throws Exception{
		return sqlSessionTemplate.update(sqlId, indexInfo);
	}
	
	public List getIndexList(String sqlId)throws Exception{
		return sqlSessionTemplate.selectList(sqlId);
	}
	public IndexInfo getIndexData(String sqlId,String id)throws Exception{
		return sqlSessionTemplate.selectOne(sqlId,id);
	}
	public int updateIndexData(String sqlId,IndexInfo indexInfo)throws Exception{
		return sqlSessionTemplate.update(sqlId,indexInfo);
	}
	public List getIndexListFromType(String sqlId,String type)throws Exception{
		return sqlSessionTemplate.selectList(sqlId,type);	
	}

	
	public IndexInfo getIndexInfoById(String sqlId, Map map) throws Exception {
		IndexInfo indexInfo =sqlSessionTemplate.selectOne(sqlId, map);
		return indexInfo;
	}

	
	public int updateIndexInfoById(String sqlId, Map map) throws Exception {
		int result = this.sqlSessionTemplate.update(sqlId, map);
		return result;
	}
	public int updateObject(String sqlId,Object object)throws Exception{
		return sqlSessionTemplate.update(sqlId, object);
	}
	
	/**
	 * 获取字段 对应中文
	 * @param sqlId
	 * @param object
	 * @return
	 * @throws Exception
	 */
	public List fileText(String sqlId,Object object)throws Exception{
		return sqlSessionTemplate.selectList(sqlId, object);
	}

	public int resetPwd(String sqlId, Map map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update(sqlId, map);
	}
}

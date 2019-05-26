package com.wr4.dao.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.wr4.dao.TaskAssignationDao;
import com.wr4.domain.MotInfo;
import com.wr4.domain.ValueTextBustype;

public class TaskAssignationDaoImpl<T> implements TaskAssignationDao<T> {

	private SqlSessionTemplate sqlSessionTemplate;

	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public List<ValueTextBustype> getValueText(String sqlId, Map map) throws Exception {
		List<ValueTextBustype> list=sqlSessionTemplate.selectList(sqlId, map);
		return list;
	}

	@Override
	public void saveTaskAssingation(String sqlId, Map map) throws Exception {
		sqlSessionTemplate.insert(sqlId,map);
	}

	@Override
	public void updateTaskAssingation(String sqlId, Map map) throws Exception {
		sqlSessionTemplate.update(sqlId,map);
		
	}

	@Override
	public List<ValueTextBustype> queryTaskAssingation(String sqlId, Map map)
			throws Exception {
		List<ValueTextBustype> list=sqlSessionTemplate.selectList(sqlId, map);
		return list;
	}

	@Override
	public List<MotInfo> getMotByType(String sqlId, Map map) throws Exception {
		List<MotInfo> list = sqlSessionTemplate.selectList(sqlId, map);
		return list;
	}
	
	@Override
	public List queryTaskInfo(String sqlId, Map map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList(sqlId, map);
	}

	@Override
	public List getFileIdByMotCode(String sqlId, Map map) throws Exception {
		return sqlSessionTemplate.selectList(sqlId, map);
	}
}

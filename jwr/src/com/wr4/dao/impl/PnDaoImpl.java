package com.wr4.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.wr4.dao.IPnDao;
import com.wr4.domain.PnTrain;

public class PnDaoImpl<T> implements IPnDao<T> {
	private SqlSessionTemplate sqlSessionTemplate;

	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	// 查询考评员培训考试记录
	
	public List<T> selectPnTrain(String sqlId, Map map, int start, int limit) {
		List<T> list  = sqlSessionTemplate.selectList(sqlId, map);
		return list;
	}
	
	public static void main(String[] args) {
		
	}

}

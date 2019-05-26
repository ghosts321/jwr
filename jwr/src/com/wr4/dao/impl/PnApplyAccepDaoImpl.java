package com.wr4.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.wr4.dao.IPnApplyAccepDao;

public class PnApplyAccepDaoImpl implements IPnApplyAccepDao {
	private SqlSessionTemplate sqlSessionTemplate;
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	
	public List pnApplyAccept(String sqlId,Map map) throws Exception {
		return sqlSessionTemplate.selectList(sqlId, map);
	}
	public List pnApplyAccept(String sqlId,Map map,int offset,int limit) throws Exception {
		return sqlSessionTemplate.selectList(sqlId,map);
	}
	
	public List applyAcceptGetTrain(String string, Map map) throws Exception {
		return sqlSessionTemplate.selectList(string, map);
	}

}

package com.wr4.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.wr4.dao.TaskCheckLoginIntervalDao;
import com.wr4.domain.User;
import com.wr4.domain.UserLog;

public class TaskCheckLoginIntervalDaoImpl implements TaskCheckLoginIntervalDao {

	private SqlSessionTemplate sqlSessionTemplate;

	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public List<User> getWarnUserList(String sqlId,int num) throws Exception {
		return sqlSessionTemplate.selectList(sqlId, num);
	}
	 

}

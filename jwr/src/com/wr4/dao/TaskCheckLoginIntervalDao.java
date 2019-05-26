package com.wr4.dao;

import java.util.List;

import com.wr4.domain.User;
import com.wr4.domain.UserLog;

public interface TaskCheckLoginIntervalDao {

	public List<User> getWarnUserList(String sqlId,int num) throws Exception;
	
}

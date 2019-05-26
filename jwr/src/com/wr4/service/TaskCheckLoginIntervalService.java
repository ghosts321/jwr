package com.wr4.service;

import java.util.List;

import com.wr4.domain.User;
import com.wr4.domain.UserLog;

public interface TaskCheckLoginIntervalService {

	public List<User> getWarnUserList(String sqlId,int num) throws Exception;
	
	
}

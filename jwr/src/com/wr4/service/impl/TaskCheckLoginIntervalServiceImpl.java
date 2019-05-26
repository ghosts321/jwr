package com.wr4.service.impl;

import java.util.List;

import com.wr4.dao.TaskAssignationDao;
import com.wr4.dao.TaskCheckLoginIntervalDao;
import com.wr4.domain.User;
import com.wr4.domain.UserLog;
import com.wr4.service.TaskCheckLoginIntervalService;

public class TaskCheckLoginIntervalServiceImpl implements TaskCheckLoginIntervalService{

	
	private TaskCheckLoginIntervalDao taskCheckLoginIntervalDao;
	
	
	 public TaskCheckLoginIntervalDao getTaskCheckLoginIntervalDao() {
		return taskCheckLoginIntervalDao;
	}
	public void setTaskCheckLoginIntervalDao(TaskCheckLoginIntervalDao taskCheckLoginIntervalDao) {
		this.taskCheckLoginIntervalDao = taskCheckLoginIntervalDao;
	}
	public List<User> getWarnUserList(String sqlId, int num)
			throws Exception {
		List<User> list=taskCheckLoginIntervalDao.getWarnUserList(sqlId, num);
		return list;
	}
	
}

package com.wr4.service;

import java.util.List;
import java.util.Map;

public interface TaskAssignationService<T> {
	
	public String getValueText(String sqlId,Map map) throws Exception;
	
	public void saveTaskAssingation(String sqlId,Map map) throws Exception;
	
	public String getMotByType(String sqlId,Map map) throws Exception;
	
	public List queryTaskInfo(String sqlId,Map map) throws Exception;
	
	public String getFileIdByMotCode(String sqlId,Map map) throws Exception;
	
}

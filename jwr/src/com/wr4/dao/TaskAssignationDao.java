package com.wr4.dao;

import java.util.List;
import java.util.Map;

import com.wr4.domain.MotInfo;
import com.wr4.domain.ValueTextBustype;

public interface TaskAssignationDao<T> {

	public List<ValueTextBustype> getValueText(String sqlId,Map map) throws Exception;
	
	public List<ValueTextBustype> queryTaskAssingation(String sqlId,Map map) throws Exception;
	
	public void saveTaskAssingation(String sqlId,Map map) throws Exception;
	
	public void updateTaskAssingation(String sqlId,Map map) throws Exception;
	
	public List<MotInfo> getMotByType(String sqlId,Map map) throws Exception;
	
	public List queryTaskInfo(String sqlId,Map map)throws Exception;
	
	public List getFileIdByMotCode(String sqlId,Map map)throws Exception;
}

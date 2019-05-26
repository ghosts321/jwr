package com.wr4.service.impl;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import net.sf.json.JSONObject;

import com.wr4.dao.TaskAssignationDao;
import com.wr4.domain.MotInfo;
import com.wr4.domain.TaskAssignation;
import com.wr4.domain.ValueTextBustype;
import com.wr4.service.TaskAssignationService;

public class TaskAssignationServiceImpl<T> implements TaskAssignationService<T> {

	private TaskAssignationDao<T> taskAssignationDao;

	public TaskAssignationDao<T> getTaskAssignationDao() {
		return taskAssignationDao;
	}

	public void setTaskAssignationDao(TaskAssignationDao<T> taskAssignationDao) {
		this.taskAssignationDao = taskAssignationDao;
	}

	@Override
	public String getValueText(String sqlId, Map map) throws Exception {
		String json = "";
		List<ValueTextBustype> list = taskAssignationDao.getValueText(sqlId, map);
		List<ValueTextBustype> upperList = list;
		JSONObject jsb = new JSONObject();
		String jsbStr = "";
		for(int i=0;i<upperList.size();i++){
			if(upperList.get(i).getUpperid().equals("0")){
				jsb.put("text", upperList.get(i).getFiletext());
				jsb.put("code", upperList.get(i).getFileid());
				String str = "";
				for(ValueTextBustype value:list){
					JSONObject job = new JSONObject();
					if(value.getUpperid().equals(upperList.get(i).getFileid())){
						job.put("text", value.getFiletext());
						job.put("code", value.getFileid());
						str += job.toString() + ",";
						jsb.put("children", "["+str.substring(0,str.length()-1)+"]");
					}
				}
				jsbStr += jsb.toString() + ",";
			}
		}
		json = "[" + jsbStr.substring(0,jsbStr.length()-1) + "]";
		return json;
	}

	@Override
	public void saveTaskAssingation(String sqlId, Map map) throws Exception{
		List<ValueTextBustype> list = taskAssignationDao.queryTaskAssingation("com.wr4.domain.TaskAssignation.getOneValueText",map);
		if(list != null && list.size() > 0){
			taskAssignationDao.updateTaskAssingation("com.wr4.domain.TaskAssignation.updateTask_tbl",map);
			System.out.println("修改。。。。。");
		}else{
			taskAssignationDao.saveTaskAssingation(sqlId,map);
			System.out.println("保存。。。。。");
		}
	}

	@Override
	public String getMotByType(String sqlId, Map map) throws Exception {
		List<MotInfo> list = taskAssignationDao.getMotByType(sqlId,map);
		List<MotInfo> newList = new ArrayList<MotInfo>();
		String type = map.get("type")+"";
		String fileds="";
		if(list != null && list.size() > 0){
			for(int i=0;i<list.size();i++){
				fileds = list.get(i).getFileid();
				if(StringUtils.isNotBlank(fileds)){
					String[] str = fileds.split(",");
					for(int a=0;a<str.length;a++){
						if(type.equals(str[a])){
							newList.add(list.get(i));
						}
					}
				}
			}
			String str = newList.get(0).getMotcode()+","+newList.get(0).getMotname();
			return str;
		}else{
			return "";
		}
	}
	
	@Override
	public List queryTaskInfo(String sqlId, Map map) throws Exception {
		List list = taskAssignationDao.queryTaskInfo(sqlId,map);
		return list;
	}

	@Override
	public String getFileIdByMotCode(String sqlId, Map map) throws Exception {
		List list = taskAssignationDao.getFileIdByMotCode(sqlId,map);
		String fileidStr = "";
		if(list != null && list.size()>0){
			TaskAssignation taskAssignation= (TaskAssignation) list.get(0);
			String str = taskAssignation.getFileId();
			String strs[] = str.split(",");
			for(int i=0;i<strs.length;i++){
				fileidStr += "'"+strs[i]+"',";
			}
		}
		if(StringUtils.isNotBlank(fileidStr)){
			fileidStr = fileidStr.substring(0,fileidStr.length()-1);
		}
		return fileidStr;
	}
	
}

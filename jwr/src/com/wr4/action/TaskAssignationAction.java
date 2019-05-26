package com.wr4.action;

import java.util.HashMap;
import java.util.Map;

import com.wr4.domain.EnRegInfo;
import com.wr4.domain.ValueTextBustype;
import com.wr4.service.TaskAssignationService;

public class TaskAssignationAction extends BaseAction{

	private TaskAssignationService taskAssignationService;
	
	public TaskAssignationService getTaskAssignationService() {
		return taskAssignationService;
	}

	public void setTaskAssignationService(
			TaskAssignationService taskAssignationService) {
		this.taskAssignationService = taskAssignationService;
	}
	
	public void getValueText(){
		Map map=new HashMap();
		map.put("filetype1", "bustype");
		map.put("filetype2", "busclass");
		try {
			String json = taskAssignationService.getValueText("com.wr4.domain.TaskAssignation.getAllValueText",map);
			writer(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String saveTaskAssingation(){
		String city = request.getParameter("task_city");
		String mot = request.getParameter("mot");
		String fileids = request.getParameter("fileids");
		if(fileids.contains(",")){
			fileids = fileids.substring(0,fileids.length()-1);
		}
		Map map = new HashMap();
		map.put("city", city);
		map.put("mot", mot);
		map.put("fileids", fileids);
		try {
			taskAssignationService.saveTaskAssingation("com.wr4.domain.TaskAssignation.insertTask_tbl",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public void getMotByType(){
		String type = request.getParameter("type");
		String city = request.getParameter("city");
		String flag = request.getParameter("flag");
		Map map = new HashMap();
		map.put("type", type);
		map.put("areaCode", city);
		String sqlId = "";
		if("1".equals(flag)){
			sqlId = "com.wr4.domain.TaskAssignation.getTopMotByType";
		}else{
			sqlId = "com.wr4.domain.TaskAssignation.getMotByType";
		}
		try {
			String str = taskAssignationService.getMotByType(sqlId,map);
			writer(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void getFileIdByMotCode(){
		String motCode = request.getParameter("motCode");
		Map map = new HashMap();
		map.put("motCode", motCode);
		String str;
		try {
			str = taskAssignationService.getFileIdByMotCode("com.wr4.domain.TaskAssignation.getFileIdByMotCode",map);
			writer(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}

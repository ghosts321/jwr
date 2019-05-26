package com.wr4.task;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.wr4.action.BaseAction;
import com.wr4.dao.TaskCheckLoginIntervalDao;
import com.wr4.domain.User;
import com.wr4.domain.UserLog;
import com.wr4.service.TaskAssignationService;
import com.wr4.service.TaskCheckLoginIntervalService;
import com.wr4.util.email.SendMail;


/**
 * 检测用户登录间隔时间，超过n天不登录发送短信或者邮件提醒
 * @author user
 *
 */
public class CheckLoginIntervalTask extends BaseAction{
	
	 private TaskCheckLoginIntervalService taskCheckLoginIntervalService;
	

	 public TaskCheckLoginIntervalService getTaskCheckLoginIntervalService() {
			return taskCheckLoginIntervalService;
		}

	public void setTaskCheckLoginIntervalService(
			TaskCheckLoginIntervalService taskCheckLoginIntervalService) {
		this.taskCheckLoginIntervalService = taskCheckLoginIntervalService;
	}


	public void checkLoginInterval() 
	 {  
		
	    	logger.info("begin checkLoginIntervalTask");
	    	Pattern p =  Pattern.compile("^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$");
	    	
	    	try {
	    		List<User> list=taskCheckLoginIntervalService.getWarnUserList("com.wr4.domain.CheckLoginInterval.getWarnUserList", 10);
				if(list.size()>0){
					for(User user:list){
						 
						 Matcher m = p.matcher(user.getEmail());
						 if(m.matches()){ //证明邮箱格式正确
						      SendMail.send(user.getEmail(), "登录提醒", "你已经很久没有登录系统了，请及时登录");
							  logger.info("邮件已发送给"+user.getCommonname()+","+user.getEmail());
						 }else{
							  logger.info(user.getUser_id()+"邮箱格式不正确");
						 }
					}
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	 }  
	public static void main(String[] args) {
		Pattern p =  Pattern.compile("^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$");
		System.out.println(p.matcher("yangke@163.com").matches());
	}
	
}

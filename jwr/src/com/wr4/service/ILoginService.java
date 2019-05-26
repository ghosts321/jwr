package com.wr4.service;

import com.wr4.domain.User;

/**
 * 类说明：业务逻辑层接口
 * 
 * @author 作者: zhangli
 * @version 创建时间：2013年10月29日 15:11:27
 */
public interface ILoginService {

	// 添加用户
	public   User login(User user) throws Exception;
	//用户登录成功后添加日志
	public  Object insertLoginLog(User user)throws Exception;

}
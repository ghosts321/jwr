package com.wr4.dao;

import com.wr4.domain.User;

/**
 * 类说明：数据库业务接口层
 * 
 * @author 作者: zhangli
 * @version 创建时间：2013年10月29日 15:08:47
 */
public interface ILoginDao {

	public abstract User userLogin(User user)throws Exception;
	public  Object insertLoginLog(User user)throws Exception;

}
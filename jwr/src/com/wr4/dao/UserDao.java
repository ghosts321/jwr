package com.wr4.dao;

import java.util.List;

import com.wr4.domain.User;

/**
 * 类说明：数据库业务接口层
 * 
 * @author 作者: zhangli
 * @version 创建时间：2013年10月29日 15:08:47
 */
public interface UserDao {

	public abstract void insertUser(User user);

	public abstract void updateUser(User user);

	public abstract void deleteUser(Integer userId);

	public abstract User findUserByid(Integer userId);

	public abstract List<User> findAll();

	public abstract User userLogin(User user);

}
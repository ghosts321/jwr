package com.wr4.service;

import java.util.List;

import com.wr4.domain.User;

/**
 * 类说明：业务逻辑层接口
 * 
 * @author 作者: zhangli
 * @version 创建时间：2013年10月29日 15:11:27
 */
public interface UserService {

	// 添加用户
	public abstract void addUser(User user);

	public abstract void updateUser(User user);

	public abstract void deleteUser(Integer userId);

	public abstract User findUserById(Integer userId);

	public abstract List<User> findAllUser();

	public abstract User login(User user);

}
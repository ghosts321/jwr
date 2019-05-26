package com.wr4.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wr4.dao.UserDao;
import com.wr4.domain.User;
import com.wr4.service.UserService;

/**
 * 类说明：用户逻辑层Service实现
 * 
 * @author 作者: zhangli
 * @version 创建时间：2013年10月29日 15:11:54
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	// 添加用户
	public void addUser(User user) {
		userDao.insertUser(user);
	}

	// 更新用户
	public void updateUser(User user) {
		userDao.updateUser(user);
	}

	public void deleteUser(Integer userId) {
		userDao.deleteUser(userId);
	}

	public User findUserById(Integer userId) {
		return userDao.findUserByid(userId);
	}

	public List<User> findAllUser() {
		return userDao.findAll();
	}

	public User login(User user) {
		return userDao.userLogin(user);
	}
}

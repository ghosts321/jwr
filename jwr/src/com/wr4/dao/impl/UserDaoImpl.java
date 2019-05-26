package com.wr4.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wr4.dao.UserDao;
import com.wr4.domain.User;

/**
 * 类说明：用户dao实现
 * 
 * @author 作者: zhangli
 * @version 创建时间：2013年10月29日 15:10:04
 */
@Repository
public class UserDaoImpl implements UserDao {
	private final String INSERT_USER = "insertUser";
	private final String UPDATE_USER = "updateUser";
	private final String DELETE_USER = "deleteUser";
	private final String FIND_USER_BYID = "findUserById";
	private final String SELECT_ALL_USER = "selectAllUser";
	private final String USER_LOGIN = "userLogin";
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public User userLogin(User user) {
		return sqlSessionTemplate.selectOne(USER_LOGIN, user);
	}

	public void deleteUser(Integer userId) {
		// TODO Auto-generated method stub
		
	}

	public List<User> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public User findUserByid(Integer userId) {
		// TODO Auto-generated method stub
		return null;
	}

	public void insertUser(User user) {
		// TODO Auto-generated method stub
		
	}

	public void updateUser(User user) {
		// TODO Auto-generated method stub
		
	}
}

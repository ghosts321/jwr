package com.wr4.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.wr4.dao.ILoginDao;
import com.wr4.domain.User;

/**
 * 类说明：登录dao实现
 * 
 * @author 作者: zhangli
 * @version 创建时间：2013年10月29日 15:10:04
 */
@Repository
public class LoginDaoImpl implements ILoginDao {
	private final String INSERT_USER = "insertUser";
	private final String UPDATE_USER = "updateUser";
	private final String DELETE_USER = "deleteUser";
	private final String FIND_USER_BYID = "findUserById";
	private final String SELECT_ALL_USER = "selectAllUser";
	private final String USER_LOGIN = "userLogin";

	private SqlSessionTemplate sqlSessionTemplate;
	
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public User userLogin(User user)throws Exception {
		return sqlSessionTemplate.selectOne("com.wr4.domain.User.userLogin", user);
	}
	public  Object insertLoginLog(User user)throws Exception{
		String sql="com.wr4.domain.User.insertLoginLog";
		if(user.getRespuserid()!=null){
			sql="com.wr4.domain.User.insertRespLog";
		}
		return sqlSessionTemplate.insert(sql,user);
	}
}

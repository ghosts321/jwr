package com.wr4.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wr4.dao.ILoginDao;
import com.wr4.domain.User;
import com.wr4.service.ILoginService;

/**
 * 类说明：登录逻辑层Service实现
 * 
 * @author 作者: zhangli
 * @version 创建时间：2013年10月29日 15:11:54
 */
@Service
@Transactional
public class LoginServiceImpl implements ILoginService {
	private ILoginDao loginDao;
	
	public ILoginDao getLoginDao() {
		return loginDao;
	}

	public void setLoginDao(ILoginDao loginDao) {
		this.loginDao = loginDao;
	}


	public User login(User user)throws Exception {
		return loginDao.userLogin(user);
	}
	
	//用户登录成功后添加日志
	public  Object insertLoginLog(User user)throws Exception{
		
		int i= (Integer) loginDao.insertLoginLog(user);
		if(i<1){
			throw new Exception();
		}
		return i;
	}
}

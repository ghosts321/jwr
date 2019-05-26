package com.wr4.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.wr4.domain.User;
import com.wr4.service.UserService;

/**
 * 类说明：用户Action
 * 
 * @author 作者: zhangli
 * @version 创建时间：2013年10月29日 15:08:47
 */
@Controller
@Scope("prototype")
public class UserAction extends BaseAction {
	@Autowired
	private UserService userService;
	private User user;
	private List<User> userList;

	public String execute() throws Exception {
		return null;
	}

	public String login() {
		if (user != null) {
			User user2 = userService.login(user);
			if (user2 != null) {
				return SUCCESS;
			}
		}
		this.addFieldError("user.username", "用户名或密码错误!");
		return INPUT;
	}

	public String addUI() {
		return "addUser";
	}

	public String updateUI() {
		user = userService.findUserById(user.getId());
		return "updateUser";
	}

	public String add() {
		userService.addUser(user);
		return SUCCESS;
	}

	public String delete() {
		userService.deleteUser(user.getId());
		return SUCCESS;
	}

	public String update() {
		userService.updateUser(user);
		return SUCCESS;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String queryAllUser() {
		userList = userService.findAllUser();
		return "userList";
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

}

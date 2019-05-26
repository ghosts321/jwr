package com.wr4.action;

import org.springframework.beans.factory.annotation.Autowired;

import com.wr4.domain.MotInfo;
import com.wr4.domain.User;
import com.wr4.service.ILoginService;
import com.wr4.service.IMotService;
import com.wr4.util.CodeToCnUtil;

/**
 * 类说明：登录Action
 * 
 * @author 作者: zhangli
 * @version 创建时间：2013年10月29日 15:08:47
 */
public class LoginAction extends BaseAction {
	@Autowired
	private ILoginService loginService;
	private IMotService<MotInfo> motService;

	public IMotService<MotInfo> getMotService() {
		return motService;
	}

	public void setMotService(IMotService<MotInfo> motService) {
		this.motService = motService;
	}

	private User user;
	private MotInfo motInfo;

	public MotInfo getMotInfo() {
		return motInfo;
	}

	public void setMotInfo(MotInfo motInfo) {
		this.motInfo = motInfo;
	}

	public ILoginService getLoginService() {
		return loginService;
	}

	public User getUser() {
		return user;
	}

	public String login() {
		String s = SUCCESS;
		try {
			if(request.getSession()!=null){
				String usertype=request.getSession().getAttribute("usertype")==null?"":request.getSession().getAttribute("usertype").toString();
				if(!"".equals(usertype)&&!usertype.equals(user.getUsertype())){
					request.setAttribute("msg", "请将当前登录的用户退出系统后再登录！");
					s="error";
					return s;
				}
			}
			String md5Pass = md5(user.getUser_pass());
			user.setUser_pass(md5Pass);
			String userid =user.getUser_id().trim();
			user.setUser_id(userid);
			user.setRegresp(null);
			User user2 = loginService.login(user);
			if (user2 != null) {
				if(user2.getUsable()!=null&&"0".equals(user2.getUsable())){
					request.setAttribute("msg", "登录失败，用户已停用，请联系管理员！");
					s="error";
					return s;
				}
				
				request.getSession().setAttribute("username",
						user2.getCommonname());
				request.getSession().setAttribute("userid",
						user2.getUser_id());
				// usertype，判断用户进入系统后的角色
				request.getSession().setAttribute("usertype",
						user2.getUsertype());
				// paperid，用户所属组织主键
				request.getSession()
						.setAttribute("paperid", user2.getPaperid());
				// mot，用户主管机关代码
				request.getSession().setAttribute("mot", user2.getMot());
				//motCity 用户主管机关所在区域
				request.getSession().setAttribute("motCity", user2.getCity());
				//motname 主管机关名称
				request.getSession().setAttribute("motname", CodeToCnUtil.getMotCnVal(user2.getMot()));
				if (user.getMot() != "") {
					if(motInfo!=null){
						motInfo.setMotcode(user2.getMot());
					}else{
						motInfo = new MotInfo();
						motInfo.setMotcode(user2.getMot());
					}
				    String motName = motService.selectMotOne("com.wr4.domain.MotInfo.selectMot", motInfo).getMotname();
				    //将mot编号对应名称从mot表查处后放到session中
				    request.getSession().setAttribute("motname", motName);
				}
				//记录登录成功
				user2.setRemark("登录成功");
				loginService.insertLoginLog(user2);
			}else{
				request.setAttribute("msg", "登录失败，用户名或密码错误！");
				s="error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			request.setAttribute("msg", "登录失败，请检查用户名密码！");
			return "error";
		}
		return s;
	}

	public void setLoginService(ILoginService loginService) {
		this.loginService = loginService;
	}

	public void setUser(User user) {
		this.user = user;
	}
}

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="loginmain.jsp" %>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>天津市交通厅安全生产化平台</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
</style>
<script type="text/javascript">
   function onLogin(){
      var  password = document.getElementById("user.user_pass").value;
      if(password ==''){
          alert("密码不能为空");
          return false;
         }
      var usertype=<%=request.getParameter("usertype")%>;
      alert(usertype);
      $("#usertype").val(usertype);
    	window.location.href ="index.jsp";
	}
</script>


</head>
<body bgcolor="#FFFFFF" style="margin: 0; padding: 0">
	<div id="moc_login">
		<div class="moc_login_main">
			<div class="login_left_h2">
				<img src="/jwr/esp/img/jtb_r2_c3.jpg" />
			</div>
			<div class="login_left_con">
				<div class="login_left_pic">
					<img src="/jwr/esp/img/jtb_r4_c2.jpg" />
				</div>
				<div class="login_left_log">
					<div class="login_log_h3">
						<img src="/jwr/esp/img/jtb_r4_c.jpg" />
					</div>
					<div class="login_log_user">
						<div class="user_info" style="border: 1px dashed #ddf">
							<form ID="User" action="userlogin/loginAction.action" method="post" name="User">
						 <input class="ui-corner-all" id="usertype" name="user.usertype" style="width: 215px" value="" type="hidden" />
								<ul>
									<span>用户：</span>
									<input class="ui-corner-all" id="user.user_id"
										name="user.user_id" style="width: 215px" type="text" />
								</ul>
								<ul>
									<span>口令：</span>
									<input id="user.user_pass" maxlength="16" name="user.user_pass"
										size="16" style="width: 215px" type="password" />
								</ul>
							</form>
						</div>
						 
						<div class="user_sub">
							<ul>
								<img onclick="$('#User').submit()"
									src="/jwr/esp/img/login_enter.png" />
							</ul>
							<ul>
								<img onclick="$('#LoginForm').get(0).reset();"
                                     src="/jwr/esp/img/login_reset.png" />
							</ul>
						</div>
						<div class="user_link" >
							<hr />
							<br /> <a id="user_link" href="/jwr/JSP/motreg.jsp" target="_blank"
								title="请点击此处进行报名申请。">主管机关报名申请</a> <br />
								 <a id="user_link" href="javascript:void(0)" target="_blank"
								title="请点击此处进行报名申请。">链接到esp系统</a> <br />
						</div>
					</div>
				</div>
				<div class="login_right_pic">
					<img src="/jwr/img/jtb_r4_c5.jpg" />
				</div>
			</div>
			<div class="login_bottom_txt">系统使用支持：13301357860 和 13301357875
				&nbsp; &nbsp;</div>
		</div>
	</div>

</body>
</html>
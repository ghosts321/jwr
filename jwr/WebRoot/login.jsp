<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/loginmain.jsp" %>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>交通厅安全生产化平台</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
</style>
<script type="text/javascript">

<%String   msg=request.getAttribute("msg")==null?"":request.getAttribute("msg").toString();
if(msg.equals("yes")){
	%>
	 
	 <%
}else if(msg!=null&&!msg.equals("yes")&&!msg.equals("")){
	%>
		alert('<%=msg%>');
		window.location.href ="<%=basePath%>/index.html";
	<%
}else{%>
	 
<%
}
%>
var usertype=<%=request.getParameter("usertype")%>
	$(function(){
		$("#usertype").val(usertype);
		if(usertype=='mot'){
			$("#mot1").show();
		}else if(usertype=='en'){
			$("#en2").show();
			$("#ddd").show();
		}else if(usertype=='org'){
			$("#org3").show();
		}else if(usertype=='pn'){
			$("#pn4").show();
		}
	});
   function onLogin(){
      var  username = document.getElementById("user.user_id").value;
      var  password = document.getElementById("user.user_pass").value;
      if(username ==''){
          alert("用户名不能为空");
          return false;
         }
      if(password ==''){
          alert("密码不能为空");
          return false;
         }
      document.forms[0].submit();
	}

</script>


</head>
<body bgcolor="#FFFFFF" style="margin: 0; padding: 0">
	<div id="moc_login">
		<div class="moc_login_main">
			<div class="login_left_h2">
				<img src="/jwr/esp/login/jtb_r2_c3.png" />
			</div>
			<div class="login_left_con">
				<div class="login_left_pic">
					<img src="/jwr/esp/login/jtb_r4_c2.jpg" />
				</div>
				<div class="login_left_log">
					<div class="login_log_h3">
						<img src="/jwr/esp/login/jtb_r4_c.png" />
					</div>
					<div class="login_log_user">
						<div class="user_info" style="border: 1px dashed #ddf;padding: 10px;margin-left: 20px;">
							<form ID="User" action="<%=basePath %>/userlogin/loginAction.action" method="post" name="User">
						 <input class="ui-corner-all" id="usertype" name="user.usertype" style="width: 215px" value="" type="hidden" />
								<ul>
									<span>用户：</span>
									<input class="ui-corner-all" id="user.user_id"
										name="user.user_id" style="width: 215px" type="text" onkeydown="if(event.keyCode==13){onLogin()};"/>
								</ul>
								<ul>
									<span>口令：</span>
									<input id="user.user_pass" maxlength="16" name="user.user_pass"
										size="16" style="width: 215px" type="password" onkeydown="if(event.keyCode==13){onLogin()};"/>
								</ul>
							</form>
						</div>
						 
						<div class="user_sub">
							<ul>
								<!-- <img onclick="$('#User').submit()" -->
								<img onclick="onLogin();"
									src="/jwr/esp/login/login_enter.png" />
							</ul>
							<ul>
								<img onclick="$('#User').get(0).reset();"
                                     src="/jwr/esp/login/login_reset.png" />
							</ul>
						</div>
						<div class="user_link"  id="mot1" style="display: none">
							<br />
								<a id="user_link" href="/jwr/JSP/motreg.jsp" target="_blank"
									title="请点击此处进行报名申请。">主管机关报名申请</a> <br />
								<a id="user_link" href="/jwr/JSP/pn/regUpdata.jsp?type=mot" target="_blank"
									title="点击此处查询申请进度。">主管机关报名申请进度查询</a> <br />
						 		<a id="user_link" href="javascript:history.go(-1)" target="_parent"
								title="点击此处返回首页。">返回首页</a> <br />
						</div>
						<div class="user_link"  id="en2" style="display: none">
							<br />
								<a id="user_link" href="/jwr/JSP/enreg.jsp" target="_blank"
									title="请点击此处进行报名申请。">企业报名申请</a> <br />
								<a id="user_link" href="/jwr/JSP/pn/regUpdata.jsp?type=en" target="_blank"
									title="点击此处查询申请进度。">企业报名申请进度查询</a> <br />
						 		<a id="user_link" href="javascript:history.go(-1)" target="_parent"
								title="点击此处返回首页。">返回首页</a> <br />
						</div>
						<div class="user_link"  id="org3" style="display: none">
							<br />
								<a id="user_link" href="/jwr/JSP/orgreg.jsp" target="_blank"
									title="请点击此处进行报名申请。">考评机构报名申请</a> <br />
								<a id="user_link" href="/jwr/JSP/pn/regUpdata.jsp?type=org" target="_blank"
									title="点击此处查询申请进度。">考评机构报名申请进度查询</a> <br />
						 		<a id="user_link" href="javascript:history.go(-1)" target="_parent"
								title="点击此处返回首页。">返回首页</a> <br />
						</div>
						<div class="user_link"  id="pn4" style="display: none">
							<br />
								<a id="user_link" href="/jwr/JSP/pnreg.jsp" target="_blank"
									title="请点击此处进行报名申请。">考评员报名申请</a> <br />
								<a id="user_link" href="/jwr/JSP/pn/regUpdata.jsp?type=pn" target="_blank"
									title="点击此处查询申请进度。">考评员报名申请进度查询</a> <br />
						 		<a id="user_link" href="javascript:history.go(-1)" target="_parent"
								title="点击此处返回首页。">返回首页</a> <br />
						</div>
					</div>
				</div>
				<div class="login_right_pic">
					<img src="/jwr/esp/login/jtb_r4_c5.jpg" />
				</div>
			</div>
			<div class="login_bottom_txt">系统使用支持：010-62790052 &nbsp; &nbsp;</div>
			<div class="login_bottom_txt" id="ddd" style="display: none">特殊企业注册问题请联系：024-23871368 &nbsp; &nbsp;</div>
		</div>
	</div>

</body>
</html>
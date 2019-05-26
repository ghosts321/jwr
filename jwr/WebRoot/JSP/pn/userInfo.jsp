<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../main.jsp" %>
<%
	String username = (String)request.getSession().getAttribute("username");
String userid = (String)request.getSession().getAttribute("userid");
	String paperid = (String)request.getSession().getAttribute("paperid");
	String motName = (String)request.getSession().getAttribute("motname");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'pnApply.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link type="text/css" href="css/main.css" rel="stylesheet">
<link type="text/css" href="css/easyui/default/easyui.css"
	rel="stylesheet">
<link type="text/css" href="css/easyui/icon.css" rel="stylesheet">
</head>
<script type="text/javascript">
	function resetPwd(){
		$("#hidReset").show();
		
	}
	
	function mody(){
		var oldPwd=$("#oldPwd").val();
		var newPwd=$("#newPwd").val();
		var conPwd=$("#conPwd").val();
		if(oldPwd==""||oldPwd=='undefined'||oldPwd==null){
			alert("原密码不能为空");
			return ;
		}
		if(newPwd==""||newPwd=='undefined'||newPwd==null){
			alert("新密码不能为空");
			return ;
		}
		if(conPwd==""||conPwd=='undefined'||conPwd==null){
			alert("确认密码不能为空");
			return ;
		}
		if(newPwd!=conPwd){
			alert("两次输入的密码不一致");
			return;
		}
		//验证原密码
		var flag=true;
		var username='<%=userid%>';
	    $.ajax({
		    type:"POST",
		    async:false,
		    url:"/jwr/motpn/isPwdAction.action",
		    data:{userid:username,pwd:oldPwd},
		    success:function(returnValue){
		   		if(returnValue=='ok'){
		   			flag=true;
		   		}else{
		   			flag=false;
		   		}
		    }
		});
	    if(flag==false){
	    	alert("原密码不正确");
	    	return ;
	    }
		//修改新密码
	    $.ajax({
		    type:"POST",
		    async:false,
		    url:"/jwr/motpn/resetPwdAction.action",
		    data:{userid:username,pwd:newPwd},
		    success:function(returnValue){
		   		if(returnValue=='ok'){
		   			flag=true;
		   		}else{
		   			flag=false;
		   		}
		    }
		});
		if(flag==true){
			alert("修改成功");
			//执行退出方法
			 var uname='<%=username%>';
        	 var basep='<%=basePath%>';
        	 $.ajax({
 			    type:"POST",
 			    url:"<%=basePath%>/menu/removeSessionAction.action",
 			    success:function(returnValue){
 			   		if(returnValue=='yes'){
 			   		 	alert("已将用户："+ uname +"注销"); 
         	        	top.window.location.href = basep;
 			   		} 
 			   		 	
 			    },
 			    error:function(ss){
 			    	alert(" 用户："+ uname +"注销时系统异常，请联系系统管理员！"); 
			   		 	return false;
 			    }
 			 });
		}else {
			alert("修改失败，请与管理员联系");
		}
	}
</script>
<body>
	<h1 style="font-family: 微软雅黑;font-weight:bold;">我的用户信息：</h1>
	<h3 style="margin-top: 18px;">名称：<%=username%></h3>
	<h3 style="margin-top: 18px;">证件号码：<%=paperid %></h3>
	<h3 style="margin-top: 18px;">主管机关：<%=motName %></h3>
	<h3 style="margin-top: 18px;"><button onclick="resetPwd()"><font style="color: blue;font-size: 16">修改密码</font></button></h3>
	<div id="hidReset" style="display: none;border: 1 solid silver;width: 300px;" align="center">
		<div style="height: 15px"></div>
		&nbsp;&nbsp;&nbsp;原密码：<input  type="text"  id="oldPwd"/><br>
		<div style="height: 4px"></div>
		&nbsp;&nbsp;&nbsp;新密码：<input  type="password"  id="newPwd"/><br>
		<div style="height: 4px"></div>
		确认密码：<input  type="password"  id="conPwd"/><br>
		<div style="height: 4px"></div>
		<button onclick="mody()"><font style="color: blue;font-size: 15">修改</font></button>
			<div style="height: 15px"></div>
	</div>
</body>
</html>

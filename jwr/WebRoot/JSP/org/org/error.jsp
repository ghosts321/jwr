<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String userid = request.getParameter("userid");
	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<base href="<%=basePath%>">
		<title>
		  主管机关报名申请
		</title>
		
<link type="text/css" href="css/main.css" rel="stylesheet">
<link type="text/css" href="css/easyui/default/easyui.css"
	rel="stylesheet">
<link type="text/css" href="css/easyui/icon.css" rel="stylesheet">
<script src="js/jquery-1.3.2.min.js" type="text/javascript"></script>
  <script type="text/javascript">
 	$(function(){
 		alert("本考评机构业务类型已存在");
 		window.history.go(-1);
 	});
  
  </script>
	</head>
<body>
	

</body>
</html>

﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<link href="<%= path%>/css/main.css" rel="stylesheet" type="text/css" />
<link href="<%= path%>/css/easyui/default/easyui.css" rel="stylesheet"
	type="text/css" />
<script src="<%= path%>/js/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="<%= path%>/js/jquery.easyui.min.js" type="text/javascript"></script>
</head>
<body style="padding:0px; overflow:hidden; ">
	<div id="topmenu"></div>
	<span class="spinner">
	<input class="easyui-numberspinner spinner-text validatebox-text"
		group="score" i="1" increment="1" j="1" k="1" max="5" min="0"
		name="f_1_1_1" score="5" star="3" style="width: 20px; " value="5"/>
		<span class="spinner-arrow">
			<span class="spinner-arrow-up">
			</span>
			<span class="spinner-arrow-down"></span>
			</span>
		</span>
	</span>
</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>
<%String filename=request.getParameter("filename").toString();
	request.setAttribute("filename", filename);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

</head>
<style type="text/css" media=print>
.Noprint{display : none }
</style>
<script type="text/javascript">
function printImg(){
	window.print();
}
</script>
<body style="padding:10px;">
<input type="hidden" value="${filename }"/>
	 <img width=800px height=600px alt="ss" src="<%=basePath %>file/${filename }">
	 <div class="noprint" align="center"><button onclick="printImg()" value="打印">打印</button></div>
</body>
</html>

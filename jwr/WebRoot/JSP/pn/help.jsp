<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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

<body>
	<h1>
		《交通运输企业安全生产标准化考评管理办法》中关于<span class=bgy>考评员</span>的条列：
	</h1>
	<h2>
		<style>
.bgy {
	background-color: yellow
}
</style>
		<ul>
			<li>第十一条 <span class=bgy>考评员</span>应具有交通运输相关学历和工作经历，并经专业培训、考试合格取得资格。
			</li>
			<li>第十二条 主管机关负责<span class=bgy>考评员</span>适任条件的审核、培训考试发证、注册和考核等管理工作，并建立档案。
				考评机构应建立<span class=bgy>考评员</span>日常管理档案，并按年度向主管机关备案。
			</li>
			<li>第三十五条 <span class=bgy>考评员</span>应保守秘密并谨慎处理所接触的有关文件、特许的信息资料等。
				企业可以向主管机关或考评机构举报、投诉<span class=bgy>考评员</span>的不正当行为。
			</li>
			<li>第三十六条 主管机关应对考评机构和<span class=bgy>考评员</span>进行监督管理。考评机构或<span
				class=bgy>考评员</span>如有违法违纪行为的，主管机关应做出处理直至取消其考评资格。
			</li>
			<li>第三十七条 主管机关相关管理人员和<span class=bgy>考评员</span>应严格遵守本办法和有关廉政规定，不得借考评工作谋取任何私利。违反规定的，由主管机关和考评机构按相关规定查处；构成犯罪的，按规定移送司法机关处理。
			</li>
		</ul>
	</h2>
</body>
</html>

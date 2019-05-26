<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../main.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%--<base href="<%=basePath%>">--%>

<title>My JSP 'pnApply.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

    <script type="text/javascript">
    function itemclick(id,imgname) {
     	stid=id;
		window.open(
			'/jwr/JSP/pn/uploadTemplate.jsp?imgnames='+imgname,
			'',
			'height=100,width=400,top=200,left=450,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
	}
    </script>
</head>

<body style="padding:10px;">
	<table align="center">
		<tr>
			<td align="center">图片1</td>
			<td align="center">图片2</td>
			<td align="center">图片3</td>
		</tr>
		<tr>
			<td style="padding: 7px"><img id="img1" src="<%= basePath%>/uploadimg/lunbo_img_01.jpg"  width="340" height="263"/></td>
			<td style="padding: 7px"><img id="img2" src="<%= basePath%>/uploadimg/lunbo_img_02.jpg"  width="340" height="263"/></td>
			<td style="padding: 7px"><img id="img3" src="<%= basePath%>/uploadimg/lunbo_img_03.jpg"  width="340" height="263"/></td>
		</tr>
		<tr  align="center">
			<td><input class="easyui-validatebox validatebox-text" id="filename*"
				name="indexInfo.filename" title="注：多次上传会覆盖之前的。" type="hidden" value=""><a
				class="easyui-linkbutton l-btn"
				href="javascript:void(0)" onclick="itemclick('img1','lunbo_img_01.jpg')" id="filename"> 
				<span class="l-btn-left">
					<span class="l-btn-text">修改图片1</span> 
				</span> 
				</a>
			</td>
			<td><input class="easyui-validatebox validatebox-text" id="filename*"
				name="indexInfo.filename" title="注：多次上传会覆盖之前的。" type="hidden" value=""><a
				class="easyui-linkbutton l-btn"
				href="javascript:void(0)" onclick="itemclick('img2','lunbo_img_02.jpg')" id="filename"> 
				<span class="l-btn-left">
					<span class="l-btn-text">修改图片2</span> 
				</span> 
				</a>
			</td>
			<td><input class="easyui-validatebox validatebox-text" id="filename*"
				name="indexInfo.filename" title="注：多次上传会覆盖之前的。" type="hidden" value=""><a
				class="easyui-linkbutton l-btn"
				href="javascript:void(0)" onclick="itemclick('img3','lunbo_img_03.jpg')" id="filename"> 
				<span class="l-btn-left">
					<span class="l-btn-text">修改图片3</span> 
				</span> 
				</a>
			</td>
		</tr>
	</table>
</body>
</html>

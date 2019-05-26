<%@ page language="java" import="java.util.*,com.wr4.domain.OrgInfo" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>
<%
	String id=request.getParameter("id").toString();
	String certnumber = request.getParameter("certnumber").toString();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP 'pntail.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


    <script type="text/javascript">
	$(function() {
		
	})
	
	function changeBook(){
		var id='<%=id%>';
		var certnumber='<%=certnumber%>';
		var reason=$("#reason").val();
		if(reason.length>800){
			alert("换证原因字数不能超过800个，已输入"+reason.length+"个字!");
  			return false;
		}
		 $.ajax({
			    type:"POST",
			    async:false,
			    url:"/jwr/bookChange/updateReasonAction.action",
			    data:{'id':id,'reason':reason,certnumber:certnumber},
			    success:function(returnValue){
			    	if(returnValue=='0'){
			    		alert("更新失败");
			    	}else{
			    		alert("已提交，页面即将关闭");
			    		window.parent.ligerwindow.close();
			    		
			    	}
			    }
			});
	}
</script>
</head>
<body >
<h1 align="center">换证原因</h1>
<div class="eui-info">
				<div class="eui-tip icon-tip"></div>
				<div>请填写换证原因</div>
			</div>
			<div style="margin-top: 10px"></div>
	换证原因<textarea rows="200" cols="500" id="reason" name="reason"></textarea>
	<div align="center">
	<button onclick="changeBook()">提交</button>
	</div>
</body>
</html>

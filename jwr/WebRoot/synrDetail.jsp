<%@ page language="java" import="java.net.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <script src="<%=basePath%>/js/jquery-1.4a2.min.js" type="text/javascript"></script>
    	<script type="text/javascript">
    	var id=<%=request.getParameter("id")%>;
    	var dataDetail;
    		 $.ajax({
		    type:"POST",
		    async:false,
		    data:{id:id},
		    url:"/jwr/motControl/getIndexDetailAction.action",
		    success:function(returnValue){
		   // alert(returnValue)
		   		dataDetail=eval("("+returnValue+")");
		   	}
		    });
    	</script>
    <script type="text/javascript">document.write( "<title>"+dataDetail.ptitle +"</title>")</script>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <body>
  
    <center><h1>	<script type="text/javascript"> document.write(dataDetail.ptitle)</script></h1></center>
    <table>
    <tr>
    <td style="text-indent:2em; font:20/1.5 仿宋">
     	内容:
	</td>
	<td>
	<textarea id="synr" rows="15" cols="100" readonly="readonly">
	</textarea>
	</td>
	</tr>
	<br/>
	
    <br/>
     <tr>
    <td style="text-indent:2em; font:20/1.5 仿宋">
     	附件:
	</td>
	<td id="chakan">
	</td>
    </tr>
    </table>
    <hr /><br /><center><a class="easyui-linkbutton" href="#" onclick="window.close();">关闭</a></center></body>
  </body>
  <script type="text/javascript">
  	$(function(){
  		$("#synr").val( dataDetail.contenttext);
  		$("#chakan").append(
  		"  <a href='<%= basePath%>updown/downloadFileAction?file="+dataDetail.filename+" ' >查看</a>"	
  		);
  	
  	})
  </script>
</html>

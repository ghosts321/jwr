<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="../main.jsp" %>
<%
			String userId=(String)request.getSession().getAttribute("userid");
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>
		  详细信息
		</title>

	 <script type="text/javascript">
	  <%String   msg=request.getAttribute("msg")==null?"":request.getAttribute("msg").toString();
		if(msg.equals("yes")){
		%>
			alert("提交成功，窗口将关闭");
			// window.close();
			 window.location.href ="<%=basePath%>/index.html";
		 <%
	}else if(msg!=null&&!"".equals(msg)&& !msg.equals("yes")){
	%>
		alert("提交失败");
		<%
	}
%>
	 	function nameReportAdd(){
	 	//window.location.href='/jwr/nameReport/nameReportInsertAction.action';
	 	var jmessage=document.getElementById('nameReport.jmessage').value;
	 	var contenttext=document.getElementById('nameReport.contenttext').value;
	 	if($.trim(jmessage)=="" || jmessage==null){
	 		alert("举报人基本信息必须全部填写！");
	 		return;
	 	}
	 	if($.trim(contenttext)=="" || contenttext==null){
	 		alert("请填写举报内容！");
	 		return;
	 	}
		document.forms[0].submit();
		
	
	
}
			
		$(function(){
		//管理机关
        		 $.ajax({
        			    type:"POST",
        			    async:false,
        			    url:"/jwr/respInfo/getMotAction.action",
        			    success:function(returnValue){
        			   		indexdata=returnValue;
        			   		var obj1=(eval("("+indexdata+")")).Rows;
        			   		var str="";
        			   	    str='<SELECT id="nameReport.adminmot" name="nameReport.adminmot">';
        			   		for(var i=0;i<obj1.length;i++){
        						str+='<OPTION selected value='+obj1[i].motcode+'>'+obj1[i].motname+'</OPTION>';
        			   		}
        			   		
        			   		  str+='</SELECT>';
        			   		$("#sa").html(str);
        			    }
        			});
		})
		
 	 </script>
	</head>
<body>
	<h1>实名举报</h1>
	
	<div class="eui-info">
	<div class="eui-tip icon-tip"></div>
	<div>任何单位和个人对考评机构的考评行为，有权向主管机关进行实名举报，主管机关会及时受理、组织调查处理，并为举报人保密。</div>
	</div><br /><br />
	<form action="/jwr/nameReport/nameReportInsertAction.action" id="nameReport" name="nameReport"  method="post">
		<table width="80%" align="center" class="grid">
	<tr>
	<td>
		<label><b>举报人信息等：</b></label>
	</td>
	<td>
		<textarea id="nameReport.jmessage" name="nameReport.jmessage" cols="5" rows="3" class="easyui-validatebox"  style="height: 100px">
姓名：   
身份证号：
联系方式：
其 他：
        </textarea>
	</td>
	<td></td>
	</tr>
	<br/><br/>
	<tr></tr>
	<tr>
		<td>
			<label><b>要举报的对象：</b></label>
		</td>
		<td>
		<select  id="nameReport.jtype" name="nameReport.jtype">
			<option value="交通运输企业">交通运输企业</option>
			<option value="考评机构">考评机构</option>
			<option value="考评员">考评员</option>
		</select>
		</td>
			<td></td>
	</tr>
	<br/><br/>
	<tr>
		<td>
		<label><b>填写举报内容：</b></label>
		</td>
		<td>
			<textarea  id="nameReport.contenttext" name="nameReport.contenttext"  class="easyui-validatebox" name="content" style="width: 500px; height: 300px"></textarea>
		</td>
			<td></td>
	</tr>
	<tr>
		<td><label><b>选择主管机关：</b></label></td>
		<td >
		<span id="sa"></span>
		</td>
	<td></td>
	</tr>
	<tr align="center">
		<td colspan="3">
		
		<a  class="easyui-linkbutton l-btn" onclick="nameReportAdd();"  >
	<SPAN class=l-btn-left><SPAN class=l-btn-text>提交</SPAN></SPAN></a>
		
		</td>
	</tr>
	
</table>

</form>
</body>
</html>

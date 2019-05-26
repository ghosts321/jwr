<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="../main.jsp" %>
<%
			String id=request.getParameter("id");
			request.setAttribute("id", id);
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>
		  详细信息
		</title>
<script type="text/javascript" src="/js/main.js"></script>
<script src="/js/app-esp.js" type="text/javascript"></script>
	 <script type="text/javascript">
		var indexdata = "";
		var totalSize = "";
	$(function() {
		//管理机关
        		 $.ajax({
        			    type:"POST",
        			    async:false,
        			    url:"/jwr/respInfo/getMotAction.action",
        			    success:function(returnValue){
        			   		indexdata=returnValue;
        			   		var obj1=(eval("("+indexdata+")")).Rows;
        			   		var str="";
        			   	    str='<SELECT id="zforg" name="zforg">';
        			   		for(var i=0;i<obj1.length;i++){
        						str+='<OPTION selected value='+obj1[i].motcode+'>'+obj1[i].motname+'</OPTION>';
        			   		}
        			   		  str+='</SELECT>';
        			   		$("#sa").html(str);
        			    }
        			});
	
	
	
	
			var id=$("#id").val();
			 $.ajax({
					    type:"POST",
					    async:false,
					    url:"/jwr/nameReport/nameReportDetailAction.action",
					    data:{'id':id},
					    success:function(returnValue){
					    	var exchangeInfo=eval("("+returnValue+")")[0];
					    	indexdata = exchangeInfo;
					    	
					    	$("#jmessage").text(exchangeInfo.jmessage);
					    	$("#orgname").text(exchangeInfo.orgname);
					    	$("#jtype").text(exchangeInfo.jtype);
					    	$("#contenttext").text(exchangeInfo.contenttext);
					    	$("#createdate").text(exchangeInfo.createdate);
					    	$("#advice1").text(exchangeInfo.advice);
					    	
					    	
					    }
					});
	})
	
	
		
	//提交
	function sub(id){
		//alert(id);
		var advice=$("#advice").val();
		var jmessage = indexdata.jmessage;
		var adminmot = indexdata.adminmot;
		var jtype = indexdata.jtype;
		var contenttext = indexdata.contenttext;
		var createdate = indexdata.createdate;
		var zforg = $("#zforg").val();
		 $.ajax({
			    type:"POST",
			    async:false,
			    data:{"id":id,'advice':advice,'zforg':zforg,'jtype':jtype,'jmessage':jmessage,'adminmot':adminmot,'contenttext':contenttext,'createdate':createdate},
			    url:"/jwr/nameReport/updateNReportByIdAction.action",
			    success:function(returnValue){
			   		if(returnValue=="ok"){
			   			alert("已提交,实名举报处理成功!");
			   			window.parent.gird.reload();
			   			window.parent.ligerwindow.close();
			   		}else if(returnValue=="error"){
			   			alert("操作失败，请与管理员联系!");
			   		}
			    }
			});
	}
	
	function strChange(){
		alert("查看举报信息完毕，窗口将关闭");
		 window.parent.ligerwindow.close();
	}
 	 </script>
	</head>
<body>
	<input type="hidden" id="id" value="${id }">
	<caption>
			实名举报 <u></u>
		</caption>
	<div class="eui-info">
	<div class="eui-tip icon-tip"></div>
	<div>任何单位和个人对考评机构的考评行为，有权向主管机关进行实名举报，主管机关会及时受理、组织调查处理，并为举报人保密。</div>
	</div><br /><br />
	<form action="/jwr/nameReport/nameReportInsertAction.action" id="nameReport" name="nameReport"  method="post">
	<table border="1" class="wr3table">
		<tbody>
	<tr>
		<th nowrap="true" style="text-align: left">举报人信息：</th>
	<td id="jmessage"></td>
	</tr>
	<tr>
	<th nowrap="true" style="text-align: left">主管机关：</th>
	<td id="orgname"></td>
	</tr>
	<tr>
		<th nowrap="true" style="text-align: left">举报对象类型：</th>
		<td id="jtype">
		</td>
	</tr>
	<tr>
		<th nowrap="true" style="text-align: left">内容：</th>
		<td id="contenttext">
		</td>
	</tr>
	<tr>
		<th nowrap="true" style="text-align: left">处理意见：</th>
		<td id="advice1">
		</td>
	</tr>
	<tr>
	<th nowrap="true" style="text-align: left">日期：</th>
		<td id="createdate">
		</td>
	</tr>
	<tr>
	<td colspan="2" align="center" >
	<A id=undefined class="easyui-linkbutton l-btn" onclick="strChange();"; href="#" jQuery163039564304368123043="1">
	<SPAN class=l-btn-left><SPAN class=l-btn-text>关闭</SPAN></SPAN></A></TD></TR></TFOOT></TABLE>
			
	</tr>
	</tbody>
	
</table>

<br>
	<label>处理意见：</label>
	<textarea class="easyui-validatebox validatebox-text" id="advice" name="advice"
		style="width: 600px; margin: 0px; height: 150px;"></textarea>
	<br>
	<br>
<br>
	<label>转发至主管机关：</label>
	<span id="sa"></span>
	<br>
	<br>
<br>
	<div align="center">
		<A id=undefined class="easyui-linkbutton l-btn" onclick="sub('${id }');" href="#" jQuery163039564304368123043="1">
		 <SPAN class=l-btn-left><SPAN class=l-btn-text>提交</SPAN></SPAN>
		</A>
	</div>
	
</form>
</body>
</html>

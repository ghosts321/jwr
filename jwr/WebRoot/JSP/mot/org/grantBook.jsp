<%@page import="com.wr4.util.DateUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="../../main.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
	String bustype = request.getParameter("type");
	String userId = request.getParameter("userId");
	request.setAttribute("userId", userId);
	String busType = request.getParameter("busType").toString();
	request.setAttribute("busType", busType);
	String orgname = java.net.URLDecoder.decode(
			request.getParameter("orgname").toString(), "UTF-8");
	request.setAttribute("orgname", orgname);
	String grade = request.getParameter("grade");
	request.setAttribute("grade", grade);
	String adminmot = request.getParameter("adminmot");
	request.setAttribute("adminmot", adminmot);
	String remark = new String(request.getParameter("remark").getBytes(
			"ISO-8859-1"), "utf-8");
	request.setAttribute("remark", remark);
	String applyid = new String(request.getParameter("applyid")
			.getBytes("ISO-8859-1"), "utf-8");
	request.setAttribute("applyid", applyid);
	String pid = new String(request.getParameter("pid").getBytes(
			"ISO-8859-1"), "utf-8");
	request.setAttribute("pid", pid);
	String filetext = java.net.URLDecoder.decode(
			request.getParameter("filetext").toString(), "UTF-8");
	request.setAttribute("filetext", filetext);
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
<script type="text/javascript"src="<%= path%>/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	
	$(function() {	
		 if('<%=grade%>'=='2'){
   			 $("#grade").text("二级");
   		 }else if('<%=grade%>'=='3'){
   			 $("#grade").text("三级");
   		 }
   		var motnum = $("#adminmot").val();
		$.ajax({
		    type:"POST",
		    async:false,
		    data:{motnum:motnum,usertype:'org'},
		    url: "/jwr/enControl/getCertDateAction.action",
		    success:function(returnValue){
		    	certNum = returnValue;
		    	$("#cid").val(certNum) ;
		    }
		});
	});	 
	
	//查看打印证书
					 function print(){
		//点打完打印按钮不可用，防止连续点击
						 $("#printBt").attr('disabled',true);
						 var indexdata = "";
						 var indexdata2 = "";
							var totalSize = "";
							var userId=$("#userId").val();
							var busType=$("#busType").val();
							var orgname=$("#orgname").val();
							var grade=$("#grade1").val();
							var remark=$("#remark1").val();
							var applyid=$("#applyid").val();
							var copy=$('#copy option:selected').val();
							var pid=$("#pid").val();
							var cid=$("#cid").val();
							var cdate=$("#cdate").val();
									 $.ajax({
									    type:"POST",
									    async:false,
									    url:"/jwr/orgControl/grantBookAction.action",
									    data:{'userId':userId,'busType':busType,'applyid':applyid,'grade':grade,'pid':pid,'copy':copy,'orgname':orgname,cid:cid,cdate:cdate},
									    success:function(returnValue){
									    	if(returnValue=="error"){
									    		alert("该证书号已被使用请重新填写！");
									    		return false;
									    	}
									    	var orgInfo=eval("("+returnValue+")")[0];
									   		 $("#name").text(orgname);
									   		 $("#type").text(orgInfo.busType);
									   		 if(grade=='2'){
									   			 $("#grade").text("二级");
									   		 }else if(grade=='3'){
									   			 $("#grade").text("三级");
									   		 }
									   		 $("#remark").text(remark);
									   		  $("#date").text(orgInfo.curDate);
									   		  var filename=orgInfo.fileName;
// 									   		scanImg(filename);
										//关闭页面重新加载表格数据
										window.parent.gird.setOptions({ parms: { page:'1'}});
								        //将 查询参数 设置到 grid中 以便下次分页时候 可以获取到查询参数
								        window.parent.gird.reload();
									   		  window.location.href="<%=basePath%>JSP/mot/org/cert.jsp?filename="+ filename;
						// 									   		 window.parent.ligerwindow.close();
					}
				});

	}
</script>
</head>
<body>
	<input id="userId" value="${userId }" type="hidden" />
	<input id="busType" value="${busType }" type="hidden" />
	<input id="orgname" value="${orgname }" type="hidden" />
	<input id="grade1" value="${grade }" type="hidden" />
	<input id="applyid" value="${applyid }" type="hidden" />
	<input id="remark1" value="${remark }" type="hidden" />
	<input id="pid" value="${pid }" type="hidden" />
	<input id="adminmot" value="${adminmot }" type="hidden" />
	<table border="1">
		<TBODY>
			<TR>
				<TD
					style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px;  FONT-SIZE: 14px"><LABEL>证书编号：</LABEL></TD>
				<TD style="BORDER-BOTTOM: gray 1px dotted"><input type="text"id="cid"/><FONT color=red>可自己填写证书号,或应用系统生成的证书号!</FONT></TD>
			</TR>
			<TR>
				<TD
					style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px;FONT-SIZE: 14px"><LABEL>有效期开始日期：</LABEL></TD>
				<TD style="BORDER-BOTTOM: gray 1px dotted" id="date"><input type="text" id="cdate" value="<%=DateUtils.getDateFormatString().substring(0, 10)%>"
				class="input-text lh30" size="20" style="background:#fff url(${ctx }/My97DatePicker/skin/datePicker.gif) no-repeat right;"
		                    onfocus="WdatePicker({isShowClear:false,readOnly:true,maxDate:'%y-%M-%d'})"/>
		                    <FONT color=red>点击文本框选择修改的日期。</FONT></TD>
<!-- 				<TD style="BORDER-BOTTOM: gray 1px dotted" id="date"><input type="text" id="cdate" value="<%=DateUtils.getDateFormatString().substring(0, 10)%>"/><FONT color=red>可自己填写证书开始日期,日期格式为2015-01-01!</FONT></TD> -->
			</TR>
			<TR>
				<TD
					style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px"><LABEL>名称：</LABEL></TD>
				<TD style="BORDER-BOTTOM: gray 1px dotted" id="name"><%=orgname%></TD>
			</TR>
			<TR>
				<TD
					style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px"><LABEL>类型类别：</LABEL></TD>
				<TD style="BORDER-BOTTOM: gray 1px dotted" id="type"><%=filetext%></TD>
			</TR>
			<TR>
				<TD
					style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px"><LABEL>达标/资质等级：</LABEL></TD>
				<TD style="BORDER-BOTTOM: gray 1px dotted" id="grade"></TD>
			</TR>
			<TR>
				<TD
					style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px"><LABEL>正本/副本选择：</LABEL></TD>
				<TD style="BORDER-BOTTOM: gray 1px dotted"><SELECT id=copy
					name=copy><OPTION selected value="1">—— 打印正本 ——</OPTION>
						<OPTION value="2">—— 打印副本 ——</OPTION></SELECT></TD>
			</TR>
			<TR>
				<TD
					style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px"><LABEL>备注：</LABEL></TD>
				<TD style="BORDER-BOTTOM: gray 1px dotted"><TEXTAREA
						style="WIDTH: 400px; HEIGHT: 60px" id="remark"
						class="easyui-validatebox validatebox-text" name=comment
						jQuery16307076543895769001="8"><%=remark%></TEXTAREA></TD>
			</TR>
		<TFOOT>
			<TR>
				<TD
					style="PADDING-BOTTOM: 15px; PADDING-LEFT: 15px; PADDING-RIGHT: 15px; PADDING-TOP: 15px"
					colSpan=3 align=center><INPUT name=apply-type value=org-apply
					type=hidden>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button id="printBt" class="easyui-linkbutton l-btn"
						onclick="print()" href="#">
						<SPAN class=l-btn-left><SPAN class=l-btn-text>查看、打印证书</SPAN></SPAN>
					</button></TD>
			</TR>
		</TFOOT>
	</table>
</body>
</html>

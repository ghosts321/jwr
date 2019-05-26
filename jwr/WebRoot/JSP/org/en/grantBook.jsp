<%@page import="com.wr4.util.DateUtils"%>
<%@ page language="java" import="java.util.*,java.net.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../../main.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
	String bustype = request.getParameter("type");
	String userId=URLDecoder.decode(request.getParameter("userId"), "UTF-8");
	request.setAttribute("userId", userId);
	String busType=request.getParameter("busType");
	request.setAttribute("busType", busType);
	String grade=request.getParameter("grade");
	request.setAttribute("grade", grade);
	String remark=URLDecoder.decode(request.getParameter("remark"), "UTF-8");
	request.setAttribute("remark", remark);
	System.out.println(remark);
	String applyid= request.getParameter("applyid") ;
	request.setAttribute("applyid", applyid);
	String adminmot= request.getParameter("adminmot") ;
	request.setAttribute("adminmot", adminmot);
	String pid=new String(request.getParameter("pid").getBytes("ISO-8859-1"),"utf-8");
	request.setAttribute("pid", pid);
	String enname=URLDecoder.decode(request.getParameter("enname"), "UTF-8");
	request.setAttribute("enname", enname);
	String respdate= request.getParameter("respdate") ;
	request.setAttribute("respdate", respdate);
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
	 
	 $("#type").html(getCelltype( $("#type").html()));
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

	function print(){
		$("#printBt").attr("disable",true);
			var indexdata = "";
			var totalSize = "";
			var indexdata2="";
			var userId=$("#userId").val();
			var busType=$("#busType").val();
			var enname=$("#enname").val();
			var grade=$("#grade1").val();
			var remark=$("#remark1").val();
			var applyid=$("#applyid").val();
			var respdate=$("#respdate").val();
			var pid=$("#pid").val();
			var cid=$("#cid").val();
			var cdate=$("#cdate").val();
			var copy=$('#copy option:selected').val();
					 $.ajax({
					    type:"POST",
					    async:false,
					    url:"/jwr/orgControl/grantEnBookAction.action",
					    data:{respdate:respdate,'userId':userId,'busType':busType,remark:remark,'copy':copy,'applyid':applyid,'grade':grade,'pid':pid,'enname':enname,cid:cid,cdate:cdate},
					    success:function(returnValue){
					    	if(returnValue=="error"){
					    		alert("审核天数不符合");
					    		$("#printBt").attr("disable",false);
					    		return false;
					    	}else if(returnValue=="errore"){
					    		alert("该证书号已被使用请重新填写！");
					    		$("#printBt").attr("disable",false);
					    		return false;
					    	}
					    	var enInfo=eval("("+returnValue+")")[0];
					   		 $("#name").text(enname);
					   		 $("#type").text(enInfo.busType);
					   		 if(grade=='2'){
					   			 $("#grade").text("二级");
					   		 }else if(grade=='3'){
					   			 $("#grade").text("三级");
					   		 }
					   		 $("#remark").text(remark);
					   		  $("#date").text(enInfo.curDate);
					   		 var filename=enInfo.fileName;
					   	  //将 查询参数 设置到 grid中 以便下次分页时候 可以获取到查询参数
						        //默认回到第一页
					   	   window.parent.gird.setOptions({ parms: { page:'1'}});
					        window.parent.gird.reload();
					   		  window.location.href="<%= basePath%>JSP/mot/org/cert.jsp?filename="+filename;
					    }
					});
	}
</script>
</head>
<body>
	<input id="userId" value="${userId }" type="hidden"/>
	<input id="busType" value="${busType }" type="hidden"/>
	<input id="enname" value="${enname }" type="hidden"/>
	<input id="grade1" value="${grade }" type="hidden"/>
	<input id="remark1" value="${remark }" type="hidden"/>
	<input id="applyid" value="${applyid }" type="hidden"/>
	<input id="respdate" value="${respdate }" type="hidden"/>
	<input id="pid" value="${pid }" type="hidden"/>
	<input id="adminmot" value="${adminmot }" type="hidden"/>
	<table border="1" class="wr3table">
		<TBODY>
			<TR>
			<TD style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px"><LABEL>证书编号：</LABEL></TD>
			<TD style="BORDER-BOTTOM: gray 1px dotted"><input type="text"id="cid"/></TD>
			<TD><FONT color=red>可自己填写证书号,或应用系统生成的证书号!</FONT></TD></TR>
			<TR>
			<TD style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px"><LABEL>有效期开始日期：</LABEL></TD>
			<TD style="BORDER-BOTTOM: gray 1px dotted" id="date"><input type="text" id="cdate" value="<%=DateUtils.getDateFormatString().substring(0, 10)%>"
				class="input-text lh30" size="20" style="background:#fff url(${ctx }/My97DatePicker/skin/datePicker.gif) no-repeat right;"
		                    onfocus="WdatePicker({isShowClear:false,readOnly:true,maxDate:'%y-%M-%d'})"/></TD>
			<TD><FONT color=red>*点击文本框选择修改的日期。</FONT></TD></TR>
			<TR>
			<TD style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px"><LABEL>名称：</LABEL></TD>
			<TD style="BORDER-BOTTOM: gray 1px dotted" id="name"><%=enname %></TD>
			<TD><FONT color=red>*</FONT></TD></TR>
			<TR>
			<TD style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px"><LABEL>类型类别：</LABEL></TD>
			<TD style="BORDER-BOTTOM: gray 1px dotted" id="type"><%=busType %></TD>
			<TD><FONT color=red>*</FONT></TD></TR>
			<TR>
			<TD style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px"><LABEL>达标/资质等级：</LABEL></TD>
			<TD style="BORDER-BOTTOM: gray 1px dotted" id="grade"></TD>
			<TD><FONT color=red>*</FONT></TD></TR>
			<TR>
			<TD style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px"><LABEL>正本/副本选择：</LABEL></TD>
			<TD style="BORDER-BOTTOM: gray 1px dotted"><SELECT id=copy name=copy><OPTION selected value="1">—— 打印正本 ——</OPTION><OPTION value="2">—— 打印副本 ——</OPTION></SELECT></TD>
			<TD><FONT color=red>*</FONT></TD></TR>
			<TR>
			<TD style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px"><LABEL>备注：</LABEL></TD>
			<TD style="BORDER-BOTTOM: gray 1px dotted"><TEXTAREA style="WIDTH: 400px; HEIGHT: 60px" id="remark" class="easyui-validatebox validatebox-text" name="comment"></TEXTAREA></TD>
			<TD><FONT color=red>*</FONT></TD></TR>
			
		<TFOOT>
			<TR>
				<TD
					style="PADDING-BOTTOM: 15px; PADDING-LEFT: 15px; PADDING-RIGHT: 15px; PADDING-TOP: 15px"
					colSpan=3 align=center>
					<P>
						注：带红色<FONT color=red>*</FONT>的为必填项。
					</P>
					<INPUT name=apply-type value=org-apply type=hidden>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button
					id="printBt" class="easyui-linkbutton l-btn"
					onclick="print()" href="#"><SPAN class=l-btn-left><SPAN
							class=l-btn-text>查看、打印证书</SPAN></SPAN></button>
				</TD>
			</TR>
		</TFOOT>
	</table>
</body>
</html>

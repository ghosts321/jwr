<%@page import="com.wr4.util.CodeToCnUtil"%>
<%@page import="com.wr4.util.DateUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../../main.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String pid=request.getParameter("pid");
	request.setAttribute("pid", pid);
	String createdate=	request.getParameter("createdate").toString();
	request.setAttribute("createdate", createdate);
	String pnname=java.net.URLDecoder.decode(request.getParameter("pnname").toString(),"UTF-8");
	request.setAttribute("pnname", pnname);
	String photo=request.getParameter("photo");
	request.setAttribute("photo", photo);
	String bussinestype=java.net.URLDecoder.decode(request.getParameter("bussinestype").toString(),"UTF-8");
	request.setAttribute("bussinestype", bussinestype);
	String id=new String(request.getParameter("id").getBytes("ISO-8859-1"),"utf-8");
	request.setAttribute("id", id);
	String userid=new String(request.getParameter("userid").getBytes("ISO-8859-1"),"utf-8");
	request.setAttribute("userid", userid);
	String adminmot=new String(request.getParameter("adminmot"));
	request.setAttribute("adminmot", adminmot);
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
		$("#type").html(getCelltype( $("#type").html()));
		var motnum = $("#adminmot").val();
		var bussinestype = $("#bussinestype").val();
		$.ajax({
		    type:"POST",
		    async:false,
		    data:{motnum:motnum,usertype:'pn',bussinestype:bussinestype},
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
						 $("#printBt").attr("disabled",true);
						 var indexdata = "";
						 var indexdata2 = "";
							var totalSize = "";
							var pnname=$("#pnname").val();
							var pid=$("#pid").val();
							var photo=$("#photo").val();
							var bussinestype=$("#bussinestype").val();
							var createdate=$("#createdate").val();
							var id=$("#id").val();
							var userid=$("#userid").val();
							var cid=$("#cid").val();
							$.ajax({
							    type:"POST",
							    async:false,
							    url:"/jwr/motcert/getCertAction.action?id="+id,
							    data:{pnname:pnname,photo:photo,createdate:createdate,userid:userid,bussinestype:bussinestype,id:id,pid:pid,cid:cid},
							    success:function(returnValue){
							   		if(returnValue=='yes'){
							   			alert('发证成功');
							   		        window.parent.manager.setOptions({ parms: { newPage:'1'}});
									        //将 查询参数 设置到 grid中 以便下次分页时候 可以获取到查询参数
									        window.parent.manager.reload();
	 									   	window.parent.ligerwindow.close();
							   		}else if(returnValue=='no'){
							   			alert('已经拥有一张同类型的证书，请验证！');
							   		}else if('jpg'==eval("("+returnValue+")")[0].fileName.substr(eval("("+returnValue+")")[0].fileName.length-3,eval("("+returnValue+")")[0].fileName.length-1)){
							   		   window.parent.manager.setOptions({ parms: { newPage:'1'}});
								        //将 查询参数 设置到 grid中 以便下次分页时候 可以获取到查询参数
								        window.parent.manager.reload();
							   		   window.location.href="<%= basePath%>JSP/mot/pn/cert.jsp?filename="+eval("("+returnValue+")")[0].fileName;
							   		   return;
							   		} else{
							   			alert('发证失败');
							   		}
							    }
							});
							 
									 
					 }
					

</script>
</head>
<body>
	<input id="pnname" value="${pnname }" type="hidden"/>
	<input id="pid" value="${pid }" type="hidden"/>
	<input id="photo" value="${photo }" type="hidden"/>
	<input id="bussinestype" value="${bussinestype }" type="hidden"/>
	<input id="createdate" value="${createdate }" type="hidden"/>
	<input id="id" value="${id }" type="hidden"/>
	<input id="userid" value="${userid }" type="hidden"/>
	<input id="adminmot" value="${adminmot }" type="hidden"/>
	<table border="1" class="wr3table" width="100%" >
		<TBODY>
			<TR>
			<TD style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px"><LABEL>证书编号：</LABEL></TD>
			<TD style="BORDER-BOTTOM: gray 1px dotted"><input type="text"id="cid"/></TD>
			<TD><FONT color=red>可自己填写证书号,或应用系统生成的证书号!</FONT></TD></TR>
			<TR>
			<TD style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px"><LABEL>姓名：</LABEL></TD>
			<TD style="BORDER-BOTTOM: gray 1px dotted" id="pnname"><%=pnname %></TD>
			<TD><FONT color=red>*</FONT></TD></TR>
			<TR>
			<TD style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px"><LABEL>身份证号：</LABEL></TD>
			<TD style="BORDER-BOTTOM: gray 1px dotted" id="pid"><%=pid %></TD>
			<TD><FONT color=red>*</FONT></TD></TR>
			<TR>
			<TD style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px"><LABEL>专业类型：</LABEL></TD>
			<TD style="BORDER-BOTTOM: gray 1px dotted" id="bussinestype"><%=CodeToCnUtil.getBustypeCnVal(bussinestype) %></TD>
			<TD><FONT color=red>*</FONT></TD></TR>
<!-- 			<TR> -->
<!-- 			<TD style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px"><LABEL>发证主管机关（盖章）：</LABEL></TD> -->
<!-- 			<TD style="BORDER-BOTTOM: gray 1px dotted" id="grade"></TD> -->
<!-- 			<TD><FONT color=red>*</FONT></TD></TR> -->
<!-- 			<TR> -->
<!-- 			<TD style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px"><LABEL>正本/副本选择：</LABEL></TD> -->
<!-- 			<TD style="BORDER-BOTTOM: gray 1px dotted"><SELECT id=copy name=copy><OPTION selected value="1">—— 打印正本 ——</OPTION><OPTION value="2">—— 打印副本 ——</OPTION></SELECT></TD> -->
<!-- 			<TD><FONT color=red>*</FONT></TD></TR> -->
<!-- 			<TR> -->
<!-- 			<TD style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px"><LABEL>备注：</LABEL></TD> -->
<!-- 			<TD style="BORDER-BOTTOM: gray 1px dotted"><TEXTAREA style="WIDTH: 400px; HEIGHT: 60px" id="remark" class="easyui-validatebox validatebox-text" name=comment jQuery16307076543895769001="8"> </TEXTAREA></TD> -->
<!-- 			<TD><FONT color=red>*</FONT></TD></TR> -->
			
		<TFOOT>
			<TR>
				<TD
					style="PADDING-BOTTOM: 15px; PADDING-LEFT: 15px; PADDING-RIGHT: 15px; PADDING-TOP: 15px"
					colSpan=3 align=center>
					<P>
						注：带红色<FONT color=red>*</FONT>的为必填项。
					</P>
					<div style="height: 5px"></div>
					<INPUT name=apply-type value=org-apply type=hidden>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
					<button id="printBt"   onclick="print()"  style="height:30px"><font size="1">查看打印证书 </font></button>
				</TD>
			</TR>
		</TFOOT>
	</table>
</body>
</html>

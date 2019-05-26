<%@ page language="java" import="java.util.*,java.net.*" pageEncoding="UTF-8"%>
<%@include file="../../main.jsp"  %>
<%
String certnumber=request.getParameter("certnumber");
request.setAttribute("certnumber", certnumber);
String enname = URLDecoder.decode(request.getParameter("enname"), "UTF-8");
request.setAttribute("enname", enname);
String pid=request.getParameter("pid");
request.setAttribute("pid", pid);

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>My JSP 'pntail.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript" charset="UTF-8">
var resultData = "";



$(function() {
	var pid=$("#pid1").val();
	$.ajax({
		type : "POST",
		async : false,
		url : "/jwr/respInfo/getEnDetailAction.action?pid="+pid,
		success : function(returnValue) {
			resultData = returnValue;
			resultData = eval("("+resultData+")");
			$("#userid").html(resultData[0].userid);
			$("#adminmot").html(resultData[0].adminmot);
			$("#province").html(resultData[0].province);
			$("#enname").html(resultData[0].enname);
			$("#pid").html(resultData[0].pid);
			$("#legalp").html(resultData[0].legalp);
			$("#contact").html(resultData[0].contact);
			$("#mobile").html(resultData[0].mobile);
			$("#email").html(resultData[0].email);
			$("#grade").html(resultData[0].grade);
			$("#bustype").html(resultData[0].bustype);
			$("#type2").html(resultData[0].type2);
			$("#address").html(resultData[0].address);
			$("#tel").html(resultData[0].tel);
			$("#tax").html(resultData[0].tax);
			$("#renew").html(resultData[0].renew);
			$("#orgid").html(resultData[0].orgid);
			$("#createdate").html(resultData[0].createdate);
			$("#kpresult").html(resultData[0].kpresult);
			$("#orgid1").html(resultData[0].orgid1);
			$("#kaoScore").html(resultData[0].kaoScore);
			$("#kpadvice").html(resultData[0].kpadvice);
			$("#kpdate").html(resultData[0].kpdate);
			$("#resp").html(resultData[0].resp);
			$("#respdate").html(resultData[0].respdate);
		}
	});
	
	var isBol='0',ligerwindow;
	function dbzp(el){
		   ligerwindow=$.ligerDialog.open({
	        	url:'JSP/mot/en/enDbzpAdd.jsp?type='+el,
	        	width:1000,
	        	height:500,
	        	title:"企业自评分"
	    	});
		   ;
	   }
});
</script>
</head>
<body>
<input type="hidden" id="cid" value="${cid }"/>
<input type="hidden" id="pid1" value="${pid }"/>
	<TABLE class=wr3table border=1>
		<CAPTION>
			交通运输企业申请 <U><%=enname %></U>
		</CAPTION>
		<TBODY>
			<TR>
				<TH style="TEXT-ALIGN: left" noWrap>用户ID：</TH>
				<TD id="userid"></TD>
			</TR>
			<TR>
				<TH style="TEXT-ALIGN: left" noWrap>主管机关：</TH>
				<TD id="adminmot"></TD>
			</TR>
			<TR>
				<TH style="TEXT-ALIGN: left" noWrap>所在省市：</TH>
				<TD id="province">/TD>
			</TR>
			<TR>
				<TH style="TEXT-ALIGN: left" noWrap>名称：</TH>
				<TD id="enname"></TD>
			</TR>
			<TR>
				<TH style="TEXT-ALIGN: left" noWrap>证件号：</TH>
				<TD id="pid"></TD>
			</TR>
			<TR>
				<TH style="TEXT-ALIGN: left" noWrap>法人代表：</TH>
				<TD id="legalp"></TD>
			</TR>
			<TR>
				<TH style="TEXT-ALIGN: left" noWrap>联系人姓名：</TH>
				<TD id="contact"></TD>
			</TR>
			<TR>
				<TH style="TEXT-ALIGN: left" noWrap>手机：</TH>
				<TD id="mobile"></TD>
			</TR>
			<TR>
				<TH style="TEXT-ALIGN: left" noWrap>联系人邮箱：</TH>
				<TD id="email"></TD>
			</TR>
			<TR>
				<TH style="TEXT-ALIGN: left" noWrap>等级：</TH>
				<TD id="grade"></TD>
			</TR>
			<TR>
				<TH style="TEXT-ALIGN: left" noWrap>业务类型：</TH>
				<TD id="bustype"></TD>
			</TR>
			<TR>
				<TH style="TEXT-ALIGN: left" noWrap>业务类别：</TH>
				<TD id="type2"></TD>
			</TR>
			<TR>
				<TH style="TEXT-ALIGN: left" noWrap>通讯地址：</TH>
				<TD id="address"></TD>
			</TR>
			<TR>
				<TH style="TEXT-ALIGN: left" noWrap>联系电话：</TH>
				<TD id="tel"></TD>
			</TR>
			<TR>
				<TH style="TEXT-ALIGN: left" noWrap>传真：</TH>
				<TD id="tax"></TD>
			</TR>
			<TR>
				<TH style="TEXT-ALIGN: left" noWrap>换证原因<B>（仅换证申请）</B>：
				</TH>
				<TD id="renew"></TD>
			</TR>
			<TR>
				<TH style="TEXT-ALIGN: left" noWrap>选择的2个考评机构：</TH>
				<TD id="orgid"></TD>
			</TR>
			<TR>
				<TH style="TEXT-ALIGN: left" noWrap>日期：</TH>
				<TD id="createdate"></TD>
			</TR>
			<TR>
				<TH style="TEXT-ALIGN: left" noWrap>考评结果：</TH>
				<TD id="kpresult"><B><FONT color=green></FONT></B></TD>
			</TR>
			<TR>
				<TH style="TEXT-ALIGN: left" noWrap>指定的考评机构：</TH>
				<TD id="orgid1"></TD>
			</TR>
			<TR>
				<TH style="TEXT-ALIGN: left" noWrap>考评分数：</TH>
				<TD id="kaoScore"></TD>
			</TR>
			<TR>
				<TH style="TEXT-ALIGN: left" noWrap>处理意见：</TH>
				<TD id="advice"></TD>
			</TR>
			<TR>
				<TH style="TEXT-ALIGN: left" noWrap>考评日期：</TH>
				<TD id="kpdate">2014-01-02 10:49:19</TD>
			</TR>
			<TR>
				<TH style="TEXT-ALIGN: left" noWrap>考评意见：</TH>
				<TD id="kpadvice">ff</TD>
			</TR>
			<TR>
				<TH style="TEXT-ALIGN: left" noWrap>受理结果：</TH>
				<TD id="resp"><B><FONT color=green></FONT></B></TD>
			</TR>
			<TR style="DISPLAY: none">
				<TH style="TEXT-ALIGN: left" noWrap>uidapply：</TH>
				<TD>1</TD>
			</TR>
			<TR>
				<TH style="TEXT-ALIGN: left" noWrap>用户类型：</TH>
				<TD>企业</TD>
			</TR>
			<TR>
				<TH style="TEXT-ALIGN: left" noWrap>受理日期：</TH>
				<TD id="respdate"></TD>
			</TR>
		</TBODY>
		<TFOOT>
			<TR height=50 align=center>
				<TD colSpan=2></TD>
			</TR>
		</TFOOT>
	</TABLE>
	<BR>
	
	<BR>
	<BR>
	<BR>
	<BR>
</body>

</html>

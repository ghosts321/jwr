<%@ page language="java" import="java.util.*,java.net.*" pageEncoding="UTF-8"%>
<%@include file="../../main.jsp"  %>
<%
String certnumber=request.getParameter("certnumber");
request.setAttribute("certnumber", certnumber);

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
	var number = $("#certnumber").val();
	var pid=$("#pid").val();
	$.ajax({
		type : "POST",
		async : false,
		url : "/jwr/enFileManage/getEnDetailAction.action?cid="+number+"&pid="+pid,
		success : function(returnValue) {
			resultData = returnValue;
			resultData = eval("("+resultData+")");
			$("#userId").html(resultData[0].userId);
			$("#admin").html(resultData[0].admin);
			$("#province").html(resultData[0].province);
			$("#name").html(resultData[0].name);
			$("#pid").html(resultData[0].pid);
			$("#legalp").html(resultData[0].legalp);
			$("#contact").html(resultData[0].contact);
			$("#mobile").html(resultData[0].mobile);
			$("#email").html(resultData[0].email);
			$("#grade").html(resultData[0].grade);
			$("#busType").html(resultData[0].busType);
			$("#type2").html(resultData[0].type2);
			$("#address").html(resultData[0].address);
			$("#tel").html(resultData[0].tel);
			$("#tax").html(resultData[0].tax);
			$("#safe").html(resultData[0].safe);
			$("#qual").html(resultData[0].qual);
			$("#license").html(resultData[0].license);
			$("#zpReport").html(resultData[0].report);
			$("#reNew").html(resultData[0].reNew);
			$("#orgId").html(resultData[0].orgId);
			$("#createDate").html(resultData[0].createdate);
			$("#fzDate").html(resultData[0].cdate);
			$("#orgId1").html(resultData[0].orgId1);
			$("#cid").html(resultData[0].cid);
			$("#auditDate").html(resultData[0].respDateReview);
			$("#adviceadviceReview").html(resultData[0].adviceReview);
			$("#advice").html(resultData[0].advice);
			$("#results").html(resultData[0].respReview);
			$("#respDate").html(resultData[0].respDate);
			$("#resp").html(resultData[0].resp);
			
		}
	});
});
</script>
</head>
<body>
	<TABLE class=wr3table border=1>
<CAPTION>交通运输企业申请 <U>大连万达集团总部</U></CAPTION>
<TBODY>
<TR>
<TH style="TEXT-ALIGN: left" noWrap>用户ID：</TH>
<TD>dl_wd</TD></TR>
<TR style="DISPLAY: none">
<TH style="TEXT-ALIGN: left" noWrap>用户密码：</TH>
<TD>e10adc3949ba59abbe56e057f20f883e</TD></TR>
<TR>
<TH style="TEXT-ALIGN: left" noWrap>主管机关：</TH>
<TD>大连交通协会</TD></TR>
<TR>
<TH style="TEXT-ALIGN: left" noWrap>所在省市：</TH>
<TD>天津市</TD></TR>
<TR>
<TH style="TEXT-ALIGN: left" noWrap>名称：</TH>
<TD>大连万达集团总部</TD></TR>
<TR>
<TH style="TEXT-ALIGN: left" noWrap>证件号：</TH>
<TD>19928971-X</TD></TR>
<TR>
<TH style="TEXT-ALIGN: left" noWrap>法人代表：</TH>
<TD>王某</TD></TR>
<TR>
<TH style="TEXT-ALIGN: left" noWrap>联系人姓名：</TH>
<TD>王某</TD></TR>
<TR>
<TH style="TEXT-ALIGN: left" noWrap>手机：</TH>
<TD>xx</TD></TR>
<TR>
<TH style="TEXT-ALIGN: left" noWrap>联系人邮箱：</TH>
<TD>xx</TD></TR>
<TR>
<TH style="TEXT-ALIGN: left" noWrap>等级：</TH>
<TD>二级</TD></TR>
<TR>
<TH style="TEXT-ALIGN: left" noWrap>业务类型：</TH>
<TD>道路运输</TD></TR>
<TR>
<TH style="TEXT-ALIGN: left" noWrap>业务类别：</TH>
<TD>道路运输普通货运</TD></TR>
<TR>
<TH style="TEXT-ALIGN: left" noWrap>通讯地址：</TH>
<TD>xx</TD></TR>
<TR>
<TH style="TEXT-ALIGN: left" noWrap>联系电话：</TH>
<TD>xx</TD></TR>
<TR>
<TH style="TEXT-ALIGN: left" noWrap>传真：</TH>
<TD>xx</TD></TR>
<TR>
<TH style="TEXT-ALIGN: left" noWrap>换证原因<B>（仅换证申请）</B>：</TH>
<TD>-- 无 --</TD></TR>
<TR>
<TH style="TEXT-ALIGN: left" noWrap>选择的2个考评机构：</TH>
<TD><A href="/c/esp/docv/org-apply/5264c17dcffbae6d2d2964f9" target=_blank>大连市交通考评机构</A>，<A href="/c/esp/docv/org-apply/5264e249cffb37d3460a8f02" target=_blank>大连市高开区交通第二考评机构</A></TD></TR>
<TR>
<TH style="TEXT-ALIGN: left" noWrap>日期：</TH>
<TD>2013-10-22 14:28:56</TD></TR>
<TR>
<TH style="TEXT-ALIGN: left" noWrap>考评结果：</TH>
<TD><B><FONT color=green>同 意</FONT></B></TD></TR>
<TR>
<TH style="TEXT-ALIGN: left" noWrap>指定的考评机构：</TH>
<TD><A href="/c/esp/docv/org-apply/2013-0702-000001" target=_blank><A href="/c/esp/docv/org-apply/5264c17dcffbae6d2d2964f9" target=_blank>大连市交通考评机构</A></A></TD></TR>
<TR>
<TH style="TEXT-ALIGN: left" noWrap>考评分数：</TH>
<TD>995</TD></TR>
<TR>
<TH style="TEXT-ALIGN: left" noWrap>处理意见：</TH>
<TD></TD></TR>
<TR>
<TH style="TEXT-ALIGN: left" noWrap>考评日期：</TH>
<TD>2014-01-02 10:49:19</TD></TR>
<TR>
<TH style="TEXT-ALIGN: left" noWrap>考评意见：</TH>
<TD>ff</TD></TR>
<TR>
<TH style="TEXT-ALIGN: left" noWrap>受理结果：</TH>
<TD><B><FONT color=green>同 意</FONT></B></TD></TR>
<TR style="DISPLAY: none">
<TH style="TEXT-ALIGN: left" noWrap>uidapply：</TH>
<TD>1</TD></TR>
<TR>
<TH style="TEXT-ALIGN: left" noWrap>用户类型：</TH>
<TD>企业</TD></TR>
<TR>
<TH style="TEXT-ALIGN: left" noWrap>受理日期：</TH>
<TD>2013-10-22 14:52:20</TD></TR></TBODY>
<TFOOT>
<TR height=50 align=center>
<TD colSpan=2><A id=undefined class="easyui-linkbutton l-btn" onclick=window.close(); href="#" jQuery16306954879511053458="1"><SPAN class=l-btn-left><SPAN class=l-btn-text>关闭</SPAN></SPAN></A></TD></TR></TFOOT></TABLE><BR><LABEL>第一步：</LABEL><A id=undefined class="easyui-linkbutton l-btn" onclick="" href="/c/esp/org-select-pn/52661b28cffb9e96475e5d18" target=_blank jQuery16306954879511053458="2"><SPAN class=l-btn-left><SPAN class=l-btn-text>考评员选择</SPAN></SPAN></A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<A id=undefined class="easyui-linkbutton l-btn" onclick="" href="/c/esp/stand/14?enid=52661b28cffb9e96475e5d18" target=_blank jQuery16306954879511053458="3"><SPAN class=l-btn-left><SPAN class=l-btn-text>企业考评打分</SPAN></SPAN></A><BR><BR><LABEL>第二步：</LABEL><BR><BR><LABEL>填写意见：</LABEL><TEXTAREA style="WIDTH: 600px" id=advice class="easyui-validatebox validatebox-text" jQuery16306954879511053458="6"></TEXTAREA><BR><BR><A id=undefined class="easyui-linkbutton l-btn" onclick="esp_org_en_apply('yes', '52661b28cffb9e96475e5d18')" href="#" jQuery16306954879511053458="4" iconCls="icon-ok"><SPAN class=l-btn-left><SPAN style="PADDING-LEFT: 20px" class="l-btn-text icon-ok">同 意</SPAN></SPAN></A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<A id=undefined class="easyui-linkbutton l-btn" onclick="esp_org_en_apply('no',  '52661b28cffb9e96475e5d18')" href="#" jQuery16306954879511053458="5" iconCls="icon-cancel"><SPAN class=l-btn-left><SPAN style="PADDING-LEFT: 20px" class="l-btn-text icon-cancel">不同意</SPAN></SPAN></A><BR><BR><BR><BR>
</body>

</html>

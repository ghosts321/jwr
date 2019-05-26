<%@ page language="java" import="java.util.*,java.net.*" pageEncoding="UTF-8"%>
<%@include file="../../main.jsp" %>
<%
			String userId= request.getSession().getAttribute("userid").toString();
			String pid= request.getSession().getAttribute("paperid").toString();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 
    <script type="text/javascript">
    var indexdata="";
    var totalSize="";
	var userId='<%=userId%>';
	var usertype='<%=request.getParameter("usertype")%>';
	 
    var gird;
    $.ajax({
	    type:"POST",
	    async:false,
	    data:{usertype:usertype},
	    url:"/jwr/bookUpdate/getUpdateListAction.action?usertype=en",
	    data:{ userId :userId},
	    success:function(returnValue){
	   		indexdata=eval("("+returnValue+")");
	    }
	});
     var postdata;
    //详细信息
    function itemclick(){
    var selected = gird.getSelected();
    if(gird.getSelected()==null){
    	alert("请选中一行");
    }else{
    	  var str = JSON2.stringify(selected);
    	  postdata=str;
        	$.ligerDialog.open({
            	url:'JSP/org/org/exchangeDetail.jsp?type=en',
            	width:500,
            	height:400,
            	title:'变更详细信息信息'
        	});
    	
   	 }
   	}
   	
   	   	function exportExcel(){
	   	 window.location.href="/jwr/orgListControl/exportAction.action";
   		 	}
   	
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
        $(function ()
        {
            window['g'] = 
           gird=$("#maingrid4").ligerGrid({
                columns: [ 
            { display: '变更原因', name: 'reason',  align: 'center',
            	render: function (item)
                {
           		 if(item.reason=="1"){return '企业法人代表变更的';}
           		 else if (item.reason=="2"){ return '企业名称变更的';}
                    else{return '企业地址变更的';}
                }},
            { display: '备案时间', name: 'cdate',  align: 'center'}, 
            { display: '受理结果', name: 'resp',  align: 'center'}, 
            { display: '受理日期', name: 'updateDate',  align: 'center'}], 
                data: indexdata,
                rownumbers: true,
                url: "",
                toolbar: { 
                	items: [
                	       
                            { text: '详细信息', click: itemclick, icon: 'modify' }
                	       ]
                },
                
//                 pageSize: 10,
				usePager:false,
                width: '60%', 
                height: '320', 
                checkbox: false
            });
           
            $("#pageloading").hide();
            
        });
        function trim(str){ //删除左右两端的空格
            return str.replace(/(^\s*)|(\s*$)/g, "");
            }
        
        function sendApply(){
        	if($("#content").val()==''||trim($("#content").val())==''){
        		alert("变更内容不能为空!");
        		return false;
        	}
        	document.forms[0].submit();
        }
        // 禁用鼠标右键
	document.onkeydown = function() {   
	     if (event.keyCode == 116) {   
	         event.keyCode = 0;   
	         event.returnValue = false;   
	     }   
	   };  
	  document.oncontextmenu = function() {   
	   	  event.returnValue = false;   
	   }; 
    </script>
</head>

<body style="padding:10px;">
	<h1>申请变更备案</h1>
	<DIV class=eui-info>
		<DIV class="eui-tip icon-tip"></DIV>
		<DIV>已提交的<span id="zp">0</span>条变更备案申请：</DIV>
	</DIV>
	
	<div id="maingrid4" style="margin: 0; padding: 0"></div>
	<div style="display: none;"></div>
<div style="height: 20px"></div>
	<FORM id="fm1" method="POST" action="/jwr/bookUpdate/insertUpdateContentAction.action?type=en">
		<TABLE style="FONT-FAMILY: 微软雅黑; FONT-SIZE: 16px">
			<CAPTION style="margin-left: 150px;">提交新的变更备案申请</CAPTION>
			<TBODY>
				<TR>
					<TD><LABEL>选择变更原因：</LABEL></TD>
					<TD><SELECT name="exchange.reason" id="reason" value="1">
							<OPTION selected value=1>企业法人代表变更的</OPTION>
							<OPTION value=2>企业名称变更的</OPTION>
							<OPTION value=3>企业地址变更的</OPTION>
							</SELECT>
				</TR>
				<TR>
					<TD><LABEL>变更内容：</LABEL></TD>
					<TD><TEXTAREA style="WIDTH: 362px"
							class="easyui-validatebox validatebox-text" id="content"name="exchange.content"
							 ></TEXTAREA></TD>
				</TR>
				<TR>
					<TD><input type="hidden" name="exchange.type" value="en"/></TD>
				</TR>
			</TBODY>
			<TFOOT>
				<TR>
					<TD
						style="PADDING-BOTTOM: 10px; PADDING-LEFT: 10px; PADDING-RIGHT: 10px; PADDING-TOP: 10px"
						colSpan=2 align=right><A 
						class="easyui-linkbutton l-btn" onclick="sendApply()"
						 ><SPAN class=l-btn-left><SPAN
								class=l-btn-text>提交申请</SPAN></SPAN></A></TD>
				</TR>
			</TFOOT>
		</TABLE>
	</FORM>
</body>
</html>

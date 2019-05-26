<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="../../main.jsp" %>
<%
			String userId=(String)request.getSession().getAttribute("userid");
			String pid=(String)request.getSession().getAttribute("pid");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
   
    <script type="text/javascript">
    var indexdata="";
    var totalSize="";
	var userId='<%=userId%>';
    var gird;
    var ligerwindow;
	
    //详细信息
    //页面中声明一个变量
  	var postdata;
    function itemclick(){
    var selected = gird.getSelected();
    if(gird.getSelected()==null){
    	alert("请选中一行");
    }else{
    	  var str = JSON2.stringify(selected);
    	  postdata=str;
        	ligerwindow=$.ligerDialog.open({
        		url:'JSP/org/org/exchangeDetail.jsp',
		     	width:500,
		     	height:400,
		     	title:'考评机构<font color="red">'+gird.getSelected().userid+'</font>变更详细信息'
		 	});
	   ;
   	 }
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
                 if(item.reason=='1'){return '（一）法定代表人变更的';}
                 else if (item.reason=='2'){ return '（二）机构名称变更的';}
                 else if (item.reason=='3'){ return '（三）机构地址变更的';}
                 else if (item.reason=='4'){ return '（四）停业、破产或有其他原因终止业务的';}
                 else if (item.reason=='5'){ return '（五）从事专职管理和考评工作的人员发生重大变化的';}
                 }},
            { display: '备案时间', name: 'cdate',  align: 'center' },
            { display: '受理结果', name: 'resp',  align: 'center' }, 
            { display: '受理日期', name: 'updateDate',  align: 'center' }], 
                data: indexdata,
                rownumbers: true,
                url:"/jwr/bookUpdate/getUpdateListAction.action",
                toolbar: { 
                	items: [
                            { text: '详细信息', click: itemclick, icon: 'modify' }
                	       ]
                },
				usePager:false,
                width: '100%', 
                height: '320', 
                checkbox: false
            });
            $.ajax({
        	    type:"POST",
        	    async:false,
        	    url:"/jwr/bookUpdate/getUpdateListAction.action",
        	    data:{'userId':userId},
        	    success:function(returnValue){
        	   		indexdata=returnValue;
        	    }
        	});
            
            $("#pageloading").hide();
            if(indexdata!=null||indexdata!=''){
            	$("#zp").text(eval("("+indexdata+")").Rows.length);
            }
        });
        
        
        function sendApply(){
        	var content=  document.getElementById('exchange.content').value;
        	if(content.length >400){
  				alert("输入变更内容字数不能超过400个，已输入"+content.length+"个字!");
  				return;
  			}
  			if(content==null || content==""){
  				alert("变更内容不能为空！");
  				return;
  			}
         	document.forms[0].submit();
        }
        
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
	<FORM id=fm1 method="POST" action="/jwr/bookUpdate/insertUpdateContentAction.action">
	<input type="hidden" value="org"  name="exchange.type"/>
		<TABLE style="FONT-FAMILY: 微软雅黑; FONT-SIZE: 16px">
			<CAPTION style="margin-left: 150px;">提交新的变更备案申请</CAPTION>
			<TBODY>
				<TR>
					<TD><LABEL>选择变更原因：</LABEL></TD>
					<TD><SELECT name=exchange.reason><OPTION selected value=1>（一）法定代表人变更的</OPTION>
							<OPTION value=2>（二）机构名称变更的</OPTION>
							<OPTION value=3>（三）机构地址变更的</OPTION>
							<OPTION value=4>（四）停业、破产或有其他原因终止业务的</OPTION>
							<OPTION value=5>（五）从事专职管理和考评工作的人员发生重大变化的</OPTION></SELECT></TD>
				</TR>
				<TR>
					<TD><LABEL>变更内容：</LABEL></TD>
					<TD><TEXTAREA style="WIDTH: 362px"
							class="easyui-validatebox validatebox-text" name=exchange.content id="exchange.content"
							jQuery163037278563355713256="53"></TEXTAREA></TD>
				</TR>
			</TBODY>
			<TFOOT>
				<TR>
					<TD
						style="PADDING-BOTTOM: 10px; PADDING-LEFT: 10px; PADDING-RIGHT: 10px; PADDING-TOP: 10px"
						colSpan=2 align=right><A id=undefined
						class="easyui-linkbutton l-btn" onclick="sendApply()"
						jQuery163037278563355713256="52"><SPAN class=l-btn-left><SPAN
								class=l-btn-text>提交申请</SPAN></SPAN></A></TD>
				</TR>
			</TFOOT>
		</TABLE>
	</FORM>
</body>
</html>

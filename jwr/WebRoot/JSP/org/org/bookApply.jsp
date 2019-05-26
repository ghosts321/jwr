<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>
<%
			String userId=(String)request.getSession().getAttribute("userid");
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
    function itemclick(){
    if(gird.getSelected()==null){
    	alert("请选中一行");
    }else{
 	 	  var selValue=gird.getSelected().id;
        	ligerwindow=$.ligerDialog.open({
        		url:'JSP/org/org/scanDetail.jsp?id='+selValue,
		     	width:820,
		     	height:560,
		     	title:'考评机构<font color="red">'+gird.getSelected().orgname+'</font>详细信息'
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
            { display: '日期', name: 'createdate',  align: 'center' },
            { display: '业务类型', name: 'typename',  align: 'center' },
            { display: '受理结果', name: 'resp',  heightAlign: 'center' },
            { display: '受理日期', name: 'respdate',    align: 'center' }
//             { display: '是否有效', name: 'del',    align: 'center' ,
//             	render: function (item)
//                 {
            		 
//            		 if(item.del=="1"){return '无效';}
//            		 else if(item.respdate==""){return '无效';}
//            		 else{ return '有效';}
//                 }}
            ], 
                rownumbers: true,
                url:"/jwr/bookApply/getBookApplyAction.action",
                parms:{userId:userId},
                toolbar: { 
               	items: [
               	       
                           { text: '详细信息', click: itemclick, icon: 'modify' }
               	       ]
                },
                width: '1000', 
                height: '320', 
                checkbox: false
            });
            $("#pageloading").hide();
        });
        function sendApply(){
			 window.location.href="/jwr/respInfo/getOrgRegInfoAction.action";
        }
        
    </script>
</head>

<body style="padding:10px;">
	<h1>考评机构资质证书申请</h1>
	<DIV class=eui-info>
		<DIV class="eui-tip icon-tip"></DIV>
		<DIV>已通过报名申请，可进行考评机构资质证书申请。</DIV>
	</DIV>
	<DIV><A style="MARGIN: 10px" id=ap class="easyui-linkbutton l-btn" onclick="sendApply()" ><SPAN class=l-btn-left><SPAN class=l-btn-text>进行证书申请</SPAN></SPAN></A></DIV>
	<div style="margin:10px auto;"></div>
	<div class="l-loading" style="display: block;" id="pageloading"></div>
	
	<div id="maingrid4" style="margin: 0; padding: 0"></div>
	<div style="display: none;"></div>
</body>
</html>

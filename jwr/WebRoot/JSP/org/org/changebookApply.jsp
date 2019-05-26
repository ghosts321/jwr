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
    var gird1;
   
	
    //详细信息
    function itemclick(){
    if(gird.getSelected()==null){
    	alert("请选中一行");
    }else{
 	 	  var selValue=gird.getSelected().certnumber;
        	ligerwindow=$.ligerDialog.open({
        		url:'JSP/org/org/bookDetailExchange.jsp?certnumber='+selValue,
 		     	width:880,
 		     	height:700,
 		     	title:'考评机构详细信息'
 		 	});
 	   ;
   	 }
   	}
    //详细信息
    function itemclick1(){
    if(gird1.getSelected()==null){
    	alert("请选中一行");
    }else{
 	 	  var selValue=gird1.getSelected().certnumber;
 	 	  var orgid=gird1.getSelected().orgid;
        	ligerwindow=$.ligerDialog.open({
        		url:'JSP/org/org/bookDetailExchange1.jsp?certnumber='+selValue+'&orgid='+orgid,
 		     	width:880,
 		     	height:700,
 		     	title:'考评机构详细信息'
 		 	});
 	   ;
   	 }
   	}
   	
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
        $(initLiger);
        function  initLiger(parms) {
            window['g'] = 
           gird=$("#maingrid4").ligerGrid({
                columns: [ 
            { display: '证书号', name: 'certnumber',  align: 'center' },
            { display: '发证时间', name: 'fzdate',  align: 'center' },
            { display: '业务类型', name: 'filetext',  heightAlign: 'center' },
            { display: '证书到期日', name: 'stopdate',    align: 'center' }], 
                rownumbers: true,
                parms:{userId:userId},
                url:"/jwr/bookChange/getBookChangeAction.action",
                toolbar: { 
                	items: [
                	       
                            { text: '详细信息', click: itemclick, icon: 'modify' }
                	       ]
                },
                width: '800', 
                height: '320', 
                checkbox: false
            });
            $("#pageloading").hide();
        }
        
        
        function sendApply(){
			 window.location.href="/jwr/JSP/org/org/orgReg.jsp";
        }
        $(initLiger2);
        function  initLiger2(parms) {
            window['g'] = 
           gird1=$("#maingrid5").ligerGrid({
                columns: [ 
            { display: '证书号', name: 'certnumber',  align: 'center' },
            { display: '发证时间', name: 'fzdate',  align: 'center' },
            { display: '业务类型', name: 'filetext',  heightAlign: 'center' },
            { display: '受理结果', name: 'resp',  heightAlign: 'center' },
            { display: '证书到期日', name: 'stopdate',    align: 'center' }], 
                rownumbers: true,
                url:"/jwr/bookChange/getBookChange1Action.action",
                parms:{userId:userId},
                toolbar: { 
                	items: [
                	       
                            { text: '详细信息', click: itemclick1, icon: 'modify' }
                	       ]
                },
                width: '800', 
                height: '320', 
                checkbox: false
            });
           
            $("#pageloading").hide();
        }
    </script>
</head>

<body style="padding:10px;">
	<h1>换证申请</h1>
	<div style="height: 10"></div>	
	<H2>目前已有的 《考评机构资质证书》：</H2>
	<div style="height: 10"></div>	
	<DIV class=eui-info>
		<DIV class="eui-tip icon-tip"></DIV>
			<DIV>请点击查看详情并进行换证申请</DIV>
	</DIV>
	
<!-- 	<div style="margin:10px auto;"></div> -->
	<div class="l-loading" style="display: block;" id="pageloading"></div>
	<div id="maingrid4" style="margin: 0; padding: 0"></div>
	<H2>考评机构换证申请列表：</H2>
	<div id="maingrid5" style="margin: 0; padding: 0"></div>
	<div style="display: none;"></div>
</body>
</html>

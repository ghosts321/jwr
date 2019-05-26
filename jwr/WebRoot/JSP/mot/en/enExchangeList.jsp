<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>
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
    var indexdata2="";
    var totalSize="";
	  var ligerwindow;
    var gird2;
	//查看详细信息
    function view(){
     	var selected = gird2.getSelected();
         if (!selected) { 
        	 alert('请选择行');
         	return; 
         }else{
        	 var id=selected.id;
		 	ligerwindow=$.ligerDialog.open({
		 		url:'JSP/mot/en/ExchangeDetail.jsp?id='+id,
		     	width:650,
		     	height:600,
		     	title:'企业<font color="red">'+gird2.getSelected().name+'</font>详细信息'
		 	});
	  // ;
         }
     }
   	   	
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
        $(initLiger);
        function  initLiger() {
            window['g'] = 
           gird2= $("#maingrid2").ligerGrid({
                     columns: [ 
                 { display: '交通运输企业名称', name: 'name',  align: 'center' },
                 { display: '原因', name: 'reason',  align: 'center' ,
                	 render: function (item)
                     {
                		 if(item.reason=="1"){return '企业法人代表变更的';}
                		 else if (item.reason=="2"){ return '企业名称变更的';}
                         else{return '企业地址变更的';}
                     }},
                 { display: '申请日期', name: 'cdate',  heightAlign: 'center' },
                 { display: '受理结果', name: 'resp',    align: 'center' }, 
                 { display: '受理日期', name: 'updateDate',    align: 'center' }], 
                     url:'/jwr/orgExchange/getOrgExchangeListAction.action?type=en',
                     rownumbers: true,
                     toolbar: { 
                     	items: [
                     	       
                                 { text: '详细信息', click: view, icon: 'modify' }
                     	       ]
                     },
                     width: '100%', 
                     height: '340', 
                     checkbox: false
                 });
                
                 $("#pageloading2").hide();
        }
      
        
    </script>
</head>

<body style="padding:10px;">
	
	
	<h1>交通运输企业变更备案受理</h1>
	<div style="height: 10px"></div>

	<div style="margin:10px auto;"></div>
	<div class="l-loading" style="display: block;" id="pageloading2"></div>
	
	<div id="maingrid2" style="margin: 0; padding: 0"></div>
</body>
</html>

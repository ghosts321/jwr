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
    var type="org";
	
	//查看详细信息
    function view(){
     	var selected = gird2.getSelected();
         if (!selected) { 
        	 alert('请选择行');
         	return; 
         }else{
        	var id=selected.id;
		 	ligerwindow=$.ligerDialog.open({
		 		url:'JSP/mot/resp/scanCertChangeDetail.jsp?id='+id,
		     	width:910,
		     	height:800,
		     	title:'考评机构<font color="red">'+gird2.getSelected().orgname+'</font>详细信息'
		 	});
	   ;
         }
     }
   	   	
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
        $(function ()
        {
            window['g'] = 
           gird2= $("#maingrid2").ligerGrid({
                     columns: [ 
                 { display: '名称', name: 'motname',  heightAlign: 'center' },
                 { display: '日期', name: 'createdate',    align: 'center' },
                 { display: '业务类型', name: 'uppername',    align: 'center' },
                 { display: '受理结果', name: 'resp',    align: 'center' },
                 { display: '受理受理日期', name: 'respdate',    align: 'center' },
                 { display: '换证原因（仅换证申请）', name: 'renew',    align: 'center' }], 
                     rownumbers: true,
                     parms:{type:type},
                     url:"/jwr/certChange/getCertChangeListAction.action",
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
        });
      
    </script>
</head>

<body style="padding:10px;">
	
	
	<h1>考评机构换证申请受理</h1>
	<div style="margin:10px auto;"></div>
	<div class="l-loading" style="display: block;" id="pageloading2"></div>
	
	<div id="maingrid2" style="margin: 0; padding: 0"></div>
</body>
</html>

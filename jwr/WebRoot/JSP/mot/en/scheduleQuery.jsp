<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../main.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'pnApply.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

    <script type="text/javascript">
    var indexdata="";
    var totalSize="";
    
    $.ajax({
	    type:"POST",
	    async:false,
	    url:"/jwr/enControl/getEnApplyListAction.action",
	    success:function(returnValue){
	   		indexdata=returnValue;
	    }
	});
    //删除del以及其值
    if(indexdata!=""){
    	var sss= indexdata;
    	indexdata = eval("("+sss+")");
    	totalSize = indexdata.Total;
    	//alert(indexdata.Rows[0].del);
    	for(var sdd in indexdata.Rows){
    		$.each(indexdata.Rows[sdd], function(key,value){
    			delete indexdata.Rows[sdd].del;
        	});
    	}
    }
    
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
        $(function ()
        {
            window['g'] = 
            grid=$("#maingrid4").ligerGrid({
                columns: [
            { display: '企业名称', name: 'enname',    align: 'center',width:'40%' },
            { display: '业务类型', name: 'filetext',  align: 'center',width:'35%' },
            { display: '申请日期', name: 'date',  heightAlign: 'center',width:'21%' }], 
                data: indexdata,
                rownumbers: true,
                url: "",
                toolbar: { 
                	items: [
                            { text: '进度查看', click: view, icon: 'modify' }
                	       ]
                },
                pageSize: 10,
                height: '95%', 
                checkbox: false
            });
            $("#pageloading").hide();
        });
        function itemclick(){
        	
        }
        //页面中声明一个变量
  		var postdata;
        function view(){
        	var selected = grid.getSelected();
            if (!selected) { 
            	alert('请点击要查看的申请记录');
            	return; 
            }else{
            	var name = selected.name;
            	var str = JSON2.stringify(selected);
            	postdata=str;
            	ligerwindow=$.ligerDialog.open({
                 	url:'JSP/mot/en/schedule.jsp?&flag=1',
                 	width:1000,
                 	height:420,
                 	title:'交通运输企业<font color="red">'+selected.enname+'</font>申请进度详情'
             	});
            	//;
            }
        }
    </script>
</head>

<body style="padding:10px;">
	<h1>申请进度查询</h1>
	<div style="margin:10px auto;"></div>
	<div class="l-loading" style="display: block;" id="pageloading"></div>
	
	<div id="maingrid4" style="margin: 0; padding: 0"></div>
	<div style="display: none;"></div>
</body>
</html>

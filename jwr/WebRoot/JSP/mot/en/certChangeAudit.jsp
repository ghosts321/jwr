<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../main.jsp" %>


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
    
    $.ajax({
	    type:"POST",
	    async:false,
	    url:"/jwr/enControl/getEnChangeAppListAction.action",
	    success:function(returnValue){
	   		indexdata=eval("("+returnValue+")");
	    }
	});
    function exportFile(){
    	window.location.href="/jwr/enControl/exportAction.action";
    }
    //页面中声明一个变量
  	var postdata;
    var ligerWindows;
    function view(){
    	var selected = grid.getSelected();
        if (!selected) { 
        	alert('请选择行');
        	return; 
        }else{
        	var name = selected.enname;
        	var str = JSON2.stringify(selected);
        	postdata=str;
        	ligerWindows=$.ligerDialog.open({
             	url:'JSP/mot/en/enChangeDetial.jsp?indexdata='+encodeURI(encodeURI(str)),
             	width:750,
             	height:600,
             	title:'交通运输企业换证申请<font color="red">'+name+'</font>详细信息'
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
            { display: '名称', name: 'enname',  align: 'center' },
            { display: '日期', name: 'date',  heightAlign: 'center' },
            { display: '业务类型', name: 'filetext',    align: 'center' },
            { display: '换证原因', name: 'reNew',  align: 'center' },
            { display: '处理结果', name: 'changeresault',  align: 'center' ,
            	render: function (item)
                {
          		 if(item.changeresault=="0"){return '不同意';}
          		 else if (item.changeresault=="1"){ return '同意';}
                 else{return '尚未处理';}
               }  },
            { display: '处理时间', name: 'changedate',  align: 'center' } 
            ], 
                rownumbers: true,
                url:"/jwr/enControl/getEnChangeAppListAction.action",
                toolbar: { 
                	items: [
                	       
                            { text: '详细信息', click: view, icon: 'modify' }
                	       ]
                },
                
                pageSize: 10,
                width: '100%', 
                height: '320', 
                checkbox: false
            });
            $("#pageloading").hide();
        });
    </script>
</head>

<body style="padding:10px;">
	<h1>交通运输企业换证申请受理</h1>
	<DIV class=eui-info>
		<DIV class="eui-tip icon-tip"></DIV>
		<DIV>请点击详细信息进行处理</DIV>
	</DIV>
	<div style="margin:10px auto;"></div>
	<div class="l-loading" style="display: block;" id="pageloading"></div>
	
	<div id="maingrid4" style="margin: 0; padding: 0"></div>
	<div style="display: none;"></div>
</body>
</html>

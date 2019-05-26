<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../main.jsp" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

	    
    <script type="text/javascript">
    var indexdata="";
    var totalSize="";
    var gird;
    var len;
	//页面中声明一个变量
  	var postdata;
    //详细信息
   /***/
    function itemclick(){
   	var selected = gird.getSelected();
    if(selected==null){
    	alert("请选中一行");
    }else{
    	var name = selected.enname;
    	var str = JSON2.stringify(selected);
    	postdata=str;
    	manager1 = $.ligerDialog.open({
         	url:'JSP/org/en/enManageTail.jsp?flag=1',
         	width:750,
         	height:420,
         	title:'交通运输企业申请<font color="red">'+name+'</font>详细信息'
     	});
    	
   	 }
   	}

    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
        $(initLiger);
        function  initLiger(parms) {
            window['g'] = 
           gird=$("#maingrid4").ligerGrid({
                columns: [ 
            { display: '名称', name: 'enname',  align: 'center' },
            { display: '业务类别', name: 'filetext',  align: 'center' },
            { display: '等级', name: 'grade',  heightAlign: 'center',  
            	render: function (item)
                {
	       		 if(item.grade=="2"){return '二级';}
	       		 else if (item.grade=="3"){ return '三级';}
            	}},
            { display: '日期', name: 'createdate',    align: 'center'},
            { display: '受理结果', name: 'results',    align: 'center',
            		render: function (item)
                {
	       		 if(item.results=="1"){return '同意 ';}
	       		 else { return '不同意 ';}
            	}
            },
            { display: '受理日期', name: 'respdate',    align: 'center' ,width:'10%'}], 
                rownumbers: true,
                url:"/jwr/enFileManage/getEnFileManageListAction.action",
                toolbar: { 
                	items: [
                	       
                            { text: '详情', click: itemclick, icon: 'modify' }
                	       ]
                },
                width: '90%', 
                height: '60%', 
                checkbox: false
            });
           
            $("#pageloading").hide();
            $("#row2").text(len);
        }
        
    </script>
</head>

<body style="padding:10px;">
	<h1>本考评机构考评过的企业档案（<span id="row2"><script type="text/javascript">totalSize</script></span>条）</h1>
	<div class="l-loading" style="display: block;" id="pageloading"></div>
	
	<div id="maingrid4" style="margin: 0; padding: 0"></div>
	<div style="display: none;"></div>
</body>
</html>

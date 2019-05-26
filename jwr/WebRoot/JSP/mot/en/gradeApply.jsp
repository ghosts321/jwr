<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../main.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'pnApply.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

    <script type="text/javascript">
    var indexdata="";
    var totalSize="";
    
     //页面中声明一个变量
  	var postdata,manager1,ligerwindow; 
    function view(){
    	var selected = grid.getSelected();
        if (!selected) { 
        	alert('请选择行');
        	return; 
        }else{
        	var name = selected.name;
        	var str = JSON2.stringify(selected);
        	postdata=str;
        	manager1 = $.ligerDialog.open({
             	url:'JSP/mot/en/enBaseTail.jsp?flag=1',
             	width:750,
             	height:600,
             	title:'交通运输企业申请<font color="red">'+grid.getSelected().enname+'</font>详细信息'
         	});
        }
    }
    //页面中声明一个变量
    function update(){
    	var selected = grid.getSelected();
        if (!selected) { 
        	alert('请选择行');
        	return; 
        }else{
        	var name = selected.name;
        	var str = JSON2.stringify(selected);
        	postdata=str;
        	ligerwindow = $.ligerDialog.open({
             	url:'/jwr/enControl/enUpdateApplyAction.action?id='+selected.id+'&flag=1',
             	width:750,
             	height:600,
             	title:'交通运输企业申请<font color="red">'+grid.getSelected().enname+'</font>修改信息'
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
            { display: '日期', name: 'date',    align: 'center' ,width:'20%'},
            { display: '业务类别', name: 'filetext',  align: 'center' ,width:'30%'},
            { display: '受理结果', name: 'resp',  align: 'center',width:'15%',
            	 render: function (item)
                 {
            		 if(item.resp==""){return '尚未处理';}
            		 else if (parseInt(item.resp) == 0){ return '拒绝';}
                     else{return '通过';}
                 }},
            { display: '受理日期', name: 'auditdate',  heightAlign: 'center',width:'17%',
            	 render: function (item)
                 {
            		 if(item.auditdate==""){return '尚未处理';}
                     else{return item.auditdate;}
                 }
               }], 
                rownumbers: true,
                url: "/jwr/enControl/getEnApplyListAction.action",
                toolbar: { 
                	items: [
                            { text: '查看', click: view, icon: 'modify' },
							{ text: '修改', click: update, icon: 'update' }
                	       ]
                },
                width: '100%', 
                height: '100%', 
                checkbox: false
            });
            $("#pageloading").hide();
        });

    function getqypf(){
    	if(confirm("请检查是否提交对应等级和专业的达标自评!")){
	   		location.href="enControl/enFirstApplyAction.action"
    	}
    }
    </script>
</head>

<body style="padding:10px;">
	<h1>企业达标等级证书申请：</h1>
	<DIV class=eui-info>
		<DIV class="eui-tip icon-tip"></DIV>
		<DIV>已通过报名申请,可进行企业达标等级证书申请</DIV>
	</DIV>
	<a class="easyui-linkbutton l-btn" onclick="javascript:getqypf()" 
		style="margin:10px"> <span class="l-btn-left">
			<span class="l-btn-text">企业达标等级证书申请</span>
	</span>
	</a>
	<div style="margin:10px auto;"></div>
	<div class="l-loading" style="display: block;" id="pageloading"></div>
	
	<div id="maingrid4" style="margin: 0; padding: 0"></div>
	<div style="display: none;"></div>
</body>
</html>

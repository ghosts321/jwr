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
    var ligerwindow;
    
    function exportFile(){
    	window.location.href="/jwr/enControl/exportAction.action";
    }
    //页面中声明一个变量
  	var postdata;
    function view(){
    	var selected = grid.getSelected();
        if (!selected) { 
        	alert('请选择行');
        	return; 
        }else{
        	var name = selected.name;
        	var str = JSON2.stringify(selected);
        	postdata=str;
        	ligerwindow=$.ligerDialog.open({
        		url:'JSP/mot/en/enApplyFlowtail.jsp?flag=1',
             	width:900,
             	height:1350,
             	title:'交通运输企业申请<font color="red">'+grid.getSelected().enname+'</font>详细信息'
 		 	});
 	  // ;
        }
    }
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
        $(initLiger);
        function initLiger(parms)
        {
            window['g'] = 
            grid=$("#maingrid4").ligerGrid({
                columns: [ 
            { display: '名称', name: 'enname',  align: 'center' ,width:'120'},
            { display: '业务类别', name: 'filetext',  heightAlign: 'center' ,width:'120'},
            { display: '日期', name: 'date',    align: 'center' ,width:'120'},
            { display: '自评分数', name: 'selfScore',  align: 'center' ,width:'120'}, 
            { display: '考评分数', name: 'kaoScore',  align: 'center' ,width:'120'},
            { display: '受理结果', name: 'respResult',  align: 'center' ,width:'120',
            	render: function (item)
                {
           		 if(item.respResult==""){return '尚未处理';}
           		 else if (parseInt(item.respResult) == 0){ return '拒绝';}
                    else{return '通过';}
                }},
            { display: '考评结果', name: 'orgresult',  align: 'center' ,width:'120',
            	render: function (item)
                {
           		 if(item.orgresult==""){return '尚未处理';}
           		 else if (parseInt(item.orgresult) == 0){ return '拒绝';}
                    else{return '通过';}
                }},
            { display: '审核结果', name: 'auditResult',  align: 'center',width:'120' ,
            	render: function (item)
                {
           		 if(item.auditResult==""){return '尚未处理';}
           		 else if (parseInt(item.auditResult) == 0){ return '拒绝';}
           		 else if (parseInt(item.auditResult) == 1){ return '通过';}
           		 else if (parseInt(item.auditResult) == 2){ return '已初审核';}
                }}], 
                //data: indexdata,
                url:"/jwr/enControl/getEnAuditListAction.action",
                parms:parms,
                rownumbers: true,
                toolbar: { 
                	items: [
                            { text: '详细信息', click: view, icon: 'modify' }
                	       ]
                },
                width: '100%', 
                height: '320', 
                checkbox: false
            });
            $("#pageloading").hide();
           
        }
    </script>
</head>

<body style="padding:10px;">
	<h1>企业考评结论审核</h1>
	<DIV class=eui-info>
		<DIV class="eui-tip icon-tip"></DIV>
		<DIV>企业考评结论受理：（同意并在本系统实时公示，7天到期自动通过可发证）/（同意并在本系统实时公示，7天到期有举报且情况属实，退到考评机构）/（不同意+意见退到考评机构和企业）</DIV>
	</DIV>
	<div style="margin:10px auto;"></div>
	<div class="l-loading" style="display: block;" id="pageloading"></div>
	<h2>待审核企业</h2>
	<div id="maingrid4" style="margin: 0; padding: 0"></div>
	<div style="margin:10px auto;"></div>
	<h2>公示期满可发证企业一览</h2>
	<DIV class=eui-info>
		<DIV class="eui-tip icon-tip"></DIV>
		<DIV>无公示期满的企业</DIV>
	</DIV>
	
</body>
</html>

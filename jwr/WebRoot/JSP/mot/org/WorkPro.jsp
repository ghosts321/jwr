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
    var gird;
    
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
        $(initLiger);
        function  initLiger(parms) {
            window['g'] = 
            gird=$("#maingrid4").ligerGrid({
                columns: [ 
            { display: '指定的考评机构', name: 'orgname',  align: 'center' },
            { display: '名称', name: 'enname',  heightAlign: 'center' },
            { display: '业务类别', name: 'filetext',    align: 'center' },
            { display: '等级', name: 'grade',    align: 'center',
            	render: function (item)
                {
           		 if(item.grade=="2"){return '二级';}
           		 else if (item.grade=="3"){ return '三级';}
                    else{return ' ';}
                }	
            },
            { display: '日期', name: 'createdate',    align: 'center' },
            { display: '主管机关', name: 'motname',    align: 'center' }
            
            ], 
                url:"/jwr/orgYearReport/getWorkProListAction.action",
                width: '800', 
                height: '340', 
                rownumbers: true,
                checkbox: false
            });
            $("#pageloading").hide();
        }
    </script>
</head>

<body style="padding:10px;">
	<h1>考评机构考评情况汇总表</h1>
	
	<div style="margin:10px auto;"></div>
	<div class="l-loading" style="display: block;" id="pageloading"></div>
	
	<div id="maingrid4" style="margin: 0; padding: 0"></div>
	<div style="display: none;"></div>
	
</body>
</html>

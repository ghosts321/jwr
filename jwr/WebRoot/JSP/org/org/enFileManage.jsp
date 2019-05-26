<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>
<%
	String userId = (String) request.getSession()
			.getAttribute("userid");
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
var parttimeData="",pneduData="",pnTrainData="",parttimeWin,pneduWin,pnTrainWin;
$(function(){
	//本机构专兼职考评员ajax
	$.ajax({
	    type:"POST",
	    async:false,
	    url:"/jwr/enFileManage2/parttimeDataAction.action",
	    success:function(returnValue){
	   		parttimeData=returnValue;
	   		parttimeData = eval("("+parttimeData+")");
	    }
	});
	//考评员学历一览AJAX
	$.ajax({
	    type:"POST",
	    async:false,
	    url:"/jwr/enFileManage2/pneduDataAction.action",
	    success:function(returnValue){
	   		pneduData=returnValue;
	   		pneduData = eval("("+pneduData+")");
	    }
	});
	//考评员培训考试AJAX
	$.ajax({
	    type:"POST",
	    async:false,
	    url:"/jwr/enFileManage2/pnTrainDataAction.action",
	    success:function(returnValue){
	   		pnTrainData=returnValue;
	   		pnTrainData = eval("("+pnTrainData+")");
	    }
	});
	window['g'] = 
            parttimeWin = $("#parttime").ligerGrid({
                columns: [ 
	            { display: '专兼职', name: 'parttime',width:100,align: 'center'  },
	            { display: '数量小计', name: 'total',width:200, align: 'center'  }], 
                data: parttimeData,
                width:'90%',
                height: 'auto',
                usePager:false,
                rownumbers: true
            });
    window['g'] = 
            pneduWin = $("#edu").ligerGrid({
                columns: [ 
	            { display: '学历', name: 'edu',width:100,align: 'center'  },
	            { display: '数量小计', name: 'total',width:200, align: 'center'  }], 
                data: pneduData,
                width:'90%',
                height: 'auto',
                usePager:false,
                rownumbers: true
            });
    window['g'] = 
            pnTrainWin = $("#resultexam").ligerGrid({
                columns: [ 
	            { display: '考试时间', name: 'exam_date',width:100,align: 'center'  },
	            { display: '数量小计', name: 'total',width:200, align: 'center'  }], 
                data: pnTrainData,
                height: 'auto',
                width:'90%',
                usePager:false,
                rownumbers: true
            });
});
</script>
</head>

<body style="padding:10px;">
	<div style="padding: 20px; width: 95%; height: 88%;" split="false"
		region="center" border="false"
		class="layout-body panel-body panel-body-noheader panel-body-noborder"
		title="">
		<h2>本机构专兼职考评员：</h2>
		<div id="parttime" style="margin: 5px;"></div>
		<h2>考评员学历一览：</h2>
		<div id="edu" style="margin: 5px;"></div>
		<h2>考评员培训考试：</h2>
		<div id="resultexam" style="margin: 5px;"></div>
	</div>
</body>
</html>

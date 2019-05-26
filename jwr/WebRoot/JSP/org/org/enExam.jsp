<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp"%>
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
	$(initLiger);
    function  initLiger(parms){
    	window['g'] = 
            manager = 
            $("#result").ligerGrid({
                columns: [ 
            { display: '名称', name: 'pnname',  align: 'center' },
            { display: '业务类型', name: 'bustype',    align: 'center',render:function(item){return getBusTypeVal(item.bustype)==null?item.bustype:getBusTypeVal(item.bustype)}},
            { display: '培训合格证', name: 'train_id',    align: 'center' },
            { display: '开始日期', name: 'train_start',    align: 'center' },
            { display: '结束日期', name: 'train_end',    align: 'center' },
            { display: '培训学时', name: 'train_hour',    align: 'center' },
            { display: '考试日期', name: 'exam_date',    align: 'center' },
            { display: '考试分分数', name: 'exam_score',    align: 'center' }
            ], 
            rownumbers: true,
            url:"/jwr/mottrain/orgPnTrainAction.action",
            width: '100%', 
            height: '60%'
            });
    	 $("#pageloading").hide();
    }
	
</script>
</head>

<body style="padding:10px;">
	<div style="padding: 20px; width: 95%; height: 91%;" split="false"
		region="center" border="false"
		class="layout-body panel-body panel-body-noheader panel-body-noborder"
		title="">
		<h1>本机构考评员培训、考试情况一览</h1>
		<h2>培训时间，培训学时（不少于24个学时），培训类别，培训合格证号</h2>
		<div>注：由省级交通运输主管机关、长江和珠江航务管理局按管辖范围负责组织实施培训、考试工作。</div>
		<br>
		<div id="result"></div>
	</div>
</body>
</html>

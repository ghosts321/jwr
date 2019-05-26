<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../main.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'pxks.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript">
var indexdata="";
$(function (){
	require.config({
	    paths:{
	        'echarts':'js/echarts/echarts',
	        'echarts/chart/bar'  : 'js/echarts/echarts',
	        'echarts/chart/line': 'js/echarts/echarts'
	    }
	});
	$.ajax({
	    type:"POST",
	    async:false,
	    url:"/jwr/statistics/statisticsPntrainLineAction.action",
	    success:function(returnValue){
	   		indexdata=returnValue;
	   		indexdata = eval("("+indexdata+")");
	   		getLine(indexdata);
	    }
	});
});
function getLine(indexdata){
	require([
         'echarts',
         'echarts/chart/bar',
         'echarts/chart/line'
    ],
    function(ec) {
         var  myChart = ec.init(document.getElementById('result'));
         var option = {
       		    title : {
       		        text: '各分数值的评审员数量'
       		    },
       		    tooltip : {
       		        trigger: 'axis'
       		    },
       		    legend: {
       		        data:['评审员数量']
       		    },
       		    toolbox: {
       		        show : false,
       		        feature : {
       		            mark : true,
       		            dataView : {readOnly: false},
       		            magicType:['line', 'bar'],
       		            restore : true,
       		            saveAsImage : true
       		        }
       		    },
       		    calculable : true,
       		    xAxis : [
       		        {
       		            type : 'category',
       		            boundaryGap : false,
       		            data : indexdata.category
       		        }
       		    ],
       		    yAxis : [
       		        {
       		            type : 'value',
       		            splitArea : {show : true}
       		        }
       		    ],
       		    series : [
       		        {
       		            name:'评审员数量',
       		            type:'line',
       		            itemStyle: {
       		                normal: {
       		                    lineStyle: {
       		                        shadowColor : 'rgba(0,0,0,0.4)'
       		                    }
       		                }
       		            },
       		            data:indexdata.total
       		        }
       		    ]
       		};
         myChart.setOption(option);
	});
}
</script>
</head>

<body>
	<div style="padding: 20px; width: 95%; height: 478px;" split="false"
		region="center" border="false"
		class="layout-body panel-body panel-body-noheader panel-body-noborder"
		title="">
		<h1>评审员考试情况统计</h1>
		<h2>考试时间，考试成绩，是否合格，考试类别，</h2>
		<div>注：交通运输部负责组织编写培训教材和考试大纲。省级交通运输主管机关、长江和珠江航务管理局按管辖范围负责组织实施培训、考试工作</div>
		<br>
		<div style="height: 400px;width: 95%;border: 1px solid gray;" id="result"></div>
	</div>
</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../main.jsp"%>

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
	<script src="<%= path%>/js/jquery-1.3.2.min.js" type="text/javascript"></script>
	<script src="<%= basePath%>/js/highcharts/highcharts.js"></script>
	<script src="<%= basePath%>/js/highcharts/highcharts-3d.js"></script>
	<script src="<%= basePath%>/js/highcharts/modules/exporting.js"></script>
  </head>
  <style type="text/css">
#approval, #registration {
	float: left;
	margin-top:10px;
}
#approval,#registration {
    height: 400px; 
}
</style>
<script type="text/javascript">
var data1 = "";
var data2 = "";
$(function () {
	$.ajax({
	    type:"POST",
	    async:false,
	    url:"/jwr/mot/getDataForChartAction.action",
	    success:function(returnValue){
	    	data1 = returnValue;
	    }
	 });
	
    var chart1 = new Highcharts.Chart({
        chart: {
            renderTo: 'approval',
            type: 'column',
            margin: 75,
            options3d: {
                enabled: true,
                alpha: 10,
                beta: 30,
                depth: 50,
                viewDistance: 25
            }
        },
        title: {
            text: '企业申报办结情况一览'
        },
        subtitle: {
            text: '显示当前有多少企业待办业务'
        },
        xAxis: {
            categories: ['未受理', '未审核']
        },
        yAxis: {
            allowDecimals: false,
            min: 0,
            title: {
                text: '数量（个）'
            }
        },
        plotOptions: {
            column: {
                depth: 25,
                cursor: 'pointer',
                events: {click: function(e) {
                    //location.href = e.point.url;<span></span> //上面是当前页跳转，如果是要跳出新页面，那就用
                    //window.open(e.point.url);
                    //这里的url要后面的data里给出
    	        	 alert(e.point);
    	        }}
            }
        },
        series: [{
        	name:'待办业务',
            data: eval(data1)
        }]
    });
});


$(function () {
	$.ajax({
	    type:"POST",
	    async:false,
	    url:"/jwr/mot/getRegDataForChartAction.action",
	    success:function(returnValue){
	    	data2 = returnValue;
	    }
	 });
	
    var chart2 = new Highcharts.Chart({
        chart: {
            renderTo: 'registration',
            type: 'column',
            margin: 75,
            options3d: {
                enabled: true,
                alpha: 10,
                beta: 30,
                depth: 50,
                viewDistance: 25
            }
        },
        title: {
            text: '用户注册情况一览'
        },
        subtitle: {
            text: '显示当前各用户注册未审批数量'
        },
        xAxis: {
            categories: ['主管机关', '考评员', '考评机构', '企业']
        },
        yAxis: {
            allowDecimals: false,
            min: 0,
            title: {
                text: '数量（个）'
            }
        },
        plotOptions: {
            column: {
                depth: 25,
                cursor: 'pointer',
                events: {click: function(e) {
                    //location.href = e.point.url;<span></span> //上面是当前页跳转，如果是要跳出新页面，那就用
                    //window.open(e.point.url);
                    //这里的url要后面的data里给出
    	        	 alert(e.point);
    	        }}
            }
        },
        series: [{
        	name:'待办业务',
            data: eval(data2)
        }]
    });
}); 
		</script>
  <body>
  <div class="eui-info">
	<div class="eui-tip icon-tip"></div>
	<div>待办事宜中各项目的数量提示：</div>
  </div>
    <div id="approval"></div>
    <div id="registration"></div>
  </body>
</html>

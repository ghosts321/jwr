<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>
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
var indexdata="",totalSize="",allTrain="",trainSize="",dialog="",manager,manager1;
var initTrain,initNoTrain, initSum;
	require.config({
	    paths:{
	        'echarts':'js/echarts/echarts',
	        'echarts/chart/bar'  : 'js/echarts/echarts',
	        'echarts/chart/line': 'js/echarts/echarts'
	    }
	});
	$(initNoTrain);
    function  initNoTrain() {
    	window['g'] = manager =
            $("#notrain").ligerGrid({
                columns: [ 
            { display: '主管机关', name: 'adminmot', width:'19%', align: 'center',render:function(item){return getMotVal(item.adminmot)==null?item.adminmot:getMotVal(item.adminmot)}},
            { display: '名称', name: 'pnname', width:'10%', align: 'center' },
            { display: '业务类型', name: 'bussinestype',width:'10%',    align: 'center',render:function(item){return getBusTypeVal(item.bussinestype)==null?item.bussinestype:getBusTypeVal(item.bussinestype)} },
            { display: '手机', name: 'mobile',width:'10%',    align: 'center' }], 
                url:"/jwr/mottrain/getAllNoTrainAction.action",
                width: '100%', 
                height: '56%', 
                checkbox: false,
                rownumbers:true,
                toolbar: { 
                	items: [
                       { text: '详细信息', click: tail, icon: 'modify' },
                       { line: true }]
                }
            });
    }
    
    $(initTrain);
    function  initTrain() {
    	window['g'] = manager1 =
            $("#train").ligerGrid({
                columns: [ 
            { display: '主管机关', name: 'adminmot',width:'18%',  align: 'center',render:function(item){return getMotVal(item.adminmot)==null?item.adminmot:getMotVal(item.adminmot)} },
            { display: '名称', name: 'pnname', width:'8%', align: 'center' },
            { display: '培训合格证', name: 'train_id',width:'12%',  heightAlign: 'center' },
            { display: '开始日期', name: 'train_start',width:'10%',  heightAlign: 'center'},
            { display: '结束日期', name: 'train_end',width:'10%',  heightAlign: 'center' },
            { display: '培训学时', name: 'train_hour',width:'5%',  heightAlign: 'center' },
            { display: '业务类型', name: 'bustype',width:'10%',  heightAlign: 'center',render:function(item){return getBusTypeVal(item.bustype)==null?item.bustype:getBusTypeVal(item.bustype)} },
            { display: '考试日期', name: 'exam_date',width:'10%',  heightAlign: 'center' },
            { display: '考试成绩', name: 'exam_score',width:'10%',  heightAlign: 'center' }],
                url:"/jwr/mottrain/getAllTrainAction.action",
                width: '100%', 
                height: '56%', 
                rownumbers:true,
                checkbox: false
            });
    }
    $(initSum);
    function  initSum() {
    	$.ajax({
    	    type:"POST",
    	    async:false,
    	    url:"/jwr/statistics/statisticsPntrainAction.action",
    	    success:function(returnValue){
    	    	trainData=returnValue;
    	    	trainData = eval("("+trainData+")");
    	   		getBar(trainData);
    	    }
    	});
    }
  //创建柱状图
    function getBar(indexdata){
    	require([
    	          'echarts',
    	          'echarts/chart/bar',
    	          'echarts/chart/line'
    		    ],
    	       function(ec) {
    	            var  myChart = ec.init(document.getElementById('result'));
    				var option = {
    					    title : {
    					        text: '各月份培训的考评员数量' 
    					    },
    					    tooltip : {
    					        trigger: 'axis'
    					    },
    					    legend: {
    					        data:['考评员人数']
    					    },
    					    toolbox: {
    					    	x:800,
    					    	y:20,
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
    					            name:'考评员人数',
    					            type:'bar',
    					            data:indexdata.total
    					        }
    					    ]
    					};
    				myChart.setOption(option);
    			});
    }
   //页面中声明一个变量
  var postdata;
  function tail(){
	  var selected = manager.getSelected();
	  var str = JSON2.stringify(selected);
	  postdata=str;
      if (!selected) { 
    	  alert('请选择行');
      	return; 
      }else{
    	  dialog = $.ligerDialog.open({
           	url:'JSP/mot/pn/notraintail.jsp',
           	width:760,
           	height:620,
           	title:'考评员<font color="red">'+selected.username+'</font>详细信息'
       	});
      }
  }
</script>

</head>

<body style="padding-left: 10;padding-right: 10;height: 100%">
	<h1>考评员培训、考试管理</h1>
	<h2>培训时间，培训学时（不少于24个学时），培训类别，培训合格证号</h2>
	<div>注：由省级交通运输主管机关、长江和珠江航务管理局按管辖范围负责组织实施培训、考试工作。</div>
	<div style="height: 300px;width: 95%;border: 1px solid gray;" id="result"></div>
	<br/>
	 
	<div class="eui-info">
		<div class="eui-tip icon-tip"></div>
		<div>请点击查看考评员详情并录入培训、考试资料。</div>
	</div>
	<br/>
	<div id="notrain" style="width: 100%;height: 65%"></div>
	<br/>
	<div id="pn_train_list" >
		<h2>已录入的考评员培训、考试记录：</h2>
		<div id="train" style="width: 100%;height: 65%"></div>
	</div>
</body>
</html>
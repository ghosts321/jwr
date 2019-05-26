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
<style type="text/css">
	.hide{display:none}
</style>
<script type="text/javascript">
require.config({
    paths:{
        'echarts':'js/echarts/echarts',
        'echarts/chart/bar'  : 'js/echarts/echarts',
        'echarts/chart/line': 'js/echarts/echarts',
        'echarts/chart/pie': 'js/echarts/echarts'
    }
});
function query(){
	var nameorcertnum = $("#nameorcertnum").val();
	var admin = $("#adminmot").val();
	var type = $("#type").val();
	var grade = $("#grade").val();
	var parm = {nameorcertnum:nameorcertnum,admin:admin,type:type,grade:grade};
	initLiger(parm);
}
function  initLiger(parms) {
	window['g'] = 
             manager = $("#result").ligerGrid({
                columns: [
	            { display: '名称', name: 'enname',  align: 'center' },
	            { display: '业务类型', name: 'bustype',    align: 'center',
		            render:function(item){
		            	return getBusTypeVal(item.bustype)==null?item.busType:getBusTypeVal(item.bustype)
		            } 
		        },
	            { display: '等级', name: 'grade',  align: 'center', render: function (item)
		        {
		   		  if (item.grade=="1"){ return '一级';}
		   		 else if (item.grade=="2"){ return '二级';}
		   		 else if (item.grade=="3"){ return '三级';}
		        }},
	            { display: '证书号', name: 'cid',  align: 'center' }, 
	            { display: '主管机关', name: 'adminmot',  align: 'center',render:function(item){return getMotVal(item.adminmot)==null?item.adminmot:getMotVal(item.adminmot)}  }],
	            url:"/jwr/statistics/enQueryAction.action",
                rownumbers: true,
                parms:parms,
                width: '100%', 
                height: 300, 
                toolbar: { 
                	items: [{ text: '详细信息', click: tail, icon: 'modify' },
                            { line: true }
                	       ]
                }
            });
}
//页面中声明一个变量
var postdata; 
function tail(){
	var selected = manager.getSelected();
    if (!selected) { 
    	alert('请选择行');
    	return; 
    }else{
    	var name = selected.name;
    	var str = JSON2.stringify(selected);
    	postdata=str;
    	ligerwindow=$.ligerDialog.open({
    		url:'JSP/mot/en/enQueryDetial.jsp?indexdata='+encodeURI(encodeURI(str))+'&flag=1',
         	width:720,
         	height:420,
         	title:'交通运输企业<font color="red">'+manager.getSelected().enname+'</font>详细信息'
		 	});
	   	//;
    }
}
function reset(){
	$("#adminmot").val(0);
	$("#grade").val(0);
	$("#type").val(0);
	$("#grade").val(0);
	$("#nameorcertnum").val('');
}
function statistics(barId){
	var indexdata;
	$.ajax({
	    type:"POST",
	    async:false,
	    data:{barId:barId},
	    url:"/jwr/statistics/enCountQueryAction.action",
	    success:function(returnValue){
	    	if(returnValue.length<=2){
	    		alert("无统计信息");
	    		return;
	    	}
	   		indexdata=returnValue;
	   		indexdata = eval("("+indexdata+")");
	   		getBar(barId,indexdata);
	    }
	});
}
//创建柱状图
function getBar(barId,indexdata){
	$("#result2").removeClass("hide");
	$("#result3").removeClass("hide");
	var title = '';
	if(barId=='bustype'){
		title = '【业务类型】-【交通运输企业申请数量】分析图表';
	}else if(barId=='adminmot'){
		title = '【主管机关】-【交通运输企业申请数量】分析图表';
	}else{
		title = '【等级】-【交通运输企业申请数量】分析图表';
	}
	require([
	          'echarts',
	          'echarts/chart/bar',
	          'echarts/chart/line',
	          'echarts/chart/pie'
		    ],
	       function(ec) {
	            var  myChart1 = ec.init(document.getElementById('result2'));
	            var  myChart2 = ec.init(document.getElementById('result3'));
				var option1 = {
					    title : {
					        text: title,
					        x:'center'
					    },
					    tooltip : {
					        trigger: 'axis'
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
					            name:'数量小计',
					            type:'bar',
					            data:indexdata.total
					        }
					    ]
					};
					var option2 = {
					    title : {
					        text: title,
					        subtext: '',
					        x:'center'
					    },
					    tooltip : {
					        trigger: 'item',
					        formatter: "{a} <br/>{b} : {c} ({d}%)"
					    },
					    legend: {
					        orient : 'vertical',
					        x : 'left',
					        data:indexdata.category
					    },
					    toolbox: {
					        show : false,
					        feature : {
					            mark : true,
					            dataView : {readOnly: false},
					            restore : true,
					            saveAsImage : true
					        }
					    },
					    calculable : true,
					    series : [
					        {
					            name:'数量小计',
					            type:'pie',
					            radius : [0, 110],
					            selectedOffset : [10],
					            data: (function(){
								var res = [];
								var len = 0;
								while (len++ < indexdata.category.length) {
								
								res.push({
								value: indexdata.total[len-1],
								name: indexdata.category[len-1]
								});
								}
								return res;
								})() 
					        }
					    ]
					};
				myChart1.setOption(option1,true);
				myChart2.setOption(option2,true);
			});
			createTable(barId,indexdata);
}

//创建表格
 function createTable(barId,indexdata){
  clenTable();
	 	var titleName = '';
		if(barId=='bustype'){
			titleName = '业务类型';
		}else if(barId=='adminmot'){
			titleName = '主管机关';
		}else{
			titleName = '等级';
		}
 $("#result4").removeClass("hide");
 
     var sdiv = document.getElementById("result4"); 
     var table = document.createElement("table");//创建table 
     table.border=1;
     table.id="tb";
     var row = table.insertRow();
     var cell = row.insertCell();
     
     cell.width = "100";//更改cell的各种属性 
     //cell.style.backgroundColor = "#999999";
     cell.innerHTML="序号"; 
     cell = row.insertCell();
     
     cell.width = "100";//更改cell的各种属性 
     //cell.style.backgroundColor = "#999999"; 
     cell.innerHTML=titleName; 
     cell = row.insertCell();
     
     cell.width = "100";//更改cell的各种属性 
     //cell.style.backgroundColor = "#999999"; 
     cell.innerHTML="数量小计"; 
     cell = row.insertCell();
     for (var nu = 0; nu < indexdata.category.length;nu++){
     	var row = table.insertRow();
     	var cell = row.insertCell();
     	cell.width = "100";//更改cell的各种属性 
     	//cell.style.backgroundColor = "#999999";
	     cell.innerHTML=nu+1; 
	     cell = row.insertCell();
	    cell.width = "100";//更改cell的各种属性 
     	//cell.style.backgroundColor = "#999999";
	     cell.innerHTML=indexdata.category[nu]; 
	     cell = row.insertCell();
	    cell.width = "100";//更改cell的各种属性 
     	//cell.style.backgroundColor = "#999999";
	     cell.innerHTML=indexdata.total[nu]; 
	     cell = row.insertCell();
     }
     sdiv.appendChild(table); 
 } 
 
 function clenTable(){
 	var tb = document.getElementById('tb');
 	if(tb==null){
 		return;
 	}else{
 		tb.firstChild.removeNode(true);
 		tb.id="";
 	}
 }

$(function ()
        {
 $.ajax({
	    type:"POST",
	    async:false,
	    url:"/jwr/respInfo/getMotAction.action",
	    success:function(returnValue){
	   		indexdata=returnValue;
	   		indexdata=eval('('+indexdata+')');
	   		var selectMot=document.getElementById("adminmot");
	   		for(var i=0;i<indexdata.Rows.length;i++){
	   			selectMot.options.add(new Option(indexdata.Rows[i].motname, indexdata.Rows[i].motcode ));
	   		}
	    }
	});
 });
</script>
</head>

<body style="overflow:hidden">
	<div style="padding: 20px; width: 100%; height:100%" split="false" 
		region="center" border="false"
		class="layout-body panel-body panel-body-noheader panel-body-noborder"
		title="">
		<h1>交通运输企业分析及查询搜索</h1>
		<h2>
			条件搜索：
		</h2>
			<label>主管机关：</label><select id="adminmot"><option value="0">--
					所有 --</option>
			</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>业务类型：</label><select id="type"><option
					value="0">-- 所有 --</option>
				<option value="1">道路运输</option>
				<option value="2">水路运输</option>
				<option value="3">港口运营</option>
				<option value="4">城市客运</option>
				<option value="5">交通运输工程建设</option>
				<option value="6">其他</option>
			</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>达标等级：</label><select id="grade">
			<option value="0">-- 所有 --</option>
			<option value="2">二级</option>
			<option value="3">三级</option>
			</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br> <br> <label>企业名称：</label><input
				type="text" id="nameorcertnum" name="s"
				class="easyui-validatebox validatebox-text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a onclick="query();" iconcls="icon-ok" href="javascript:void(0);"
				class="easyui-linkbutton l-btn">
				<span class="l-btn-left"><span class="l-btn-text icon-ok"
					style="padding-left: 20px;">搜 索</span> </span>
			</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="reset();" href="javascript:void(0);"
				iconcls="icon-cancel" class="easyui-linkbutton l-btn" id="undefined"><span
				class="l-btn-left"><span class="l-btn-text icon-cancel"
					style="padding-left: 20px;">重置</span> </span> </a>
		<div id="result">
		</div>
		<hr>
		<a name="dim"></a>
		<h2>
			企业维度指标分析：
		</h2>
		<label>点击如下维度进行统计：</label><a onclick="statistics(this.id)" href="javascript:void(0);"
			class="easyui-linkbutton l-btn" id="bustype"><span
			class="l-btn-left"><span class="l-btn-text">业务类型</span> </span> </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
			onclick="statistics(this.id)" href="javascript:void(0);" class="easyui-linkbutton l-btn" id="adminmot"><span
			class="l-btn-left"><span class="l-btn-text">主管机关</span> </span> </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
			onclick="statistics(this.id)" href="javascript:void(0);" class="easyui-linkbutton l-btn" id="grade"><span
			class="l-btn-left"><span class="l-btn-text">等级</span> </span> </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<div class="hide" style="width: 80%;height: 70%;border: 0px solid gray;margin-left: 90px;" id="result2" ></div>
		<br>
		<div class="hide" style="width: 80%;height: 80%;border: 0px solid gray;margin-left: 90px;" id="result3"></div>
		<br>
		<div class="hide" style="width: 80%;height: 30%;border: 0px solid gray;margin-left: 390px;" id="result4"></div>
	</div>
</body>
</html>

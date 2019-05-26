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
var ligerwindow;
var gird;
require.config({
    paths:{
        'echarts':'js/echarts/echarts',
        'echarts/chart/bar'  : 'js/echarts/echarts',
        'echarts/chart/line': 'js/echarts/echarts',
        'echarts/chart/pie': 'js/echarts/echarts'
    }
});
function query(){
	var indexdata;
	var nameorcertnum = $("#nameorcertnum").val();
	var admin = $("#adminmot").val();
	var type = $("#type").val();
	var grade = $("#grade").val();
	$.ajax({
	    type:"POST",
	    async:false,
	    url:"/jwr/statistics/orgQueryAction.action",
	    data:{nameorcertnum:nameorcertnum,admin:admin,type:type,grade:grade},
	    success:function(returnValue){
	   		indexdata=returnValue;
	   		indexdata = eval("("+indexdata+")");
	   		createShowingTable(indexdata);
	   		//将 查询参数 设置到 grid中 以便下次分页时候 可以获取到查询参数
	   		gird.setOptions({ parms: { nameorcertnum:nameorcertnum,admin:admin,type:type,grade:grade},newPage:'1'});
	   		/* //将grid 表格 刷新
			gird.reload(); */
	    }
	});
}
function createShowingTable(indexdata,nameorcertnum,admin,type,grade){
	window['g'] = 
		gird= $("#result").ligerGrid({
                columns: [
				            { display: '名称', name: 'orgname',  align: 'center' },
				            { display: '业务类型', name: 'busType',    align: 'center',render:function(item){return getBusTypeVal(item.busType)==null?item.busType:getBusTypeVal(item.busType)} },
				            { display: '等级', name: 'grade',  align: 'center', render:function(item){if(item.grade=='2'){return '二级'} else if(item.grade=='3'){return '三级'}} },
				            { display: '证书号', name: 'cid',  align: 'center' }, 
				            { display: '主管机关', name: 'motname',  align: 'center'}],
                data: indexdata,
                rownumbers: true,
                /* url:"/jwr/statistics/orgQueryAction.action", */
                pageSize: 10,
                width: '800', 
                height: 320, 
                //checkbox: true,
                toolbar: { 
                	items: [{ text: '详细信息', click: tail, icon: 'modify' },
                            { line: true }
                	       ]
                }
            });
	
}
function tail(){
	var id = gird.getSelected().id;
    if (!gird.getSelected()) { 
    	alert('请选择行');
    	return; 
    }else{
    	ligerwindow=$.ligerDialog.open({
    		url:'JSP/mot/org/scanDetail.jsp?id='+id,
	     	width:910,
	     	height:500,
	     	title:'考评机构<font color="red">'+gird.getSelected().orgname+'</font>详细信息'
	 	});
       ;
    }
}
function reset(){
	$("#adminmot").val("%");
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
	    url:"/jwr/statistics/orgCountQueryAction.action",
	    success:function(returnValue){
	    	if(returnValue.length<=2){
	    		alert("无统计信息");
	    		return;
	    	}
	   		indexdata=returnValue;
	   		indexdata=eval("("+returnValue+")");
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
		title = '【业务类型】-【考评机构申请数量】分析图表';
	}else if(barId=='adminmot'){
		title = '【主管机关】-【考评机构申请数量】分析图表';
	}else{
		title = '【等级】-【考评机构申请数量】分析图表';
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
					            dataView : {readOnly: true},
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

$(function(){
		//管理机关
        		 $.ajax({
        			    type:"POST",
        			    async:false,
        			    url:"/jwr/respInfo/getMotAction.action",
        			    success:function(returnValue){
        			   		indexdata1=returnValue;
        			   		var obj1=(eval("("+indexdata1+")")).Rows;
        			   		var str="";
        			   	    str='<SELECT id="adminmot" name="adminmot" style="width: 150px;">';
        			   		for(var i=0;i<obj1.length;i++){
        			   			if(i==0){
        			   				str+='<OPTION selected value="%">请选择</OPTION>';
        			   				str+='<OPTION value='+obj1[i].motcode+'>'+obj1[i].motname+'</OPTION>';
        			   			}else{
        			   				str+='<OPTION  value='+obj1[i].motcode+'>'+obj1[i].motname+'</OPTION>';
        			   			}
        						
        			   		}
        			   		
        			   		  str+='</SELECT>';
        			   		$("#sa").append(str);
        			    }
        			});
		});



</script>
</head>

<body style="overflow:hidden">
	<div style="padding: 20px; width: 100%; height:100%;" split="false"
		region="center" border="false"
		class="layout-body panel-body panel-body-noheader panel-body-noborder"
		title="">
		<h1>考评机构统计分析及查询搜索</h1>
		<div style="margin-top: 10px"></div>
		<h2>
			条件搜索：
		</h2>
			<div style="margin-top: 10px"></div>
			<label>主管机关：</label>
			<span id="sa"></span>
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
			</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br> <br> <label>考评机构名称：</label><input
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
					style="padding-left: 20px;">取 消</span> </span> </a>
						<div style="margin-top: 10px"></div>
		<div id="result">
		</div>
		<hr>
		<a name="dim"></a>
		<h2>
			考评机构维度指标分析： 
		</h2>
		<label>点击如下维度进行统计：</label><a onclick="statistics(this.id)" href="javascript:void(0);"
			class="easyui-linkbutton l-btn" id="bustype"><span
			class="l-btn-left"><span class="l-btn-text">业务类型</span> </span> </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
			onclick="statistics(this.id)" href="javascript:void(0);" class="easyui-linkbutton l-btn" id="adminmot"><span
			class="l-btn-left"><span class="l-btn-text">主管机关</span> </span> </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
			onclick="statistics(this.id)" href="javascript:void(0);" class="easyui-linkbutton l-btn" id="grade"><span
			class="l-btn-left"><span class="l-btn-text">等级</span> </span> </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<div class="hide" style="width: 80%;height: 70%;margin-left: 90px;border: 0px solid gray;" id="result2"></div>
		<br> 
		<div class="hide" style="width: 80%;height: 80%;margin-left: 90px;border: 0px solid gray;" id="result3"></div>
		<br>
		<div class="hide" style="width: 80%;height: 30%;margin-left: 330px;border: 0px solid gray;" id="result4"></div>
	</div>
</body>
</html>

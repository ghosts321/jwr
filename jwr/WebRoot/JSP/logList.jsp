<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="main.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 
    <script type="text/javascript">
    var indexdata="";
    var totalSize="";
    var gird;
    var ligerwindow;
    require.config({
        paths:{
            'echarts':'js/echarts/echarts',
            'echarts/chart/bar'  : 'js/echarts/echarts',
            'echarts/chart/line': 'js/echarts/echarts'
        }
    });
    $(initLiger);
    function  initLiger(parms,url) {
    	if(url == "" || url == null){
    		url = "/jwr/mot/getLogListAction.action";
    	}
    	window['g'] = 
            gird=$("#maingrid4").ligerGrid({
                 columns: [ 
 			{ display: '用户ID', name: 'userid',  heightAlign: 'center' },
             { display: '用户名称', name: 'username', align: 'center' ,width:60 },
             { display: '用户类型', name: 'role',  align: 'center',
             	render: function (item)
                 {
            		 if(item.role=="mot"){return '主管机关';}
            		 else if (item.role=="org"){ return '考评机构';}
            		 else if (item.role=="en"){ return '企业';}
            		 else if (item.role=="pn"){ return '考评员';}
            		 else{return '';}
                 } },
             { display: '证件号', name: 'pid',  align: 'center' },
             { display: '日期', name: 'createdate',  heightAlign: 'center' },
             { display: '信息', name: 'remark',  align: 'center' }], 
                 rownumbers: true,
                 url:url,
                 parms:parms,
                 width: '800', 
                 height: '320', 
                 checkbox: false
             });
             $("#pageloading").hide();
    }
    
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
        $(function ()
        {
        	$("#text2").ligerDateEditor({  label: '日期', labelWidth: 40, labelAlign: 'center' });
        });
    
        function query(){
        	var admin = $("#admin").val();
        	var type = $("#text2").val();
        	var grade = $("#pid").val();
        	var parm = {admin:admin,type:type,grade:grade};
        	initLiger(parm,"");
        }
        function chongzhi(){
        	$("#fm2").get(0).reset();
        }
        function statistics(){
        	var indexdatas;
        	var admin = $("#admin").val();
        	var type = $("#text2").val();
        	var grade = $("#pid").val();
        	$.ajax({
        	    type:"POST",
        	    async:false,
        	    data:{admin:admin,type:type,grade:grade},
        	    url:"/jwr/mot/getLogListtjAction.action",
        	    success:function(returnValue){
        	   		indexdatas=returnValue;
        	   		indexdatas = eval("("+indexdatas+")");
        	   		getLine(indexdatas);
        	    }
        	});
        }
        
        function getLine(indexdatax){
        	$("#result2").show();
        	require([
                 'echarts',
                 'echarts/chart/bar',
                 'echarts/chart/line'
            ],
            function(ec) {
                 var  myChart = ec.init(document.getElementById('result2'));
                 var option = {
               		    title : {
               		        text: '各用户登录的数量'
               		    },
               		    tooltip : {
               		        trigger: 'axis'
               		    },
               		    legend: {
               		        data:['登录数量']
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
               		            boundaryGap : true,
               		            data : indexdatax.category
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
               		            name:'登录数量',
               		            type:'bar',
               		            data:indexdatax.total
               		        }
               		    ]
               		};
                 myChart.setOption(option);
        	});
        }
    </script>
</head>

<body style="padding:10px;">
	<h1>系统日志：</h1>
	<table id="filter2">
		<form id="fm2">
		<table>
			<tr style="width: 100%">
				<td>
					<label>日志类型：</label>
					<select id="admin">
						<option value="登录">登录</option>
						<option value="审批">报名申请审批</option>
					</select>
				</td>
				<td>
					<input type="text" id="text2"    />
				</td>
				<td>
					证件号：<input type="text" id="pid" /> 
				</td>  
			</tr>
		</table>
		<table>
			<tr>
				<td>
					<a onclick="query();" iconcls="icon-reload" href="javascript:void(0);" class="easyui-linkbutton l-btn"id="ss"
						 style="margin-top: 10px; margin-left: 10px;">
						<span class="l-btn-left">
							<span class="l-btn-text icon-reload" style="padding-left: 20px;">查询</span>
						</span>
					</a>
				</td>
				<td>
					<a id="undefined" class="easyui-linkbutton l-btn" onclick="chongzhi()" iconcls="icon-undo" href="javascript:void(0)" style="margin-left: 10px;margin-top: 10px;">
					    <span class="l-btn-left">
					        <span class="l-btn-text icon-undo" style="padding-left: 20px;">重置</span>
					    </span>
					</a>
				</td>
				<td>
					<a id="jilu" class="easyui-linkbutton l-btn" onclick="statistics()" iconcls="icon-bar" href="javascript:void(0)" style="margin-left: 10px;margin-top: 10px;">
					    <span class="l-btn-left">
					        <span class="l-btn-text icon-bar" style="padding-left: 20px;">记录统计</span>
					    </span>
					</a>
				</td>
				<tr>
			</table>
		</form>
	</table>
	<div style="margin:10px auto;"></div>
	<div class="l-loading" style="display: block;" id="pageloading"></div>
	
	<div id="maingrid4" style="margin: 0; padding: 0"></div>
	<div style="display: none;"></div>
	<div  style="width: 71%;height: 70%;margin-top:10;border: 1px solid gray;display: none;" id="result2"></div>
</body>
</html>

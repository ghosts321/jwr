<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>
<HTML style="HEIGHT: 100%; OVERFLOW: hidden" sizcache="0" sizset="0">
<HEAD>
<TITLE>下级机构管理统计分析</TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
<script type="text/javascript">
var indexdata2;
var indexdata3;
var indexdata4;
require.config({
    paths:{
        'echarts':'js/echarts/echarts',
        'echarts/chart/bar'  : 'js/echarts/echarts',
        'echarts/chart/line': 'js/echarts/echarts'
    }
});
//点击业务类型
function busDis(){
	$("#tab").html("");
	$("#result2").hide();
	$.ajax({
	    type:"POST",
	    async:false,
	    url:"/jwr/statistics/getLowerListAction.action",
	    success:function(returnValue){
	    	if(returnValue.length<=2){
	    		alert("无统计信息");
	    		return;
	    	}
	   		indexdata2=returnValue;
	   		indexdata2 = eval("("+indexdata2+")");
	    }
	});
	
	//确定行
	var bol=false;
	$.ajax({
	    type:"POST",
	    async:false,
	    url:"/jwr/statistics/getLowerListCountAction.action",
	    success:function(returnValue){
	    	indexdata3 = eval("("+returnValue+")");
	    	if(indexdata3.Rows.length<1){
	    		alert("无统计信息");
	    		bol=true;
	    		return;
	    	}
	   		indexdata3=returnValue;
	   		indexdata3 = eval("("+indexdata3+")");
	    }
	});
	if(bol){
		return;
	}
	//确定第一行名称
	$.ajax({
    type:"POST",
    async:false,
    url:"/jwr/statistics/getLowerListFiletextAction.action",
    success:function(returnValue){
    	if(returnValue.length<=2){
    		alert("无统计信息");
    		return;
    	}
   		indexdata4=returnValue;
   		indexdata4 = eval("("+indexdata4+")");
    }
});

	if(indexdata2!=''&&indexdata3!=''){
		var str="";
		var z=0;
		var temp=true;
		var flag=true;
		var lowerbustype='lowerbustype';
		str+="<tr><td width='150'><div align='right'>业务类型</div>主管机关</td>";
		for(var j=0;j<indexdata4.Rows.length;j++){
			str+="<td width='100' align='center'>"+indexdata4.Rows[j].filetext+"</td>";
		}
		str+="</tr>";
		flag=false;
// 		for(var i=0;i<indexdata3.Rows.length;i++){
			//加载第一行
				//加载其他
				for(var k=0;k<indexdata3.Rows.length;k++){
					str+="<tr><td width='150'><a href=\"javascript:statistics( 'lowerbustype','"+indexdata3.Rows[k].adminmot.split(":")[0]+ "','"+indexdata3.Rows[k].adminmot.split(":")[1]+"')\" >"+indexdata3.Rows[k].adminmot+"</a></td>";
					for(var m=0;m<indexdata4.Rows.length;m++){
							//判断是否存在和表头相等的业务类型	
							for(var h=0;h<indexdata2.Rows.length;h++){
								temp=true;
								if(indexdata3.Rows[k].adminmot.split(":")[0]==indexdata2.Rows[h].dimension.split(":")[0]&&indexdata2.Rows[h].dimension.split(":")[1]==indexdata4.Rows[m].filetext&&h!=indexdata2.Rows.length){
									str+="<td width='100' align='center'>"+indexdata2.Rows[h].total+"</td>";
									temp=false;
									break;
								}
							}
							if(temp){
								str+="<td width='100' align='center'>0</td>";
								temp=true;
							}
							
					}
					str+="</tr>";
				}
// 		}
		$("#tab").html(str);
	}
	
}

//点击等级
function gradeDis(){
	$("#tab").html("");
	$("#result2").hide();
	//获取主管机关
	$.ajax({
	    type:"POST",
	    async:false,
	    url:"/jwr/statistics/getLowerGradeListAction.action",
	    success:function(returnValue){
	    	if(returnValue.length<=2){
	    		alert("无统计信息");
	    		return;
	    	}
	   		indexdata2=returnValue;
	   		indexdata2 = eval("("+indexdata2+")");
	    }
	});
	
	//确定行
	$.ajax({
	    type:"POST",
	    async:false,
	    url:"/jwr/statistics/getLowerListCountAction.action",
	    success:function(returnValue){
	    	if(returnValue.length<=2){
	    		alert("无统计信息");
	    		return;
	    	}
	   		indexdata3=returnValue;
	   		indexdata3 = eval("("+indexdata3+")");
	    }
	});
	//确定第一行名称
	var bol=false;
	$.ajax({
    type:"POST",
    async:false,
    url:"/jwr/statistics/getLowerGradeListFiletextAction.action",
    success:function(returnValue){
    	indexdata4 = eval("("+returnValue+")");
    	if(indexdata4.Rows.length<1){
    		alert("无统计信息");
    		bol=true;
    		return;
    	}
   		indexdata4=returnValue;
   		indexdata4 = eval("("+indexdata4+")");
    }
});
	if(bol){
		return;
	}
	if(indexdata2!=''&&indexdata3!=''){
		var str="";
		var z=0;
		var temp=true;
		var lowerbustype='lowerbustype';
		//加载第一行
		str+="<tr><td width='150'><div align='right'>等级</div>主管机关</td>";
		for(var j=0;j<indexdata4.Rows.length;j++){
			if(indexdata4.Rows[j].filetext=='2'){
				str+="<td width='100' align='center'>二级</td>";
			}else{
				str+="<td width='100' align='center'>三级</td>";
			}
			
		}
		str+="</tr>";
// 		for(var i=0;i<indexdata3.Rows.length;i++){
				//加载其他
				
				for(var k=0;k<indexdata3.Rows.length;k++){
					str+="<tr><td width='150'><a href=\"javascript:statistics( 'lowergrade','"+indexdata3.Rows[k].adminmot.split(":")[0]+ "','"+indexdata3.Rows[k].adminmot.split(":")[1]+"')\" >"+indexdata3.Rows[k].adminmot+"</a></td>";
					for(var m=0;m<indexdata4.Rows.length;m++){
							//判断是否存在和表头相等的等级	
							for(var h=0;h<indexdata2.Rows.length;h++){
								
								temp=true;
								if(indexdata3.Rows[k].adminmot.split(":")[0]==indexdata2.Rows[h].dimension.split(":")[0]&&indexdata2.Rows[h].dimension.split(":")[1]==indexdata4.Rows[m].filetext&&h!=indexdata2.Rows.length){
									str+="<td width='100' align='center'>"+indexdata2.Rows[h].total+"</td>";
									temp=false;
									break;
								}
							}
							if(temp){
								str+="<td width='100' align='center'>0</td>";
								temp=true;
							}
							
					}
					str+="</tr>";
				}
// 		}
		$("#tab").html(str);
	}
}

function statistics(barId,motPara,busname){
	$("#result2").show();
	var indexdata;
	$.ajax({
	    type:"POST",
	    async:false,
	    data:{barId:barId},
	    url:"/jwr/statistics/orgCountQueryAction.action",
	    data:{'barId':barId,'busname':busname,'motPara':motPara},
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
	var title = '';
	if(barId=='lowerbustype'){
		title = '【业务类型】-【企业数量统计】分析图表';
	}else{
		title = '【等级】-【企业数量统计】分析图表';
	}
	require([
	          'echarts',
	          'echarts/chart/bar',
	          'echarts/chart/line'
		    ],
	       function(ec) {
	            var  myChart = ec.init(document.getElementById('result2'));
				var option = {
					    title : {
					        text: title
					    },
					    tooltip : {
					        trigger: 'axis'
					    },
					    legend: {
					        data:['数量小计']
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
				myChart.setOption(option);
			});
}
</script>
</HEAD>
<BODY>
	<DIV style="WIDTH: 1000px; TOP: 0px; LEFT: 0px"
		class="panel layout-panel layout-panel-north">
		
	</DIV>
		<DIV
			style="PADDING-BOTTOM: 20px; PADDING-LEFT: 20px; WIDTH: 500; PADDING-RIGHT: 20px; PADDING-TOP: 20px"
			class="layout-body panel-body panel-body-noheader panel-body-noborder"
			title=""  split="false" region="center"
			border="false">
		<a onclick="busDis()" href="javascript:void(0);"
			class="easyui-linkbutton l-btn" id="lowerbustype"><span
			class="l-btn-left"><span class="l-btn-text">主管机关——企业业务类型</span> </span> </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
			onclick="gradeDis()" href="javascript:void(0);"
			class="easyui-linkbutton l-btn" id="lowergrade"><span
			class="l-btn-left"><span class="l-btn-text">主管机关——企业达标等级</span> </span> </a>
			<DIV class=eui-info> 
				<DIV class="eui-tip icon-tip"></DIV>
				<DIV>请点击数据行可得到该行的图形分析。</DIV>
			</DIV>
				<h2>申请等级企业数量统计表</h2>
		<table border="1" cellspacing="0" cellpadding="0" id="tab">
		</table>
	</DIV>
	<div class="hide" style="width: 90%;height: 70%;margin: 10 10 10 10;border: 0px solid gray; " id="result2" ></div>
</BODY>
</HTML>

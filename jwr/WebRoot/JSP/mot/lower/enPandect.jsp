<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>
<HTML style="HEIGHT: 100%; OVERFLOW: hidden" sizcache="0" sizset="0">
<HEAD>
<TITLE>企业注册申报总览</TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
<script type="text/javascript">
var indexdata;
var b=true;
require.config({
    paths:{
        'echarts':'js/echarts/echarts',
        'echarts/chart/bar'  : 'js/echarts/echarts',
        'echarts/chart/line': 'js/echarts/echarts'
    }
});

$(function(){
	$.ajax({
	    type:"POST",
	    async:false,
	    url:"/jwr/statistics/enPandectAction.action",
	    success:function(returnValue){
	    	if(returnValue.length<=2){
	    		alert("无统计信息");
	    		b=false;
	    		return;
	    	}
	    	indexdata=returnValue;
	    	indexdata = eval("("+indexdata+")");
	    }
	});
	if(b){
		var str="<tr height='30px' align='center'><td>主管机关编号</td><td>主管机关名称</td><td>已注册</td><td>已受理</td><td>已审核</td><td>已考评</td></tr>";

		for(var i=0;i<indexdata.Rows.length;i++){
			str+="<tr align='center'><td width='200'>"+indexdata.Rows[i].motCode+"</td>";
			str+="<td width='360'>"+indexdata.Rows[i].motName+"</td>";
			str+="<td width='150'>"+indexdata.Rows[i].yzc+"</td>";
			str+="<td width='150'>"+indexdata.Rows[i].ysl+"</td>";
			str+="<td width='150'>"+indexdata.Rows[i].ysh+"</td>";
			str+="<td width='150'>"+indexdata.Rows[i].ykp+"</td>";
			str+="</tr>";
		}
		$("#tab").html(str);
	}
})

</script>
</HEAD>
<BODY>
	    <a class="easyui-linkbutton l-btn" href="/jwr/excelExport" id="lowerbustype">
	    <span class="l-btn-left">
	         <span class="l-btn-text">导出Excel</span>
	    </span>
	    </a>
	    <br>
		<table width="100%" border="1" cellspacing="0" cellpadding="0" id="tab">
		   
		</table>
	</DIV>
</BODY>
</HTML>

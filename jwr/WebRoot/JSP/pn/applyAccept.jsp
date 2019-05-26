<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../main.jsp" %>
<% 
request.setCharacterEncoding("UTF-8");
	String mot = request.getSession().getAttribute("mot").toString();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'applyAccept.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript">
var indexdata,manager1,initData,manager;
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
        			   		$("#zgjg").append(str);
        			    }
        			});
		});
$(initLiger);
function  initLiger(parms) {
	window['g'] = 
        manager = $("#list").ligerGrid({
            columns: [ 
        
        { display: '主管机关', name: 'ADMINMOT',  align: 'center',render:function(item){return getMotVal(item.ADMINMOT)==null?item.ADMINMOT:getMotVal(item.ADMINMOT)} },
        { display: '姓名', name: 'PNNAME', align: 'center' },
        { display: '证件号', name: 'PID',  heightAlign: 'center'},
        { display: '单位组织', name: 'ORG',    align: 'center' },
        { display: '业务类型', name: 'BUSSINESTYPE',    align: 'center',render:function(item){return getBusTypeVal(item.BUSSINESTYPE)==null?item.BUSSINESTYPE:getBusTypeVal(item.BUSSINESTYPE)} },
        { display: '审核日期', name: 'AUDITDATE',   align: 'center' },
        { display: '审核结果', name: 'AUDITRESP',   align: 'center' ,
        render: function (item)
        {
   		  if (item.AUDITRESP=="0"){ return '尚未处理';}
   		 else if (item.AUDITRESP=="1"){ return '同意';}
   		 else if (item.AUDITRESP=="2"){ return '不同意';}
            else{return '尚未处理';}
        }  }],
        rownumbers: true,
        parms:parms,
        url:"/jwr/pnApplyAccep/pnApplyAcceptAction.action",
        title:'考评员资格证申请列表',
        toolbar: { 
        	items: [
        	        { text: '详细信息', click: detial, icon: 'modify' },
                    { line: true }
        	       ]
        },
        width: '100%', 
        height: '320', 
        checkbox: false
        });
        $("#pageloading").hide();
}
function change(){
	var ftype = $("#ftype").val();
	if(ftype=='admin'){
		$("#span1").html('<select name="admin1" id="admin1"><option value="0" selected="true">全部</option><option value="${mot}">${motname}</option>');
	}else if(ftype=='name'){
		$("#span1").html('<input type="text" id="name1" />');
	}else if(ftype=='pid'){
		$("#span1").html('<input type="text" id="pid1" />');
	}else if(ftype=='resp'){
		$("#span1").html('<select name="resp1" id="admin1"><option value="all" selected="true">全部</option><option value="1">同意</option><option value="0">不同意</option><option value="2">已发证</option></select>');
	}else{
		$("#span1").html('<font color="gray">全部</font>');
	}
}
function query(){
	var adminmot = $("#adminmot").val();
    var pid = $("#pid").val();
    var pnname = $("#pnname").val();
    var resp = $("#resp").val();
    var data= {adminmot:adminmot,pid:pid,pnname:pnname,resp:resp};
    initLiger(data);
}
//页面中声明一个变量
  var postdata;
function detial(){
	var selected = manager.getSelected();
    if (!selected) {
    	alert('请选择行');
    	return; 
    }else{
    	var str = JSON2.stringify(selected);
    	postdata=str;
    	manager1 = $.ligerDialog.open({
         	url:'JSP/pn/applyAcceptdetail.jsp?',
         	width:900,
         	height:1300,
         	title:'考评员<font color="red">'+selected.PNNAME+'</font>详细信息'
     	});
    }
}
function recover(){
		 $("#adminmot").val("%");
    	 $("#pid").val("");
    	 $("#pnname").val("");
    	 $("#resp").val("");
	}
</script>
</head>

<body>
	<div style="padding: 20px; split="false"region="center" border="false"class="layout-body panel-body 
	panel-body-noheader panel-body-noborder"title="">
		<h1>受理考评员资格证申请</h1>
		<div class="eui-info">
			<div class="eui-tip icon-tip"></div>
			<div>请点击详情/查看进行处理</div>
		</div>
		<div id="filter1" class="mt10">
			<div class="box" style="margin-bottom: 5px">
				<div class="box_border">
			         <div class="box_top" style="width: 100%;">
			         	<div style="display:block; float:left;margin-left: 10px">
			         		<b class="pl15" sytle="display:block;float:left;">
				         		<font size="4">搜索</font>
				         	</b>
			         	</div>
			         	<div style="display:block; float:right;margin-right: 10">
			         		<a href="javascript:void(0);" onclick="zhankai()" style="" >展开</a> ||
			         		<a href="javascript:void(0);" onclick="shouqi()" style="">收起</a>
			         	</div>
	         		</div>
	         		<div class="box_center pt10 pb10" id="deg" style="height: 15%;display: none;">
	         			<div id="button" class="mt10" style="margin-left: 5px;">
				 			<input type="button" name="button" class="btn btn82 btn_search" value="查询" onclick="query()">
				 			<input type="button" name="button" class="btn btn82 btn_config" value="重置" onclick="recover()">    
			    		</div>
			           <table class="form_table" border="0" cellpadding="0" cellspacing="0">
			             <tr>
			               <td>主管机关：</td>
			               <td>
			               	<span id="zgjg"></span>
			               </td>
			               <td>证件号：</td>
			               <td>
			                 <input type="text" name="" id="pid" style="width: 150px;">
			               </td>
			               <td>考评员名称：</td>
			               <td>
			               	<input type="text" name="" id="pnname" style="width: 150px;">
			               </td>
			               <td>受理结果：</td>
			               <td>
			                 <select id="resp" style="width: 150px;">
			                 	<option value="">--请选择--</option>
			                 	<option value="0">尚未处理</option>
			                 	<option value="1">同意</option>
			                 	<option value="2">不同意</option>
			                 </select>
			               </td>
			             </tr>
				       </table>
		   		</div>
		 	</div>
	   </div>
	</div>
		<div id="list"></div>
	</div>
</body>
</html>

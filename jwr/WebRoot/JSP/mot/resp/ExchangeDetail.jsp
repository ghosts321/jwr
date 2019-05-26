<%@ page language="java" import="java.util.*,com.wr4.domain.OrgInfo" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>
<%
	String id=request.getParameter("id");
	request.setAttribute("id", id);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP 'pntail.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript">
var indexdata = "";
var totalSize = "";
	$(function() {
			var id=$("#id").val();
			 $.ajax({
					    type:"POST",
					    async:false,
					    url:"/jwr/orgExchange/selectExchangeByIdAction.action",
					    data:{'id':id},
					    success:function(returnValue){
					    	indexdata=eval("("+returnValue+")")[0];
					    	if(indexdata.reason=='1'){
		         	   			indexdata.reason2="（一）法定代表人变更的";
				  	  		}else if(indexdata.reason=='2'){
				  	  		indexdata.reason2="（二）机构名称变更的";
				  	  		}else if(indexdata.reason=='3'){
				  	  		indexdata.reason2="（三）机构地址变更的";
				  	  		}else if(indexdata.reason=='4'){
				  	  		indexdata.reason2="（四）停业、破产或有其他原因终止业务的";
				  	  		}else if(indexdata.reason=='5'){
				  	  		indexdata.reason2="（五）从事专职管理和考评工作的人员发生重大变化的";
				  	  		}
					    	indexdata.resp==""?indexdata.resp="尚未处理":indexdata.resp;
					    }
					});
			 
			 var ss= $("#motResp").ligerForm({
	           	 inputWidth:450, labelWidth:90, 
	           	appendID: true,
	                fields:[  
	                { display: "原因", name: "reason2", newline: true,type:"text",disabled:true}, 
	                { display: "内容", name: "content", newline: true,  type:"text",disabled:true},
	                { display: "用户id", name: "userid", newline: true,  type:"text",disabled:true}, 
	                { display: "日期", name: "cdate", newline: true, type:"text", disabled:true},
	                { display: "主管机关", name: "motname", newline: true,  disabled:true},
	                { display: "处理结果", name: "resp", newline: true,  disabled:true}
	                ]
	           });
			ss.setData(indexdata);
			if(indexdata.resp!="尚未处理"){
				$("#advice").attr("disabled","disabled");
			}
			if(indexdata.resp=="申请通过"){
				 
				document.getElementById("ad1").style.display="none";
				document.getElementById("ad2").style.display="block";
			}else{
				document.getElementById("ad1").style.display="block";
				document.getElementById("ad2").style.display="none";
			}
			$("#advice").val(indexdata.advice);
			
	})
	
	//提交
	function sub(flag,id){
		 var type='org';
		var advice=$("#advice").val();
		if(advice.length>800){
			alert("处理意见字数不能超过800个，已输入"+advice.length+"个字!");
  			return false;
		}
// 		var type = indexdata.type;
		var userId = indexdata.userid;
		var reason = indexdata.reason;
		var content = indexdata.content;
		 $.ajax({
			    type:"POST",
			    async:false,
			    data:{'id':id,'advice':advice,'flag':flag,'type':type,'userId':userId,'reason':reason,'content':content},
			    url:"/jwr/orgExchange/updateAdviceByIdAction.action",
			    success:function(returnValue){
			   		if(returnValue=="ok"){
			   			alert("已提交,变更申请处理成功!");
			   			window.parent.gird2.reload();
			    		window.parent.ligerwindow.close();
			   		}else if(returnValue=="error"){
			   			alert("操作失败，请与管理员联系!");
			   		}
			    }
			});
		 
		  $.ajax({
       	    type:"POST",
       	    async:false,
       	    url:"/jwr/orgExchange/getOrgExchangeListAction.action",
       	    data:{'type':type},
       	    success:function(returnValue){
       	   		indexdata2=eval("("+returnValue+")");
       	   		totalSize = indexdata2.Total;
       	   	 	//将 查询参数 设置到 grid中 以便下次分页时候 可以获取到查询参数
       	   	 	window.parent.gird2.setOptions({ parms: { page:'1'}});
       	   		 window.parent.gird2.reload();
		        //默认回到第一页
				//window.parent.gird2.changePage('first');
		        //向控制台打印信息
				window.parent.ligerwindow.close();
       	    }
       	});
	}
</script>
</head>
<body>
<input type="hidden" id="id" value="${id }">
	<center style="border: 1px solid #369">
		<h1 style="padding:20px; background-color:#369; color: white; font-size: 22px; margin-top:0px">考评机构变更申请</h1>
		
	</center>
		<div id="motResp" style="margin: 3; padding: 0;width: 95%"></div>
	<label> 处理意见：</label>
	<textarea class="easyui-validatebox validatebox-text" id="advice"
		style="width: 500px; margin: 0px; height: 150px;"></textarea>
	<br>
	<br>
	<div id="ad1" style="display:block">
		<a onclick="sub('1','${id }');" iconcls="icon-ok" href="javascript:void(0);"
			class="easyui-linkbutton l-btn">
			<span class="l-btn-left"><span class="l-btn-text icon-ok"
				style="padding-left: 20px;">同意</span> </span>
		</a>
		<a onclick="sub('0','${id }');" href="javascript:void(0);"
			iconcls="icon-cancel" class="easyui-linkbutton l-btn" id="undefined"><span
			class="l-btn-left"><span class="l-btn-text icon-cancel"
				style="padding-left: 20px;">不同意</span> </span> 
		</a>
	</div>
	<div id="ad2" style="display:none">
	<center>
	<a   href="javascript:window.parent.ligerwindow.close();"
			iconcls="icon-cancel" class="easyui-linkbutton l-btn" id="undefined"><span
			class="l-btn-left"><span class="l-btn-text icon-cancel"
				style="padding-left: 20px;">关闭</span> </span> 
		</a>
		</center>
	</div>
</body>
</html>

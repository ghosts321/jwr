<%@ page language="java" import="java.net.*" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>


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

    <script type="text/javascript">
    	var indexdata1 = window.parent.postdata;
  		$(function(){
  			indexdata1=eval("("+indexdata1+")");
  			var motcode=indexdata1.adminmot;
  			var indexdata;
  			var usertype='<%=request.getParameter("type")==null?"":request.getParameter("type")%>';
  			//此处为何 来个截取
  			if(usertype=='en'){
  			}else{
  				motcode=indexdata1.adminmot;
  			}
  			 $.ajax({
         	    type:"POST",
         	    async:false,
         	    url:"/jwr/bookUpdate/getMotByCodeAction.action",
         	    data:{'motcode':motcode},
         	    success:function(returnValue){
         	   	 		indexdata=eval("("+returnValue+")")[0];
         	   		var reason =indexdata1.reason;
				if(usertype=='en'){
					if(reason=='1'){
         	   			indexdata.reason="企业法人代表变更的";
		  	  		}else if(reason=='2'){
		  	  			indexdata.reason="企业名称变更的";
		  	  		}else if(reason=='3'){
		  	  			indexdata.reason="企业地址变更的";
		  	  		}
					indexdata.content=indexdata1.content;
         	   		indexdata.pid=indexdata1.pid;
         	   		indexdata.cdate=indexdata1.cdate;
         	   		indexdata.resp=indexdata1.resp;
         	   		if(indexdata.resp==''){
         	   		indexdata.resp="尚未处理";
         	   		}
				}else{
	         	   		if(reason=='1'){
	         	   			indexdata.reason="（一）法定代表人变更的";
			  	  		}else if(reason=='2'){
			  	  		indexdata.reason="（二）机构名称变更的";
			  	  		}else if(reason=='3'){
			  	  		indexdata.reason="（三）机构地址变更的";
			  	  		}else if(reason=='4'){
			  	  		indexdata.reason="（四）停业、破产或有其他原因终止业务的";
			  	  		}else if(reason=='5'){
			  	  		indexdata.reason="（五）从事专职管理和考评工作的人员发生重大变化的";
		  	  			}
	         	   		indexdata.content=indexdata1.content;
         	   			indexdata.pid=indexdata1.pid;
         	   			indexdata.cdate=indexdata1.cdate;
         	   			indexdata.resp=indexdata1.resp;
	         	   		indexdata.advice=indexdata1.advice;
	         	   		if(indexdata.resp==''){
	         	   			indexdata.resp="尚未处理";
	         	   		}
	         	    }
         	    }
         	});
  	  		
  			 
  			 
  			  var ss= $("#motResp").ligerForm({
  	           	 inputWidth:350, labelWidth:60, 
  	           	appendID: true,
  	                fields:[  
  	                { display: "原因", name: "reason", newline: true,type:"text",disabled:true}, 
  	                { display: "内容", name: "content", newline: true,  type:"text",disabled:true},
  	                { display: "用户id", name: "pid", newline: true,  type:"text",disabled:true}, 
  	                { display: "日期", name: "cdate", newline: true, type:"text", disabled:true},
  	                { display: "主管机关", name: "motname", newline: true,  disabled:true},
  	                { display: "处理结果", name: "resp", newline: true, type:"text", disabled:true},
  	                { display: "处理意见", name: "advice", newline: true, type:"textarea", disabled:true}
  	                ]
  	           });
  			ss.setData(indexdata);
  			$("#advice").attr("disabled","disabled");
  		})
    </script>
</head>

<body>
<center style="border: 1px solid #369">
		<h1 style="padding:20px; background-color:#369; color: white; font-size: 22px; margin-top:0px">变更申请详细信息</h1>
		
	</center>
		<div id="motResp" style="margin: 3; padding: 0;width: 95%"></div>
	<br/>
</body>
</html>

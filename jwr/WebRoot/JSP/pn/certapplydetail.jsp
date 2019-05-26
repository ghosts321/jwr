<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
%>
<%@ include file="../main.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
  <script type="text/javascript">
 	var id='<%=id%>',indexdata="";
    $.ajax({
	    type:"POST",
	    async:false,
	    data:{id:id},
	    url:"<%=basePath%>exchangecert/getDetialByIdAction.action",
	    success:function(returnValue){
	    	indexdata = eval("("+returnValue+")");
	    }
	});
  	$(function(){
  	//创建表单结构 
  		       var ss=     $("#certApply").ligerForm({
  		            	 inputWidth:120, labelWidth: 90, space: 20,
  		                 fields:[  
  		                 { display: "用户ID", name: "userid", newline: true,type:"text",disabled:true  }, 
  		                 { display: "主管机关", name: "adminmot", newline: false,  type:"text",disabled:true},
  		                 { display: "名称", name: "pnname", newline: true,  type:"text",disabled:true}, 
  		                 { display: "证件号", name: "pid", newline: false, type:"text", disabled:true,inputWidth:120},
  		                 { display: "业务类型", name: "bussinestype", newline: true,  disabled:true}, 
  		               	 { display: "初审结果", name: "resp_reg", newline: false,  disabled:true}, 
  		              	{ display: "联系地址", name: "address", newline: true,  disabled:true}, 
  		                 { display: "手机", name: "mobile", newline: false,  disabled:true}, 
  		                 { display: "联系人邮箱", name: "email", newline: true, disabled:true},
  		                 { display: "联系电话", name: "tel", newline: false, disabled:true}, 
  		                 { display: "传真", name: "fax", newline: true, disabled:true},
  		                 { display: "日期", name: "createdate", newline: false, disabled:true},
  		              	 { display: "工作单位", name: "org", newline: true, disabled:true}
  		                 ]
  		            });
  		            indexdata[0].bussinestype = getBusTypeVal(indexdata[0].bussinestype);
  		     		indexdata[0].adminmot = getMotVal(indexdata[0].adminmot);
  		            ss.setData(indexdata[0]);
  			
  	});
  
  </script>
	</head>
<body>
	<center >
		<h1 style="padding:20px; background-color:#369; color: white; font-size: 22px; margin-top:0px">资格申请</h1>
			<div id="certApply" style="margin: 5 3 3 30; padding: 0;width: 95%"></div>
	</center>
	<br/>
</body>
</html>
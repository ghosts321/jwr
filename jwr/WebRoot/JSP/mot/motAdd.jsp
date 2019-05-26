<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../main.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>
		  详细信息
		</title>
<script type="text/javascript">
	var indexdata=${js};
  	function check(){
  		formsubmit();
  	}
  	function formsubmit(){
  		
  		document.forms[0].submit();
  	}
  	
  	$(function(){
  		
  	//创建表单结构 
  		       var ss=     $("#maingrid4").ligerForm({
  		            	 inputWidth: 370, labelWidth: 120, space: 20,
  		                 fields:[  
  		                 { display: "上级主管机关", name: "userid", newline: true,type:"text",disabled:true  }, 
  		                 { display: "主管机关代码", name: "adminmot", newline: false,  type:"text",disabled:true},
  		                 { display: "主管机关名称", name: "motname", newline: true,  type:"text",disabled:true} 
  		                 ]
  		            }); 
  					ss.setData(indexdata);
  			
  	});
  
  </script>
	</head>
<body>
	<div class="panel layout-panel layout-panel-center" style="left: 210px; top: 70px; width: 1158px; ">
			<div style="margin:10px auto;"></div>
	<div class="l-loading" style="display: block;" id="pageloading"></div>
	
	<div id="maingrid4" style="margin: 0; padding: 0"></div>
	<div style="display: none;"></div> 
	</div>
</body>
</html>

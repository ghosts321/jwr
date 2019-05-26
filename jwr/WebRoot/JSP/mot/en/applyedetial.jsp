<%@ page language="java" import="java.net.*" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
  <script type="text/javascript">
  var indexdata=window.parent.postdata1;
  indexdata = eval("("+indexdata+")");
   
  	function check(){
  		formsubmit();
  	}
  	function formsubmit(){
  		var changereason = document.getElementById('changereason').value;
  		if(changereason.length>800){
  			alert("审批意见字数不能超过800个，已输入"+data.length+"个字!");
  			return false;
  		}
  	    $.ajax({
  		    type:"POST",
  		    async:false,
  		    url:"<%=basePath%>exchangecert/exchangeSubmitAction.action?userid="+indexdata.userid+"&bustype="+encodeURI(encodeURI(indexdata.type))+"&changereason="+encodeURI(encodeURI(changereason)),
  		    success:function(returnValue){
  		   		if(returnValue=='yes'){
  		   			alert("换证申请成功！");
	  		   		window.parent.iniData();
	  		   		window.parent.applyedData();
	  		  		window.parent.manager1.close();
  		   		}else{
  		   			alert("换证申请失败！");
  		   		}
  		    }
  		});
  	}
  	
  	$(function(){
  		
  	//创建表单结构 
  		       var ss=     $("#motResp").ligerForm({
  		            	 inputWidth:120, labelWidth: 90, space: 20,
  		                 fields:[  
  		                 { display: "用户ID", name: "userid", newline: true,type:"text",disabled:true  }, 
  		                 { display: "主管机关", name: "adminmotname", newline: false,  type:"text",disabled:true},
  		                 { display: "名称", name: "enname", newline: true,  type:"text",disabled:true}, 
  		                 { display: "证件号", name: "pid", newline: false, type:"text", disabled:true,inputWidth:120},
  		                 { display: "证书号", name: "cid", newline: true,  disabled:true}, 
  		                 { display: "业务类型", name: "type2name", newline: false,  disabled:true}, 
  		                 { display: "手机", name: "mobile", newline: true,  disabled:true}, 
  		                 { display: "联系人邮箱", name: "email", newline: false, disabled:true},
  		                 { display: "联系电话", name: "tel", newline: true, disabled:true}, 
  		                 { display: "传真", name: "tax", newline: false, disabled:true},
  		                 { display: "日期", name: "createdate", newline: true, disabled:true},
  		                 { display: "状态", name: "changeresault", newline: true, disabled:true} 
  		              
  		                 ]
  		            }); 
  					ss.setData(indexdata);
  					if(indexdata.changeresault=='1'){
  						$("[name=changeresault]").val("同意");
  					}else if(indexdata.changeresault=='0'){
  						$("[name=changeresault]").val("不同意");
  					}else{
  						$("[name=changeresault]").val("尚未处理");
  					}
  					$("#changereason").val(indexdata.changereason==null?"":indexdata.changereason);
  					//document.getElementById("motForm").action="<%=basePath%>exchangecert/exchangeSubmitAction.action?userid="+indexdata.userid+"&bustype="+indexdata.type;
  			
  	});
  
  </script>
	</head>
<body>
	<center>
		<h1 style="padding:20px; background-color:#369; color: white; font-size: 22px; margin-top:0px">换证申请</h1>
			<div id="motResp" style="margin: 3; padding: 0;width: 95%"></div>
	</center>
	<table style="margin: 3">
		<tr align="left">
				<td>
					审批意见:
			    </td>
			    <td>
			    			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    				 
			    	<textarea  disabled="disabled" id="changereason" name = "changereason" style="width: 400px"></textarea>
			    </td>
			</tr>
			</table>
	<br/>
</body>
</html>
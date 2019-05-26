<%@ page language="java" import="java.net.*" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
  <script type="text/javascript">
  var indexdata=window.parent.postdata1;
  indexdata = eval("("+indexdata+")");
  indexdata.type = getBusTypeVal(indexdata.type);
  if(indexdata.AUDITRESP=='0'){
	  indexdata.AUDITRESP='同意';
  }else if(indexdata.AUDITRESP=='1'){
	  indexdata.AUDITRESP='不同意';
  }
  	function check(){
  		formsubmit();
  	}
  	function formsubmit(){
  		var changereason = document.getElementById('changereason').value;
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
  					if(indexdata.CHANGERESAULT=="0"){
  		     			indexdata.CHANGERESAULT="同意";
  		     		}else if (indexdata.CHANGERESAULT=="1"){
  		     			indexdata.CHANGERESAULT="不同意";
  		     		}
  		       var ss=     $("#motResp").ligerForm({
  		            	 inputWidth:120, labelWidth: 90, space: 20,
  		                 fields:[  
  		                 { display: "用户ID", name: "USERID", newline: true,type:"text",disabled:true  }, 
  		                 { display: "主管机关", name: "ADMINMOT", newline: false,  type:"text",disabled:true},
  		                 { display: "名称", name: "PNNAME", newline: true,  type:"text",disabled:true}, 
  		                 { display: "证件号", name: "PID", newline: false, type:"text", disabled:true,inputWidth:120},
  		                 { display: "证书号", name: "CERTNUMBER", newline: true,  disabled:true}, 
  		                 { display: "业务类型", name: "BUSSINESTYPE", newline: false,  disabled:true}, 
  		                 { display: "手机", name: "MOBILE", newline: true,  disabled:true}, 
  		                 { display: "联系人邮箱", name: "EMAIL", newline: false, disabled:true},
  		                 { display: "联系电话", name: "TEL", newline: true, disabled:true}, 
  		                 { display: "传真", name: "FAX", newline: false, disabled:true},
  		                 { display: "换证申请处理时间", name: "CHANGEDATE", newline: true, disabled:true},
  		                 { display: "换证申请状态", name: "CHANGERESAULT", newline: false, disabled:true } ]
  		            }); 
  		     		ss.setData(indexdata);
		     		$("[name=BUSSINESTYPE]").val(getBusTypeVal(indexdata.BUSSINESTYPE));
		     		$("[name=ADMINMOT]").val(getMotVal(indexdata.ADMINMOT));
  					
  					//document.getElementById("motForm").action="<%=basePath%>exchangecert/exchangeSubmitAction.action?userid="+indexdata.userid+"&bustype="+indexdata.type;
  					$("#advice").text(indexdata.CHANGEREASON);
  	});
  
  </script>
	</head>
<body>
	<center>
		<h1 style="padding:20px; background-color:#369; color: white; font-size: 22px; margin-top:0px">换证申请</h1>
			<div id="motResp" style="margin: 3; padding: 0;width: 95%"></div>
	</center>
	<br/>
	<label style="padding: 0">处理意见：</label>
	<textarea id="advice"  readonly="readonly" class="easyui-validatebox validatebox-text" style="width:400px; padding: 0"></textarea>
</body>
</html>
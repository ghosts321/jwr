<%@ page language="java" import="java.net.*" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
  <script type="text/javascript">
  var indexdata= window.parent.postdata;
  indexdata = eval("("+indexdata+")");
  
  	function check(){
  		formsubmit();
  	}
  	function formsubmit(){
  		var changereason = document.getElementById('changereason').value;
  		if(changereason.length>800){
  			alert("换证原因字数不能超过800个，已输入"+changereason.length+"个字!");
  			return false;
  		}
  	    $.ajax({
  		    type:"POST",
  		    async:false,
  		    data:{indexdata:JSON2.stringify(indexdata),renew:$("#changereason").val()},
  		    url:"<%=basePath%>exchangecert/enexchangeSubmitAction.action",
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
  		            	 inputWidth:140, labelWidth: 90, space: 20,
  		                 fields:[  
  		                 { display: "用户ID", name: "userid", newline: true,type:"text",disabled:true  }, 
  		                 { display: "主管机关", name: "adminmotname", newline: false,  type:"text",disabled:true},
  		                 { display: "名称", name: "enname", newline: true,  type:"text",disabled:true}, 
  		                 { display: "证件号", name: "pid", newline: false, type:"text", disabled:true,inputWidth:120},
  		                 { display: "证书号", name: "certnumber", newline: true,  disabled:true}, 
  		                 { display: "业务类型", name: "type2name", newline: false,  disabled:true}, 
  		                 { display: "手机", name: "mobile", newline: true,  disabled:true}, 
  		                 { display: "联系人邮箱", name: "email", newline: false, disabled:true},
  		                 { display: "联系电话", name: "tel", newline: true, disabled:true}, 
  		                 { display: "传真", name: "tax", newline: false, disabled:true},
  		                 { display: "日期", name: "createdate", newline: true, disabled:true}
  		              
  		                 ]
  		            }); 
  					ss.setData(indexdata );
  					
  					//document.getElementById("motForm").action="<%=basePath%>exchangecert/exchangeSubmitAction.action?userid="+indexdata.userid+"&bustype="+indexdata.type;
  			
  	});
  
  </script>
	</head>
<body>
	<center style="border: 1px solid #369">
		<h1 style="padding:20px; background-color:#369; color: white; font-size: 22px; margin-top:0px">换证申请</h1>
			<div id="motResp" style="margin: 3; padding: 0;width: 95%"></div>
	</center>
	<br/>
	<form method="post" id="motForm" action="">
		<table style="margin: 3">
			<tr>
				<td>
					换证原因:
			    </td>
			    <td>
			    			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    				 
			    	<textarea  id="changereason" name = "changereason" style="width: 400px"></textarea>
			    </td>
			</tr>
			
			<!-- tr>
				<td>
					换证结果:
			   </td>
				<td>
				 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select id="regresp" value="1">
						<option value="1">同意</option>
						<option value="2">不同意</option>
						<option value="0">尚未处理</option>
					</select>
				</td>
			</tr-->
		</table>
		<div class="l-panel-topbar" style="width:520px" align="center">
			<a onclick="check()" iconcls="icon-ok" href="javascript:void(0);" class="easyui-linkbutton l-btn" id="ty">
				<span class="l-btn-left">
					<span class="l-btn-text icon-ok" style="padding-left: 20px;">提 交</span>
				</span>
			</a>
		<!-- <div class="l-panel-topbarinner l-toolbar l-panel-topbarinner-center" align="center"
			ligeruiid="ToolBar1000" style="">
			<div class="l-toolbar-item l-panel-btn l-toolbar-item-hasicon"
				toolbarid="item-1">
				<span onclick="check()" >提交</span>
				<div class="l-panel-btn-l"></div>
				<div class="l-panel-btn-r"></div>
				<div class="l-icon l-icon-ok"></div>
			</div>
		</div >-->
	</div>
	</form>
</body>
</html>
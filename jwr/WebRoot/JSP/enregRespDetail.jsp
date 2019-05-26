<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="main.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>
		  企业报名申请详细信息
		</title>
		
  <script type="text/javascript">
  <%String   msg=request.getAttribute("msg")==null?"":request.getAttribute("msg").toString();
  
	if(msg.equals("yes")){
		%>
		alert("提交成功，窗口将关闭");
		 window.parent.iniData("enGrid");
		 window.parent.ligerwindow.close();
		 <%
	}else if(msg!=null&&!msg.equals("yes")&&!msg.equals("")){
		%>
			alert('<%=msg%>');
			window.parent.ligerwindow.close();
		<%
	}else{%>
		var indexdata=${js};
	<%
	}
%>
  	function check(){
  		var dsd=document.getElementById('regrespremark').value;
  		if($("#regresp").val()=='0'){
  			$.ligerDialog.error('请选择审核结果！');	 
  			return false;
  		}
  		if(dsd.length>800){
  			alert("初审意见字数不能超过800个，已输入"+dsd.length+"个字!");
  			return false;
  		}
  		formsubmit();
  	}
  	function formsubmit(){
  		document.forms[0].submit();
  		
  	}
  	
  	$(function(){
  		
  	//创建表单结构 
  		       var ss=     $("#motResp").ligerForm({
  		            	 inputWidth: 250, labelWidth: 190, space: 10,
  		                 fields:[  
  		                 { display: "用户ID", name: "userid", newline: true,type:"text",disabled:true  }, 
  		                 { display: "主管机关", name: "adminmot", newline: false,  type:"text",disabled:true},
  		                 { display: "所属市", name: "city", newline: true,  type:"text",disabled:true}, 
  		                 { display: "名称", name: "username", newline: true, type:"text", disabled:true},
  		                 { display: "组织机构代码", name: "pid", newline: false,type:"text", disabled:true}, 
  		                 { display: "法人代表", name: "legalp", newline: true,  disabled:true},
  		                 { display: "联系人姓名", name: "contact", newline: false,  disabled:true}, 
  		                 { display: "手机", name: "mobile", newline: true, disabled:true},
  		                 { display: "联系人邮箱", name: "email", newline: false, disabled:true}, 
  		                 { display: "等级", name: "grade", newline: true, disabled:true},
  		                 { display: "业务类型", name: "bustype", newline: false, disabled:true}, 
  		               	 { display: "业务类别", name: "celltype", newline: true, disabled:true}, 
  		                 { display: "通讯地址", name: "address", newline: false, disabled:true}, 
  		                 { display: "联系电话", name: "tel", newline: true, disabled:true},
  		               	 { display: "传真", name: "tax", newline: false, disabled:true},
  		             	 { display: "日期", name: "createdate", newline: true, disabled:true}
  		             	 
  		                 ]
  		            }); 
  					ss.setData(indexdata);
  					$("[name=adminmot]").val(getMotVal(indexdata.adminmot));
  		     	 	$("[name=bustype]").val(getBusTypeVal(indexdata.bustype));
  		     	 	$("[name=celltype]").val(getCelltype(indexdata.celltype));
  		     	 	$("[name=province]").val(getcomefromVal(indexdata.province));
  		     	 	$("[name=city]").val(getcomefromValue(indexdata.city));
  					document.getElementById("motForm").action="<%=basePath%>mot/enRegRespUpdateAction.action?pid="+indexdata.id;
  					$("#regrespremark").text(indexdata.regrespremark);
  					if (indexdata.regresp==1) {
						$("#button").hide();
						$("#button1").show();
					}
  					if(indexdata.grade=="2"){
  						$("[name=grade]").val("二级");
  					}else if(indexdata.grade=="3"){
  						$("[name=grade]").val("三级");
  					}
  					
  	});
  
  </script>
	</head>
<body style="overflow: hidden;">
	<center style="border: 1px solid #369">
		<h1 style="padding:20px; background-color:#369; color: white; font-size: 22px; margin-top:0px">企业报名申请初审</h1>
			<div id="motResp" style="margin: 0; padding: 5"></div>
			
	</center>
	<br/>
	<form method="post" id="motForm" action="<%=basePath%>mot/enRegRespUpdateAction.action">
	
		<table cellspacing="5">
			<tr>
				<td>
					初审意见:
			    </td>
			    <td>
			    			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    				 
			    	<textarea  id="regrespremark"   name="enRegInfo.regrespremark"  style="width: 400px;"></textarea>
			    </td>
			</tr>
			<tr>
				<td>
					初审结果:
			   </td>
				<td>
				 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select id="regresp"  name="enRegInfo.regresp" value="0">
						<script type="text/javascript">
							if(indexdata.regresp==null||indexdata.regresp=='0'||indexdata.regresp==''){
								 $("#regresp").append("<option value='0'  selected='selected'>尚未处理</option> <option value='1'>同意</option> <option value='2'>不同意</option>");
							 }else if(indexdata.regresp!=null&&indexdata.regresp=='1'){
								 $("#regresp").append("<option value='1'  selected='selected'>同意</option>");
							 }else if(indexdata.regresp!=null&&indexdata.regresp=='2'){
								 $("#regresp").append("<option value='2'  selected='selected'>不同意</option><option value='1'>同意</option>");
							 } 
						</script>
					</select>
				</td>
			</tr>
			
		</table>
				<center>
					 <input type="button" id="button" class="button blue" value="提交" onclick="check();" style="width: 50;height: 20"/>
					 <input type="button" id="button1" class="button blue" value="关闭" onclick="javascript:window.parent.ligerwindow.close();" style="width: 50;height: 20;display: none;"/>
				</center>
	</div>
	</form>
</body>
</html>

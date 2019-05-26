<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="main.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>
		  主管机关报名申请详细信息
		</title>
	
  <script type="text/javascript">
  <%String   msg=request.getAttribute("msg")==null?"":request.getAttribute("msg").toString();
	if(msg.equals("yes")){
		%>
		alert("提交成功，窗口将关闭");
		 window.parent.iniData("motGrid");
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
  			alert('请选择审核结果！');	 
  			return false;
  		}
  		if(dsd.length>800){
  			alert("初审意见字数不能超过800个，已输入"+dsd.length+"个字!");
  			return false;
  		}
  		if($("#regresp").val()=='1'){
  			alert('审批通过之后，请联系管理员为此机构分配专业权限！');
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
  		                 { display: "名称", name: "motname", newline: true,  type:"text",disabled:true}, 
  		                 { display: "证件号", name: "pid", newline: false, type:"text", disabled:true},
  		                 { display: "法人代表", name: "legalp", newline: true,type:"text", disabled:true}, 
  		                 { display: "联系人姓名", name: "contact", newline: false,  disabled:true},
  		                 { display: "手机", name: "mobile", newline: true,  disabled:true}, 
  		                 { display: "联系人邮箱", name: "email", newline: false, disabled:true},
  		                 { display: "联系电话", name: "tel", newline: true, disabled:true}, 
  		                 { display: "传真", name: "tax", newline: false, disabled:true},
  		                 { display: "日期", name: "createdate", newline: true, disabled:true}, 
  		               	 { display: "操作权限", name: "isread", newline: false, disabled:true}, 
  		                 { display: "可用/停用", name: "usable", newline: true, disabled:true},
  		                 { display: "城市", name: "city", newline: false,type:"text",disabled:true} 
  		                 ]
  		            });
  		     		ss.setData(indexdata);
  		     		$("[name=adminmot]").val(getMotVal(indexdata.adminmot));
  		     		$("[name=city]").val(getcomefromValue(indexdata.city));
  					document.getElementById("motForm").action="<%=basePath%>mot/motRegRespUpdateAction.action?pid="+indexdata.id;
  					$("#regrespremark").text(indexdata.regrespremark);
  					if (indexdata.regresp==1) {
						$("#button").hide();
						$("#button1").show();
					}
  					if( indexdata.usable=='0'){
  						$("[name=usable]").val("停用");
  					}else{
  						$("[name=usable]").val("可用");
  					}
  					if( indexdata.isread!=''&&indexdata.isread=='1'){
  						$("[name=isread]").val("仅可阅读");
  					}else{
  						$("[name=isread]").val("正常操作");
  					}
  	});
  </script>
	</head>
<body style="overflow: hidden;">
	<center style="border: 1px solid #369">
		<h1 style="padding:20px; background-color:#369; color: white; font-size: 22px; margin-top:0px">主管机关报名申请初审</h1>
			<div id="motResp" style="margin: 0; padding: 5"></div>
			
	</center>
	<br/>
	<form method="post" id="motForm" action="<%=basePath%>mot/motRegRespUpdateAction.action">
	
		<table cellspacing="5">
			<tr>
				<td>
					初审意见:
			    </td>
			    <td>
			    			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    				 
			    	<textarea   id="regrespremark"   name="motRegInfo.regrespremark"  style="width: 400px"></textarea>
			    </td>
			</tr>
			<tr>
				<td>
					初审结果:
			   </td>
				<td>
				 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select id="regresp"  name="motRegInfo.regresp" value="0">
						<script type="text/javascript">
							 if(indexdata.regresp==null||indexdata.regresp=='0'||indexdata.regresp==''){
								 $("#regresp").append("<option value='0'  selected='selected'>尚未处理</option> <option value='1'>同意</option> <option value='2'>不同意</option>");
							 }else if(indexdata.regresp!=null&&indexdata.regresp=='1'){
								 $("#regresp").append("<option value='1'  selected='selected'>同意</option>");
							 }else if(indexdata.regresp!=null&&indexdata.regresp=='2'){
								 $("#regresp").append("<option value='2'  selected='selected'>不同意</option> <option value='1'>同意</option>");
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

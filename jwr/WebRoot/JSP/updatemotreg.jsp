<%@page import="com.wr4.domain.MotRegInfo"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="main.jsp" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
	String userid = request.getParameter("userid");
	String num = request.getParameter("num");
	MotRegInfo motRegInfo = (MotRegInfo)request.getAttribute("motRegInfo");
	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>
		  主管机关报名申请
		</title>
		
  <script type="text/javascript">
  <%String   msg=request.getAttribute("msg")==null?"":request.getAttribute("msg").toString();
  if(msg.equals("yes")){
  	%>
  	 alert("提交成功，窗口将关闭");
  	 window.close();
  	 <%
  }else if(msg!=null&&!msg.equals("yes")&&!msg.equals("")){
  	%>
  		alert('<%=msg%>');
  		 window.close();
  	<%
  }else{%>
  	 
  <%
  }
  %>
  function showMot(city){
//管理机关
	 $.ajax({
		    type:"POST",
		    async:false,
		    url:"/jwr/respInfo/getMotByCityAction.action",
		 	data:{city:city},
		    success:function(returnValue){
		   		indexdata=returnValue;
		   		var obj1=(eval("("+indexdata+")")).Rows;
		   		var str="";
		   	    str='<SELECT id="motRegInfo.adminmot" name="motRegInfo.adminmot">';
		   		for(var i=0;i<obj1.length;i++){
		   			if(i==0){
		   				if('${motRegInfo.adminmot}'==obj1[i].motcode){
		   					str+='<OPTION selected value='+obj1[i].motcode+'>'+obj1[i].motname+'</OPTION>';
		   				}else{
		   					str+='<OPTION value='+obj1[i].motcode+'>'+obj1[i].motname+'</OPTION>';
		   				}
		   			}else{
		   				if('${motRegInfo.adminmot}'==obj1[i].motcode){
		   					str+='<OPTION selected  value='+obj1[i].motcode+'>'+obj1[i].motname+'</OPTION>';
		   				}else{
		   					str+='<OPTION  value='+obj1[i].motcode+'>'+obj1[i].motname+'</OPTION>';
		   				}
		   			}
		   		}
		   		str+='</SELECT>';
		   		$("#sa").html(str);
		    }
		});
}
//获取所在市
$(function(){
 $.ajax({
	    type:"POST",
	    async:false,
	    url:"/jwr/respInfo/getcityAction.action",
	    success:function(returnValue){
	   		indexdata=returnValue;
	   		var obj2=(eval("("+indexdata+")")).Rows;
	   		var str1="";
	   	    str1='<SELECT selected id="motRegInfo.city" name="motRegInfo.city" onchange="showMot(this.options[this.selectedIndex].value)">';
	   	    for(var i=0;i<obj2.length;i++){
	   			if(i==0){
	   				if('${motRegInfo.city}'==obj2[i].du_code){
	   					str1+='<OPTION selected value='+obj2[i].du_code+'>'+obj2[i].du_name+'</OPTION>';
	   				}else{
	   					str1+='<OPTION  value='+obj2[i].du_code+'>'+obj2[i].du_name+'</OPTION>';
	   				}
	   			}else{
	   				if('${motRegInfo.city}'==obj2[i].du_code){
	   					str1+='<OPTION selected value='+obj2[i].du_code+'>'+obj2[i].du_name+'</OPTION>';
	   				}else{
	   					str1+='<OPTION  value='+obj2[i].du_code+'>'+obj2[i].du_name+'</OPTION>';
	   				}
	   			}
	   		}
	   		  str1+='</SELECT>';
	   		$("#citys").html(str1); 
	    }
	 });
})
  
  	function check(){
  		$("#send").attr("disabled",true);
  		//组织机构代码
  		var orgCode=document.getElementById('motRegInfo.pid');
  		//联系人身份证
  		var card=document.getElementById('motRegInfo.cpid');
  		var cellphone=/^0?1[3|4|5|8][0-9]\d{8}$/;
  		var phone=/^(\d{3,4}\-?)?\d{7,8}$/;
  		var myreg = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
  		var regs =  /[\u4E00-\u9FA5]/g;
  		var userid=document.getElementById('motRegInfo.userid').value;
  		var motname=document.getElementById('motRegInfo.motname').value;
  		var legalp=document.getElementById('motRegInfo.legalp').value;
  		var contact=document.getElementById('motRegInfo.contact').value;
  		var mobile=document.getElementById('motRegInfo.mobile').value;
  		var email=document.getElementById('email').value;
  		var address=document.getElementById('motRegInfo.address').value;
  		var tel=document.getElementById('motRegInfo.tel').value;
  		var tax=document.getElementById('motRegInfo.tax').value;
  		if($.trim(userid)=="" || userid== null){
  			alert("输入用户ID不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(regs.test(userid)){
  			alert("用户ID不能输入中文,请从新填写");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(userid.length>20){
  			alert("输入用户ID字数不能超过20个，已输入"+userid.length+"个字!");
			$("#send").removeAttr("disabled");
			return;
  		}
  		
  		if(motname=="" || motname== null){
  			alert("输入单位名称不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(motname.length>100){
  			alert("输入单位名称字数不能超过100个，已输入"+motname.length+"个字!");
			$("#send").removeAttr("disabled");
			return;
  		}
  		if(card!=null){
  			card=card.value;
  		}
  		if(card==''){
  			alert("输入身份证号码不能为空!");
  			 $("#send").removeAttr("disabled");
  			 return (false);
  		}else{
  			var mesg=checkDate(card); //调用验证身份证号码
  			if(mesg!=''){
  				alert(mesg);
  				 $("#send").removeAttr("disabled");
  				 return (false);
  			}
  		}
  		if(orgCode!=null){
  			orgCode=orgCode.value;
  		}
  		if(orgCode==''){
  			alert("组织机构代码不能为空，请填写！");
  			 $("#send").removeAttr("disabled");
  			 return (false);
  		}else{
  			var bol=isValidOrgCode(orgCode); //调用验证组织机构代码
  			if(!bol){
  				alert("组织机构代码格式不正确，请检查！");
  				 $("#send").removeAttr("disabled");
  				return (false);
  			}
  		}
  		
  		if(legalp=="" || legalp== null){
  			alert("输入法人代表不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(legalp.length>10){
  			alert("输入法人代表字数不能超过10个，已输入"+legalp.length+"个字!");
			$("#send").removeAttr("disabled");
			return;
  		}
  		if(contact=="" || contact== null){
  			alert("输入联系人姓名不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(contact.length>10){
  			alert("输入联系人姓名字数不能超过10个，已输入"+contact.length+"个字!");
			$("#send").removeAttr("disabled");
			return;
  		}
  		if(mobile=="" || mobile== null){
  			alert("输入联系人手机不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
		if(!cellphone.test(mobile)){
		   alert('请输入有效的手机号码！');
		   $("#send").removeAttr("disabled");
		   return;
		}
  		if(email=="" || email== null){
  			alert("输入联系人邮箱不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(!myreg.test(email)){
  			alert("请输入有效的邮箱!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(email.length>100){
  			alert("输入联系人邮箱不能超过100位，已输入"+email.length+"个字!");
			$("#send").removeAttr("disabled");
			return;
  		}
  		if(address=="" || address== null){
  			alert("输入通讯地址不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(address.length>300){
  			alert("输通讯地址字数不能超过300个，已输入"+address.length+"个字!");
			$("#send").removeAttr("disabled");
			return;
  		}
  		if(tel=="" || tel== null){
  			alert("输入联系电话不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(!phone.test(tel)){
  			alert("请输入有效的电话号码!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		
  		if(tax=="" || tax== null){
  			alert("输入单位传真不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(tax.length>15){
  			alert("输入单位传真字数不能超过10个，已输入"+tax.length+"个字!");
			$("#send").removeAttr("disabled");
			return;
  		}
  		
  		
  		
  		
  		/* var user= document.getElementById('motRegInfo.userid').value;
		var userBol=false;
		  $.ajax({
			    type:"POST",
			    async:false,
			    data:{userid:user,usertype:'mot'},
			    url:"/jwr/respInfo/getUserIdAction.action",
			    success:function(returnValue){
			   		if(returnValue=='yes'){
			   			alert('该用户名已被注册！请从新填写');
			   		    userBol=true;
			   		}
			   		
			    }
			});
			if(userBol){$("#send").removeAttr("disabled");return;}
		var pid= document.getElementById('motRegInfo.cpid').value;
		var pidBol=false;
		$.ajax({
			    type:"POST",
			    async:false,
			    data:{pid:pid,usertype:'mot'},
			    url:"/jwr/respInfo/getpidAction.action",
			    success:function(returnValue){
			   		if(returnValue=='yes'){
			   			alert('该身份证已被注册！请从新填写');
			   			pidBol=true;
			   		}
			   		
			    }
			    
			});
	
  		if(pidBol){$("#send").removeAttr("disabled");return;}
  		var orgCodeBol=false;
		$.ajax({
			    type:"POST",
			    async:false,
			    data:{orgCode:orgCode,usertype:'mot'},
			    url:"/jwr/respInfo/getorgCodeAction.action",
			    success:function(returnValue){
			   		if(returnValue=='yes'){
			   			alert('该组织机构代码已被注册！请从新填写');
			   			orgCodeBol=true;
			   		}
			   		
			    }
			    
			});
	
  		if(orgCodeBol){$("#send").removeAttr("disabled");return;}
  		$("#send").attr("disabled",true); */
  		formsubmit();
  	}
  	function formsubmit(){
  		
  		document.forms[0].submit();
  	}
  	$(function(){
  		var city ='${motRegInfo.city}';
  	  	if(city != null){
  	  		showMot(city);
  	  	}
  	});
  </script>
	</head>
<body>
	<center style="border: 1px solid #369">
		<h1  style="padding:20px; background-color:#369; color: white; font-size: 22px; margin-top:0px">主管机关报名申请信息修改</h1>
		<div align="left">
			<div class="eui-info">
				<div class="eui-tip icon-tip"></div>
				<div>请认真填写如下所有信息，并等待主管机关进行报名申请初审。</div>
			</div>
		</div>
		<div align="center" style="border:0px solid red">
			<input id="typeText" type="hidden" value="">
			<form id="fm1" method="POST" action="<%=basePath%>/reg/updatemotregAction.action">
			<input type="hidden" name="motRegInfo.id" id="motid" value="${motRegInfo.id }"/>
				<table style="margin-left: 30px">
					<caption style="padding: 5px">
						<h1 align="center">主管机关报名申请</h1>
					</caption>
					<tbody>
						
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="注：除一级企业及长航局、珠航局企业外，请和上面主管机关选项一致">所在区域：</label></td>
							<td style="border-bottom:1px dotted gray">
								<span id="citys"></span>
							</td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="省级交通厅、交委请选择“交通运输部”">主管机关：</label></td>
							<td style="border-bottom:1px dotted gray">
								<span id="sa"></span>
							</td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>单位名称：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="motRegInfo.motname" 
								name="motRegInfo.motname" required="true" style="width:300px" type="text"
								value="${motRegInfo.motname }"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>组织机构代码：</label></td>
							<td style="border-bottom:1px dotted gray"><input readonly="readonly"
								class="easyui-validatebox validatebox-text" id="motRegInfo.pid" name="motRegInfo.pid"
								required="true" type="text" value="${motRegInfo.pid }"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>法人代表：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="motRegInfo.legalp" name="motRegInfo.legalp" value="${motRegInfo.legalp}" required="true" type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray">
								<label>用户ID：</label></td>
							<td style="border-bottom:1px dotted gray">
								<input class="easyui-validatebox validatebox-text" id="motRegInfo.userid" readonly="readonly" name="motRegInfo.userid" value="${motRegInfo.userid}" required="true" type="text">
							</td><td><font color="red">*</font></td></tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>联系人姓名：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="motRegInfo.contact" value="${motRegInfo.contact}"
								name="motRegInfo.contact" required="true" type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray" title="15位或18位身份证">
								<label>联系人身份证号：</label></td>
							<td style="border-bottom:1px dotted gray"><input readonly="readonly"
								class="easyui-validatebox validatebox-text" id="motRegInfo.cpid" value="${motRegInfo.cpid }"
								name="motRegInfo.cpid" required="true" type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray">
								<label>联系人手机：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="motRegInfo.mobile" value="${motRegInfo.mobile }"
								name="motRegInfo.mobile" required="true" type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>联系人邮箱：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="email" value="${motRegInfo.email }"
								name="motRegInfo.email" required="true" type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray">
								<label
								title="选择GIS坐标">通讯地址：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="motRegInfo.address" value="${motRegInfo.address }"
								name="motRegInfo.address" required="true" style="width:300px"
								title="选择GIS坐标" type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray">
								<label>联系电话：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="motRegInfo.tel" name="motRegInfo.tel" value="${motRegInfo.tel }"
								required="true" type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray">
								<label>单位传真：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="motRegInfo.tax" name="motRegInfo.tax" value="${motRegInfo.tax }"
								required="true" type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td align="center" colspan="3" style="padding: 15px"><p>
									注：带红色<font color="red">*</font>的为必填项。
								</p>
								 <input type="button" class="button blue" value="提交" onclick="check()" id="send"style="width: 50;height: 20"/>
								 <input type="reset" calss="button blue" value="重置"  style="width: 50;height: 20"/> 
						</tr>
					</tfoot>
				</table>
			</form>
		</div>
		<h2 style="padding:15px; background-color:lightgray; margin-bottom:0px; color:#333; text-shadow:0 1px 0 #EEE;">版权所有：<%=pro_mot_name %>
			2016 年</h2>
	</center>
</body>
</html>

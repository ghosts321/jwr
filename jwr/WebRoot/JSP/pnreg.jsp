<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="main.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>考评员报名申请</title>

<script type="text/javascript">
<%String   msg=request.getAttribute("msg")==null?"":request.getAttribute("msg").toString();
if(msg.equals("yes")){
	%>
	 	alert("提交成功，窗口将关闭");
	 	window.open("","_self");
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
	   	    str1='<SELECT selected id="pnRegInfo.city" name="pnRegInfo.city" onchange="resetBustype()">';
	   	    for(var i=0;i<obj2.length;i++){
	   			if(i==0){
	   				str1+='<OPTION selected=true value='+0+'>'+'--请选择--'+'</OPTION>';
	   				if('${pnRegInfo.city}'==obj2[i].du_code){
	   					str1+='<OPTION selected value='+obj2[i].du_code+'>'+obj2[i].du_name+'</OPTION>';
	   				}else{
	   					str1+='<OPTION  value='+obj2[i].du_code+'>'+obj2[i].du_name+'</OPTION>';
	   				}
	   			}else{
	   				if('${pnRegInfo.city}'==obj2[i].du_code){
	   					str1+='<OPTION selected value='+obj2[i].du_code+'>'+obj2[i].du_name+'</OPTION>';
	   				}else{
	   					str1+='<OPTION  value='+obj2[i].du_code+'>'+obj2[i].du_name+'</OPTION>';
	   				}
	   			}
	   		}
	   		  str1+='</SELECT>';
	   		$("#city").html(str1); 
	    }
	 });
})

function resetBustype(){
	var bustype=document.getElementById('pnRegInfo.type');
	bustype.value='';
}
function showMot(type){
	var city= document.getElementById('pnRegInfo.city').value;
	$.ajax({
	    type:"POST",
	    async:false,
	    data:{type:type,city:city},
	    url:"/jwr/taskAssignation/getMotByTypeAction.action",
	    success:function(returnValue){
		    var str = returnValue;
		    if(str == ""){
				alert("没有管理此专业的主管机关");
				$("#notName").val("");
				document.getElementById('pnRegInfo.admin').value="";
			}else{
			    document.getElementById("pnRegInfo.admin").value=str.split(',')[0];
		   		$("#notName").val(str.split(',')[1]);
			}
	    }
   });
}
  	function check(){
  	$("#send").attr("disabled",true);
  	//组织机构代码
  		//联系人身份证
  		var card=document.getElementById('pnRegInfo.pid');
  		var reg = new RegExp("^[0-9]*$");
  		var cellphone=/^0?1[3|4|5|8][0-9]\d{8}$/;
  		var phone=/^(\d{3,4}\-?)?\d{7,8}$/;
  		var myreg = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
  		var re= /^[1-9][0-9]{5}$/;
  		var regs =  /[\u4E00-\u9FA5]/g;
  		var userid=document.getElementById('pnRegInfo.userid').value;
  		var pass=document.getElementById('pnRegInfo.userpass').value;
  		var surepass=document.getElementById('surepass').value;
  		var username=document.getElementById('pnRegInfo.username').value;
  		var org=document.getElementById('pnRegInfo.org').value;
  		var address=document.getElementById('pnRegInfo.address').value;
  		var adminName=document.getElementById('pnRegInfo.admin').value;
  		var bustype=document.getElementById('pnRegInfo.type').value;
  		var city= document.getElementById('pnRegInfo.city').value;
  		var pcode=document.getElementById('pnRegInfo.pcode').value;
  		var mobile=document.getElementById('pnRegInfo.mobile').value;
  		var email=document.getElementById('pnRegInfo.email').value;
  		var edu=document.getElementById('pnRegInfo.edu').value;
  		var major=document.getElementById('pnRegInfo.major').value;
  		var prof=document.getElementById('pnRegInfo.prof').value;
  		var begindate=document.getElementById('pnRegInfo.begindate').value;
  		var train=document.getElementById('pnRegInfo.train').value;
  		var resume=document.getElementById('pnRegInfo.resume').value;
  		var perf=document.getElementById('pnRegInfo.perf').value;
  		var tel=document.getElementById('pnRegInfo.tel').value;
  		var title=document.getElementById('pnRegInfo.title').value;
  		var fax=document.getElementById('pnRegInfo.fax').value;
  		
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
  		if(pass=="" || pass==null){
  			alert("输入用户密码不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(pass.length>20){
  			alert("输入用户密码字数不能超过20个，已输入"+pass.length+"个字!");
			$("#send").removeAttr("disabled");
			return;
  		}
  		if(surepass=="" || surepass==null){
  			alert("输入确认密码不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		
  		if(pass!=surepass){
  			alert("输入密码不不一致!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(city=="" || city==null || city=="0"){
  			alert("请选择您所在的市!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(bustype =="" || bustype==null){
  			alert("专业类型不能为空!");
  			return;
  		}
  		if(adminName=="" || adminName == null){
  			alert("主管机关不能为空!");
  			return;
  		}
  		
  		if(username=="" || username==null){
  			alert("输入姓名不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(username.length>10){
  			alert("输入姓名字数不能超过10个，已输入"+username.length+"个字!");
			$("#send").removeAttr("disabled");
			return;
  		}
  		if(card!=null){
  			card=card.value;
  		}
  		if(card==''){
  			alert("输入身份证号码不能为空!");
  			 $("#send").removeAttr("disabled");
  			 return  ;
  		}else{
  			var mesg=checkDate(card); //调用验证身份证号码
  			if(mesg!=''){
  				alert(mesg);
  				 $("#send").removeAttr("disabled");
  				 return ;
  			}
  		}
  		
  		if(org=="" || org==null){
  			alert("输入工作单位不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(org.length>100){
  			alert("输入工作单位字数不能超过100个，已输入"+org.length+"个字!");
			$("#send").removeAttr("disabled");
			return;
  		}
  		if(title.length>10){
  			alert("输入职称字数不能超过10个，已输入"+title.length+"个字!");
			$("#send").removeAttr("disabled");
			return;
  		}
  		if(address=="" || address==null){
  			alert("输入通讯地址不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(address.length>100){
  			alert("输入通讯地址字数不能超过100个，已输入"+address.length+"个字!");
			$("#send").removeAttr("disabled");
			return;
  		}
  		if(pcode=="" || pcode==null){
  			alert("输入邮编 不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(pcode.length>10){
  			alert("输入邮编字数不能超过10个，已输入"+pcode.length+"个字!");
			$("#send").removeAttr("disabled");
			return;
  		}
  		if(!phone.test(tel)){
  			alert("请输入正确的联系电话!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(fax.length>10){
  			alert("输入传真号码字数不能超过10个，已输入"+fax.length+"个字!");
			$("#send").removeAttr("disabled");
			return;
  		}
  		if(mobile=="" || mobile==null){
  			alert("输入手机号码不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(!cellphone.test(mobile)){
  			alert("请输入正确的手机号!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		
  		if(email=="" || email==null){
  			alert("输入电子邮箱 不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(email.length>100){
  			alert("输入联系人邮箱不能超过100位，已输入"+email.length+"个字!");
			$("#send").removeAttr("disabled");
			return;
  		}
  		if(!myreg.test(email)){
  			alert("请输入正确的邮箱地址!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(edu=="" || edu==null || edu=="00"){
  			alert("输入文化程度 不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(major=="" || major==null){
  			alert("输入所学专业不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(major.length>30){
  			alert("输入所学专业字数不能超过30个，已输入"+major.length+"个字!");
			$("#send").removeAttr("disabled");
			return;
  		}
  		if(prof=="" || prof==null){
  			alert("输入现从事专业不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(major.length>30){
  			alert("输入现从事专业字数不能超过30个，已输入"+major.length+"个字!");
			$("#send").removeAttr("disabled");
			return;
  		}
  		if(begindate=="" || begindate==null){
  			alert("输入相关专业从业年份不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		} 
  		if(begindate.length>20){
  			alert("输入相关专业从业年份字数不能超过20个，已输入"+begindate.length+"个字!");
			$("#send").removeAttr("disabled");
			return;
  		}
  		if(train=="" || train==null){
  			alert("输入主要学习（培训）经历不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}else{
  			if(train.length >800){
  				alert("输入主要学习（培训）经历字数不能超过800个，已输入"+train.length+"个字!");
  				$("#send").removeAttr("disabled");
  				return;
  			}
  		}
  		if(resume=="" || resume==null){
  			alert("输入主要工作简历不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}else{
  			if(resume.length >800){
  				alert("输入主要工作简历字数不能超过800个，已输入"+resume.length+"个字!");
  				$("#send").removeAttr("disabled");
  				return;
  			}
  		}
  		if(perf=="" || perf==null){
  			alert("输入专业工作业绩不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}else{
  			if(perf.length >800){
  				alert("输入专业工作业绩字数不能超过800个，已输入"+perf.length+"个字!");
  				$("#send").removeAttr("disabled");
  				return;
  			}
  		}
		var user= document.getElementById('pnRegInfo.userid').value;
		var userBol=false;
		  $.ajax({
			    type:"POST",
			    async:false,
			    data:{userid:user,usertype:'pn'},
			    url:"/jwr/respInfo/getUserIdAction.action",
			    success:function(returnValue){
			   		if(returnValue=='yes'){
			   			alert('该用户名已被注册！请从新填写');
			   		    userBol=true;
			   		}
			   		
			    }
			});
			if(userBol){$("#send").removeAttr("disabled");return;}
		var pid= document.getElementById('pnRegInfo.pid').value;
		var pidBol=false;
		$.ajax({
			    type:"POST",
			    async:false,
			    data:{pid:pid,usertype:'pn'},
			    url:"/jwr/respInfo/getpidAction.action",
			    success:function(returnValue){
			   		if(returnValue=='yes'){
			   			alert('该身份证已被注册！请从新填写');
			   			pidBol=true;
			   		}
			   		
			    }
			    
			});
	
  		if(pidBol){$("#send").removeAttr("disabled");return;}
  		
  		$("#send").attr("disabled",true);
  		formsubmit();
  	}
  	function formsubmit(){
  		document.forms[0].submit();
  	}
  	
	var windowRetrun;
	var stid;
	 //上传文件
	 
  </script>
</head>
<body>
 
	<center style="border: 1px solid #369">
		<h1
			style="padding:20px; background-color:#369; color: white; font-size: 22px; margin-top:0px">考评员报名申请</h1>
		<div align="left">
			<div class="eui-info">
				<div class="eui-tip icon-tip"></div>
				<div>请认真填写如下所有信息，并等待主管机关进行报名申请初审。</div>
			</div>
		</div>
		<div align="center" style="border:0px solid red">
			<input id="typeText" type="hidden" value="">
			<form id="fm1" method="POST"
				action="<%=basePath%>/reg/pnRegAction.action">
				<table style="margin-left: 30px">
					<caption style="padding: 5px;">
						<h1 align="center">考评员报名申请</h1>
					</caption>
					<tbody>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="注：除一级考评机构及长航局、珠航局考评机构外，请和上面主管机关选项一致">所在市：</label></td>
							<td style="border-bottom:1px dotted gray">
								<span id="city"></span>
							</td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="考评员申请的专业类型不得多于二种">申请专业类型（不得多于两种）：</label></td>
							<td style="border-bottom:1px dotted gray">
							<select id="pnRegInfo.type" name="pnRegInfo.type" onchange="showMot(this.options[this.selectedIndex].value)">
									<option selected value="">--请选择--</option>
									<option value="1">道路运输</option>
									<option value="2">水路运输</option>
									<option value="3">港口运营</option>
									<option value="4">城市客运</option>
									<option value="5">交通运输工程建设</option>
									<option value="6">其他</option>
							</select>
							</td>
							<td><font color="lightgray">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="提示：若须申请一级企业达标等级证书，请选择“交通运输部”">主管机关：</label></td>
							<td style="border-bottom:1px dotted gray">
								<input type="hidden" id="pnRegInfo.admin" name="pnRegInfo.admin">
								<input class="easyui-validatebox validatebox-text" id="notName" 
								name="notName" required="true" readonly style="width:200px" type="text"
								value="">
								<font color="red">提示：主管机关是根据区域和专业自动分配</font>
							</td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>用户ID：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text"
								id="pnRegInfo.userid" name="pnRegInfo.userid" required="true"
								type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>用户密码：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="pnRegInfo.userpass"
								name="pnRegInfo.userpass" required="true" type="password"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>确认密码：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="surepass"
								name="surepass" required="true" type="password"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>姓名：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="pnRegInfo.username"
								name="pnRegInfo.username" required="true" type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="15位或18位身份证">身份证号：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="pnRegInfo.pid" name="pnRegInfo.pid"
								required="true" title="15位或18位身份证" type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>工作单位：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="pnRegInfo.org" name="pnRegInfo.org"
								required="true" style="width:300px" type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>职称：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="pnRegInfo.title"
								name="pnRegInfo.title" type="text"></td>
							<td><font color="lightgray">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>通讯地址：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="pnRegInfo.address"
								name="pnRegInfo.address" required="true" style="width:300px" type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>邮编：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="pnRegInfo.pcode"
								name="pnRegInfo.pcode" required="true" type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>联系电话：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="pnRegInfo.tel" name="pnRegInfo.tel"
								type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>传真号码：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="pnRegInfo.fax" name="pnRegInfo.fax"
								type="text"></td>
							<td><font color="lightgray">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>手机号码：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="pnRegInfo.mobile"
								name="pnRegInfo.mobile" required="true" type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>电子邮箱：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="pnRegInfo.email"
								name="pnRegInfo.email" required="true" type="text" validtype="email"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="按国标（中专以上）">文化程度：</label></td>
							<td style="border-bottom:1px dotted gray"><select id="pnRegInfo.edu"
								name="pnRegInfo.edu" required="true" title="按国标（中专以上）">
									<option value="00">--请选择--</option>	
									<option	value="中专">中专</option>
									<option value="大专">大专</option>
									<option value="本科">本科</option>
									<option value="研究生">研究生</option>
									<option value="博士生">博士生</option></select></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="注意：必须具备交通运输相关专业大学专科以上学历">所学专业：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="pnRegInfo.major"
								name="pnRegInfo.major" required="true" title="注意：必须具备交通运输相关专业大学专科以上学历"
								type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>现从事专业：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="pnRegInfo.prof"
								name="pnRegInfo.prof" required="true" type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>相关专业从业年份：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="pnRegInfo.begindate"
								name="pnRegInfo.begindate" required="true" type="text" value="5"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>主要学习（培训）经历：</label></td>
							<td style="border-bottom:1px dotted gray"><textarea
									class="easyui-validatebox validatebox-text" id="pnRegInfo.train"
									name="pnRegInfo.train" required="true"></textarea></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>主要工作简历：</label></td>
							<td style="border-bottom:1px dotted gray"><textarea
									class="easyui-validatebox validatebox-text" id="pnRegInfo.resume"
									name="pnRegInfo.resume" required="true"></textarea></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="不得少于10个字">专业工作业绩：</label></td>
							<td style="border-bottom:1px dotted gray"><textarea
									class="easyui-validatebox validatebox-text" id="pnRegInfo.perf"
									name="pnRegInfo.perf" required="true" title="不得少于10个字"></textarea></td>
							<td><font color="red">*</font></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td align="center" colspan="3" style="padding: 15px"><p>
									注：带红色<font color="red">*</font>的为必填项。
								</p> <input type="button" class="button blue" value="提交"
								onclick="check()" id="send" style="width: 50;height: 20" /> <input
								type="reset" calss="button blue"  value="重置"
								style="width: 50;height: 20" />
						</tr>
					</tfoot>
				</table>
			</form>
		</div>
		<h2
			style="padding:15px; background-color:lightgray; margin-bottom:0px; color:#333; text-shadow:0 1px 0 #EEE;">版权所有：<%=pro_mot_name %>
			2016 年</h2>
	</center>
</body>
</html>

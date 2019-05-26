<%@page import="com.wr4.domain.OrgRegInfo"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="main.jsp" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
	String userid = request.getParameter("userid");
	String num = request.getParameter("num");
	OrgRegInfo orgRegInfo = (OrgRegInfo)request.getAttribute("orgRegInfo");
	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>考评机构报名申请</title>

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
		 window.parent.ligerwindow.close();
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
	   	    str1='<SELECT selected id="orgRegInfo.city" name="orgRegInfo.city" onchange="resetBustype()">';
	   	    for(var i=0;i<obj2.length;i++){
	   			if(i==0){
	   				str1+='<OPTION selected=true value='+0+'>'+'--请选择--'+'</OPTION>';
	   				if('${orgRegInfo.city}'==obj2[i].du_code){
	   					str1+='<OPTION selected value='+obj2[i].du_code+'>'+obj2[i].du_name+'</OPTION>';
	   				}else{
	   					str1+='<OPTION  value='+obj2[i].du_code+'>'+obj2[i].du_name+'</OPTION>';
	   				}
	   			}else{
	   				if('${orgRegInfo.city}'==obj2[i].du_code){
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
 var type='${orgRegInfo.bustype}';
 if(type != null){
	 document.getElementById("orgRegInfo.bustype").value=type;
 }
 showMot(type);
 initSelect();
})
function resetBustype(){
	var bustype=document.getElementById('orgRegInfo.bustype');
	bustype.value='';
}
function initSelect(){
	var cc = document.getElementById("orgRegInfo.grade");
	 for(var i=0;i<cc.options.length;i++){
	 	if(cc.options[i].value=='${orgRegInfo.grade}'){
	 		cc.options[i].selected=true;
	 	}
	 }
}
function showMot(type){
	var city= document.getElementById('orgRegInfo.city').value;
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
			}else{
			    document.getElementById("orgRegInfo.adminmot").value=str.split(',')[0];
		   		$("#notName").val(str.split(',')[1]);
			}
	    }
   });
}

	$(function(){
		//管理机关
        		 $.ajax({
        			    type:"POST",
        			    async:false,
        			    url:"/jwr/respInfo/getMotAction.action",
        			    success:function(returnValue){
        			   		indexdata=returnValue;
        			   		var obj1=(eval("("+indexdata+")")).Rows;
        			   		var str="";
        			   	    str='<SELECT id="orgRegInfo.adminmot" name="orgRegInfo.adminmot">';
        			   		for(var i=0;i<obj1.length;i++){
        			   			if(i==0){
        			   				str+='<OPTION selected value='+obj1[i].motcode+'>'+obj1[i].motname+'</OPTION>';
        			   			}else{
        			   				if('${orgRegInfo.adminmot}'==obj1[i].motcode){
        			   					str+='<OPTION selected value='+obj1[i].motcode+'>'+obj1[i].motname+'</OPTION>';
        			   				}else{
        			   					str+='<OPTION  value='+obj1[i].motcode+'>'+obj1[i].motname+'</OPTION>';
        			   				}
        			   				
        			   			}
        						
        			   		}
        			   		  str+='</SELECT>';
        			   		$("#sa").html(str);
        			    }
        			});
		});
  	function check(){
  	$("#send").attr("disabled",true);
  	//组织机构代码
  		var orgCode=document.getElementById('orgRegInfo.pid');
  		//联系人身份证
  		var card=document.getElementById('orgRegInfo.cpid');
  		var reg = new RegExp("^[0-9]*$");
  		var cellphone=/^0?1[3|4|5|8][0-9]\d{8}$/;
  		var phone=/^(\d{3,4}\-?)?\d{7,8}$/;
  		var myreg = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
  		var regs =  /[\u4E00-\u9FA5]/g;
  		var userid=document.getElementById('orgRegInfo.userid').value;
  		var orgname=document.getElementById('orgRegInfo.orgname').value;
  		
  		var city=document.getElementById('orgRegInfo.city').value;
  		var bustype=document.getElementById('orgRegInfo.bustype').value;
  		var adminmot=document.getElementById('orgRegInfo.adminmot').value;
  		
  		var legalp=document.getElementById('orgRegInfo.legalp').value;
  		var contact=document.getElementById('orgRegInfo.contact').value;
  		var mobile=document.getElementById('orgRegInfo.mobile').value;
  		var email=document.getElementById('orgRegInfo.email').value;
  		var pnumber=document.getElementById('orgRegInfo.pnumber').value;
  		var pnumber2=document.getElementById('orgRegInfo.pnumber2').value;
  		var startdate=document.getElementById('orgRegInfo.startdate').value;
  		var tel=document.getElementById('orgRegInfo.tel').value;
  		var fax=document.getElementById('orgRegInfo.fax').value;
  		var pcode=document.getElementById('orgRegInfo.pcode').value;
  		var address=document.getElementById('orgRegInfo.address').value;
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
  		if(orgname=="" || orgname==null ){
  			alert("输入单位名称不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(orgname.length>100){
  			alert("输入单位名称字数不能超过100个，已输入"+orgname.length+"个字!");
			$("#send").removeAttr("disabled");
			return;
  		}
  		
  		if(city=="" || city==null || city=="0"){
  			alert("请选择您所在的市!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(bustype == "" || bustype == null){
  			alert("请选择专业!");
  			return ;
  		}
  		if(adminmot == "" || adminmot == null){
  			alert("主管机关不能为空!");
  			return ;
  		}
  		
  		if(legalp=="" || legalp==null ){
  			alert("输入法人代表不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(legalp.length>10){
  			alert("输入法人代表字数不能超过10个，已输入"+legalp.length+"个字!");
			$("#send").removeAttr("disabled");
			return;
  		}
  		if(contact=="" || contact==null ){
  			alert("输入联系人姓名不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(contact.length>10){
  			alert("输入联系人姓名字数不能超过10个，已输入"+contact.length+"个字!");
			$("#send").removeAttr("disabled");
			return;
  		}
  		if(mobile=="" || mobile==null ){
  			alert("输入联系人手机不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(!cellphone.test(mobile)){
  			alert("请输入正确的手机号!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(email=="" || email==null ){
  			alert("输入联系人邮箱不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(email.length>100){
  			alert("输入联系人邮箱不能超过100位，已输入"+email.length+"个字!");
			$("#send").removeAttr("disabled");
			return;
  		}
  		if(!myreg.test(email)){
  			alert("请输入正确的联系人邮箱!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(pnumber=="" || pnumber==null ){
  			alert("输入专职考评员人数不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(!reg.test(pnumber)){
  			alert("专职考评员人数请输入数字!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(pnumber.length>10){
  			alert("输入专职考评员人数不能超过10位数，已输入"+pnumber.length+"个字!");
			$("#send").removeAttr("disabled");
			return;
  		}
  		if(pnumber2=="" || pnumber2==null ){
  			alert("输入高级技术职称考评员人数不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(!reg.test(pnumber2)){
  			alert("高级技术职称考评员人数请输入数字!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(pnumber.length>10){
  			alert("输入高级技术职称考评员人数不能超过10位数，已输入"+pnumber.length+"个字!");
			$("#send").removeAttr("disabled");
			return;
  		}
  		if(startdate=="" || startdate==null ){
  			alert("输入开始从事相应业务年份不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(startdate.length>10){
  			alert("输入开始从事相应业务年份不能超过10个，已输入"+startdate.length+"个字!");
			$("#send").removeAttr("disabled");
			return;
  		}
  		if(address.length>100){
  			alert("输入通讯地址字数不能超过100个，已输入"+address.length+"个字!");
			$("#send").removeAttr("disabled");
			return;
  		}
  		if(pcode.length>20){
  			alert("输入邮编字数不能超过20个，已输入"+pcode.length+"个字!");
			$("#send").removeAttr("disabled");
			return;
  		}
  		if(tel=="" || tel==null ){
  			alert("输入联系电话不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(!phone.test(tel)){
  			alert("请输入正确的联系电话!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(fax=="" || fax==null ){
  			alert("输入传真号码不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(fax.length>20){
  			alert("输入传真号码字数不能超过20个，已输入"+fax.length+"个字!");
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
  		
  		formsubmit();
  	}
  	function formsubmit(){
  		
  		document.forms[0].submit();
  	}
  	
  	
	var windowRetrun;
	var stid;
	
	function itemclick(id) {
		stid=id;
		//  var m = $.ligerDialog.open({ url: 'JSP/pn/pnupload.jsp',width:800, height: 400, isResize: true }); 
		window.open(
			'<%=basePath%>/JSP/pn/pnupload.jsp',
			'newwindow',
			'height=100,width=400,top=100,left=100,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
		
	} 
  //查看
	function chakan(id){
		var ss= id.substr(0,id.length-1)+'*';
		var freport=document.getElementById(ss).value;
			$.trim(freport);
			if(freport!=null && freport!=""){
 		 	var ss1=freport.split('.');
	    	var filetype=ss1[1];
 			 if(filetype =='bmp'||filetype =='BMP'||filetype =='jpg'||filetype =='JPG'||filetype =='jpeg'||filetype =='JPEG'||filetype =='png'||filetype =='PNG'||filetype =='gif'||filetype =='GIF'){
	  				//window.location.href='<%= basePath%>JSP/images.jsp?filename='+freport ;
	  				scanImg1('img0',freport);
	  			}else{
	  				window.location.href='<%= basePath%>updown/downloadFileAction?file='+freport;
	  			} 
  		}else{
  			alert("没有上传相关文件");
  		}
		
	}
	function scanImg1(id,filename){
	
		var path='<%=basePath%>images/';
    	var fileName=path+filename;
    	$.ligerDialog.open({
        	url:fileName,
        	width:800,
        	height:600,
        	title:'查看图片'
    	});
	}
  </script>
</head>
<body>
	<center style="border: 1px solid #369">
		<h1
			style="padding:20px; background-color:#369; color: white; font-size: 22px; margin-top:0px">考评机构报名申请信息修改</h1>
		<div align="left">
			<div class="eui-info">
				<div class="eui-tip icon-tip"></div>
				<div>请认真填写如下所有信息，并等待主管机关进行报名申请初审。</div>
			</div>
		</div>
		<div align="center" style="border:0px solid red">
			<input id="typeText" type="hidden" value="">
			<form id="fm1" method="POST"  action="<%=basePath%>/reg/updateorgregAction.action">
				<input type="hidden" id="" name="orgRegInfo.id" value="${orgRegInfo.id }"/>
				<table style="margin-left: 30px">
					<caption style="padding: 5px">
						<h1 align="center">考评机构报名申请信息修改</h1>
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
								title="最多只可选择两种专业范围">专业范围：</label></td>
								<td style="border-bottom:1px dotted gray">
							<select id="orgRegInfo.bustype"
								name="orgRegInfo.bustype" required="true"
								title="生产经营类型" onchange="showMot(this.options[this.selectedIndex].value)"> 
									<option selected value="">--请选择--</option>
									<option value="1">道路运输</option>
									<option value="2">水路运输</option>
									<option value="3">港口运营</option>
									<option value="4">城市客运</option>
									<option value="5">交通运输工程建设</option>
									<option value="6">其他</option>
									</select>
							</td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="提示：若须申请一级考评机构资质证书，请选择“交通运输部”">主管机关：</label></td>
							<td style="border-bottom:1px dotted gray">
								<input type="hidden" id="orgRegInfo.adminmot" name="orgRegInfo.adminmot">
								<input class="easyui-validatebox validatebox-text" id="notName" 
								name="notName" required="true" readonly style="width:200px" type="text"
								value="">
								<font color="red">提示：主管机关是根据区域和专业自动分配</font>
							</td>
							<td><font color="red">*</font></td>
						</tr>
						
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="一般为：学校/交通相关学会/协会/研究所">单位名称：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="orgRegInfo.orgname" 
								name="orgRegInfo.orgname" required="true" style="width:300px"
								title="一般为：学校/交通相关学会/协会/研究所" type="text" value="${orgRegInfo.orgname }"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>组织机构代码：</label></td>
							<td style="border-bottom:1px dotted gray"><input readonly="readonly"
								class="easyui-validatebox validatebox-text" id="orgRegInfo.pid" name="orgRegInfo.pid"
								required="true" type="text" value="${orgRegInfo.pid }"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>法人代表：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="orgRegInfo.legalp" value="${orgRegInfo.legalp }"
								name="orgRegInfo.legalp" required="true" type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>用户ID：</label></td>
							<td style="border-bottom:1px dotted gray"><input readonly="readonly"
								class="easyui-validatebox validatebox-text" id="orgRegInfo.userid" name="orgRegInfo.userid" value="${orgRegInfo.userid }"
								required="true" type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>联系人姓名：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="orgRegInfo.contact" value="${orgRegInfo.contact }"
								name="orgRegInfo.contact" required="true" type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="15位或18位身份证">联系人身份证号：</label></td>
							<td style="border-bottom:1px dotted gray"><input readonly="readonly"
								class="easyui-validatebox validatebox-text" id="orgRegInfo.cpid" value="${orgRegInfo.cpid }"
								name="orgRegInfo.cpid" required="true" title="用于申请u盘验证签名" type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>联系人手机：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="orgRegInfo.mobile" value="${orgRegInfo.mobile }"
								name="orgRegInfo.mobile" required="true" type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>联系人邮箱：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="orgRegInfo.email" value="${orgRegInfo.email }"
								name="orgRegInfo.email" required="true" type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="报名申请时，填一个拟申请等级即可；
报名申请通过后，可试情况申请多个等级的证书">资质等级：</label></td>
							<td style="border-bottom:1px dotted gray"><select id="orgRegInfo.grade" 
								name="orgRegInfo.grade" required="true"
								title="报名申请时，填一个拟申请等级即可；
报名申请通过后，可试情况申请多个等级的证书" > 
									<option value="2" >二级</option>
									<option value="3" >三级</option></select></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="二级≥5名；三级≥3名。">专职考评员人数：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="orgRegInfo.pnumber" 
								name="orgRegInfo.pnumber" required="true" title="二级≥5名；三级≥3名。"
								type="text" value="${orgRegInfo.pnumber }"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="二级≥2名；三级≥1名。">高级技术职称考评员人数：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="orgRegInfo.pnumber2"
								name="orgRegInfo.pnumber2" required="true" title="一级≥3名；二级≥2名；三级≥1名。"
								type="text" value="${orgRegInfo.pnumber2 }"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>开始从事相应业务年份：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="orgRegInfo.startdate"
								name="orgRegInfo.startdate" required="true" type="text" value="${orgRegInfo.startdate }"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>通讯地址：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="orgRegInfo.address" value="${orgRegInfo.address }"
								name="orgRegInfo.address" style="width:300px" type="text"></td>
							<td><font color="lightgray">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>邮编：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="orgRegInfo.pcode" value="${orgRegInfo.pcode }"
								name="orgRegInfo.pcode" type="text"></td>
							<td><font color="lightgray">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>联系电话：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="orgRegInfo.tel" name="orgRegInfo.tel" value="${orgRegInfo.tel }"
								required="true" type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>传真号码：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="orgRegInfo.fax" name="orgRegInfo.fax" value="${orgRegInfo.fax }"
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
								 <input type="reset" calss="button blue"  value="重置" style="width: 50;height: 20"/>	 
						</tr>
					</tfoot>
				</table>
			</form>
		</div>
		<h2
			style="padding:15px; background-color:lightgray; margin-bottom:0px; color:#333; text-shadow:0 1px 0 #EEE;">版权所有：<%=pro_mot_name %>
			2016年</h2>
	</center>
	
	<div class="panel window"
		style="display: none; left: 400px; top: 150px; width: 388px;">
		<div class="panel-header panel-header-noborder window-header"
			style="width: 388px;">
			<div class="panel-title">对话框1</div>
			<div class="panel-tool">
				<div class="panel-tool-close"></div>
			</div>
		</div>
		<div buttons="#fileupload-buttons"
			class="easyui-dialog1 panel-body panel-body-noborder window-body"
			closed="true" href="/c/pub/fileupload" id="fileupload"
			resizable1="true" title=""
			style="overflow: hidden; width: 386px; height: 185px;">
			<div class="panel"
				style="left: 400px; top: 150px; width: 386px; display: none;">
				<div
					class="dialog1-content panel-body panel-body-noheader panel-body-noborder"
					style="width: 366px; height: 130px; left: 400px; top: 150px; padding: 10px;"
					title=""></div>
			</div>
			<div id="fileupload-buttons" class="dialog1-button" style="">
				<a class="easyui-linkbutton l-btn"
					href="http://202.96.42.100/c/espn/input/org#" iconcls="icon-ok"
					id="fileupload_ok" onclick=""><span class="l-btn-left"><span
						class="l-btn-text icon-ok" style="padding-left: 20px;">确定</span></span></a><a
					class="easyui-linkbutton l-btn"
					href="http://202.96.42.100/c/espn/input/org#"
					id="fileupload_cancel" onclick=""><span class="l-btn-left"><span
						class="l-btn-text">取消</span></span></a>
			</div>
		</div>
	</div>
	<div class="window-shadow"
		style="display: none; left: 400px; top: 150px;"></div>
	<div class="panel"
		style="position: absolute; z-index: 10; display: none; width: 250px;">
		<div class="combo-panel panel-body panel-body-noheader" title=""
			style="width: 248px; height: 198px;">
			<div class="combobox-item" value="1">道路运输</div>
			<div class="combobox-item" value="2">水路运输</div>
			<div class="combobox-item" value="3">港口运营</div>
			<div class="combobox-item" value="4">城市客运</div>
			<div class="combobox-item" value="5">交通运输工程建设</div>
			<div class="combobox-item" value="6">其他</div>
		</div>
	</div>
</body>
</html>

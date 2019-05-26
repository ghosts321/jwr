<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
 <%@ include file="../../main.jsp"%> 
<%
String motname="";
 if(request.getAttribute("msg")==null||"".equals(request.getAttribute("msg"))){
	motname=request.getAttribute("orgInfo.motname").toString();
	
	}
	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<base href="<%=basePath%>">
		<title>
		 考评机构资质申请
		</title>
		
 
  <script type="text/javascript">
  var filePath = "",indexdata="",totalSize="";
	<%String   msg=request.getAttribute("msg")==null?"":request.getAttribute("msg").toString();
	if(msg.equals("yes")){
		%>
		alert("提交成功，窗口将关闭");
		window.location.href="/jwr/bookApply/bookApplyAction.action"; 
		 <%
	}else if(msg!=null&&!msg.equals("yes")&&!msg.equals("")){
		%>
			alert('<%=msg%>');
			window.location.href="/jwr/bookApply/bookApplyAction.action"; 
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
	   	    str1='<SELECT selected id="citySelect" name="citySelect" disabled>';
	   	    for(var i=0;i<obj2.length;i++){
	   			if(i==0){
	   				str1+='<OPTION selected=true value='+0+'>'+'--请选择--'+'</OPTION>';
	   				if('${orgInfo.city}'==obj2[i].du_code){
	   					str1+='<OPTION selected value='+obj2[i].du_code+'>'+obj2[i].du_name+'</OPTION>';
	   				}else{
	   					str1+='<OPTION  value='+obj2[i].du_code+'>'+obj2[i].du_name+'</OPTION>';
	   				}
	   			}else{
	   				if('${orgInfo.city}'==obj2[i].du_code){
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
/* $(function(){
	//管理机关
	 $.ajax({
	    type:"POST",
	    async:false,
	    url:"/jwr/respInfo/getMotAction.action",
	    success:function(returnValue){
	   		indexdata=returnValue;
	   		var obj1=(eval("("+indexdata+")")).Rows;
	   		var str="";
	   	    str='<SELECT id="orgInfo.adminmot" name="orgInfo.adminmot">';
	   		for(var i=0;i<obj1.length;i++){
	   			if(i==0){
	   				if('${orgInfo.adminmot}'==obj1[i].motcode){
	   					str+='<OPTION selected value='+obj1[i].motcode+'>'+obj1[i].motname+'</OPTION>';
					}else{
						str+='<OPTION value='+obj1[i].motcode+'>'+obj1[i].motname+'</OPTION>';
					}
	   				
	   			}else{
	   				if('${orgInfo.adminmot}'==obj1[i].motcode){
	   					str+='<OPTION selected value='+obj1[i].motcode+'>'+obj1[i].motname+'</OPTION>';
	   				}else{
	   					str+='<OPTION  value='+obj1[i].motcode+'>'+obj1[i].motname+'</OPTION>';
	   				}
	   			}
				
	   		}
	   		  str+='</SELECT>';
	   		$("#adminmot").html(str);
	    }
	});
	
	 /* var busType = document.getElementById("orgInfo.busType");
	 for(var i=0;i<busType.options.length;i++){
	 	if(busType.options[i].value=='${orgInfo.busType}'){
	 		busType.options[i].selected=true;
	 	}
	 } 
}); */
	function upload() {
		$.ajax({
			type : "POST",
			async : true, //是否异步
			url : "/jwr/updown/uploadAction.action",
			success : function(returnValue) {
				filePath = returnValue;
			}
		});
	}
	//alert(filePath);
	var windowRetrun;
	var stid;
	/**
	* <input type="hidden" name ="bean.属性"  id="id+'*'"
	*/
	function afterItemclick(id){
		var styleid=id+"_";//显示上传成功
		var hiddenid=id+"*";//记录文件名
		var ostyleid = document.getElementById(styleid);
		var ohiddenid = document.getElementById(hiddenid);
		if(ostyleid!=null || ostyleid!=undefined){
			ostyleid.style.display = 'block';
			
			ohiddenid.value = windowRetrun;
		}
	}
	function itemclick(id) {
		stid=id;
		//  var m = $.ligerDialog.open({ url: 'JSP/pn/pnupload.jsp',width:800, height: 400, isResize: true }); 
		window.open(
			'<%=basePath%>/JSP/pn/pnupload.jsp',
			'newwindow',
			'height=100,width=400,top=100,left=100,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
		
	} 
	
	function  orgApplyInsert(){
		
		var reg = new RegExp("^[0-9]*$");
  		var cellphone=/^0?1[3|4|5|8][0-9]\d{8}$/;
  		var phone=/^(\d{3,4}\-?)?\d{7,8}$/;
  		var myreg = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
  		var regs =  /[\u4E00-\u9FA5]/g;
  		var mobile=document.getElementById('orgInfo.mobile').value;
  		var adminmot=document.getElementById('orgInfo.adminmot').value;
  		var email=document.getElementById('orgInfo.email').value;
  		var tel=document.getElementById('orgInfo.tel').value;
  		var fax=document.getElementById('orgInfo.fax').value;
  		var met=document.getElementById('met*').value;
  		var pns=document.getElementById('pns*').value;
		var met = document.getElementById("met*").value;
		var pns = document.getElementById("pns*").value;
		var busType = document.getElementById("orgInfo.busType").value;
		/* var man = document.getElementById("man*").value;
		var orher = document.getElementById("orher*").value; */
		if(mobile=="" || mobile==null ){
  			alert("输入联系人手机不能为空!");
  			return;
  		}
  		if(!cellphone.test(mobile)){
  			alert("请输入正确的手机号!");
  			return;
  		}
  		if(email=="" || email==null ){
  			alert("输入联系人邮箱不能为空!");
  			return;
  		}
  		if(!myreg.test(email)){
  			alert("请输入正确的联系人邮箱!");
  			return;
  		}
  		if(busType == null || busType == ""){
			alert("请选择专业");
			return ;
		}
		if(adminmot == null || adminmot == ""){
			alert("主管机关不能为空");
			return ;
		}
  		if(tel=="" || tel==null ){
  			alert("输入联系电话不能为空!");
  			return;
  		}
  		if(!phone.test(tel)){
  			alert("请输入正确的联系电话!");
  			return;
  		}
  		if(fax=="" || fax==null ){
  			alert("输入传真号码不能为空!");
  			return;
  		}
  		
		if (met==null || met=="") {
			alert("请上传单位基本情况相关资料");
			return;
		}
		if (pns==null || pns=="") {
			alert("请上传专职考评员聘用 证明与职称证明");
			return;
		}
		/* if (man==null || man=="") {
			alert("请上传考评管理制度");
			return;
		}
		if (orher==null || orher=="") {
			alert("请上传其他资料");
			return;
		} */
		var grade=document.getElementById('orgInfo.grade').value;
  		 if(grade==2){
  			var pnumber=document.getElementById('orgInfo.pnumber').value;
  			if(pnumber<5){
  				alert("专职考评员人数需大于等于5名");
  				return;
  			}
  		}else if(grade==3){
  			var pnumber=document.getElementById('orgInfo.pnumber').value;
  			if(pnumber<3){
  				alert("专职考评员人数需大于等于3名");
  				return;
  			}
  		}
  		if(grade==2){
  			var pnumber2=document.getElementById('orgInfo.pnumber2').value;
  			if(pnumber2<2){
  				alert("高级技术职称考评员人数需大于等于2名");
  				return;
  			}
  		}else if(grade==3){
  			var pnumber2=document.getElementById('orgInfo.pnumber2').value;
  			if(pnumber2<1){
  				alert("高级技术职称考评员人数需大于等于1名");
  				return;
  			}
  		}
		 //document.getElementById("orgInfo.adminmot").value= '${orgInfo.adminmot}';
		
		document.forms[0].submit();
// 		window.location.href='/jwr/bookApply/bookApplyAction.action';
	}
	function showMot(type){
		var city= document.getElementById('orgInfo.city').value;
		if(city == null || city == ""){
			alert("请选择专业类型");
			return ;
		}
		$.ajax({
		    type:"POST",
		    async:false,
		    data:{type:type,city:city,flag:1},
		    url:"/jwr/taskAssignation/getMotByTypeAction.action",
		    success:function(returnValue){
			    var str = returnValue;
			    if(str == ""){
					alert("没有管理此专业的主管机关");
					$("#motName").val("");
				}else{
				    document.getElementById("orgInfo.adminmot").value=str.split(',')[0];
			   		$("#motName").val(str.split(',')[1]);
				}
		    }
	   });
	}
  
  </script>
	</head>
<body>
	<div class="panel layout-panel layout-panel-center"
		style="width: 1156px;">
		<div border="false" region="center" split="false"
			style="padding: 20px; width: 1116px;"
			class="layout-body panel-body panel-body-noheader panel-body-noborder"
			title="">
			<input id="typeText" type="hidden" value="">
			<form id="fm1" method="POST" action="/jwr/bookApply/orgRegAction.action">
			<input id="orgInfo.city" name="orgInfo.city" type="hidden" value="${orgInfo.city}">
				<table style="margin-left: 30px">
					<caption style="padding: 5px">
						<h1> 考评机构资质申请</h1>
					</caption>
					<tbody>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>所在市：</label></td>
							<td style="border-bottom:1px dotted gray" id="provinceSel">
								<span id="city"></span>
							</td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>单位名称：</label></td>
							<td style="border-bottom:1px dotted gray"><input readonly
								class="easyui-validatebox validatebox-text" id="orgInfo.orgname"
								name="orgInfo.orgname" required="true" style="width:300px"
								type="text" value="${orgInfo.orgname }"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>组织机构代码：</label></td>
							<td style="border-bottom:1px dotted gray"><input readonly
								class="easyui-validatebox validatebox-text" id="orgInfo.pid"
								name="orgInfo.pid" required="true" type="text" value="${orgInfo.pid }"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>法人代表：</label></td>
							<td style="border-bottom:1px dotted gray"><input readonly
								class="easyui-validatebox validatebox-text" id="orgInfo.legalp"
								name="orgInfo.legalp" required="true" type="text" value="${orgInfo.legalp}"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>联系人姓名：</label></td>
							<td style="border-bottom:1px dotted gray"><input readonly
								class="easyui-validatebox validatebox-text" id="orgInfo.contact"
								name="orgInfo.contact" required="true" type="text" value="${orgInfo.contact}"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray">
								<label>联系人手机：</label>
							</td>
							<td style="border-bottom:1px dotted gray"><input 
								class="easyui-validatebox validatebox-text" id="orgInfo.mobile"
								name="orgInfo.mobile" required="true" type="text" value="${orgInfo.mobile}"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>联系人邮箱：</label></td>
							<td style="border-bottom:1px dotted gray"><input 
								class="easyui-validatebox validatebox-text" id="orgInfo.email"
								name="orgInfo.email" required="true" type="text" value="${orgInfo.email}"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<TD
								style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px"><LABEL
								title="报名申请时，填一个拟申请等级即可；&#10;报名申请通过后，可试情况申请多个等级的证书">资质等级：</LABEL></TD>
							<TD style="BORDER-BOTTOM: gray 1px dotted"><SELECT
								id=orgInfo.grade
								title="报名申请时，填一个拟申请等级即可；&#10;报名申请通过后，可试情况申请多个等级的证书"
								name=orgInfo.grade value="${orgInfo.grade}" required="true">
								<s:if test="orgInfo.grade==2">
								     <OPTION selected value=2>二级</OPTION>
									<OPTION value=3>三级</OPTION></SELECT></TD>
								</s:if>
								<s:elseif test="orgInfo.grade==3">
									<OPTION value=2>二级</OPTION>
									<OPTION selected value=3>三级</OPTION></SELECT></TD>
								</s:elseif>
							<TD><FONT color=red>*</FONT></TD>
						</TR>
						<TR>
							<TD
								style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px"><LABEL
								title=最多只可选择两种专业范围>专业范围：</LABEL></TD>
							<TD style="BORDER-BOTTOM: gray 1px dotted" id="typename">
							<select id="orgInfo.busType"name="orgInfo.busType" required="true" onchange="showMot(this.options[this.selectedIndex].value)">
								<option selected value="">--请选择--</option> 
								<option	value="1">道路运输</option>
								<option value="2">水路运输</option>
								<option value="3">港口运营</option>
								<option value="4">城市客运</option>
								<option value="5">交通运输工程建设</option>
								<option value="6">其他</option>
							</select>
							</TD>
						</TR>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="省级交通厅、交委请选择“交通运输部”">主管机关：</label></td>
							<td style="border-bottom:1px dotted gray">
								<input type="hidden" id="orgInfo.adminmot" name="orgInfo.adminmot">
								<input class="easyui-validatebox validatebox-text" id="motName" 
								name="motName" readonly style="width:300px" type="text"
								value="">
								<font color="red">提示：主管机关是根据区域和专业自动分配</font>
							</td>
							<td><font color="red">*</font></td>
						</tr>
						<TR>
							<TD
								style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px"><LABEL
								title=一级≥7名；二级≥5名；三级≥3名。>专职考评员人数：</LABEL></TD>
							<TD style="BORDER-BOTTOM: gray 1px dotted"><INPUT 
								id=orgInfo.pnumber class="easyui-validatebox validatebox-text"
								title=一级≥7名；二级≥5名；三级≥3名。 name=orgInfo.pnumber value="${orgInfo.pnumber}"
								 required="true"></TD>
							<TD><FONT color=red>*</FONT></TD>
						</TR>
						<TR>
							<TD
								style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px"><LABEL
								title=一级≥3名；二级≥2名；三级≥1名。>高级技术职称考评员人数：</LABEL></TD>
							<TD style="BORDER-BOTTOM: gray 1px dotted"><INPUT 
								id=orgInfo.pnumber2 class="easyui-validatebox validatebox-text"
								title=一级≥3名；二级≥2名；三级≥1名。 name=orgInfo.pnumber2 value="${orgInfo.pnumber2}"
								required="true"></TD>
							<TD><FONT color=red>*</FONT></TD>
						</TR>
						<TR>
							<TD
								style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px"><LABEL>开始从事相应业务年份：</LABEL></TD>
							<TD style="BORDER-BOTTOM: gray 1px dotted"><INPUT 
								id=orgInfo.startdate class="easyui-validatebox validatebox-text"
								name=orgInfo.startdate value="${orgInfo.startdate}"
								 required="true"></TD>
							<TD><FONT color=red>*</FONT></TD>
						</TR>
						<TR>
							<TD
								style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px"><LABEL>通讯地址：</LABEL></TD>
							<TD style="BORDER-BOTTOM: gray 1px dotted"><INPUT 
								style="WIDTH: 300px" id=orgInfo.address
								class="easyui-validatebox validatebox-text" name=orgInfo.address value="${orgInfo.address}"></TD>
							<TD><FONT color=lightgray>*</FONT></TD>
						</TR>
						<TR>
							<TD
								style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px"><LABEL>邮编：</LABEL></TD>
							<TD style="BORDER-BOTTOM: gray 1px dotted"><INPUT 
								id=orgInfo.pcode class="easyui-validatebox validatebox-text"
								name=orgInfo.pcode value="${orgInfo.pcode}"></TD>
							<TD><FONT color=lightgray>*</FONT></TD>
						</TR>
						<TR>
							<TD
								style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px"><LABEL>联系电话：</LABEL></TD>
							<TD style="BORDER-BOTTOM: gray 1px dotted"><INPUT 
								id=orgInfo.tel class="easyui-validatebox validatebox-text"
								name=orgInfo.tel value="${orgInfo.tel}"
								  required="true"></TD>
							<TD><FONT color=red>*</FONT></TD>
						</TR>
						<TR>
							<TD
								style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px"><LABEL>传真号码：</LABEL></TD>
							<TD style="BORDER-BOTTOM: gray 1px dotted"><INPUT 
								id=orgInfo.fax class="easyui-validatebox validatebox-text"
								name=orgInfo.fax value="${orgInfo.fax}"
								  required="true"></TD>
							<TD><FONT color=red>*</FONT></TD>
						</TR>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="照片文件请勿超过10M大小；多次上传会覆盖之前的。">单位基本情况相关材料：</label></td>
							<td style="border-bottom:1px dotted gray" style="width:400"><input
								class="easyui-validatebox validatebox-text" id="met*"
								name="orgInfo.met" title="照片文件请勿超过10M大小；多次上传会覆盖之前的。"
								type="hidden" value=""><span></span><a
								class="easyui-linkbutton l-btn" onclick="itemclick(this.id)"
								id="met"><span class="l-btn-left"><span
										class="l-btn-text">上传文件..</span></span></a></td>
							<td style="border-bottom:1px dotted gray"><span id="met_"
								style="display:none;color:blue;"> 上传成功 </span></td>

							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="照片文件请勿超过10M大小；多次上传会覆盖之前的。">专职考评员聘用 证明与职称证明：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="pns*"
								name="orgInfo.pns" title="照片文件请勿超过10M大小；多次上传会覆盖之前的。"
								type="hidden" value=""><span></span><a
								class="easyui-linkbutton l-btn" onclick="itemclick(this.id)"
								id="pns"><span class="l-btn-left"><span
										class="l-btn-text">上传文件..</span></span></a></td>
							<td style="border-bottom:1px dotted gray"><span id="pns_"
								style="display:none;color:blue;"> 上传成功 </span></td>

							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="照片文件请勿超过10M大小；多次上传会覆盖之前的。">考评管理制度：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="man*"
								name="orgInfo.man" title="照片文件请勿超过10M大小；多次上传会覆盖之前的。"
								type="hidden" value=""><span></span><a
								class="easyui-linkbutton l-btn" onclick="itemclick(this.id)"
								id="man"><span class="l-btn-left"><span
										class="l-btn-text">上传文件..</span></span></a></td>
							<td style="border-bottom:1px dotted gray"><span id="man_"
								style="display:none;color:blue;"> 上传成功 </span></td>

							<td><font color="lightgray">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="照片文件请勿超过10M大小；多次上传会覆盖之前的。">其他资料：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="orher*"
								name="orgInfo.orher" title="照片文件请勿超过10M大小；多次上传会覆盖之前的。"
								type="hidden" value=""><span></span><a
								class="easyui-linkbutton l-btn" onclick="itemclick(this.id)"
								id="orher"><span class="l-btn-left"><span
										class="l-btn-text">上传文件..</span></span></a></td>
							<td style="border-bottom:1px dotted gray"><span id="orher_"
								style="display:none;color:blue;"> 上传成功 </span></td>

							<td><font color="lightgray">*</font></td>
						</tr>
						<TR>
							<TD
								style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px"><LABEL>换证原因<B>（仅换证申请）</B>：
							</LABEL></TD>
							<TD style="BORDER-BOTTOM: gray 1px dotted"><SELECT id=renew
								name=orgInfo.renew value="0"><OPTION selected value=0>--
										无 --</OPTION>
									<OPTION value=1>1、考评员：资格证书到期</OPTION>
									<OPTION value=2>2、考评员：户籍所在地或常住地发生省际间变更</OPTION>
									<OPTION value=3>3、企业：达标等级证书到期</OPTION>
									<OPTION value=4>4、考评机构：资质证书到期</OPTION></SELECT></TD>
							<TD><FONT color=lightgray>*</FONT></TD>
						</TR>
					</tbody>
					<tfoot>
						<tr>
							<td align="center" colspan="3" style="padding: 15px"><p>
								注：带红色<font color="red">*</font>的为必填项。
							</p> <a class="easyui-linkbutton l-btn"  iconcls="icon-ok"
							onclick="orgApplyInsert()" id="undefined"><span
								class="l-btn-left"><span class="l-btn-text icon-ok"
									style="padding-left: 20px;">提交申请</span></span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
							class="easyui-linkbutton l-btn"  iconcls="icon-cancel"
							onclick="$('#fm1').get(0).reset()" id="undefined"><span
								class="l-btn-left"><span class="l-btn-text icon-cancel"
									style="padding-left: 20px;">重 置</span></span></a></td>
						</tr>
					</tfoot>
				</table>
			</form>
		</div>
	</div>



</body>
</html>

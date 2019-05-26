<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="main.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>企业报名申请</title>
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
		 window.parent.ligerwindow.close();
	<%
}else{%>
	 
<%
}
%>

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
        			   	    str='<SELECT id="nameReport.adminmot" name="enRegInfo.adminmot">';
        			   		for(var i=0;i<obj1.length;i++){
        			   			if(i==0){
        			   				str+='<OPTION selected value='+obj1[i].motcode+'>'+obj1[i].motname+'</OPTION>';
        			   			}else{
        			   				str+='<OPTION  value='+obj1[i].motcode+'>'+obj1[i].motname+'</OPTION>';
        			   			}
        						
        			   		}
        			   		
        			   		  str+='</SELECT>';
        			   		$("#sa").html(str);
        			    }
        			});
		})
	$(function(){
		//获取所在省
        		 $.ajax({
        			    type:"POST",
        			    async:false,
        			    url:"/jwr/respInfo/getQYcodeAction.action",
        			    success:function(returnValue){
        			   		indexdata=returnValue;
        			   		var obj2=(eval("("+indexdata+")")).Rows;
        			   		/* var temp = document.getElementById("enRegInfo.province");
							for (i = 0; i < obj2.length; i++) {
								temp.options[i] = new Option(obj2[i].sz_province,
										obj2[i].du_code);
							} */
							var str1="";
        			   	    str1='<SELECT selected id="enRegInfo.province" name="enRegInfo.province" onchange="szs(this.options[this.selectedIndex].value)">';
        			   	    for(var i=0;i<obj2.length;i++){
        			   	    	if(i==0){
        			   	    		str1+='<OPTION  selected value='+obj2[i].du_code+'>'+obj2[i].du_name+'</OPTION>';
        			   	    	}else{
        			   	    		str1+='<OPTION   value='+obj2[i].du_code+'>'+obj2[i].du_name+'</OPTION>';
        			   	    	}
        						
        			   		}
        			   		 str1+='</SELECT>';
        			   		$("#province").html(str1); 
        			    }
        			    
        			});
        			var province = document.getElementById("enRegInfo.province");
					 	province.fireEvent("onchange");
		});
		//获取所在市
	function szs(ss){
		$.ajax({
        			    type:"POST",
        			    async:false,
        			    url:"/jwr/respInfo/getcityAction.action",
        			    data:{sprovince:ss},
        			    success:function(returnValue){
        			   		indexdata=returnValue;
        			   		var obj2=(eval("("+indexdata+")")).Rows;
        			   		var str1="";
        			   	    str1='<SELECT selected id="enRegInfo.city" name="enRegInfo.city">';
        			   		for(var i=0;i<obj2.length;i++){
        			   			if(i==0){
        			   				str1+='<OPTION selected=true value='+0+'>'+'--请选择--'+'</OPTION>';
        			   				if('${enRegInfo.city}'==obj2[i].du_code){
        			   					str1+='<OPTION selected value='+obj2[i].du_code+'>'+obj2[i].du_name+'</OPTION>';
        			   				}else{
        			   					str1+='<OPTION  value='+obj2[i].du_code+'>'+obj2[i].du_name+'</OPTION>';
        			   				}
        			   			}else{
        			   				if('${enRegInfo.city}'==obj2[i].du_code){
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
	}
  	function check(){
		$("#send").attr("disabled",true);
		var reg = new RegExp("^[0-9]*$");
		var cellphone=/^0?1[3|4|5|8][0-9]\d{8}$/;
  		var phone=/^(\d{3,4}\-?)?\d{7,8}$/;
  		var myreg = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
  		var regs =  /[\u4E00-\u9FA5]/g;
  		var orgCode=document.getElementById('enRegInfo.pid');
  		//联系人身份证
  		var card=document.getElementById('enRegInfo.cpid');
   		var userid=document.getElementById('enRegInfo.userid').value;
  		var pass=document.getElementById('pass').value;
  		var surepass=document.getElementById('surepass').value;
  		var province=document.getElementById('enRegInfo.province').value;
  		var username=document.getElementById('enRegInfo.username').value;
  		var legalp=document.getElementById('enRegInfo.legalp').value;
  		var contact=document.getElementById('enRegInfo.contact').value;
  		var mobile=document.getElementById('enRegInfo.mobile').value;
  		var email=document.getElementById('enRegInfo.email').value;
  		var grade=document.getElementById('enRegInfo.grade').value;
  		var bustype=document.getElementById('enRegInfo.bustype').value;
  		var celltype=document.getElementById('enRegInfo.celltype').value;
  		var address=document.getElementById('enRegInfo.address').value;
  		var tel=document.getElementById('enRegInfo.tel').value;
  		var tax=document.getElementById('enRegInfo.tax').value;
  		
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
  		if(surepass.length>20){
  			alert("输入确认密码字数不能超过20个，已输入"+userpass.length+"个字!");
			$("#send").removeAttr("disabled");
			return;
  		}
  		if(province=="" || province==null || province=="00"){
  			alert("输入所在省市不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		
  		if(username=="" || username==null){
  			alert("输入企业名称不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(username.length>100){
  			alert("输入企业名称字数不能超过100个，已输入"+username.length+"个字!");
			$("#send").removeAttr("disabled");
			return;
  		}
  		if(legalp=="" || legalp==null){
  			alert("输入法人代表不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(legalp.length>10){
  			alert("输入法人代表字数不能超过10个，已输入"+legalp.length+"个字!");
			$("#send").removeAttr("disabled");
			return;
  		}
  		if(contact==null || contact==""){
  			alert("输入联系人姓名不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(contact.length>10){
  			alert("输入联系人姓名字数不能超过10个，已输入"+contact.length+"个字!");
			$("#send").removeAttr("disabled");
			return;
  		}
  		if(mobile=="" || mobile==null){
  			alert("输入联系人手机不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(!cellphone.test(mobile)){
  			alert("请输入正确的手机号!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(email=="" || email==null){
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
  			alert("请输入正确的邮箱地址!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(grade=="" || grade==null){
  			alert("输入申请等级不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(bustype=="" || bustype==null){
  			alert("输入生产经营类型不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(celltype=="" || celltype==null){
  			alert("输入生产经营类别不能为空!");
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
  		if(tel=="" || tel==null){
  			alert("输入联系电话不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(!phone.test(tel)){
  			alert("请输入正确的联系电话!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(tax=="" || tax==null){
  			alert("输入传真不能为空!");
  			$("#send").removeAttr("disabled");
  			return;
  		}
  		if(tax.length>20){
  			alert("输入通讯地址字数不能超过20个，已输入"+tax.length+"个字!");
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
  		}/* else{
  			var bol=isValidOrgCode(orgCode); //调用验证组织机构代码
  			if(!bol){
  				 $.ligerDialog.alert("组织机构代码格式不正确，请检查！");
  				 $("#send").removeAttr("disabled");
  				return (false);
  			} 
  		}*/
  		
  		var user= document.getElementById('enRegInfo.userid').value;
		var userBol=false;
		  $.ajax({
			    type:"POST",
			    async:false,
			    data:{userid:user,usertype:'en'},
			    url:"/jwr/respInfo/getUserIdAction.action",
			    success:function(returnValue){
			   		if(returnValue=='yes'){
			   			alert('该用户名已被注册！请从新填写');
			   		    userBol=true;
			   		}
			   		
			    }
			});
			if(userBol){$("#send").removeAttr("disabled");return;}
		var pid= document.getElementById('enRegInfo.cpid').value;
		var pidBol=false;
		$.ajax({
			    type:"POST",
			    async:false,
			    data:{pid:pid,usertype:'en'},
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
  		
  		var orgCodeBol=false;
		$.ajax({
			    type:"POST",
			    async:false,
			    data:{orgCode:orgCode,usertype:'en'},
			    url:"/jwr/respInfo/getorgCodeAction.action",
			    success:function(returnValue){
			   		if(returnValue=='yes'){
			   			alert('该组织机构代码已被注册！请从新填写');
			   			orgCodeBol=true;
			   		}
			   		
			    }
			    
			});
	
  		if(orgCodeBol){return;} 
  		
  		
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
  	
	var select2 = new Array(7);
	for (i=0; i<7; i++) 
	{
	select2[i] = new Array();
	}
	//定义基本选项
	select2[0][0] = new Option("--请选择--", "00");
	select2[0][1] = new Option("", "");
	select2[0][2] = new Option("", "");
	select2[0][3] = new Option("", "");
	select2[0][4] = new Option("", "");
	select2[0][5] = new Option("", "");

	select2[1][0] = new Option("道路旅客运输 ", "11");
	select2[1][1] = new Option("道路危险货物运输", "12");
	select2[1][2] = new Option("汽车客运站", "13");
	select2[1][3] = new Option("道路普通货运", "14");
	select2[1][4] = new Option("道路货物运输场站", "15");
	select2[1][5] = new Option("机动车维修", "16");

	select2[2][0] = new Option("水路旅客运输", "21");
	select2[2][1] = new Option("水路危险货物运输", "22");
	select2[2][2] = new Option("水路普通货物运输", "23");
	select2[2][3] = new Option("", "");
	select2[2][4] = new Option("", "");
	select2[2][5] = new Option("", "");

	select2[3][0] = new Option("港口客运（滚装、渡船渡口）码头", "31");
	select2[3][1] = new Option("危险货物码头运输", "32");
	select2[3][2] = new Option("港口散杂货（集装箱）码头", "33");
	select2[3][3] = new Option("", "");
	select2[3][4] = new Option("", "");
	select2[3][5] = new Option("", "");
	
	select2[4][0] = new Option("城市公共汽车客运", "41");
	select2[4][1] = new Option("城市轨道交通运输", "42");
	select2[4][2] = new Option("出租汽车营运", "43");
	select2[4][3] = new Option("", "");
	select2[4][4] = new Option("", "");
	select2[4][5] = new Option("", "");
	
	select2[5][0] = new Option("交通运输建筑施工", "51");
	select2[5][1] = new Option("", "");
	select2[5][2] = new Option("", "");
	select2[5][3] = new Option("", "");
	select2[5][4] = new Option("", "");
	select2[5][5] = new Option("", "");
	
	select2[6][0] = new Option("其他", "61");
	select2[6][1] = new Option("", "");
	select2[6][2] = new Option("", "");
	select2[6][3] = new Option("", "");
	select2[6][4] = new Option("", "");
	select2[6][5] = new Option("", "");

	function redirec(x)
	{
		var temp = document.getElementById("enRegInfo.celltype");
			for (i = 0; i < select2[x].length; i++) {
				temp.options[i] = new Option(select2[x][i].text,
						select2[x][i].value);
			}
			temp.options[0].selected = true;

		} 
	
  </script>
</head>
<body>
	<center style="border: 1px solid #369">
		<h1
			style="padding:20px; background-color:#369; color: white; font-size: 22px; margin-top:0px">天津市交通运输厅</h1>
		<div align="left">
			<div class="eui-info">
				<div class="eui-tip icon-tip"></div>
				<div>请认真填写如下所有信息，并等待主管机关进行报名申请初审。</div>
			</div>
		</div>
		<div align="center" style="border:0px solid red">
			<input id="typeText" type="hidden" value="">
			<form id="fm1" name="frm" method="POST" action="<%=basePath%>/reg/enRegAction.action">
				<table style="margin-left: 30px">
					<caption style="padding: 5px">
						<h1 align="center">企业报名申请</h1>
					</caption>
					<tbody>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>用户ID：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="enRegInfo.userid" name="enRegInfo.userid" 
								required="true" type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>用户密码：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="pass"
								name="enRegInfo.userpass" required="true" type="password"></td>
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
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="提示：若须申请一级企业达标等级证书，请选择“交通运输部”">主管机关：</label></td>
							<td style="border-bottom:1px dotted gray">
								<span id="sa"></span>
								<font color="red">提示：请选择当地直属主管机关</font>
							</td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="注：除一级企业及长航局、珠航局企业外，请和上面主管机关选项一致">所在省市：</label></td>
							<td style="border-bottom:1px dotted gray">
								<!-- <select id="enRegInfo.province" name="enRegInfo.province" required="true" onchange="szs(this.options[this.selectedIndex].innerHTML)"> 
									<option selected="true">--请选择--</option>
								</select> -->
								<span id="province"></span>
							</td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="注：除一级企业及长航局、珠航局企业外，请和上面主管机关选项一致">所在市：</label></td>
							<td style="border-bottom:1px dotted gray">
								<!-- <select id="enRegInfo.city" name="enRegInfo.city" required="true" title="生产经营类别" > 
									<option selected="true">--请选择--</option>
								</select> -->
								<span id="city"></span>
							</td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>企业名称：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="enRegInfo.username" 
								name="enRegInfo.username" required="true" style="width:300px" type="text"
								value=""></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>组织机构代码：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="enRegInfo.pid" name="enRegInfo.pid"
								required="true" type="text" value=""></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>法人代表：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="enRegInfo.legalp"
								name="enRegInfo.legalp" required="true" type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>联系人姓名：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="enRegInfo.contact" name="enRegInfo.contact" required="true" type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="15位或18位身份证">联系人身份证号：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="enRegInfo.cpid"
								name="enRegInfo.cpid" required="true" title="用于申请u盘验证签名" type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>联系人手机：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="enRegInfo.mobile"
								name="enRegInfo.mobile" required="true" type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>联系人邮箱：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="enRegInfo.email"
								name="enRegInfo.email" required="true" type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="报名申请时，填一个拟申请等级即可；
报名申请通过后，可试情况申请多个等级的证书">申请等级：</label></td>
							<td style="border-bottom:1px dotted gray"><select id="enRegInfo.grade"
								name="enRegInfo.grade" required="true"
								title="报名申请时，填一个拟申请等级即可；
报名申请通过后，可试情况申请多个等级的证书" value="1"> 
									<option value="2">二级</option>
									<option value="3">三级</option></select></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="最多选两个。">生产经营类型：</label></td>
							<td style="border-bottom:1px dotted gray">
							<select id="enRegInfo.bustype" onchange="redirec(this.options.selectedIndex)"
								name="enRegInfo.bustype" required="true"
								title="生产经营类型" > 
									<option selected="true"	>--请选择--</option>
									<option value="1">道路运输</option>
									<option value="2">水路运输</option>
									<option value="3">港口运营</option>
									<option value="4">城市客运</option>
									<option value="5">交通运输工程建设</option>
									<option value="6">其他</option>
									</select>
							</td>
							<font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="报名申请时，选填一个即可。">生产经营类别：</label></td>
								<td style="border-bottom:1px dotted gray">
								<select id="enRegInfo.celltype" name="enRegInfo.celltype" required="true" title="生产经营类别" > 
									<option selected="true">--请选择--</option>
								</select>
							</td>		
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="请填写清楚通讯地址">通讯地址：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="enRegInfo.address"
								name="enRegInfo.address" required="true" style="width:300px"
								title="请填写清楚通讯地址" type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>联系电话：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="enRegInfo.tel" name="enRegInfo.tel"
								required="true" type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>传真：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="enRegInfo.tax" name="enRegInfo.tax"
								required="true" type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="注：多次上传会覆盖之前的。">企业法人营业执照：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="qual*"
								name="enRegInfo.qual" title="注：多次上传会覆盖之前的。" type="hidden" value=""><a
								class="easyui-linkbutton l-btn"
								href="javascript:void(0)" onclick="itemclick(this.id)" id="qual"> 
								<span class="l-btn-left">
									<span class="l-btn-text">上传文件..</span> 
								</span> 
								</a></td>
								<td style="border-bottom:1px dotted gray">
									<span id="qual_" style="display:none;color:blue;">
										              上传成功
									</span>
							    </td>				
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="注：多次上传会覆盖之前的。">营业执照：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="buslicense*"
								name="enRegInfo.buslicense" title="注：多次上传会覆盖之前的。" type="hidden" value=""><span></span><a
								class="easyui-linkbutton l-btn" href="javascript:void(0)" onclick="itemclick(this.id)"
								id="buslicense"><span class="l-btn-left">
									<span class="l-btn-text">上传文件..</span> 
								</span> </a></td>
							<td style="border-bottom:1px dotted gray">
									<span id="buslicense_" style="display:none;color:blue;">
										              上传成功
									</span>
							    </td>				
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="注：多次上传会覆盖之前的。">组织机构代码证：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="orgcodecert*"
								name="enRegInfo.orgcodecert" required="true" title="注：多次上传会覆盖之前的。"
								type="hidden" value=""><span></span><a
								class="easyui-linkbutton l-btn"
								href="javascript:void(0)" onclick="itemclick(this.id)"
								id="orgcodecert"> <span class="l-btn-left">
									<span class="l-btn-text">上传文件..</span> 
								</span>  </a></td>
							<td style="border-bottom:1px dotted gray">
									<span id="orgcodecert_" style="display:none;color:blue;">
										              上传成功
									</span>
							    </td>		
						</tr>
						<tr>
					 
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="注：多次上传会覆盖之前的。">经营许可证：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="license*"
								name="enRegInfo.license" required="true" title="注：多次上传会覆盖之前的。"
								type="hidden" value=""><span></span><a class="easyui-linkbutton l-btn"
										href="javascript:void(0)"
								onclick="itemclick(this.id)" id="license">
								<span class="l-btn-left">
									<span class="l-btn-text">上传文件..</span> 
								</span> 
								</a></td>
								<td style="border-bottom:1px dotted gray">
									<span id="license_" style="display:none;color:blue;">
										              上传成功
									</span>
							    </td>
						</tr>
						 <tr>
					 
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="注：多次上传会覆盖之前的。">其他安全管理体系证书证件：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="othercert*"
								name="enRegInfo.othercert" required="true" title="注：多次上传会覆盖之前的。"
								type="hidden" value=""><span></span><a class="easyui-linkbutton l-btn"
										href="javascript:void(0)"
								onclick="itemclick(this.id)" id="othercert">
								<span class="l-btn-left">
									<span class="l-btn-text">上传文件..</span> 
								</span> 
								</a></td>
								<td style="border-bottom:1px dotted gray">
									<span id="othercert_" style="display:none;color:blue;">
										              上传成功
									</span>
							    </td>
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
		<h2
			style="padding:15px; background-color:lightgray; margin-bottom:0px; color:#333; text-shadow:0 1px 0 #EEE;">版权所有：<%=pro_mot_name %>
			2014 年</h2>
	</center>
</body>
</html>

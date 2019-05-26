<%@page import="com.wr4.domain.PnRegInfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../main.jsp" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
	String userid = request.getParameter("userid");
	String num = request.getParameter("num");
	PnRegInfo pnRegInfo = (PnRegInfo)request.getAttribute("pnRegInfo");
	System.out.println(pnRegInfo);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'pnRegInfo.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script src="js/popup.js" type="text/javascript"></script>

<script type="text/javascript">
	var filePath = "",indexdata="",totalSize="",userid = '<%=userid%>',num = '<%=num%>';
	var fileName="";
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
			   				str1+='<OPTION selected value='+0+'>'+'--请选择--'+'</OPTION>';
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
			 var ff = document.getElementById("edu");
			 for(var i=0;i<ff.options.length;i++){
			 	if(ff.options[i].value=='${pnRegInfo.edu}'){
			 		ff.options[i].selected=true;
			 	}
			 }
		})
		
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
		var fileName=document.getElementById("photo*").value;
		if(fileName!=""||fileName!=undefined){
			$("#photo")[0].style.display="inline";
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
	
	function  pnApplyInput(){
		var reg = new RegExp("^[0-9]*$");
		var cellphone=/^0?1[3|4|5|8][0-9]\d{8}$/;
  		var phone=/^(\d{3,4}\-?)?\d{7,8}$/;
  		var myreg = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
  		var regs =  /[\u4E00-\u9FA5]/g;
		var qq = document.getElementById("pnApply.adminmot").value;
		var ee = document.getElementById("photo*").value;
		var edu = document.getElementById("edu").value;
		var begindate = document.getElementById("begindate").value;
		var train = document.getElementById("train").value;
		var dd =train.length;
		var workdoc = document.getElementById("workdoc").value;
		var ff = workdoc.length;
		var perf = document.getElementById("perf").value;
		var gg = perf.length;
		var proof1 = document.getElementById("proof*").value;
		var proofb = document.getElementById("proofb*").value;
		var proof2 = document.getElementById("proof2*").value;
		var bussinestype = document.getElementById("pnRegInfo.bussinestype").value;
		var address = document.getElementById("pnRegInfo.address").value;
		var pcode = document.getElementById("pnRegInfo.pcode").value;
		var mobile = document.getElementById("pnRegInfo.mobile").value;
		var email = document.getElementById("pnRegInfo.email").value;
		if(ee==null || ee==""){
			alert("请上传您的照片");
			return;
		}
		if(address==null || address==""){
			alert("请输入通信地址");
			return;
		}
		if(pcode==null || pcode==""){
			alert("请输入邮编");
			return;
		}
		if(mobile=="" || mobile==null){
  			alert("输入联系人手机不能为空!");
  			return;
  		}
  		if(!cellphone.test(mobile)){
  			alert("请输入正确的手机号!");
  			return;
  		}
  		if(email=="" || email==null){
  			alert("输入联系人邮箱不能为空!");
  			return;
  		}
  		if(!myreg.test(email)){
  			alert("请输入正确的邮箱地址!");
  			return;
  		}
		if(edu==null || edu=="" || edu==00){
			alert("请选择文化程度");
			return;
		}
		if (begindate==null || begindate=="") {
			alert("请输入相关专业从业年份");
			return;
		}
		if(bussinestype == null || bussinestype == ""){
			alert("请选择专业类型");
			return;
		}
		if(qq==null || qq=="" ||qq==00){
			alert("主管机关不能为空");
			return;
		}
		if(train==null || train==""){
			alert("请输入主要学习（培训）经历");
			return;
		}
		if (dd>800) {
			alert("主要学习（培训）经历字数不能超过800个，已输入"+dd+"个字!");
			return;
		}
		if (workdoc=="" || workdoc==null) {
			alert("请输入主要工作简历");
			return;
		}
		if (ff>800) {
			alert("主要工作简历字数不能超过800个，已输入"+ff+"个字!");
			return;
		}
		if(perf==null || perf==""){
			alert("请输入专业工作业绩");
			return;
		}
		if (gg>800) {
			alert("专业工作业绩字数不能超过800个，已输入"+gg+"个字!");
			return;
		}
		if (proof1==null || proof1=="") {
			alert("请上传您的身份证明文件");
			return;
		}
		if (proofb=="" || proofb==null) {
			alert("请上传您的身份证明文件（背面）");
			return;
		}
		if (proof2=="" || proof2==null) {
			alert("请上传您的学历证明文件");
			return;
		}
		document.getElementById("pnApply.adminmot").value= '${pnRegInfo.admin}';
		ww='${pnRegInfo.comefrom}';
		document.forms[0].submit();
	}
	
	function showMot(type){
		var city= document.getElementById('pnApply.city').value;
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
				    document.getElementById("pnApply.adminmot").value=str.split(',')[0];
			   		$("#motName").val(str.split(',')[1]);
				}
		    }
	   });
	}

	//查看
	function chakan(id){
		var ss= id.substr(0,id.length-1)+'*';
		var freport=document.getElementById(ss).value;
			if(freport!=null && freport!=""){
 		 	var ss1=freport.split('.');
	    	var filetype=ss1[1];
 			 if(filetype =='bmp'||filetype =='BMP'||filetype =='jpg'||filetype =='JPG'||filetype =='jpeg'||filetype =='JPEG'||filetype =='png'||filetype =='PNG'||filetype =='gif'||filetype =='GIF'){
	  				seeImg('img0',freport);
	  			}else{
	  				window.location.href='<%= basePath%>updown/downloadFileAction?file='+freport;
	  			} 
  		}else{
  			alert("没有上传相关文件");
  		}
		
	}
	function jy(){
		var reg = new RegExp("^[0-9]*$");
	       var obj = document.getElementById("begindate");
	    if(!reg.test(obj.value)){
	        alert("请输入数字!");
	        return;
		}
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
			<form id="fm1" method="POST" action="/jwr/pn/pnApplyInsertAction.action">
				<input type="hidden" name="pnApply.userid" id="pnRegInfo.userid" value="${userid }">
				<input type="hidden" name="num" id="num" value="${num }">
				<input type="hidden" name="pnApply.city" id="pnApply.city" value="${pnRegInfo.city}">
				<table style="margin-left: 30px">
					<caption style="padding: 5px">
						<h1>
							<font color="blue">考评员资格证</font> 申请表
						</h1>
					</caption>
					<tbody>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>姓名：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="pnname" name="pnApply.pnname" readonly="readonly"  type="text" value="${pnRegInfo.username }"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="15位或18位身份证">身份证号：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="pid" name="pnApply.pid" value="${pnRegInfo.pid }" readonly="readonly"
								 title="15位或18位身份证" type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="请自选主管机关">所在市：</label></td>
							<td style="border-bottom:1px dotted gray">
								<span id="city"></span>
							</td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>    
							<td style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="照片文件请勿超过10M大小；多次上传会覆盖之前的。">照片：</label></td>
							<td style="border-bottom:1px dotted gray"><input  class="easyui-validatebox validatebox-text" id="photo*" name="pnApply.photo"
								  title="照片文件请勿超过10M大小；多次上传会覆盖之前的。"type="hidden" value="${pnRegInfo.photo }">
								<a class="easyui-linkbutton l-btn" 
									onclick="itemclick(this.id)" id="photo"><span
									class="l-btn-left"><span class="l-btn-text">上传文件..</span></span>
								</a>
							</td>
							<td  style="border-bottom:1px dotted gray;">
								<a class="easyui-linkbutton l-btn" style="display: none;" onclick="chakan(this.id)" id="photo_"><span class="l-btn-left">
									<span class="l-btn-text">查看文件..</span></span>
								</a> 
						    </td>		
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>工作单位：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="pnApply.org" name="pnApply.org" value="${pnRegInfo.org}" readonly="readonly"
								 style="width:300px" type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>职称：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="pnApply.title" value="${pnRegInfo.title}" 
								name="pnApply.title" type="text"></td>
							<td><font color="lightgray">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>通讯地址：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="pnRegInfo.address" value="${pnRegInfo.address }" 
								name="pnApply.address"  style="width:300px" type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>邮编：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="pnRegInfo.pcode" value="${pnRegInfo.pcode }" 
								name="pnApply.pcode"  type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>联系电话：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="pnRegInfo.tel" name="pnApply.tel" value="${pnRegInfo.tel }" 
								type="text"></td>
							<td><font color="lightgray">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>传真号码：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="pnRegInfo.fax" name="pnApply.fax" value="${pnRegInfo.fax }" 
								type="text"></td>
							<td><font color="lightgray">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>手机号码：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="pnRegInfo.mobile" value="${ pnRegInfo.mobile}" 
								name="pnApply.mobile"  type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>电子邮箱：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="pnRegInfo.email" value="${pnRegInfo.email }" 
								name="pnApply.email"  type="text" validtype="email"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="按国标（中专以上）">文化程度：</label></td>
							<td style="border-bottom:1px dotted gray"><select id="edu"
								name="pnApply.edu"  title="按国标（中专以上）">
									<option value="00">--请选择--</option>
									<option value="中专">中专</option>
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
								class="easyui-validatebox validatebox-text" id="pnRegInfo.major" value="${pnRegInfo.major }" readonly
								name="pnApply.major"  title="注意：必须具备交通运输相关专业大学专科以上学历"
								type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>现从事专业：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="pnRegInfo.prof" value="${pnRegInfo.prof }" readonly="readonly"
								name="pnApply.prof"  type="text"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>相关专业从业年份：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="begindate" onchange="jy()"
								name="pnApply.begindate"  type="text" value="${pnRegInfo.begindate }"></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="考评员申请的专业类型不得多于二种">申请专业类型（不得多于两种）：</label></td>
							<td style="border-bottom:1px dotted gray"><select id="pnRegInfo.bussinestype" name="pnApply.bussinestype"
								  title="考评员申请的专业类型不得多于二种" onchange="showMot(this.options[this.selectedIndex].value)">
								    <option selected value="">--请选择--</option>
								    <option value="1">道路运输</option>
									<option value="2">水路运输</option>
									<option value="3">港口运营</option>
									<option value="4">城市客运</option>
									<option value="5">交通运输工程建设</option>
									<option value="6">其他</option></select></td>
							<td><font color="lightgray">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="请自选主管机关">主管机关：</label></td>
							<td style="border-bottom:1px dotted gray">
								<input type="hidden" id="pnApply.adminmot" name="pnApply.adminmot" value="">
								<input class="easyui-validatebox validatebox-text" id="motName" 
								name="motName" readonly style="width:300px" type="text"
								value="">
								<font color="red">提示：主管机关是根据区域和专业自动分配</font>
							</td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>主要学习（培训）经历：</label></td>
							<td style="border-bottom:1px dotted gray"><textarea
									class="easyui-validatebox validatebox-text" id="train" name="pnApply.train" 
								  >${pnRegInfo.train }</textarea></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>主要工作简历：</label></td>
							<td style="border-bottom:1px dotted gray"><textarea
									class="easyui-validatebox validatebox-text" id="workdoc" 
									name="pnApply.workdoc">${pnRegInfo.resume}</textarea></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="不得少于10个字">专业工作业绩：</label></td>
							<td style="border-bottom:1px dotted gray"><textarea
									class="easyui-validatebox validatebox-text" id="perf" 
									name="pnApply.perf"  title="不得少于10个字">${pnRegInfo.perf }</textarea></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="注：多次上传会覆盖之前的。">专业技术职称及相关材料：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="perf1*"
								name="pnApply.perf1"  title="注：多次上传会覆盖之前的。" type="hidden" value="${pnRegInfo.perf1 }"> 
									<a class="easyui-linkbutton l-btn" onclick="itemclick(this.id)" id="perf1"><span class="l-btn-left">
										<span class="l-btn-text">上传文件..</span></span>
									</a> 
							</td>
							<td  style="border-bottom:1px dotted gray;">
								<a class="easyui-linkbutton l-btn" style="display: none;" onclick="chakan(this.id)" id="perf1_"><span class="l-btn-left">
									<span class="l-btn-text">查看文件..</span></span>
								</a> 
						    </td>
							<td><font color="lightgray">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="注：多次上传会覆盖之前的。">专业工作业绩附件：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="perf2*" name="pnApply.perf2"
								 title="注：多次上传会覆盖之前的。" type="hidden" value="${pnRegInfo.perf2 }"><span></span>
									 <a class="easyui-linkbutton l-btn" onclick="itemclick(this.id)" id="perf2"><span class="l-btn-left">
									 	<span class="l-btn-text">上传文件..</span></span>
									 </a>
								 </td>
								<td  style="border-bottom:1px dotted gray;">
									<a class="easyui-linkbutton l-btn" style="display: none;"onclick="chakan(this.id)" id="perf2_"><span class="l-btn-left">
										<span class="l-btn-text">查看文件..</span></span>
									</a> 
						    	</td>
							<td><font color="lightgray">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="二代身份证、护照等的正面（pdf, doc或者jpg格式）">身份证明文件：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="proof*" name="pnApply.proof"
								title="二代身份证、护照等的正面（pdf, doc或者jpg格式）" type="hidden" value="${pnRegInfo.proof}"><span></span><a
								class="easyui-linkbutton l-btn" 
								onclick="itemclick(this.id)" id="proof"><span
									class="l-btn-left"><span class="l-btn-text">上传文件..</span></span></a></td>
							 <td  style="border-bottom:1px dotted gray;">
								<a class="easyui-linkbutton l-btn" style="display: none; "onclick="chakan(this.id)" id="proof_"><span class="l-btn-left">
									<span class="l-btn-text">查看文件..</span></span>
								</a> 
						    </td>			
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="二代身份证、护照等的反面（pdf, doc或者jpg格式）">身份证明文件（背面）：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="proofb*"
								name="pnApply.proofb" 
								title="二代身份证、护照等的反面（pdf, doc或者jpg格式）" type="hidden" value="${pnRegInfo.proofb }"><span></span><a
								class="easyui-linkbutton l-btn"  
								onclick="itemclick(this.id)" id="proofb"><span class="l-btn-left"><span
										class="l-btn-text">上传文件..</span></span></a></td>
							 <td  style="border-bottom:1px dotted gray;">
								<a class="easyui-linkbutton l-btn" style="display: none; "onclick="chakan(this.id)" id="proofb_"><span class="l-btn-left">
									<span class="l-btn-text">查看文件..</span></span>
								</a> 
						    </td>		
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="学历证书（pdf, doc或者jpg格式）">学历证明文件：</label></td>
							<td style="border-bottom:1px dotted gray">
							<input class="easyui-validatebox validatebox-text" id="proof2*" name="pnApply.proof2"  title="学历证书（pdf, doc或者jpg格式）"
								type="hidden" value="${pnRegInfo.proof2 }"><span></span>
								<a class="easyui-linkbutton l-btn"  onclick="itemclick(this.id)" id="proof2"><span
									class="l-btn-left"><span class="l-btn-text">上传文件..</span></span></a></td>
							<td  style="border-bottom:1px dotted gray;">
								<a class="easyui-linkbutton l-btn" style="display: none;" onclick="chakan(this.id)" id="proof2_"><span class="l-btn-left">
									<span class="l-btn-text">查看文件..</span></span>
								</a> 
						    </td>		
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="其他各类培训合格证明的照片、编号页、发证机关印章页（pdf, doc或者jpg格式）">培训合格证明文件：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="proof3*" name="pnApply.proof3"
								name="proof3" title="其他各类培训合格证明的照片、编号页、发证机关印章页（pdf, doc或者jpg格式）"
								type="hidden" value=""><span></span>
								<a class="easyui-linkbutton l-btn"   onclick="itemclick(this.id)" id="proof3"><span class="l-btn-left"><span
										class="l-btn-text">上传文件..</span></span></a></td>
							<td  style="border-bottom:1px dotted gray;">
								<a class="easyui-linkbutton l-btn"style="display: none;" onclick="chakan(this.id)" id="proof3_"><span class="l-btn-left">
									<span class="l-btn-text">查看文件..</span></span>
								</a> 
						    </td>		
							<td><font color="lightgray">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>换证原因<b>（仅换证申请）</b>：
							</label></td>
							<td style="border-bottom:1px dotted gray"><select id="pnRegInfo.renew"
								name="pnApply.renew"><option value="0">-- 无 --</option>
									<option value="1">1、考评员：资格证书到期</option>
									<option value="2">2、考评员：户籍所在地或常住地发生省际间变更</option>
									<option value="3">3、企业：达标等级证书到期</option>
									<option value="4">4、考评机构：资质证书到期</option></select></td>
							<td><font color="lightgray">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="注：多次上传会覆盖之前的。">继续教育证明<b>（仅换证申请）</b>：
							</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="edu2*"  name="pnApply.edu2"
								name="edu2" title="注：多次上传会覆盖之前的。" type="hidden" value=""><span></span><a
								class="easyui-linkbutton l-btn"   onclick="itemclick(this.id)" id="edu2"><span class="l-btn-left"><span
										class="l-btn-text">上传文件..</span></span></a></td>
							<td  style="border-bottom:1px dotted gray;">
								<a class="easyui-linkbutton l-btn" style="display: none;" onclick="chakan(this.id)" id="edu2_"><span class="l-btn-left">
									<span class="l-btn-text">查看文件..</span></span>
								</a> 
						    </td>
							<td><font color="lightgray">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="由所在考评机构出具的工作业绩证明。">工作业绩证明<b>（仅换证申请）</b>：
							</label></td>
							   <td style="border-bottom:1px dotted gray">
								  <input class="easyui-validatebox validatebox-text" id="prooforg*" 
									name="pnApply.prooforg" title="由所在考评机构出具的工作业绩证明。" type="hidden" value=""/>
								 
									<a class="easyui-linkbutton l-btn" onclick="itemclick(this.id)" id="prooforg" >
									   <span class="l-btn-left">
									      <span class="l-btn-text">上传文件..</span>
									   </span>
									</a>
								</td>
								<td  style="border-bottom:1px dotted gray;">
									<a class="easyui-linkbutton l-btn" style="display: none;" onclick="chakan(this.id)" id="prooforg_"><span class="l-btn-left">
										<span class="l-btn-text">查看文件..</span></span>
									</a> 
						    	</td>
								<td><font color="lightgray">*</font></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td align="center" colspan="3" style="padding: 15px"><p>
									注：带红色<font color="red">*</font>的为必填项。
								</p> <a class="easyui-linkbutton l-btn"  iconcls="icon-ok"
								onclick="pnApplyInput()" id="undefined"><span
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
	<div id="popupContact" align="center" >
		<a id="popupContactClose">x</a>
		<p id="contactArea">
			<img id="img0" src=""/>
		</p>
	</div>
</body>
</html>

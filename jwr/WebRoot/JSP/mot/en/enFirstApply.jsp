<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="../../main.jsp" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<% String pid = request.getParameter("pid");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>My JSP 'pnApply.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->



<script type="text/javascript">
	var filePath = "",indexdata="",totalSize="",pid = '<%=pid%>';
	$(function ()
	{
		var cc = document.getElementById("enInfo.grade");
		 for(var i=0;i<cc.options.length;i++){
		 	if(cc.options[i].value=='${enInfo.grade}'){
		 		cc.options[i].selected=true;
		 	}
		 }
		 var entype = document.getElementById("enInfo.busType");
		 for(var i=0;i<entype.options.length;i++){
		 	if(entype.options[i].value=='${enInfo.bustype}'){
		 		entype.options[i].selected=true;
		 	}
		 }
		 if(   document.all   ){  
          	entype.fireEvent(   "onchange"   );  
		 }else{  
            var   evt   =   document.createEvent('HTMLEvents');  
            evt.initEvent('change',true,true);  
            entype.dispatchEvent(   evt   );  
		 }
		var entype2 = document.getElementById("enInfo.type2");
		 for(var i=0;i<entype2.options.length;i++){
		 	if(entype2.options[i].value=='${enInfo.type2}'){
		 		entype2.options[i].selected=true;
		 	}
		 }
	 });
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
		   		str1+='<OPTION  value='+0+'>'+'--请选择--'+'</OPTION>';
		   	    for(var i=0;i<obj2.length;i++){
		   			if(i==0){
		   				if('${enInfo.city}'==obj2[i].du_code){
		   					str1+='<OPTION selected value='+obj2[i].du_code+'>'+obj2[i].du_name+'</OPTION>';
		   				}else{
		   					str1+='<OPTION  value='+obj2[i].du_code+'>'+obj2[i].du_name+'</OPTION>';
		   				}
		   			}else{
		   				if('${enInfo.city}'==obj2[i].du_code){
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
	}
	function itemclick(id) {
		stid=id;
		//  var m = $.ligerDialog.open({ url: 'JSP/pn/pnupload.jsp',width:800, height: 400, isResize: true }); 
		window.open(
			'<%=basePath%>/JSP/pn/pnupload.jsp',
			'newwindow',
			'height=100,width=400,top=100,left=100,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
		
	} 
	
	function  enApplyInput(){
		
		
		
		var grade =document.getElementById("enInfo.grade").value;
		var type2 = document.getElementById("enInfo.type2").value;
		var flag = true;
		$.ajax({
    	    type:"POST",
    	    async:false,
    	    url:"/jwr/enControl/getQypf_tablesAction.action?type2="+type2+"&grade="+grade,
    	    success:function(returnValue){
    	   		if(returnValue == "0"){
    	   			flag = false;
    	   		}
    	    }
    	}); 
		if(!flag){
			alert("请先提交对应生产经营类型的自评报告!");
			return ;
		}
		var reg = new RegExp("^[0-9]*$");
		var cellphone=/^0?1[3|4|5|8][0-9]\d{8}$/;
  		var phone=/^(\d{3,4}\-?)?\d{7,8}$/;
  		var myreg = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
  		var regs =  /[\u4E00-\u9FA5]/g;
		var adminmot = document.getElementById("enInfo.adminmot").value;
		var safe = document.getElementById("safe*").value;
		var qual = document.getElementById("qual*").value;
		var license = document.getElementById("license*").value;
		var report = document.getElementById("report*").value;
		
		var busType = document.getElementById("enInfo.busType").value;
		var mobile=document.getElementById('enInfo.mobile').value;
  		var email=document.getElementById('enInfo.email').value;
  		var tel=document.getElementById('tel').value;
  		var tax=document.getElementById('tax').value;
  		var address=document.getElementById('address').value;
		if(type2==''){
			alert("请选择生产经营类别！");
			return ;
		}
		if(busType=='00'){
			alert("请选择生产经营类型！");
			return ;
		}
		if(adminmot=="" || adminmot==null){
			alert("输入的主管机关不能为空！");
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
  		if($("#txtGrid").val()==null||$("#txtGrid").val()==''){
  			alert("请选择考评机构！");
			return;
  		}
		var pid=orgSelect.findValueByText($("#txtGrid").val());
		if(orgSelect==null){
			alert("此业务类型暂无相关考评机构！");
			return;
		}
		
		if(pid==""||pid==null){
			alert("请选择考评机构！");
			return;
		}
		if(address=="" || address==null){
  			alert("输入通讯地址不能为空!");
  			return;
  		}
  		if(tel=="" || tel==null){
  			alert("输入联系电话不能为空!");
  			return;
  		}
  		if(!phone.test(tel)){
  			alert("请输入正确的联系电话!");
  			return;
  		}
  		if(tax=="" || tax==null){
  			alert("输入传真不能为空!");
  			return;
  		}
		if(safe=="" || safe==null ){
			alert("请上传安全生产组织架构！");
			return;
		}
		if(qual=="" || qual==null ){
			alert("请上传企业法人资格证件！");
			return;
		}
		if(license=="" || license==null ){
			alert("请上传经营许可证！");
			return;
		}
		if(report=="" || report==null ){
			alert("请上传标准化达标自评报告！");
			return;
		}
		pid=pid.replace(/;/g,",") ;
		document.getElementById("enInfo.orgId1").value=pid;
		document.getElementById("enInfo.apporg").value=pid;
		document.forms[0].submit();
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
		var temp = document.getElementById("enInfo.type2");
		for (i = 0; i < select2[x].length; i++) {
			temp.options[i+1] = new Option(select2[x][i].text,
					select2[x][i].value);
		}
		temp.options[0] = new Option("--请选择--","");
		temp.options[0].selected = true;

		}
	/**
	** 根据业务类别选择同一主管机关下的考评机构
	**
	**
	*/
	var orgSelect;
	
	function getOrgByen(){
		
		var checki=0;
		var grade=document.getElementById("enInfo.grade").value;
		if(grade==null||grade==''){
			alert("请选择等级！");
			return;
		}
		 para = document.getElementById("enInfo.busType");
			if(para!=null&&para.value==''){
			alert("请选择生产经营类型！");
				return;
			}
		 var type2 = document.getElementById("enInfo.type2");
	
		 if(type2!=null&&type2.value==''){
				alert("请选择生产经营类别！");
					return;
				}
		
			var indexdatass;
			   $.ajax({
				    type:"POST",
				    async:false,
				   data:{bustype:para.value,grade:grade},
				    url: "/jwr/enControl/getOrgListByEnClassAction.action",
				    success:function(returnValue){
				    	indexdatass=eval("("+returnValue+")");
				    }
				});
			   
			orgSelect=$("#txtGrid").ligerComboBox({
		
			    columns: [
				            { header : '名称', name: 'orgname',  align: 'center' },
				            { header : '证件号', name: 'pid',  align: 'center'} ,
				            { header : '等级', name: 'grade',  align: 'center'} ,
				            { header : '业务类别', name: 'filetext',  align: 'center'} 
				         ],
	            parms:{bustype:para.value,grade:grade},
	            selectBoxWidth: 500, selectBoxHeight:300,
	            labelWidth:500,
	            textField:'orgname',
	            valueField :'pid',
	            url: "/jwr/enControl/getOrgListByEnClassAction.action",
				isMultiSelect: true,
				onBeforeSelect:function(value, text){
					var txtlen=$("#txtGrid").val().split(';');
					if(txtlen.length==2)
					{
						alert("最多选择两个考评机构！");
						return false;
					}
				} 

		});
			if(indexdatass.length==0){
				orgSelect.clearContent();
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
			<form id="fm1" method="POST" action="/jwr/enControl/enApplyInsertAction.action">
				<input type="hidden" name="enInfo.pid" id="enInfo.pid" value="${pid}">
				<input type="hidden" name="enInfo.orgId1" id="enInfo.orgId1" >
				<input type="hidden" name="enInfo.city" id="enInfo.city" value="${enInfo.city}">
				<input type="hidden" name="enInfo.apporg" id="enInfo.apporg" value="${enInfo.orgId}"> 
				<table style="margin-left: 30px">
					<caption style="padding: 5px">
						<h1>
							<font color="blue">企业达标等级证书</font> 申请表
						</h1>
					</caption>
					<tbody>
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
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>企业名称：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="enInfo.enname" name="enInfo.enname"  type="text" value="${enInfo.enname}" readOnly></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="15位或18位身份证">机构代码：</label></td>
							<td style="border-bottom:1px dotted gray">
							<input
								class="easyui-validatebox validatebox-text" id="enInfo.pid" name="enInfo.pid"
							    type="text" value="${enInfo.pid}" />
							</td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>法人代表：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" name="enInfo.legalp" id="enInfo.legalp"
								type="text" value="${enInfo.legalp}" readOnly></td>
							<td><font color="red">*</font></td>

						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>联系人姓名：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="enInfo.contact"
								name="enInfo.contact"  type="text" value="${enInfo.contact}" readOnly></td>
							<td><font color="red">*</font></td>

						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>联系人电话：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="enInfo.mobile"
								name="enInfo.mobile"  type="text" value="${enInfo.mobile}" ></td>
							<td><font color="red">*</font></td>

						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>联系人邮箱：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="enInfo.email"
								name="enInfo.email"  type="text" value="${enInfo.email}" ></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<TD style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px"><LABEL title="报名申请时，填一个拟申请等级即可；&#10;报名申请通过后，可试情况申请多个等级的证书">申请等级：</LABEL></TD>
							<TD style="BORDER-BOTTOM: gray 1px dotted">
								<SELECT id="enInfo.grade"  name="enInfo.grade" required="true" value="${enInfo.grade}">
									<OPTION selected value=2>二级</OPTION>
									<OPTION value=3>三级</OPTION>
								</SELECT>
							</TD>
							<TD><FONT color=red>*</FONT></TD>
						</tr>
						<tr>
							<TD style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px"><LABEL >生产经营类型：</LABEL></TD>
							<TD style="BORDER-BOTTOM: gray 1px dotted">
								<SELECT id="enInfo.busType" title="" name="enInfo.busType" required="true" onchange="redirec(this.options.selectedIndex)" >
									<OPTION selected value="">--请选择--</OPTION>
									<OPTION value="1">道路运输</OPTION>
									<OPTION value="2">水路运输</OPTION>
									<OPTION value="3">港口运营</OPTION>
									<OPTION value="4">城市客运</OPTION>
									<OPTION value="5">交通运输工程建设</OPTION>
									<OPTION value="6">其他</OPTION>
								</SELECT>
							</TD>
							<TD><FONT color=red>*</FONT></TD>
						</tr>
						<tr>
						<TD style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px"><LABEL title=报名申请时，选填一个即可。>生产经营类别：</LABEL></TD>
						<TD style="BORDER-BOTTOM: gray 1px dotted">
							<SELECT id="enInfo.type2" title="报名申请时，选填一个即可。" name="enInfo.type2" required="true" onchange="showMot(this.options[this.selectedIndex].value)">
								<OPTION selected value="">--请选择--</OPTION>
							</SELECT>
						</TD>
						<TD><FONT color=red>*</FONT></TD>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="请自选主管机关">主管机关：</label></td>
							<td style="border-bottom:1px dotted gray">
								<input type="hidden" id="enInfo.adminmot" name="enInfo.adminmot" value="${enInfo.adminmot}">
								<input class="easyui-validatebox validatebox-text" id="motName" 
								name="motName" readonly style="width:300px" type="text"
								value="">
								<font color="red">提示：主管机关是根据区域和专业自动分配</font>
							</td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<TD style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px">
								<LABEL title="请最多选择两个考评机构">选择考评机构：</LABEL>
							</td>
							<TD style="BORDER-BOTTOM: gray 1px dotted">
							<INPUT style="WIDTH: 100%; border:1px solid gray;" id="txtGrid"  title="请最多选择两个考评机构"  onclick="getOrgByen();"    >
							</TD>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>备注：</label></td>
							<td style="border-bottom:1px dotted gray">
								<input class="easyui-validatebox validatebox-text" id="enInfo.remarks" style="width: 100%;" name="enInfo.remarks"  type="text" value="${enInfo.remarks}" >
							</td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
						<TD style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px"><LABEL title=请填写清楚通讯地址>通讯地址：</LABEL></TD>
						<TD style="BORDER-BOTTOM: gray 1px dotted"><INPUT style="WIDTH: 300px" id=address class="easyui-validatebox validatebox-text" title="请填写清楚通讯地址" value="${enInfo.address}" name="enInfo.address" required="true" ></TD>
						<TD><FONT color=red>*</FONT></TD>
						</tr>
						<tr>
						<TD style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px"><LABEL>联系电话：</LABEL></TD>
						<TD style="BORDER-BOTTOM: gray 1px dotted"><INPUT id=tel class="easyui-validatebox validatebox-text" value="${enInfo.tel}" name="enInfo.tel" required="true" ></TD>
						<TD><FONT color=red>*</FONT></TD>
						</tr>
						<tr>
						<TD style="BORDER-BOTTOM: gray 1px dotted; FONT-FAMILY: 微软雅黑; HEIGHT: 35px; FONT-SIZE: 14px"><LABEL>传真：</LABEL></TD>
						<TD style="BORDER-BOTTOM: gray 1px dotted"><INPUT id=tax class="easyui-validatebox validatebox-text" value="${enInfo.tax}" name="enInfo.tax" required="true" ></TD>
						<TD><FONT color=red>*</FONT></TD>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="安全生产组织架构（pdf, doc或者jpg格式）">安全生产组织架构：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="safe*" name="enInfo.safe"
								title="安全生产组织架构（pdf, doc或者jpg格式）" type="hidden" value=""><span></span><a
								class="easyui-linkbutton l-btn" 
								onclick="itemclick(this.id)" id="safe"><span
									class="l-btn-left"><span class="l-btn-text">上传文件..</span></span></a></td>
							 <td style="border-bottom:1px dotted gray">
									<span id="safe_" style="display:none;color:blue;">
										              上传成功
									</span>
							    </td>			
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="企业法人资格证件（pdf, doc或者jpg格式）">企业法人资格证件：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="qual*"
								name="enInfo.qual" 
								title="企业法人资格证件（pdf, doc或者jpg格式）" type="hidden" value=""><span></span><a
								class="easyui-linkbutton l-btn"  
								onclick="itemclick(this.id)" id="qual"><span class="l-btn-left"><span
										class="l-btn-text">上传文件..</span></span></a></td>
								 <td style="border-bottom:1px dotted gray">
									<span id="qual_" style="display:none;color:blue;">
										              上传成功
									</span>
							    </td>		
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="经营许可证（pdf, doc或者jpg格式）">经营许可证：</label></td>
							<td style="border-bottom:1px dotted gray">
							<input class="easyui-validatebox validatebox-text" id="license*" name="enInfo.license"  title="经营许可证（pdf, doc或者jpg格式）"
								type="hidden" value=""><span></span>
								<a class="easyui-linkbutton l-btn"  onclick="itemclick(this.id)" id="license"><span
									class="l-btn-left"><span class="l-btn-text">上传文件..</span></span></a></td>
							<td style="border-bottom:1px dotted gray">
									<span id="license_" style="display:none;color:blue;">
										              上传成功
									</span>
							    </td>		
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
								title="标准化达标自评报告（pdf, doc或者jpg格式）">标准化达标自评报告：</label></td>
							<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="report*" name="enInfo.report"
								name="proof3" title="标准化达标自评报告（pdf, doc或者jpg格式）"
								type="hidden" value=""><span></span>
								<a class="easyui-linkbutton l-btn"   onclick="itemclick(this.id)" id="report"><span class="l-btn-left"><span
										class="l-btn-text">上传文件..</span></span></a></td>
								<td style="border-bottom:1px dotted gray">
									<span id="report_" style="display:none;color:blue;">
										              上传成功
									</span>
							    </td>		
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td
								style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>换证原因<b>（仅换证申请）</b>：
							</label></td>
							<td style="border-bottom:1px dotted gray"><select id="enInfo.reNew"
								name="enInfo.reNew"><option value="0">-- 无 --</option>
									<option value="1">1、评审员：资格证书到期</option>
									<option value="2">2、评审员：户籍所在地或常住地发生省际间变更</option>
									<option value="3">3、企业：达标等级证书到期</option>
									<option value="4">4、考评机构：资质证书到期</option></select></td>
							<td><font color="lightgray">*</font></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td align="center" colspan="3" style="padding: 15px"><p>
									注：带红色<font color="red">*</font>的为必填项。
								</p><a
								class="easyui-linkbutton l-btn"  iconcls="icon-ok"
								onclick="enApplyInput()" id="undefined"><span
									class="l-btn-left"><span class="l-btn-text icon-ok"
										style="padding-left: 20px;">提交申请</span></span></a></td>
						</tr>
					</tfoot>
				</table>
			</form>
		</div>
	</div>
	
</body>
<script type="text/javascript">
var indexdata = "";
$(function(){
	$.ajax({
			    type:"POST",
			    async:false,
			    url:"/jwr/respInfo/getMotAction.action",
			    success:function(returnValue){
			   		indexdata=returnValue;
			   		var obj1=(eval("("+indexdata+")")).Rows;
			   		var str="";
			   		for(var i=0;i<obj1.length;i++){
		   				if('${enInfo.adminmot}'==obj1[i].motcode){
		   					str = obj1[i].motname;
		   				}
			   		}
   					document.getElementById("motName").value = str;
			    }
			});
});

function showMot(type){
	var city= document.getElementById('enInfo.city').value;
	$.ajax({
	    type:"POST",
	    async:false,
	    data:{type:type,city:city},
	    url:"/jwr/taskAssignation/getMotByTypeAction.action",
	    success:function(returnValue){
		    var str = returnValue;
		    if(str == ""){
				alert("没有管理此专业的主管机关");
				$("#motName").val("");
			}else{
			    document.getElementById("enInfo.adminmot").value=str.split(',')[0];
		   		$("#motName").val(str.split(',')[1]);
			}
	    }
   });
}
</script>
</html>

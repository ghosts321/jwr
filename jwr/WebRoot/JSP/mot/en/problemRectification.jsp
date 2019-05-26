<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'pnApply.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<script src="<%=basePath%>js/jquery.easyui.min.js" type="text/javascript"></script>
<script type="text/javascript">
var resultData;
function query(){
	var para = $('#in').combobox('getText');
	if(para==''){
	alert("请输入证书号");
		return;
	}
	$.ajax({
	    type:"POST",
	    async:false,
	    data:{certNumber:para},
	    url:"/jwr/problemRecAction/getEnInfoAction.action",
	    success:function(returnValue){
	    	if(returnValue==""||returnValue==null||returnValue.substr(0,1)!='{'||returnValue=='{}'){
	    		alert("不存在拥有此证书的企业，请重新查询！");
	    		return;
	    	}else{
	    		resultData=returnValue;
	    
	    		resultData=eval("("+resultData+")");
	    		if(resultData.Rows[0].grade=='2'){
					resultData.Rows[0].grade="二级";
				}else if(resultData.Rows[0].grade=='3'){
					resultData.Rows[0].grade="三级";
				}
				if(resultData.Rows[0].reNew=='1'){
					resultData.Rows[0].reNew='评审员：资格证书到期';
		    	}else if(resultData.Rows[0].reNew=='2'){
		    		resultData.Rows[0].reNew='评审员：户籍所在地或常住地发生省际间变更';
		    	}else if(resultData.Rows[0].reNew=='3'){
		    		resultData.Rows[0].reNew='企业：达标等级证书到期';
		    	}else if(resultData.Rows[0].reNew=='4'){
		    		resultData.Rows[0].reNew='考评机构：资质证书到期';
		    	}else if (resultData.Rows[0].reNew=='0'){
		    		resultData.Rows[0].reNew='无';
		    	}
				
				var sorg =resultData.Rows[0].orgId1;
				  var sorgData;
				  $.ajax({
					    type:"POST",
					    async:false,
					    url: "/jwr/enControl/getOrgNameAction.action?orgid1="+sorg,
					    success:function(returnValue){
					    	sorgData=eval("("+returnValue+")");
					    }
					});
					var apporg =resultData.Rows[0].apporg;
					  var appData;
					  $.ajax({
						    type:"POST",
						    async:false,
						    url: "/jwr/enControl/getAppOrgNameAction.action?orgid1="+apporg,
						    success:function(returnValue){
						    	appData=returnValue;
						    }
						});
					//  resultData.Rows[0].orgId=appData;
					  //resultData.Rows[0].orgId1=sorgData[0].name;
		    	$("#license").html(resultData.Rows[0].license);
		    	$("#tax").html(resultData.Rows[0].tax);
		    	$("#pid").html(resultData.Rows[0].pid);
		    	$("#enName").html(resultData.Rows[0].enName);
		    	$("#safe").html(resultData.Rows[0].safe);
		    	$("#reNew").html(resultData.Rows[0].reNew);
		    	$("#zpReport").html(resultData.Rows[0].zpReport);
		    	$("#province").html(resultData.Rows[0].province=getcomefromVal(resultData.Rows[0].province));
		    	$("#city").html(resultData.Rows[0].city=getcomefromValue(resultData.Rows[0].city));
		    	$("#legalp").html(resultData.Rows[0].legalp);
		    	$("#grade").html(resultData.Rows[0].grade);
		    	$("#email").html(resultData.Rows[0].email);
		    	$("#userId").html(resultData.Rows[0].userId);
		    	$("#mobile").html(resultData.Rows[0].mobile);
		    	$("#busType").html(resultData.Rows[0].busType=getBusTypeVal(resultData.Rows[0].busType));
		    	$("#type2").html(resultData.Rows[0].type2=getCelltype(resultData.Rows[0].type2));
		    	$("#contact").html(resultData.Rows[0].contact);
		    	$("#address").html(resultData.Rows[0].address);
		    	$("#qual").html(resultData.Rows[0].qual);
		    	$("#adminMot").html(resultData.Rows[0].adminMot=getMotVal(resultData.Rows[0].adminMot));
		    	$("#license").html(resultData.Rows[0].license);
		    	$("#tel").html(resultData.Rows[0].tel);
		    	$("#cid").val(resultData.Rows[0].cid);
		    	$("#form2").show();
		    	$("#bottun1").show();
	    	}
	    }
	});
};
function save(){
	var value = $("#ad").val();
	if(value.length>800){
		alert("整改意见字数不能超过800个，已输入"+value.length+"个字!");
  		return false;
	}
	if(value==''){
		alert("请填写问题整改意见！");
	}else{
		var cid=$("#cid").val();
		$.ajax({
			type:"POST",
		    async:false,
		    data:{cid:cid,userId:resultData.Rows[0].userId,value:value},
		    url:"/jwr/problemRecAction/saveProblemRecAction.action",
		    success:function(returnValue){
		    	if(eval(returnValue)=='0'){
		    		alert("提示信息：整改通知下发成功!");
		    		$("#form2").hide();
		    		$("#bottun1").hide();
		    		//将combobox 值清空
		    		 $("#ad").val("");
		    		$('#in').combobox('setValue','');
		    	}else{
		    		alert("提示信息：整改通知下发失败!");
		    	}
		    }
		});
	}
};

$(function(){
	$("#form2").hide();
	$("#bottun1").hide();
}); 


function chakan(){
  		var freport=resultData.Rows[0].qual;
    		if(freport!=null && freport!=""){
	 			var ftype = freport.split('.');
	 			var filetype=ftype[1];
 			 if(filetype =='bmp'||filetype =='BMP'||filetype =='jpg'||filetype =='JPG'||filetype =='jpeg'||filetype =='JPEG'||filetype =='png'||filetype =='PNG'||filetype =='gif'||filetype =='GIF'){
	  				seeImg('img0',freport);
	  			}else{
	  				window.location.href='<%= basePath%>updown/downloadFileAction?file='+freport;
	  			} 
  		}else{
  			alert("没有上传相关文件");
  		}
  	} 
  	function chakan1(){
  		var freport=resultData.Rows[0].license;
    		if(freport!=null && freport!=""){
	 			var ftype = freport.split('.');
	 			var filetype=ftype[1];
 			 if(filetype =='bmp'||filetype =='BMP'||filetype =='jpg'||filetype =='JPG'||filetype =='jpeg'||filetype =='JPEG'||filetype =='png'||filetype =='PNG'||filetype =='gif'||filetype =='GIF'){
	  				seeImg('img0',freport);
	  			}else{
	  				window.location.href='<%= basePath%>updown/downloadFileAction?file='+freport;
	  			} 
  		}else{
  			alert("没有上传相关文件");
  		}
  	}
  	function chakan2(){
  		var freport=resultData.Rows[0].safe;
    		if(freport!=null && freport!=""){
	 			var ftype = freport.split('.');
	 			var filetype=ftype[1];
 			 if(filetype =='bmp'||filetype =='BMP'||filetype =='jpg'||filetype =='JPG'||filetype =='jpeg'||filetype =='JPEG'||filetype =='png'||filetype =='PNG'||filetype =='gif'||filetype =='GIF'){
	  				seeImg('img0',freport);
	  			}else{
	  				window.location.href='<%= basePath%>updown/downloadFileAction?file='+freport;
	  			} 
  		}else{
  			alert("没有上传相关文件");
  		}
  	}
  	function chakan3(){
  		var freport=resultData.Rows[0].zpReport;
    		if(freport!=null && freport!=""){
	 			var ftype = freport.split('.');
	 			var filetype=ftype[1];
 			 if(filetype =='bmp'||filetype =='BMP'||filetype =='jpg'||filetype =='JPG'||filetype =='jpeg'||filetype =='JPEG'||filetype =='png'||filetype =='PNG'||filetype =='gif'||filetype =='GIF'){
	  				seeImg('img0',freport);
	  			}else{
	  				window.location.href='<%= basePath%>updown/downloadFileAction?file='+freport;
	  			} 
  		}else{
  			alert("没有上传相关文件");
  		}
  	}   
</script>
</head>

<body style="padding:10px;">
<H1>选择交通运输企业下发整改通知</H1>
<FORM id=fm1 method=get action=/c/esp/refine-doc/en target=_blank>
<DIV class=eui-info>
<DIV class="eui-tip icon-tip"></DIV>
<DIV>以下输入框提供自动完成功能，请输入交通运输企业名称或证书号关键字，并选定列表中的一个交通运输企业。</DIV></DIV>
<LABEL>证书号：</LABEL>
 <input style="WIDTH: 500px; DISPLAY: none" id="in" name="in" value="" class="easyui-combobox">  
 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<A id=undefined class="easyui-linkbutton l-btn" onclick="query();"> <SPAN class=l-btn-text>查 询</SPAN> </A> 
<A id="bottun1" class="easyui-linkbutton l-btn" onclick="save();">   整改意见下发 </A>
</FORM>
<br>
<form method="post" action="" id="form2" >
	<table id="tb" border="1"  cellspacing="0" cellpadding="4" align="center" width="100%">
		<tr><TD><input type="hidden" id="cid"></TD></tr>
		<TR>
			<TD width="15%" height="17" align="left">
				主管机关：
			</TD>
			<TD id="adminMot" width="35%" height="17" >
			</TD>
		</TR>
		<TR>
			<TD width="15%" align="left" height="17">
				传真：
			</TD>
			<TD id="tax" width="35%" height="17">
			</TD>
		</TR>
		<TR>
			<TD width="15%" height="17" align="left">
				证件号：
			</TD>
			<TD id="pid" width="35%" height="17" >
			</TD>
		</TR>
		<TR>
			<TD width="15%" align="left" height="17">
				名称：
			</TD>
			<TD id="enName" width="35%" height="17">
			</TD>
		</TR>
		<TR>
			<TD width="15%" align="left" height="17">
				联系电话：
			</TD>
			<TD id="tel" width="35%" height="17">
			</TD>
		</TR>
		<TR>
			<TD width="15%" align="left" height="17">
				换证原因：
			</TD>
			<TD  id="reNew" width="35%" height="17">
			</TD>
		</TR><TR>
			<TD width="15%" height="17" align="left">
				手机：
			</TD>
			<TD id="mobile" width="35%" height="17" >
			</TD>
		</TR>
		<TR>
			<TD width="15%" align="left" height="17">
				所在省市：
			</TD>
			<TD id="province" width="35%" height="17">
			</TD>
		</TR>
		<TR>
			<TD width="15%" align="left" height="17">
				所在市：
			</TD>
			<TD id="city" width="35%" height="17">
			</TD>
		</TR>
		<TR>
			<TD width="15%" height="17" align="left">
				法人代表：
			</TD>
			<TD id="legalp" width="35%" height="17" >
			</TD>
		</TR>
		<TR>
			<TD width="15%" align="left" height="17">
				等级：
			</TD>
			<TD id="grade" width="35%" height="17">
			</TD>
		</TR><TR>
			<TD width="15%" height="17" align="left">
				联系人邮箱：
			</TD>
			<TD id="email" width="35%" height="17" >
			</TD>
		</TR>
		<TR>
			<TD width="15%" align="left" height="17">
				用户ID：
			</TD>
			<TD id="userId" width="35%" height="17">
			</TD>
		</TR>
		<TR>
			<TD width="15%" height="17" align="left">
				业务类型：
			</TD>
			<TD id="busType" width="35%" height="17" >
			</TD>
		</TR>
		<TR>
			<TD width="15%" align="left" height="17">
				业务类别：
			</TD>
			<TD id="type2" width="35%" height="17">
			</TD>
		</TR>
		<TR>
			<TD width="15%" height="17" align="left">
				联系人姓名：
			</TD>
			<TD id="contact" width="35%" height="17" >
			</TD>
		</TR>
		<TR>
			<TD width="15%" align="left" height="17">
				通讯地址：
			</TD>
			<TD id="address" width="35%" height="17">
			</TD>
		</TR>
		<TR>
			<TD width="15%" align="left" height="17">
				企业法人资格证件：
			</TD>
			<td colspan="2"><a href="javascript:void(0)" onclick="chakan()">查看</a></td>
		</TR>
		<TR>
			<TD width="15%" height="17" align="left">
				经营许可证：
			</TD>
			<td colspan="2"><a href="javascript:void(0)" onclick="chakan1()">查看</a></td>
		</TR>
		<tr>
			<TD width="15%" height="17" align="left">
				安全生产组织框架：
			</TD>
			<td colspan="2"><a href="javascript:void(0)" onclick="chakan2()">查看</a></td>
		</tr>
		<tr>
			<TD width="15%" height="17" align="left">
				标准化达标自评报告：
			</TD>
			<td colspan="2"><a href="javascript:void(0)" onclick="chakan3()">查看</a></td>
		</tr>
	</table>
	<table id="tb1" border="1" class="Table_N" cellspacing="0" cellpadding="4" align="center" width="100%">
		<tr>
			<TD width="15%" align="left">
				整改意见：
			</TD>
			<TD width="85%" height="17">
				<textarea  id ="ad" rows="5" cols="2" name="advice" style="height:100px;width:950px"></textarea>
			</TD>
		</tr>
	</table>
</form>
	<script type="text/javascript"> 
	     $('#in').combobox({
	        hasDownArrow: false,
	        valueField: 'id',
	        textField: 'text',
	        onChange: function(v1, v0) {
	            if ($.trim(v1) != '') {
	                $('#in').combobox('reload', encodeURI('/jwr/problemRecAction/getCertInfoAction.action?certNumber='+v1));
	            }
	        },
	        onSelect: function(r) {
	            $('#in').combobox('select', r.text); //显示选中项的文本
	        }
		}); 
	</script>
</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'pnApply.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<script type="text/javascript" src="/jwr/framework/jquery/jquery.easyui.min.js"></script>
<script type="text/javascript">
var resultData;
function query(){
	var para = $('#in').combobox('getText');
	if(para==''){
		return;
	}
	var bol=true;
	$.ajax({
	    type:"POST",
	    async:false,
	    data:{certNumber:para},
	    url:"/jwr/bookCancel/getOrgInfoAction.action",
	    success:function(returnValue){
	    	resultData=returnValue;
	    	if(resultData=='' ||resultData == null ||resultData.substr(0,1)!='{'){
	    		alert("证书号不存在，未查询到数据");	
	    		bol=false;
	    		//window.parent.ligerwindow.close();
	    	}else{
	    		resultData=eval("("+resultData+")");
	    		$("#userId").html(resultData.Rows[0].userId);
		    	$("#met").html(resultData.Rows[0].met);
		    	$("#pcode").html(resultData.Rows[0].pcode);
		    	$("#pid").html(resultData.Rows[0].pid);
		    	$("#orgName").html(resultData.Rows[0].orgname);
		    	if(resultData.Rows[0].renew=='1'){
		    		resultData.Rows[0].renew='评审员：资格证书到期';
		    	}else if(resultData.Rows[0].renew=='2'){
		    		resultData.Rows[0].renew='评审员：户籍所在地或常住地发生省际间变更';
		    	}else if(resultData.Rows[0].renew=='3'){
		    		resultData.Rows[0].renew='企业：达标等级证书到期';
		    	}else if(resultData.Rows[0].renew=='4'){
		    		resultData.Rows[0].renew='考评机构：资质证书到期';
		    	}else if(resultData.Rows[0].renew=='0'){
		    		resultData.Rows[0].renew='无';
		    	}
		    	$("#renew").html(resultData.Rows[0].renew);
		    	$("#startDate").html(resultData.Rows[0].startdate);
		    	$("#pnumber2").html(resultData.Rows[0].pnumber2);
		    	$("#province").html(resultData.Rows[0].province=getcomefromVal(resultData.Rows[0].province));
		    	$("#city").html(resultData.Rows[0].city=getcomefromValue(resultData.Rows[0].city));
		    	$("#cid1").html(resultData.Rows[0].cid);
		    	$("#legalp").html(resultData.Rows[0].legalp);
		    	$("#email").html(resultData.Rows[0].email);
		    	$("#busType").html(resultData.Rows[0].filetext);
		    	$("#bustype1").html(resultData.Rows[0].busType);
		    	if(resultData.Rows[0].grade=='2'){
		    		$("#grade").html("二级");
		    	}else if(resultData.Rows[0].grade=='3'){
		    		$("#grade").html("三级");
		    	}
		    	$("#fax").html(resultData.Rows[0].fax);
		    	$("#pnumber").html(resultData.Rows[0].pnumber);
		    	$("#contact").html(resultData.Rows[0].contact);
		    	$("#address").html(resultData.Rows[0].address);
		    	$("#adminMot").html(resultData.Rows[0].motname);
		    	$("#mobile").html(resultData.Rows[0].mobile);
		    	$("#tel").html(resultData.Rows[0].tel);
		    	$("#pns").html(resultData.Rows[0].pns);
		    	$("#form2").show();
		    	$("#bottun1").show();
	    	}
	    }
	});
	
};
function chakan(){
  		var freport=resultData.Rows[0].met;
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
  		var freport=resultData.Rows[0].pns;
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
function save(){
	var value = $("#ad").val();
	if(value.length>800){
		alert("整改意见字数不能超过800个，已输入"+value.length+"个字!");
  		return false;
	}
	if(value==''){
		alert("请填写问题整改意见！");
	}else{
		var pid=$("#pid").html();
		//alert(pid);
		var userid=$("#userId").html();
		$.ajax({
			type:"POST",
		    async:false,
		    data:{'pid':pid,'value':value,'userid':userid},
		    url:"/jwr/problemModify/saveProblemAction.action",
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
</script>
</head>

<body style="padding:10px;">
<input type="hidden" id="bustype2"/>
<H1>选择考评机构下发整改通知</H1>
<FORM id=fm1 method=get action=/c/esp/refine-doc/en target=_blank>
<DIV class=eui-info>
<DIV class="eui-tip icon-tip"></DIV>
<DIV>以下输入框提供自动完成功能，请输入考评机构名称或证书号关键字，并选定列表中的一个考评机构。</DIV></DIV>
<LABEL>证书号：</LABEL>
 <input style="WIDTH: 500px; DISPLAY: none" id="in" name="in" value="" class="easyui-combobox">  
 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<A id=undefined class="easyui-linkbutton l-btn" onclick="query();"> <SPAN class=l-btn-text>查 询</SPAN> </A> 
<A id="bottun1" class="easyui-linkbutton l-btn" onclick="save();">   整改意见下发 </A>
</FORM>
<br>
<form method="post" action="" id="form2" >
	<table id="tb" border="1"  cellspacing="5" cellpadding="0" align="center" width="100%">
		<tr><TD><input type="hidden" id="cid"></TD></tr>
		<TR>
			<TD width="15%" align="left" height="17">
				用户ID：
			</TD>
			<TD id="userId" width="35%" height="17">
			</TD>
		</TR>
		<TR>
			<TD width="15%" align="left" height="17">
				邮编：
			</TD>
			<TD id="pcode" width="35%" height="17">
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
			<TD id="orgName" width="35%" height="17">
			</TD>
		</TR>
	<TR>
			<TD width="15%" height="17" align="left">
				换证原因（仅换证申请）：
			</TD>
			<TD id="renew" width="35%" height="17" >
			</TD>
	</TR>
		<TR>
			<TD width="15%" align="left" height="17">
				开始从事相应业务年份：
			</TD>
			<TD  id="startDate" width="35%" height="17">
			</TD>
		</TR><TR>
			<TD width="15%" height="17" align="left">
				高级技术职称评审员人数：
			</TD>
			<TD id="pnumber2" width="35%" height="17" >
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
				证书号：
			</TD>
			<TD id="cid1" width="35%" height="17" >
			</TD>
		</TR>
		<TR>
			<TD width="15%" align="left" height="17">
				法人代表：
			</TD>
			<TD id="legalp" width="35%" height="17">
			</TD>
		</TR><TR>
			<TD width="15%" height="17" align="left">
				联系人邮箱：
			</TD>
			<TD id="email" width="35%" height="17" >
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
				等级：
			</TD>
			<TD id="grade" width="35%" height="17">
			</TD>
		</TR>
		<TR>
			<TD width="15%" height="17" align="left">
				传真号码：
			</TD>
			<TD id="fax" width="35%" height="17" >
			</TD>
		</TR>
		<TR>
			
			<TD width="15%" align="left" height="17">
				专职评审员人数：
			</TD>
			<TD id="pnumber" width="35%" height="17">
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
			<TD width="15%" height="17" align="left">
				主管机关：
			</TD>
			<TD id="adminMot" width="35%" height="17" >
			</TD>
		</TR>
		<TR>
			
			<TD width="15%" align="left" height="17">
				手机：
			</TD>
			<TD id="mobile" width="35%" height="17">
			</TD>
		</TR>
		<TR>
			<TD width="15%" height="17" align="left">
				联系电话：
			</TD>
			<TD id="tel" width="35%" height="17" >
			</TD>
		</TR>
			
		<TR>
			<TD width="15%" height="17" align="left">
				单位基本情况相关材料：
			</TD>
			<TD >
			<a href="javascript:void(0)" onclick="chakan()">查看</a>
			</TD>
		</TR>
		
		<TR>
			<TD width="15%" align="left" height="17">
				专职评审员聘用证明与职称证明：
			</TD>
			<td colspan="2"><a href="javascript:void(0)" onclick="chakan1()">查看</a></td>
		</TR>
		
	</table>
	<table id="tb1" border="1" class="Table_N" cellspacing="5" cellpadding="0" align="center" width="100%">
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
	                $('#in').combobox('reload', encodeURI('/jwr/problemRecAction/getCertInfo1Action.action?certNumber='+v1));
	            }
	        },
	        onSelect: function(r) {
	            $('#in').combobox('select', r.text); //显示选中项的文本
	        }
		});  
	</script>
</body>
</html>

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
var type ;
function query(){
	var para = $('#in').combobox('getText');
	if(para==''){
		return;
	}
	$.ajax({
	    type:"POST",
	    async:false,
	    data:{certnumber:para},
	    //url:"/jwr/enControl/getEnDetailAction.action",
	    url:"/jwr/enControl/getEnDetailAction.action",
	    success:function(returnValue){
	    	if(returnValue==""||returnValue==null||returnValue.substr(0,1)!='{'){
	    		alert("不存在拥有此证书的企业，请重新查询！");
	    		return;
	    	}else{
		    	resultData=returnValue;
		    	resultData=eval("("+resultData+")");
		    	if(resultData.Rows[0]==null){
		    		alert("不存在拥有此证书的企业，请重新查询！");
		    		return;
		    	}
		    	type=resultData.Rows[0].type2;
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
					  resultData.Rows[0].orgId=appData;
					  resultData.Rows[0].orgId1=sorgData[0].name;
		    	$("#userId").html(resultData.Rows[0].userId);
				$("#admin").html(resultData.Rows[0].adminmot=getMotVal(resultData.Rows[0].adminmot));
				$("#province").html(resultData.Rows[0].province=getcomefromVal(resultData.Rows[0].province));
				$("#city").html(resultData.Rows[0].city=getcomefromValue(resultData.Rows[0].city));
				$("#name").html(resultData.Rows[0].enname);
				$("#pid").html(resultData.Rows[0].pid);
				$("#legalp").html(resultData.Rows[0].legalp);
				$("#contact").html(resultData.Rows[0].contact);
				$("#mobile").html(resultData.Rows[0].mobile);
				$("#email").html(resultData.Rows[0].email);
				$("#grade").html(resultData.Rows[0].grade);
				$("#busType").html(resultData.Rows[0].bustype=getBusTypeVal(resultData.Rows[0].bustype));
				$("#type2").html(resultData.Rows[0].type2=getCelltype(resultData.Rows[0].type2));
				$("#address").html(resultData.Rows[0].address);
				$("#tel").html(resultData.Rows[0].tel);
				$("#tax").html(resultData.Rows[0].tax);
				$("#safe").html(resultData.Rows[0].safe);
				$("#qual").html(resultData.Rows[0].qual);
				$("#license").html(resultData.Rows[0].license);
				$("#zpReport").html(resultData.Rows[0].zpreport);
				$("#reNew").html(resultData.Rows[0].reNew);
				$("#orgId").html(resultData.Rows[0].orgId);
				$("#createDate").html(resultData.Rows[0].cDate);
				$("#fzDate").html(resultData.Rows[0].fzDate);
				$("#orgId1").html(resultData.Rows[0].orgId1);
				$("#certid").html(resultData.Rows[0].cid);
				$("#auditDate").html(resultData.Rows[0].auditDate);
				$("#advice").html(resultData.Rows[0].advice);
				$("#results").html(resultData.Rows[0].results);
				$("#respDate").html(resultData.Rows[0].respDate);
				$("#form2").show();
				$("#bottun1").show();
	    	}
	    }
	});
	
};
function save(){
	var value = $("#ad").val();
	if(value.length>800){
		alert("撤销意见字数不能超过800个，已输入"+value.length+"个字!");
  		return false;
	}
	if(value==''){
		alert("请填写证书撤销意见！");
	}else{
		var cid=$("#certid").html();
		 
		$.ajax({
			type:"POST",
		    async:false,
		    data:{cid:cid,value:value,bustype:type,enUserId:resultData.Rows[0].id},
		    url:"/jwr/bookCancel/saveEnAdviceAction.action",
		    success:function(returnValue){
		    	if(eval(returnValue)=='0'){
		    		alert("提示信息：证书撤销成功!");
		    		$("#form2").hide();
		    		$("#bottun1").hide();
		    		//将combobox 值清空
		    		$('#in').combobox('setValue','');
		    	}else{
		    		alert("提示信息：证书撤销失败!");
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
  	function chakan1(){
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
  	function chakan2(){
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
<H1>企业达标等级证书撤销</H1>
<FORM id=fm1 method=get action=/c/esp/refine-doc/en target=_blank>
<DIV class=eui-info>
<DIV class="eui-tip icon-tip"></DIV>
<DIV>以下输入框提供自动完成功能，请输入交通运输企业名称或证书号关键字，并选定列表中的一个交通运输企业。</DIV></DIV>
<LABEL>证书号：</LABEL>
 <input style="WIDTH: 500px; DISPLAY: none" id="in" name="in" value="" class="easyui-combobox">  
 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<A id=undefined class="easyui-linkbutton l-btn" onclick="query();"> <SPAN class=l-btn-text>查 询</SPAN> </A> 
<A id="bottun1" class="easyui-linkbutton l-btn" onclick="save();"> 撤销 </A>
</FORM>
<br>
<form method="post" action="" id="form2" >
	<table id="tb" border="1"  cellspacing="0" cellpadding="4" align="center" width="100%">
			<tr>
				<th nowrap="true" style="text-align: left">用户ID：</th>
				<td id="userId"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">主管机关：</th>
				<td id="admin"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left"> 所在省市：</th>
				<td id="province"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left"> 所在市：</th>
				<td id="city"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">名称：</th>
				<td id="name"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">证件号：</th>
				<td id="pid"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">法人代表：</th>
				<td id="legalp"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">联系人：</th>
				<td id="contact"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">手机：</th>
				<td id="mobile"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">邮箱：</th>
				<td id="email"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">等级：</th>
				<td id="grade"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">业务类型：</th>
				<td id="busType"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">业务类别：</th>
				<td id="type2"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">通信地址：</th>
				<td id="address"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">联系电话：</th>
				<td id="tel"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">传真：</th>
				<td id="tax"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">换证原因：</th>
				<td id="reNew"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">所选考评机构：</th>
				<td id="orgId"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">日期：</th>
				<td id="createDate"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">发证时间：</th>
				<td id="fzDate"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">证书号：</th>
				<td id="certid"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">指定考评机构：</th>
				<td id="orgId1"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">受理日期：</th>
				<td id="respDate"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">处理意见：</th>
				<td id=""></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">审核日期：</th>
				<td id="auditDate"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">组织架构：</th>
				<td ><a href="javascript:void(0)" onclick="chakan()">查看</a></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">资格证件：</th>
				<td ><a href="javascript:void(0)" onclick="chakan1()">查看</a></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">经营许可证：</th>
				<td ><a href="javascript:void(0)" onclick="chakan2()">查看</a></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">达标报告：</th>
				<td ><a href="javascript:void(0)" onclick="chakan3()">查看</a></td>
			</tr>
		
	</table>
	<table id="tb1" border="1" class="Table_N" cellspacing="0" cellpadding="4" align="center" width="100%">
		<tr>
			<TD width="15%" align="left">
				撤销意见：
			</TD>
			<TD width="85%" height="17">
				<textarea  id ="ad" rows="5" cols="2" name="reason" style="height:100px;width:950px"></textarea>
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

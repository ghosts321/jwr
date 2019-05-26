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
var indexdata,cid,certtype;
function query(){
	var para = $('#in').combobox('getValue');
	if(para==''){
		alert(para);
		return;
	}
	$.ajax({
	    type:"POST",
	    async:false,
	    data:{certnumber:para},
	    url:"/jwr/certrevocation/getPnInfoAction.action",
	    success:function(returnValue){
	    	$("#ad").val("");
	    	if(returnValue==""||returnValue==null||returnValue.substr(0,1)!='{'||returnValue=='{}'){
	    		alert("不存在拥有此证书的考评员，请重新查询！");
	    		return;
	    	}else{
		    	indexdata=returnValue;
		    	indexdata=eval('('+indexdata+')');
		    	if(indexdata.Rows[0]==null){
		    		alert("不存在拥有此证书的考评员，请重新查询！");
		    		return;
		    	}
		    	cid = indexdata.Rows[0].cid;
		    	certtype = indexdata.Rows[0].bustype;
	   			$("#user").text(indexdata.Rows[0].userId);
				$("#admin").text(getMotVal(indexdata.Rows[0].adminmot)==null?indexdata.Rows[0].adminmot:getMotVal(indexdata.Rows[0].adminmot));
				$("#username").text(indexdata.Rows[0].pnname);
				$("#photo").text(indexdata.Rows[0].photo);
				$("#pid").text(indexdata.Rows[0].pid);
				$("#comefrom").text( getcomefromVal(indexdata.Rows[0].fromaddress));
				$("#city").text(getcomefromValue(indexdata.Rows[0].city));
				$("#org").text(indexdata.Rows[0].org);
				$("#title").text(indexdata.Rows[0].title);
				$("#address").text(indexdata.Rows[0].address);
				$("#pcode").text(indexdata.Rows[0].pcode);
				$("#tel").text(indexdata.Rows[0].tel);
				$("#fax").text(indexdata.Rows[0].fax);
				$("#mobile").text(indexdata.Rows[0].mobile);
				$("#email").text(indexdata.Rows[0].email);
				$("#edu").text(indexdata.Rows[0].edu);
				$("#major").text(indexdata.Rows[0].major);
				$("#begindate").text(indexdata.Rows[0].begindate);
				$("#type").text(indexdata.Rows[0].typename);
				$("#train").text(indexdata.Rows[0].train);
				$("#resume").text(indexdata.Rows[0].workdoc);
				$("#perf").text(indexdata.Rows[0].perf);
				$("#changereason").text(indexdata.Rows[0].changereason);
				$("#pass_direct").text(indexdata.Rows[0].pass_direct);
				$("#train_end").text(indexdata.Rows[0].train_end);
				$("#cdate").text(indexdata.Rows[0].createdate);
				$("#fzdate").text(indexdata.Rows[0].fzdate);
				$("#train_start").text(indexdata.Rows[0].train_start);
				$("#advice").text(indexdata.Rows[0].advice);
				$("#train_hour").text(indexdata.Rows[0].train_hour);
				$("#exam_score").text(indexdata.Rows[0].exam_score);
				$("#certnumber").text(indexdata.Rows[0].cid);
				$("#train_id").text(indexdata.Rows[0].train_id);
				$("#exam_date").text(indexdata.Rows[0].exam_date);
				$("#attrorg").text(indexdata.Rows[0].attrorg);
				$("#employdate").text(indexdata.Rows[0].employdate);
				$("#unemploydate").text(indexdata.Rows[0].unemploydate);
				$("#parttime").text(indexdata.Rows[0].parttime);
				$("#prof").text(indexdata.Rows[0].prof);
				$("#proof").text(indexdata.Rows[0].proof);
				$("#proof2").text(indexdata.Rows[0].proof2);
				$("#auditname").text(indexdata.Rows[0].directname);
				$("#auditdate").text(indexdata.Rows[0].auditdate);
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
		alert("请填写撤销意见！");
	}else{
		$.ajax({
			type:"POST",
		    async:false,
		    data:{cid:cid,value:value},
		    url:"/jwr//bookCancel/savePnAdviceAction.action",
		    success:function(returnValue){
		    	if(returnValue=='0'){
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
  		var freport=indexdata.Rows[0].photo;
    	if(freport!=null && freport!=""){
	 		var ss=freport.split('.');
	    	var filetype=ss[1];
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
  		var freport=indexdata.Rows[0].proof;
    	if(freport!=null && freport!=""){
	 		var ss=freport.split('.');
	    	var filetype=ss[1];
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
  		var freport=indexdata.Rows[0].proof2;
    	if(freport!=null && freport!=""){
	 		var ss=freport.split('.');
	    	var filetype=ss[1];
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

<body >
<H1>考评员资格证撤销</H1>
<FORM id=fm1 method=get action=/c/esp/refine-doc/en target=_blank>
<DIV class=eui-info>
<DIV class="eui-tip icon-tip"></DIV>
<DIV>以下输入框提供自动完成功能，请输入考评员名称或证书号关键字，并选定列表中的一个考评员。</DIV></DIV>
<LABEL>证书号：</LABEL>
 <input style="WIDTH: 500px; DISPLAY: none" id="in" name="in" value="" class="easyui-combobox">  
 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<A id=undefined class="easyui-linkbutton l-btn" onclick="query();"> <SPAN class=l-btn-text>查 询</SPAN> </A> 
<A id="bottun1" class="easyui-linkbutton l-btn" onclick="save();">   撤销 </A>
</FORM>
<br>
<form method="post" action="" id="form2" >
	<table border="1" id="tb"  cellspacing="0" cellpadding="4" align="center" width="95%">
		<tbody>
			<tr>
				<th nowrap="true" style="text-align: left">用户ID：</th>
				<td id="user"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">主管机关：</th>
				<td id="admin"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">名称：</th>
				<td id="username"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">证件号：</th>
				<td id="pid"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">常住地：</th>
				<td id="comefrom"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">常住地：</th>
				<td id="city"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">照片：</th>
				<td><a href="javascript:void(0)" onclick="chakan()">查看</a></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">单位组织：</th>
				<td id="org"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">职称：</th>
				<td id="title"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">通讯地址：</th>
				<td id="address"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">邮编：</th>
				<td id="pcode"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">联系电话：</th>
				<td id="tel"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">传真号码：</th>
				<td id="fax"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">手机：</th>
				<td id="mobile"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">联系人邮箱：</th>
				<td id="email"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">文化程度：</th>
				<td id="edu"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">所学专业：</th>
				<td id="major"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">现从事专业：</th>
				<td id="prof"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">相关专业从业年份：</th>
				<td id="begindate"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">业务类型：</th>
				<td id="type"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">身份证明文件：</th>
				<td><a href="javascript:void(0)" onclick="chakan1()">查看</a></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">学历证明文件：</th>
				<td><a href="javascript:void(0)" onclick="chakan2()">查看</a></td>
				</td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">换证原因<b>（仅换证申请）</b>：</th>
				<td id="changereason"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">直接颁发：</th>
				<td id="pass_direct"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">培训结束日期：</th>
				<td id="train_end"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">日期：</th>
				<td id="cdate"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">专兼职：</th>
				<td id="parttime"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">发证时间：</th>
				<td id="fzdate"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">培训开始日期：</th>
				<td id="train_start"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">聘用日期：</th>
				<td id="employdate"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">备注：</th>
				<td id=""></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">解聘日期：</th>
				<td id="unemploydate"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">处理意见：</th>
				<td id="advice"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">培训学时：</th>
				<td id="train_hour"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">考试分数：</th>
				<td id="exam_score"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">证书号：</th>
				<td id="certnumber"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">所属考评机构：</th>
				<td id="attrorg"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">培训合格证号：</th>
				<td id="train_id"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">签发人姓名：</th>
				<td id="auditname"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">考试日期：</th>
				<td id="exam_date"></td>
			</tr>
			

			<tr>
				<th nowrap="true" style="text-align: left">受理日期：</th>
				<td id="auditdate"></td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">主要学习（培训）经历：</th>
				<td>
					<textarea  id ="train" rows="5" cols="2"  style="height:100px;width:950px" readonly="readonly"></textarea>
				</td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">主要工作简历：</th>
				<td>
					<textarea  id ="resume" rows="5" cols="2"  style="height:100px;width:950px" readonly="readonly"></textarea>
				</td>
			</tr>
			<tr>
				<th nowrap="true" style="text-align: left">专业工作业绩：</th>
				<td>
					<textarea  id ="perf" rows="5" cols="2"  style="height:100px;width:950px" readonly="readonly"></textarea>
				</td>
			</tr>
			<tr>
				<TD width="15%" align="left">撤销意见：</TD>
				<TD width="85%" height="17">
					<textarea  id ="ad" rows="5" cols="2" name="advice" style="height:100px;width:950px"></textarea>
				</TD>
			</tr>
			
		</tbody>
	</table>
	<!-- <table id="tb1" border="1" class="Table_N" cellspacing="0" cellpadding="4" align="center" width="100%">
		<tr>
			<TD width="15%" align="left">
				撤销意见：
			</TD>
			<TD width="85%" height="17">
				<textarea  id ="ad" rows="5" cols="2" name="advice" style="height:100px;width:100%"></textarea>
			</TD>
		</tr>
	</table> -->
</form>
	<script type="text/javascript"> 
	   var scom=  $('#in').combobox({
	        hasDownArrow: false,
	        valueField: 'id',
	        textField: 'text',
	        onChange: function(v1, v0) {
	            if ($.trim(v1) != '') {
	                $('#in').combobox('reload', encodeURI('/jwr/certrevocation/certrevocationAction.action?certnumber='+v1));
	            }
	        },
	        onSelect: function(r) {
	            $('#in').combobox('select', r.text); //显示选中项的文本
	        }
		});  
	</script>
</body>
</html>

<%@ page language="java" import="java.util.*,java.net.*" pageEncoding="UTF-8"%>
<%@include file="../../main.jsp"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>My JSP 'pntail.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript">
		var indexdata = window.parent.postdata,totalSize="";
		indexdata = eval("("+indexdata+")");
	$(function() {
		$("#username").val(indexdata.pnname);
		$("#bustype").val(indexdata.bussinestype);
		$("#admin").val (indexdata.adminmot);
		$("#admin").html("<option value='"+indexdata.adminmot+"' >"+getMotVal(indexdata.adminmot) +"</option>");
		$("#userid").val(indexdata.userId);
		detial(indexdata);
		//添加页面日期 分数 组件
		$("#train_start").ligerDateEditor({ showTime: false, labelWidth: 100, labelAlign: 'left' });
		$("#train_end").ligerDateEditor({ showTime: false, labelWidth: 100, labelAlign: 'left',value:new Date() });
		$("#exam_date").ligerDateEditor({ showTime: false, labelWidth: 100, labelAlign: 'left',value:new Date() });
		$("#train_hour").ligerSpinner({ height: 22, minValue:0,maxValue:100,type: 'int' });
		$("#exam_score").ligerSpinner({ height: 22, minValue:0,maxValue:100,type: 'int' });
	});
	function detial(indexdata){
		var ss;
			//indexdata.type = getBusTypeVal(indexdata.type)==null?indexdata.type:getBusTypeVal(indexdata.type);
			//indexdata.admin = getMotVal(indexdata.admin)==null?indexdata.admin:getMotVal(indexdata.admin);
			ss=$("#result").ligerForm({
	         	 inputWidth:120, labelWidth: 90, space: 20,
	              fields:[  
	              { display: "用户ID", name: "userId", newline: true,type:"text",disabled:true  }, 
	              { display: "主管机关", name: "adminmot", newline: false,  type:"text",disabled:true},
	              { display: "名称", name: "pnname", newline: false,  type:"text",disabled:true}, 
	              { display: "证件号", name: "pid", newline: true, type:"text", disabled:true,inputWidth:120},
	              { display: "常住地", name: "fromaddress", newline: false, type:"text", disabled:true,inputWidth:120},
	              { display: "所在市", name: "city", newline: false, type:"text", disabled:true},
	              { display: "照片", name: "photo", newline: true, type:"text", disabled:true}, 
	              { display: "单位组织", name: "org", newline: false, type:"text", disabled:true}, 
	              { display: "通讯地址", name: "address", newline: false,  disabled:true}, 
	              { display: "邮编", name: "pcode", newline: true,  disabled:true}, 
	              { display: "联系电话", name: "tel", newline: false, disabled:true}, 
	              { display: "手机", name: "mobile", newline: false,  disabled:true}, 
	              { display: "文化程度", name: "edu", newline: true, disabled:true},
	              { display: "所学专业", name: "major", newline: false, disabled:true},
	              { display: "现从事专业", name: "major", newline: false, disabled:true},
	              { display: "专业从业年份", name: "begindate", newline: true,  disabled:true},
	              { display: "业务类型", name: "bussinestype", newline: false,  disabled:true}, 
	              { display: "换证原因", name: "renew", newline: false,  disabled:true}, 
	              { display: "直接颁发", name: "pass_direct", newline: true,  disabled:true}, 
	              { display: "日期", name: "createdate", newline: false,  disabled:true}, 
	              { display: "处理意见", name: "advice", newline: false,  disabled:true}, 
	              { display: "受理结果", name: "auditresp", newline: true,  disabled:true}, 
	              { display:"用户类型",name:"usertype",newline:false,disabled:true},
	              { display: "受理日期", name: "auditdate", newline: false, disabled:true},
	              { display: "学习/培训经历", name: "train", newline: true,  disabled:true,type:"textarea"}, 
	              { display: "主要工作简历", name: "workdoc", newline: false,  disabled:true,type:"textarea"}, 
	              { display: "专业工作业绩", name: "perf", newline: false,  disabled:true,type:"textarea"}
	              ]
	         });
		ss.setData(indexdata);
		$("[name=adminmot]").val(getMotVal(indexdata.adminmot)+'');
		$("[name=fromaddress]").val(getcomefromVal(indexdata.fromaddress));
       	$("[name=city]").val(getcomefromValue(indexdata.city));
		$("#train").attr("disabled","disabled");
		$("#workdoc").attr("disabled","disabled");
		$("#perf").attr("disabled","disabled");
		if(indexdata.auditresp=='1'){
			$("[name=auditresp]").val("同意");
		}else if(indexdata.auditresp=='2'){
			$("[name=auditresp]").val("不同意");
		}else{
			$("[name=auditresp]").val("尚未处理");
		}
		
		$("[name=bussinestype]").val(getBusTypeVal(indexdata.bussinestype));
		$("[name=usertype]").val("考评员");
		initAttachment('photo');
		/* $("input[name='photo']").parent().parent().parent() .append(" <li><a href='javascript:chakan()'>查看</a></li> ") ; */
	}
	function chakan(){
  		var freport=$("input[name='photo']").val();
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
	function pn_train_save(){
		var username = $("#username").val();
		var bustype = $("#bustype").val();
		var admin = $("#admin").val();
		var train_start = $("#train_start").val();
		var train_end = $("#train_end").val();
		var train_hour = $("#train_hour").val();
		if(train_hour==null || train_hour==""){
			alert("请填写培训学时");
			return;
		}else if(train_hour<24){
			alert("培训学时必须大于等于24学时");
			return;
		}
		if(train_start>train_end){
			alert("培训开始日期不能大于结束日期");
			return;
		}
		var train_id = $("#train-id").val();
		var exam_date = $("#exam_date").val();
		var exam_score = $("#exam_score").val();
		var pnid = indexdata.id;
		var userid = $("#userid").val();
		
		$.ajax({
			type : "POST",
			async : false,
			data:{username:username,bustype:bustype,admin:admin,train_start:train_start,train_end:train_end,train_hour:train_hour,train_id:train_id,exam_date:exam_date,exam_score:exam_score,userid:userid,pnid:pnid},
			url : "<%=basePath%>/mottrain/pnTrainSaveAction.action",
			success : function(returnValue) {
				if(returnValue=='yes'){
					alert('录入成功!');
					window.parent.initSum();
					window.parent.initTrain();
					window.parent.initNoTrain();
					window.parent.dialog.close();
				}else{
					alert('录入失败！');
				}
			}
		});
	}
</script>
</head>
<body>
	<div id="result" style="width:100%"></div>
	<input type="hidden" id="userid" value="">
	<h2 style="margin: 8px;">录入考评员培训及考试结果：</h2>
		<table style="margin: 8px;border: 1px solid #BB44BB;" border="0" cellpadding="0" cellspacing="5" width="95%" height="25%">
			<tr>
				<td><label>名称：</label>
				</td>
				<td><input type="text" value="" style="border-color: #a3c0e8;width: 130" name="pnname" id="username" readonly="readonly"
					class="easyui-validatebox validatebox-text">
				</td>
				<td><label>业务类型：</label>
				</td>
				<td><select  name="bustype" id="bustype" style="border-color: #a3c0e8" disabled="disabled">
						<option value="1" selected="true">道路运输</option>
						<option value="2">水路运输</option>
						<option value="3">港口运营</option>
						<option value="4">城市客运</option>
						<option value="5">交通运输工程建设</option>
						<option value="6">其他</option>
				</select>
				</td>
			</tr>
			<tr>
				<td><label>主管机关：</label>
				</td>
				<td>
					<select value="1402" name="adminmots" style="border-color: #a3c0e8" id="admin" disabled="disabled">
						<option value="03">天津市</option>
					</select><!-- input type="checkbox" onchange="esp_train_count_admin_change()"
						value="y" id="admin_more"> 显示地市级</td-->
				</td>
				<td>
					<label>培训开始日期：</label>
				</td>
				<td>
					<input value="" type="text" id="train_start" />
				</td>
			</tr>
			<tr>
				<td>
					<label>培训结束日期：</label>
				</td>
				<td>
					<input value="" type="text" id="train_end" />
				</td>
				<td><label>培训学时：</label>
				</td>
				<td>
					<input value="" type="text" id="train_hour" />
				</td>
			</tr>
			<tr>
				<td><label>培训合格证号：</label>
				</td>
				<td><input type="text" value="" style="border-color: #a3c0e8;width: 130px;" name="train-id" id="train-id" />
				</td>
				<td><label>考试日期：</label>
				</td>
				<td>
					<input value="" type="text" id="exam_date" />
				</td>
			</tr>
			<tr>
				<td><label>考试分数：</label>
				</td>
				<td>
					<input value="" type="text" id="exam_score" />
				</td>
				<td></td>
				<td></td>
			</tr>
		</table>
		<div align="center" style="padding-top: 10">
			<!-- <a onclick="pn_train_save();" href="javascript:void(0);" class="easyui-linkbutton l-btn" id="save" >
				<span class="l-btn-left" style="width: 50px;text-align:center"><span class="l-btn-text">保存</span></span>
			</a> -->
			<a onclick="pn_train_save()" iconcls="icon-ok" href="javascript:void(0);" class="easyui-linkbutton l-btn" id="ty"><span class="l-btn-left"><span class="l-btn-text icon-ok" style="padding-left: 20px;">保  存</span></span></a>
		</div>
		<div id="popupContact" align="center" >
			<a id="popupContactClose">x</a>
			<p id="contactArea">
				<img id="img0" src=""/>
			</p>
		</div>
</body>
</html>

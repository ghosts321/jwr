<%@ page language="java" import="java.net.*" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
  <script type="text/javascript">
  var indexdata=window.parent.postdata;
  indexdata = eval("("+indexdata+")");
  indexdata.type = getBusTypeVal(indexdata.type);
  if(indexdata.respResult=='1'){
	  indexdata.respResult='同意';
  }else if(indexdata.respResult=='0'){
	  indexdata.respResult='不同意';
  }
  if(indexdata.orgresult=='1'){
	  indexdata.orgresult='同意';
  }else if(indexdata.orgresult=='0'){
	  indexdata.orgresult='不同意';
  }
  if(indexdata.auditResult=='1'){
	  indexdata.auditResult='同意';
  }else if(indexdata.auditResult=='0'){
	  indexdata.auditResult='不同意';
  }
  var sorg =indexdata.orgId1;
  var sorgData;
  $.ajax({
	    type:"POST",
	    async:false,
	    url: "/jwr/enControl/getOrgNameAction.action?orgid1="+sorg,
	    success:function(returnValue){
	    	sorgData=eval("("+returnValue+")");
	    }
	});
  	$(function(){
      var ss= $("#motResp").ligerForm({
           	 inputWidth:300, labelWidth: 120, space: 20,
                fields:[  
                { display: "用户ID", name: "userId", newline: true,type:"text",disabled:true}, 
                { display: "主管机关", name: "adminMotName", newline: false,  type:"text",disabled:true},
                { display: "所在市", name: "city", newline: true,  type:"text",disabled:true}, 
                { display: "名称", name: "enname", newline: true, type:"text", disabled:true},
                { display: "证件号", name: "pid", newline: false,  disabled:true}, 
                { display: "法人代表", name: "legalp", newline: true,  disabled:true}, 
                { display: "联系人姓名", name: "contact", newline: false,  disabled:true}, 
                { display: "手机", name: "mobile", newline: true, disabled:true},
                { display: "联系人邮箱", name: "email", newline: false, disabled:true}, 
                { display: "等级", name: "grade", newline: true, disabled:true},
                { display: "业务类型", name: "uppername", newline: false, disabled:true},
                { display: "业务类别", name: "filetext", newline: true, disabled:true},
                { display: "通讯地址", name: "address", newline: false, disabled:true},
                { display: "联系电话", name: "tel", newline: true, disabled:true},
                { display: "传真", name: "tax", newline: false, disabled:true},
                { display: "安全生产组织框架", name: "safe", newline: true, disabled:true},
                { display: "企业法人资格证件", name: "qual", newline: false, disabled:true},
                { display: "经营许可证", name: "license", newline: true, disabled:true},
                { display: "标准化达标自评报告", name: "zpreport", newline: false, disabled:true},
                { display: "指定的考评机构", name: "orgId1", newline: true , disabled:true},
                { display: "日期", name: "date", newline: false, disabled:true},
                { display: "用户类型", name: "usertype", newline: true, disabled:true},
                { display: "自评分数", name: "selfScore", newline: false, disabled:true},
                { display: "考评分数", name: "kaoScore", newline: true, disabled:true},
                { display: "受理意见", name: "respAdvice", newline: false, disabled:true},
                { display: "受理结果", name: "respResult", newline: true, disabled:true},
                { display: "受理日期", name: "respdate", newline: false, disabled:true},
                { display: "考评意见", name: "orgadvice", newline: true, disabled:true},
                { display: "考评结果", name: "orgresult", newline: false, disabled:true},
                { display: "考评日期", name: "orgdate", newline: true, disabled:true},
                { display: "审核意见", name: "auditAdvice", newline: false, disabled:true},
                { display: "审核结果", name: "auditResult", newline: true, disabled:true},
                { display: "审核日期", name: "auditDate", newline: false, disabled:true},
                { display: "换证原因", name: "reNew", newline: true, disabled:true},
                { display: "", name: "id",type:"hidden"}
                ]
           });
		ss.setData(indexdata);
		$("[name=province]").val(getcomefromVal(indexdata.province));
		$("[name=city]").val(getcomefromValue(indexdata.city));
		initAttachment('safe,qual,license,zpreport');
		$("input[name='usertype']").val("企业") ;
		$("[name=reNew]").val(getChangeReason(indexdata.reNew));
		if(indexdata.grade=="2"){
			$("input[name='grade']").val("二级") ;
		}else if(indexdata.grade=="3"){
			$("input[name='grade']").val("三级") ;
		}
		
	  var zpdata;
		var type=indexdata.type2;
		$.ajax({
		    type:"POST",
		    async:false,
		    data:{userid:indexdata.userId,type:type},
		    url: "/jwr/enControl/getEnZpListByClassAction.action",
		    success:function(returnValue){
		    	zpdata=eval("("+returnValue+")");
		    }
		});
		window['g'] = 
	        grid=$("#selfReport").ligerGrid({
	            columns: [ 
	        { display: '业务类别', name: 'busclass',  heightAlign: 'center' ,width:'25%',render:function(item){return getCelltype(item.busclass)==null?item.busclass:getCelltype(item.busclass)}},
	        { display: '日期', name: 'createdate',    align: 'center' ,width:'20%'},
	        { display: '达标评估', name: 'scoresum',  align: 'center' ,width:'30%'}, 
	        { display: '详情', name: '',  align: 'center' ,width:'10%', 
	        	render:function(item,index){
        	 	return "<a href=javascript:look('"+item.reportname+"')>查看报告</a>"; 
         		}}
	        ], 
	        	data:zpdata,
	            rownumbers: false,
	            usePager:false,
	            width: '80%', 
	            height: '15%', 
	            checkbox: false
	        });
		var kpdata;
		$.ajax({
		    type:"POST",
		    async:false,
		    data:  {orgid:indexdata.orgId1,type:type,applyid:indexdata.id} ,
		    url: "/jwr/enControl/getEnKpListByClassAction.action",
		    success:function(returnValue){
		    	kpdata=eval("("+returnValue+")");
		    }
		});
	  	window['g'] = 
	        grid1=$("#kaoReport").ligerGrid({
	            columns: [ 
	        { display: '业务类别', name: 'busclass',  heightAlign: 'center' ,width:'20%',render:function(item){return getCelltype(item.busclass)==null?item.busclass:getCelltype(item.busclass)}},
	        { display: '日期', name: 'createdate',    align: 'center' ,width:'18%'},
	        { display: '达标评估', name: 'scoresum',  align: 'center' ,width:'28%'}, 
	        { display: '用户ID', name: 'createuser',  align: 'center' ,width:'12%'},
	        { display: '详情', name: '',  align: 'center' ,width:'8%', 
	        	render:function(item,index){
	        	 	return "<a href=javascript:look('"+item.reportname+"')>查看报告</a>"; 
	         	}
	        }
	        ], 
	        data:kpdata,
	            rownumbers: false,
	            usePager:false,
	            pageSize: 10,
	            width: '80%', 
	            height: '15%', 
	            checkbox: false
	        });
  	});
  	
  	
  	
  </script>
	</head>
<body style="overflow: hidden;">
	<center style="border: 1px solid #369">
		<h1 style="padding:20px; background-color:#369; color: white; font-size: 22px; margin-top:0px">企业达标等级证书申请详情</h1>
		
	</center>
		<div id="motResp" style="margin: 3; padding: 0"></div>
	<br/>
	<h2>自评报告:</h2>
		<div id="selfReport" style="margin: 3; padding: 0"></div>
	<br/>
	<h2>评估报告:</h2>
		<div id="kaoReport" style="margin: 3; padding: 0"></div>
	<br/>
	<h2>填写意见:</h2>
	<form method="post" id="motForm" action="" style="width: 10%">
		<table style="margin: 3">
			<tr>
			    <td>
			    	<textarea style="width:680" id="changereason" name = "changereason"  ></textarea>
			    </td>
			</tr>
		</table>
	</div>
	</form>
	<div style="padding-top: 10"align="center" id="bt_submit">
		<a onclick="submitAudit('1');" iconcls="icon-ok" href="javascript:void(0);"
			class="easyui-linkbutton l-btn">
			<span class="l-btn-left"><span class="l-btn-text icon-ok"
				style="padding-left: 20px;">同意(并进行公示)</span> </span>
		</a>
		<a onclick="submitAudit('0');" href="javascript:void(0);"
			iconcls="icon-cancel" class="easyui-linkbutton l-btn" id="undefined"><span
			class="l-btn-left"><span class="l-btn-text icon-cancel"
				style="padding-left: 20px;">不同意(填写意见)</span> </span> 
		</a>
	</div>
	<script type="text/javascript">
	var auditResult = indexdata.auditResult;
	function submitAudit(type){
		var data = $("#changereason").val();
		if(data.length>800){
			alert("填写意见字数不能超过800个，已输入"+data.length+"个字!");
  			return false;
		}
		var pid = indexdata.pid;
		var busType = indexdata.type2;
		var adminmot = indexdata.adminmot;
		var applyId = indexdata.id;
		var orgId = indexdata.orgId1;
		var grade = indexdata.grade;
		var usertype="en";
		$.ligerDialog.confirm('是否确认处理此申请记录？', function (yes) {
			if(yes==true){
				$.ajax({
				    type:"POST",
				    async:false,
				    data:{advice:data,grade:grade,auditResult:auditResult,pid:pid,busType:busType,adminmot:adminmot,type:type,applyId:applyId,usertype:usertype,orgId:orgId},
				    url:"/jwr/enControl/submitResultAuditAction.action",
				    success:function(returnValue){
				    	if(eval(returnValue)=='0'){
				    		alert("提示信息：企业考评结果审核成功!");
				    		window.parent.grid.reload();
				    		window.parent.ligerwindow.close();
				    	}else{
				    		alert("提示信息：企业考评结果审核失败，请与管理员联系!");
				    	}
				    }
				});
			}else{
				return;
			}
		});
	}
	var motCity = '<%=request.getSession().getAttribute("motCity")%>';
	var nowMot = "<%=request.getSession().getAttribute("mot").toString() %>";
	if(indexdata.grade=="2"){
		  //indexdata.grade='二级';
		  //如果当前是尚未处理 并且是省级主管机关  (隐藏)
		  if(auditResult=="" && motCity.length == 2){
			  $("#org_show").hide();
			  $("#hid").hide();
		  //如果当前是尚未处理 并且是二级主管机关登录 (显示)
		  }else if(auditResult=="" && motCity.length== 2 && nowMot.length==4){
			  $("#org_show").show();
		  //如果是已初受理  并且是省级主管机关  (显示)
		  }else if(auditResult=="2" && motCity.length== 2){
			  $("#org_show").show();
		  //如果是已初受理 并且是二级主管机关  (隐藏)
		  }else if(auditResult=="2" && motCity.length != 2 && nowMot.length==4){
			  $("#org_show").hide();
			  $("#hid").hide();
		  }else{
			  $("#org_show").hide();
			  $("#hid").hide();
		  }
	  }else{
		  //indexdata.grade='三级';
		  $("#org_show").show();
	  }
</script>

	<div id="popupContact" align="center" >
		<a id="popupContactClose">x</a>
		<p id="contactArea">
			<img id="img0" src=""/>
		</p>
	</div>
</body>
</html>
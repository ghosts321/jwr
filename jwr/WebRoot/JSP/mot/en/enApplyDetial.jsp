<%@ page language="java" import="java.net.*" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
  <script type="text/javascript">
  var indexdata=window.parent.postdata;
  var nowMot = "<%=request.getSession().getAttribute("mot").toString() %>";
  var motCity = "<%=request.getSession().getAttribute("motCity")+"" %>";
  indexdata = eval("("+indexdata+")");
  var grade=indexdata.grade;
  var resp = indexdata.resp;
  var enCity = indexdata.city;
  if(resp =="同意"){
	  resp = "1";
  }
  var para=indexdata.bustype;
  var applyId = indexdata.id;
	var pid = indexdata.pid;
	//var city = indexdata.city;
	var busType = indexdata.type2;
	var uppername=indexdata.uppername;
	var userId = indexdata.userId;
	var adminmot = indexdata.adminmot;
  indexdata.type = getBusTypeVal(indexdata.type);
  var sorg =indexdata.apporg;
  var sorgData;
  var orgname1;
  $.ajax({
	    type:"POST",
	    async:false,
	    url: "/jwr/enControl/getAppOrgNameAction.action?orgid1="+encodeURI(encodeURI(sorg)),
	    success:function(returnValue){
	    orgname1=returnValue;
	    }
	});
  //回显选择的考评机构  和 受理意见
  function reShowAdvice(){
	  initExamineGrid();
  }
	
  function getOrgByen(){
		var checki=0;
			   $.ajax({
				    type:"POST",
				    async:false,
				   	 data:{bustype:para,grade:grade},
				    url: "/jwr/enControl/getOrgListByEnClassAction.action",
				    success:function(returnValue){
				   		indexdata=eval("("+returnValue+")");
				    }
				});
				$("#orgid1").ligerComboBox({
			    columns: [
				            { header : '名称', name: 'orgname',  align: 'center' },
				            { header : '证件号', name: 'pid',  align: 'center'} ,
				            { header : '等级', name: 'grade',  align: 'center'} ,
				            { header : '经营类别', name: 'filetext',  align: 'center'} 
				         ],
	            parms:{bustype:para,grade:grade},
	            selectBoxWidth: 450, selectBoxHeight:200,
	            labelWidth:300,
	            textField:'orgname',
	            valueField :'pid',
	            checkbox: false,
	            isShowCheckBox:false,
	            url: "/jwr/enControl/getOrgListByEnClassAction.action"
		});
	}
  	$(function(){
      var ss= $("#motResp").ligerForm({
           	 //inputWidth:220, labelWidth: 120, space: 20,
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
                { display: "换证原因", name: "reNew", newline: true, disabled:true},
                { display: "日期", name: "date", newline: false, disabled:true},
                { display: "用户类型", name: "usertype", newline: true, disabled:true},
                { display: "备注", name: "comment", newline: false, disabled:true},
                { display: "企业所选考评机构", name: "apporg", newline: true, disabled:true,width:"500"}
                ]
           });
		ss.setData(indexdata);
		$("[name=province]").val(getcomefromVal(indexdata.province));
		$("[name=city]").val(getcomefromValue(indexdata.city));
		initAttachment('safe,qual,license,zpreport');
		$("input[name='usertype']").val("企业") ;
		$("input[name='apporg']").val(orgname1) ;
		$("[name=reNew]").val(getChangeReason(indexdata.reNew));
  	});
  	/* function del(){
		 
		$.ligerDialog.confirm('是否确认删除此申请记录？', function (yes) {
			if(yes==true){
				$.ajax({
				    type:"POST",
				    async:false,
				    data:{applyId:applyId},
				    url:"/jwr/enControl/delApplyInfoAction.action",
				    success:function(returnValue){
				    	if(eval(returnValue)=='0'){
				    		alert("提示信息：删除企业等级证书申请记录成功!");
				    		window.parent.grid.reload();
				    		window.parent.ligerwindow.close();
				    	}else{
				    		alert("提示信息：删除企业等级证书申请记录失败，请与管理员联系!");
				    	}
				    }
				});
			}else{
				return;
			}
		});
	} */
  </script>
	</head>
<body>
	<center style="border: 1px solid #369">
		<h1 style="padding:20px; background-color:#369; color: white; font-size: 22px; margin-top:0px">企业达标等级证书申请审批</h1>
		
	</center>
		<div id="motResp" style="margin: 3; padding: 0;width: 95%"></div>
	<br/>
	<div id="org_show" style="display: none;">
	   <DIV class=eui-info><DIV class='eui-tip icon-tip'></DIV><DIV>注意：请指派一个考评机构对该企业进行考评！</DIV></DIV><br/><table><tr><td>指定考评机构：  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><input type='text'  id='orgid1' onclick='getOrgByen();'/></td></tr></table>
	
	</div>
	<div id="showExamine" style="width: 80%">
	
	<form method="post" id="motForm" action="" style="width: 10%">
		<table style="margin: 3">
			<tr>
				<td>
					填写意见:
			    </td>
			    <td>
			    			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    				 
			    	<textarea style="width:680" id="changereason" name = "changereason" ></textarea>
			    </td>
			</tr>
		</table>
	</form></div>
		<div id="hid" style=" margin-top: 10px;" align="center">
			<a onclick="submitAudit('1');" iconcls="icon-ok" href="javascript:void(0);"
				class="easyui-linkbutton l-btn">
				<span class="l-btn-left"><span class="l-btn-text icon-ok"
					style="padding-left: 20px;">同&nbsp;&nbsp;&nbsp;意</span> </span>
			</a>
			<a onclick="submitAudit('0');" href="javascript:void(0);"
				iconcls="icon-cancel" class="easyui-linkbutton l-btn" id="undefined"><span
				class="l-btn-left"><span class="l-btn-text icon-cancel"
					style="padding-left: 20px;">不同意</span> </span> 
			</a>
		</div>
	<!-- <a onclick="del();" href="javascript:void(0);"
		iconcls="icon-cancel" class="easyui-linkbutton l-btn" id="undefined"><span
		class="l-btn-left"><span class="l-btn-text icon-cancel"
			style="padding-left: 20px;">删除申请记录</span> </span> 
	</a> -->
<script type="text/javascript">
	function submitAudit(type){
		var data = $("#changereason").val();
		if(data.length>800){
			alert("填写意见字数不能超过800个，已输入"+data.length+"个字!");
  			return false;
		}
	  //if($.ligerui.get("orgid1")==null){
		//  $.ligerDialog.alert("请选择考评机构！");
		//	return false;
	  //}
		var orgId = $.ligerui.get("orgid1");
		if(orgId != null){
			orgId = orgId.getValue();
		}else{
			orgId ='';
		}
		if(!$('#org_show').is(':hidden')){
			if(orgId == ""){
				alert("请选择考评机构!");
				return ;
			}
		}
		//var orgId = document.getElementById("orgid1");
		//if(orgId != null){
		//	orgId = orgId.value;
		//}
		//if(orgId==''||orgId==null||orgId=='undefined'||orgId.length>12){
		//	$.ligerDialog.alert("请选择考评机构！");
		//	return false;
		//}
		
		var usertype = "en";
		$.ligerDialog.confirm('是否确认处理此申请记录？', function (yes) {
			if(yes==true){
				$.ajax({
				    type:"POST",
				    async:false,
				    data:{advice:data,pid:pid,grade:grade,motCity:motCity,enCity:enCity,busType:busType,adminmot:adminmot,orgId:orgId,type:type,applyId:applyId,usertype:usertype,userid:userId,uppername:uppername},
				    url:"/jwr/enControl/submitAuditAction.action",
				    success:function(returnValue){
				    	if(eval(returnValue)=='0'){
				    		alert("提示信息：企业等级证书申请处理成功!");
				    		window.parent.grid.reload();
				    		window.parent.ligerwindow.close();
				    	}else{
				    		alert("提示信息：企业等级证书申请处理失败，请检查是否存在证书后与管理员联系!");
				    	}
				    }
				});
			}else{
				return;
			}
		});
	}
	function del(){
		 
		$.ligerDialog.confirm('是否确认删除此申请记录？', function (yes) {
			if(yes==true){
				$.ajax({
				    type:"POST",
				    async:false,
				    data:{applyId:applyId},
				    url:"/jwr/enControl/delApplyInfoAction.action",
				    success:function(returnValue){
				    	if(eval(returnValue)=='0'){
				    		alert("提示信息：删除企业等级证书申请记录成功!");
				    	}else{
				    		alert("提示信息：删除企业等级证书申请记录失败，请与管理员联系!");
				    	}
				    }
				});
			}else{
				return;
			}
		});
	}
	if(indexdata.grade=="2"){
		  indexdata.grade='二级';
		  //如果当前是尚未处理 并且企业是省级直属 并且当前登录人是省级(显示)
		  if(resp=="" && nowMot.length == 2 && enCity.length==2){
			  $("#org_show").show();
		  //如果当前是尚未处理 并且是省级主管机关  (隐藏)
		  }else if(resp=="" && motCity.length== 2){
			  $("#org_show").hide();
			  $("#hid").hide();
		  //如果当前是尚未处理 并且是二级主管机关登录 (显示)
		  }else if(resp=="" && motCity.length== 2 && nowMot.length==4){
			  $("#org_show").hide();
			  $("#hid").hide();
		  //如果是已初受理  并且是省级主管机关  (显示)
		  }else if(resp=="2" && motCity.length== 2){
			  $("#org_show").show(); 
		  //如果是已初受理 并且是二级主管机关  (隐藏)
		  }else if(resp=="2" && motCity.length != 2 && nowMot.length==4){
			  $("#org_show").hide();
			  $("#hid").hide();
			  initExamineGrid();
		  }else if(resp =="1"){
			  $("#org_show").hide();
			  $("#hid").hide();
			  initExamineGrid();
		  }else{
			  $("#org_show").hide();
		  }
	  }else{
		  indexdata.grade='三级';
		  if(resp == "同意" || resp == "1"){
			  $("#hid").hide();
			  initExamineGrid();
		  }else{
			  $("#org_show").show();
		  }
	  }
	function initExamineGrid(){
		window['g'] =$("#showExamine").ligerGrid({
             columns: [
         { display: '用户类型', name: 'usertype',  align: 'center', 
        	 render: function (item){
     		 if(item.usertype=="en"){return '企业';}
     		 else if(item.usertype=="mot"){return '主管机关';}
     		 else if(item.usertype=="org"){return '考评机构';}
     		 else{return ''}
             }
         },
         { display: '用户名称', name: 'auditername',  heightAlign: 'center' },
         {display:  '处理状态',name:'status',align:'center'},
         {display:  '所选考评机构',name:'auditer',align:'center'},
         {display:  '处理人',name:'userid',align:'center'},
         { display: '处理结果', name:'results',  align: 'center',
        	 render: function (item){
	       		 if(item.results=="0"){return '不同意';}
	       		 else if(item.results=="1"){return '同意';}
	       		 else{return ''}
             }},
         { display: '处理意见', name:'advice',  align: 'center' },
         { display: '处理时间', name:'auditdate',    align: 'center'}
         ], 
          usePager: false,
          url: "/jwr/enControl/showOrgAdviceAction.action",
          parms:{applyId:applyId},
          width: '100%', 
          height: '320', 
          checkbox: false
         });
         $("#pageloading").hide();
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
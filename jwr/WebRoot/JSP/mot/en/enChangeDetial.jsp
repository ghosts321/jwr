<%@ page language="java" import="java.net.*" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
  <script type="text/javascript">
  var indexdata=window.parent.postdata;
  indexdata = eval("("+indexdata+")");
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
           	 inputWidth:200, labelWidth: 120, space: 20,
                fields:[  
                { display: "用户ID", name: "userId", newline: true,type:"text",disabled:true}, 
                { display: "主管机关", name: "adminmot", newline: false,  type:"text",disabled:true},
                { display: "所在市", name: "city", newline: true,  type:"text",disabled:true}, 
                { display: "名称", name: "enname", newline: true, type:"text", disabled:true},
                { display: "证件号", name: "cid", newline: false,  disabled:true}, 
                { display: "法人代表", name: "legalp", newline: true,  disabled:true}, 
                { display: "联系人姓名", name: "contact", newline: false,  disabled:true}, 
                { display: "手机", name: "mobile", newline: true, disabled:true},
                { display: "联系人邮箱", name: "email", newline: false, disabled:true}, 
                { display: "等级", name: "grade", newline: true, disabled:true},
                { display: "业务类型", name: "bustype", newline: false, disabled:true},
                { display: "业务类别", name: "type2", newline: true, disabled:true},
                { display: "通讯地址", name: "address", newline: false, disabled:true},
                { display: "联系电话", name: "tel", newline: true, disabled:true},
                { display: "传真", name: "tax", newline: false, disabled:true},
                { display: "换证原因", name: "reNew", newline: true, disabled:true},
                { display: "换证原因", name: "reNew", newline: false, disabled:true},
                { display: "指定的考评机构", name: "orgId1", newline: true ,type:"select",options: { valueField: "id1",textField:"name",data:sorgData} },
                { display: "日期", name: "date", newline: false, disabled:true},
                { display: "用户类型", name: "usertype", newline: true, disabled:true},
                { display: "安全生产组织框架", name: "safe", newline: true, disabled:true},
                { display: "企业法人资格证件", name: "qual", newline: false, disabled:true},
                { display: "经营许可证", name: "license", newline: true, disabled:true},
                { display: "标准化达标自评报告", name: "zpreport", newline: false, disabled:true},
                { display: "", name: "id",type:"hidden"}
                ]
           }); 
		ss.setData(indexdata);
		initAttachment('safe,qual,license,zpreport');
		$("[name=adminmot]").val(getMotVal(indexdata.adminmot));
		$("[name=province]").val(getcomefromVal(indexdata.province));
		$("[name=city]").val(getcomefromValue(indexdata.city));
		$("[name=bustype]").val(getBusTypeVal(indexdata.bustype));
		$("[name=type2]").val(getCelltype(indexdata.type2));
		$("input[name='usertype']").val("企业") ;
  		$("#changereason").val(indexdata.changereason);
  		if(indexdata.changeresault=='1'){
  			$("#changereason").attr("disabled",true);
  			document.getElementById("close").style.display="block";
  		}else{
  			document.getElementById("open").style.display="block";
  		}
  	});
 
  </script>
	</head>
<body>
	<center style="border: 1px solid #369">
		<h1 style="padding:20px; background-color:#369; color: white; font-size: 22px; margin-top:0px">企业达标等级证书申请审批</h1>
		
	</center>
		<div id="motResp" style="margin: 3; padding: 0;width: 95%"></div>
	<br/>
	<DIV class=eui-info>
		<DIV class="eui-tip icon-tip"></DIV>
		<DIV>注意：请指派一个考评机构对该企业进行考评！</DIV>
	</DIV>
	<form method="post" id="motForm" action="" style="width: 10%">
		<table style="margin: 3">
			<tr>
				<td>
					填写意见:
			    </td>
			    <td>
			    			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    				 
			    	<textarea style="width:640" id="changereason" name = "changereason"  ></textarea>
			    </td>
			</tr>
		</table>
	</div>
	</form>
	<div id="open" style="display: none">
	<a onclick="submitAudit('1');" iconcls="icon-ok" href="javascript:void(0);"
		class="easyui-linkbutton l-btn">
		<span class="l-btn-left"><span class="l-btn-text icon-ok"
			style="padding-left: 20px;">同意</span> </span>
	</a>
	<a onclick="submitAudit('0');" href="javascript:void(0);"
		iconcls="icon-cancel" class="easyui-linkbutton l-btn" id="undefined"><span
		class="l-btn-left"><span class="l-btn-text icon-cancel"
			style="padding-left: 20px;">不同意</span> </span> 
	</a>
	<a onclick="del();" href="javascript:void(0);"
		iconcls="icon-cancel" class="easyui-linkbutton l-btn" id="undefined"><span
		class="l-btn-left"><span class="l-btn-text icon-cancel"
			style="padding-left: 20px;">删除申请记录</span> </span> 
	</a>
	</div>
	<div id="close" style="display: none">
	
		<a   href="javascript:window.parent.ligerWindows.close();"
		iconcls="icon-cancel" class="easyui-linkbutton l-btn" id="undefined"><span
		class="l-btn-left"><span class="l-btn-text icon-cancel"
			style="padding-left: 20px;">关闭</span> </span> 
	</a>
	</div>
<script type="text/javascript">
	function submitAudit(type){
		var data = $("#changereason").val();
		if(data.length>800){
			alert("填写意见字数不能超过800个，已输入"+data.length+"个字!");
  			return false;
		}
		var pid = indexdata.pid;
		var busType = indexdata.type2;
		var adminmot = indexdata.adminmot;
		var orgId = indexdata.orgId;
		if(orgId=null||orgId==''){
			orgId=indexdata.orgId1;
		}
		var applyId = indexdata.id;
		var cid = indexdata.cid;
		$.ajax({
		    type:"POST",
		    async:false,
		    data:{advice:data,pid:pid,busType:busType,adminmot:adminmot,orgId:orgId,type:type,applyId:applyId,cid:cid,changereason:$("#changereason").val(),id:indexdata.id},
		    url:"/jwr/enControl/submitAuditChangeCertAction.action",
		    success:function(returnValue){
		    	if(returnValue=="0"){
					alert('处理成功！');
					window.parent.grid.reload();
					window.parent.ligerWindows.close();
				}else{
					alert(returnValue);
				}

		    },
		    error:function(e){
		    	alert("操作失败，请联系系统管理员！");
		    }
		});
	}
	function del(){
		var id = indexdata.id;
		 $.ajax({
			    type:"POST",
			    async:false,
			    url:"/jwr/respOrg/delEnApplyAction.action",
			    data:{"id":id},
			    success:function(returnValue){
			   		if(returnValue=='ok'){
			   			alert("已删除");
			   			window.parent.grid.reload();
						window.parent.ligerWindows.close();
			   		}else if(returnValue=='error'){
			   			alert("删除失败");
			   		}
			    }
			});
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
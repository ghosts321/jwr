<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../main.jsp" %>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>
		  主管机关报名申请详细信息
		</title>
	
  <script type="text/javascript">
  <%String   msg=request.getAttribute("msg")==null?"":request.getAttribute("msg").toString();
	if(msg.equals("yes")){
		%>
		alert("提交成功，窗口将关闭");
			window.parent.gird.reload();
			window.parent.ligerwindow.close();
		//$(".l-window-close" ,window.parent.document).click();
		 <%
	}else if(msg!=null&&!msg.equals("yes")&&!msg.equals("")){
		%>alert(1)
			alert('<%=msg%>');
			$(".l-window-close" ,window.parent.document).click();
		<%
	}else{ %>
	<%
	}
%>

var indexdata;
	var id='<%=request.getParameter("id")%>';
	var usertype='<%=request.getParameter("usertype")%>';
  	function check(){
  		if($("#regresp").val()=='0'){
  			alert('请选择审核结果！');	 
  			return false;
  		}
  		formsubmit();
  	}
  	
 
  	
  	$(function(){
	  	//创建表单结构 
	  	if(usertype=='mot'){
		  		 $.ajax({
					    type:"POST",
					    async:false,
					    data:{id:id},
					    url:"/jwr/motControl/getUserDetailAction.action",
					    success:function(returnValue){
					    	indexdata=eval("("+returnValue+")")[0];
					    }
					});
	  		       var ss=     $("#motResp").ligerForm({
	  		            	 inputWidth: 200, labelWidth: 120, space: 20,
	  		                 fields:[  
	  		                 { display: "用户ID", name: "user_id", newline: true,type:"text",readonly:true  }, 
	  		                 { display: "主管机关", name: "mot", newline: false,  type:"text",readonly:true},
	  		                 { display: "名称", name: "commonname", newline: true,  type:"text",readonly:true}, 
	  		                 { display: "证件号", name: "paperid", newline: false, type:"text", readonly:true},
	  		                 { display: "法人代表", name: "legalp", newline: true,type:"text", readonly:true}, 
	  		                 { display: "联系人姓名", name: "contact", newline: false,  readonly:true},
	  		                 { display: "手机", name: "mobiletelephone", newline: true,  readonly:true}, 
	  		                 { display: "联系人邮箱", name: "email", newline: false, readonly:true},
	  		                 { display: "联系电话", name: "telephonenumber", newline: true, readonly:true}, 
	  		                 { display: "传真", name: "fax", newline: false, readonly:true},
	  		                 { display: "初审结果", name: "regresp", newline: true, readonly:true}, 
	  		                 { display: "日期", name: "registerdate", newline: false, readonly:true}, 
	  		               	 { display: "操作权限", name: "isread", newline: true, readonly:true}, 
	  		                 { display: "可用/停用", name: "usable", newline: true, readonly:true} 
	  		                 ]
	  		            }); 
	  					ss.setData(indexdata);
	  					$("[name=mot]").val(getMotVal(indexdata.mot));
	  					$("[name=regresp]").val("同意");
	  					if( indexdata.isread!=''&&indexdata.isread=='1'){
	  						$("[name=isread]").val("仅可阅读");
	  					}else{
	  						$("[name=isread]").val("正常操作");
	  					}
	  					$("[name=usertype]").val("主管机关");
	  					if( indexdata.usable=='0'){
	  						$("[name=usable]").val("停用");
	  					}else{
	  						$("[name=usable]").val("可用");
	  					}
	  					
	  	}else  if(usertype=='en'){
	  		 	$.ajax({
				    type:"POST",
				    async:false,
				    data:{id:id},
				    url:"/jwr/motControl/getUserDetailAction.action",
				    success:function(returnValue){
				    	indexdata=eval("("+returnValue+")")[0];
				    }
				});
	  		 	var ss=     $("#motResp").ligerForm({
	  		            	 inputWidth: 200, labelWidth: 120, space: 20,
	  		                 fields:[  
								{ display: "用户ID", name: "user_id", newline: true,type:"text",readonly:true  }, 
								{ display: "主管机关", name: "mot", newline: false,  type:"text",readonly:true},
								{ display: "所在市", name: "city", newline: true,  type:"text",readonly:true},
								{ display: "名称", name: "commonname", newline: true,  type:"text",readonly:true}, 
								{ display: "证件号", name: "paperid", newline: false, type:"text", readonly:true},
								{ display: "法人代表", name: "legalp", newline: true,type:"text", readonly:true}, 
								{ display: "联系人姓名", name: "contact", newline: false,  readonly:true},
								{ display: "手机", name: "mobiletelephone", newline: true,  readonly:true}, 
								{ display: "联系人邮箱", name: "email", newline: false, readonly:true},
								{ display: "业务类型", name: "bustype", newline: true, readonly:true},
								{ display: "业务类别", name: "busclass", newline: false, readonly:true},
								{ display: "通讯地址", name: "address", newline: true, readonly:true},
								{ display: "联系电话", name: "telephonenumber", newline: false, readonly:true}, 
								{ display: "传真", name: "fax", newline: true, readonly:true},
								{ display: "初审结果", name: "regresp", newline: false, readonly:true}, 
								{ display: "日期", name: "registerdate", newline: true, readonly:true}, 
								 { display: "操作权限", name: "isread", newline: false, readonly:true}, 
								 { display: "用户类型", name: "usertype", newline: true, readonly:true}	
	  		                 ]
	  		            }); 
	  					ss.setData(indexdata);
	  					$("[name=mot]").val(getMotVal(indexdata.mot));
						$("[name=province]").val(getcomefromVal(indexdata.province));
						$("[name=city]").val(getcomefromValue(indexdata.city));
						$("[name=bustype]").val(getBusTypeVal(indexdata.bustype));
						$("[name=busclass]").val(getCelltype(indexdata.busclass));
	  					$("[name=regresp]").val("同意");
	  					if( indexdata.isread!=''&&indexdata.isread=='1'){
	  						$("[name=isread]").val("仅可阅读");
	  					}else{
	  						$("[name=isread]").val("正常操作");
	  					}
	  					$("[name=usertype]").val("企业");
	  					if( indexdata.usable=='0'){
	  						$("[name=usable]").val("停用");
	  					}else{
	  						$("[name=usable]").val("可用");
	  					}
	  	}else  if(usertype=='pn'){
	  		 $.ajax({
				    type:"POST",
				    async:false,
				    data:{id:id},
				    url:"/jwr/motControl/getUserDetailAction.action",
				    success:function(returnValue){
				    	indexdata=eval("("+returnValue+")")[0];
				    }
				}); 
	  				var ss=     $("#motResp").ligerForm({
	            	 inputWidth: 200, labelWidth: 120, space: 20,
	                 fields:[  
						{ display: "用户ID", name: "user_id", newline: true,type:"text",readonly:true  }, 
						{ display: "主管机关", name: "mot", newline: false,  type:"text",readonly:true},
						{ display: "所在市", name: "city", newline: true,  type:"text",readonly:true},
						{ display: "名称", name: "commonname", newline: true,  type:"text",readonly:true}, 
						{ display: "证件号", name: "paperid", newline: false, type:"text", readonly:true},
						{ display: "联系人姓名", name: "contact", newline: true,  readonly:true},
						{ display: "手机", name: "mobiletelephone", newline: false,  readonly:true}, 
						{ display: "联系人邮箱", name: "email", newline: true, readonly:true},
						{ display: "业务类型", name: "bustype", newline: false, readonly:true},
						{ display: "通讯地址", name: "address", newline: true, readonly:true},
						{ display: "联系电话", name: "telephonenumber", newline: false, readonly:true}, 
						{ display: "传真", name: "fax", newline: true, readonly:true},
						{ display: "初审结果", name: "regresp", newline: false, readonly:true}, 
						{ display: "日期", name: "registerdate", newline: true, readonly:true}, 
						 { display: "操作权限", name: "isread", newline: false, readonly:true}, 
						 { display: "用户类型", name: "usertype", newline: true, readonly:true}	
	                 ]
	            }); 
				ss.setData(indexdata);
				$("[name=mot]").val(getMotVal(indexdata.mot));
				$("[name=province]").val(getcomefromVal(indexdata.province));
				$("[name=city]").val(getcomefromValue(indexdata.city));
				$("[name=bustype]").val(getBusTypeVal(indexdata.bustype));
				$("[name=regresp]").val("同意");
				if( indexdata.isread!=''&&indexdata.isread=='1'){
					$("[name=isread]").val("仅可阅读");
				}else{
					$("[name=isread]").val("正常操作");
				}
				$("[name=usertype]").val("考评员");
					if( indexdata.usable=='0'){
						$("[name=usable]").val("停用");
					}else{
						$("[name=usable]").val("可用");
					}
		}else  if(usertype=='org'){
			 $.ajax({
				    type:"POST",
				    async:false,
				    data:{id:id},
				    url:"/jwr/motControl/getUserDetailAction.action",
				    success:function(returnValue){
				    	indexdata=eval("("+returnValue+")")[0];
				    }
				});   
			var ss=     $("#motResp").ligerForm({
	            	 inputWidth: 120, labelWidth: 120, space: 20,
	                 fields:[  
	                 { display: "用户ID", name: "user_id", newline: true,type:"text",readonly:true  }, 
	                 { display: "主管机关", name: "mot", newline: false,  type:"text",readonly:true},
	                 { display: "所在市", name: "city", newline: true,  type:"text",readonly:true},
	                 { display: "名称", name: "commonname", newline: true,  type:"text",readonly:true}, 
	                 { display: "证件号", name: "paperid", newline: false, type:"text", readonly:true},
	                 { display: "法人代表", name: "legalp", newline: true,type:"text", readonly:true}, 
	                 { display: "联系人姓名", name: "contact", newline: false,  readonly:true},
	                 { display: "手机", name: "mobiletelephone", newline: true,  readonly:true}, 
	                 { display: "联系人邮箱", name: "email", newline: false, readonly:true},
	                 { display: "业务类型", name: "bustype", newline: true, readonly:true},
	                 { display: "通讯地址", name: "address", newline: false, readonly:true},
	                 { display: "联系电话", name: "telephonenumber", newline: true, readonly:true}, 
	                 { display: "传真", name: "fax", newline: false, readonly:true},
	                 { display: "初审结果", name: "regresp", newline: true, readonly:true}, 
	                 { display: "日期", name: "registerdate", newline: false, readonly:true}, 
	               	 { display: "操作权限", name: "isread", newline: true, readonly:true}, 
	               	 { display: "用户类型", name: "usertype", newline: false, readonly:true}	                 
	                 ]
	            }); 
				ss.setData(indexdata);
				$("[name=mot]").val(getMotVal(indexdata.mot));
				$("[name=province]").val(getcomefromVal(indexdata.province));
				$("[name=city]").val(getcomefromValue(indexdata.city));
				$("[name=bustype]").val(getBusTypeVal(indexdata.bustype));
				$("[name=regresp]").val("同意");
			 
				if( indexdata.isread!=''&&indexdata.isread=='1'){
					$("[name=isread]").val("仅可阅读");
				}else{
					$("[name=isread]").val("正常操作");
				}
				$("[name=usertype]").val("考评机构");
				if( indexdata.usable=='0'){
					$("[name=usable]").val("停用");
				}else{
					$("[name=usable]").val("可用");
				}
				
		}
		 //给表单隐藏于 赋值 方便传参
		$("#userid").val(indexdata.user_id);
		$("#usertype").val(indexdata.usertype);
	  //动态拼接管理机关
		 $.ajax({
	  		    type:"POST",
	  		    async:false,
	  		    url:"/jwr/respInfo/getMotAction.action",
	  		    success:function(returnValue){
	  		   		var indexdata1=returnValue;
	  		   		var obj1=(eval("("+indexdata1+")")).Rows;
	  		   		var str="";
	  		   	    str='<SELECT id="user.mot" name="user.mot" value="indexdata.mot">';
	  		   		for(var i=0;i<obj1.length;i++){
	  		   			if(obj1[i].motcode==indexdata.mot){
	  		   				str+='<OPTION selected=true value='+obj1[i].motcode+'>'+obj1[i].motname+'</OPTION>';
	  		   			}else{
	  		   			str+='<OPTION   value='+obj1[i].motcode+'>'+obj1[i].motname+'</OPTION>';
	  		   			}
	  					
	  		   		}
	  		 
	  		   		  str+='</SELECT>';
	  		   		$("#sa").html(str);
	  		    }
	  		});
	 
  	});
  	function formsubmit(){
  		document.forms[0].action='<%=basePath%>motControl/updateUserAction.action'
  		document.forms[0].submit();
  	}
  
  </script>
	</head>
<body>
	 
	<br/>
	<%String commonnames=java.net.URLDecoder.decode(request.getParameter("commonname")==null?"":request.getParameter("commonname"), "UTF-8"); %>
	 <h2> 登录认证用户  :<%=commonnames%> </h2>
	
			<div style="margin:10px auto;"></div>

		<div id="motResp" style="margin: 0; padding: 0;width: 95%"></div>
		<div style="display: none;"></div>

	<form id="fm1" method="POST">
		<table style="margin-left: 30px">
			<caption style="padding: 5px">
				<h1>设置管理该用户</h1>
			</caption>
			<tbody>
				<tr>
				<input type="hidden" id="userid" name="user.user_id"/>
				<input type="hidden" id="usertype" name="user.usertype"/>
					<td
						style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray">
						<label>调整主管机关：</label>
					</td>
					<td style="border-bottom:1px dotted gray" id="sa">
						
					</td>
				</tr>
				<tr>
					<td
						style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>可用/停用：</label></td>
					<td style="border-bottom:1px dotted gray">
						<select id="user.usable" name="user.usable" >
							<s:if test="user.usable=0">
								<option selected value="0">&nbsp; 停用 &nbsp;</option>
								<option value="1">&nbsp; 可用 &nbsp;</option>
							</s:if>
							<s:elseif test="user.usable=1">
								<option value="0">&nbsp; 停用 &nbsp;</option>
								<option selected value="1">&nbsp; 可用 &nbsp;</option>
							</s:elseif>
							<s:else>
								<option value="0">&nbsp; 停用 &nbsp;</option>
								<option selected value="1">&nbsp; 可用 &nbsp;</option>
							</s:else>
						</select>
					</td>
				</tr>
				<tr>
					<td
						style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray">
						<label>操作/只读：</label>
					</td>
					<td style="border-bottom:1px dotted gray">
						<select id="user.isread" name="user.isread" value="0">
								<option value="0">正常操作</option>
								<option value="1">仅可查阅</option>
						</select>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td align="center" colspan="3" style="padding: 15px">
					<a class="easyui-linkbutton l-btn" href="javascript:void(0)"
						onclick="formsubmit()" >
						<span class="l-btn-left">
						<span class="l-btn-text">提交</span></span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a class="easyui-linkbutton l-btn" href="javascript:void(0)" iconcls="icon-undo"
						onclick="$('#fm1').get(0).reset()" id="undefined"><span
							class="l-btn-left"><span class="l-btn-text icon-undo"
								style="padding-left: 20px;">重置</span></span></a></td>
				</tr>
			</tfoot>
		</table>
	</form>
</body>
</html>

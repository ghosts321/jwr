<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="main.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>
		  考评员报名申请详细信息
		</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">	
  <script type="text/javascript">
<%String   msg=request.getAttribute("msg")==null?"":request.getAttribute("msg").toString();
	if(msg.equals("yes")){
		%>
		alert("提交成功，窗口将关闭");
		 window.parent.iniData("pnGrid");
		 window.parent.ligerwindow.close();
		 <%
	}else if(msg!=null&&!msg.equals("yes")&&!msg.equals("")){
		%>
			alert('<%=msg%>');
			window.parent.ligerwindow.close();
		<%
	}else{%>
		var indexdata=${js};
	<%
	}
%>
  
  		
  	function check213(){
  		var dsd=document.getElementById('regrespremark').value;
  		if($("#regresp").val()=='0'){
  			$.ligerDialog.error('请选择审核结果！');	 
  			return false;
  		}
  		if(dsd.length>800){
  			alert("初审意见字数不能超过800个，已输入"+dsd.length+"个字!");
  			return false;
  		}
  		formsubmit();
  		
  	}
  	function formsubmit(){
  		document.getElementById("motForm1").submit();
  	}
  	var comefrom =indexdata.comefrom;
  	$(function(){
  	//创建表单结构 
  		       var ss=     $("#motResp").ligerForm({
  		            	 inputWidth: 250, labelWidth: 190, space: 10,
  		                 fields:[  
  		                 { display: "用户ID", name: "userid", newline: true,type:"text",disabled:true  }, 
  		                 { display: "名称", name: "username", newline: false, type:"text", disabled:true},
  		                 { display: "主管机关", name: "admin", newline: true,  type:"text",disabled:true},
  		                 { display: "证件号", name: "pid", newline: false,type:"text", disabled:true},
  		                 { display: "日期", name: "cdate", newline: true, disabled:true},
  		                 { display: "所属市", name: "city", newline: false,  type:"text",disabled:true},
  		                 { display: "业务类型", name: "type", newline: true, disabled:true},
  		                 { display: "单位组织", name: "org", newline: false,  disabled:true}, 
  		                 { display: "通讯地址", name: "address", newline: true, disabled:true},
  		                 { display: "邮编", name: "pcode", newline: false, disabled:true}, 
  		                 { display: "手机", name: "mobile", newline: true, disabled:true},
  		                 { display: "联系人邮箱", name: "email", newline: false, disabled:true}, 
  		               	 { display: "文化程度", name: "edu", newline: true, disabled:true}, 
  		                 { display: "所学专业", name: "major", newline: false, disabled:true}, 
  		                 { display: "现从事专业", name: "prof", newline: true, disabled:true}, 
  		                 { display: "相关专业从业年份", name: "begindate", newline: false, disabled:true},
  		                 { display: "身份证明文件", name: "proof", newline: true, disabled:true},
  		                 { display: "身份证明文件（背面）", name: "proofb", newline: false, disabled:true},
  		                 { display: "学历证明文件", name: "proof2", newline: true, disabled:true},
  		                 { display: "照片", name: "photo", newline: false,  disabled:true},
  		                 { display: "主要学习（培训）经历", name: "train", newline: true,disabled:true,type:"textarea"},
  		               	 { display: "主要工作简历", name: "resume", newline: false, disabled:true,type:"textarea"},
  		                 { display: "专业工作业绩", name: "perf", newline: true, disabled:true,type:"textarea"}
  		                 ]
  		            });
  		    		 
	     		  
  					ss.setData(indexdata);
  					$("[name=admin]").val(getMotVal(indexdata.admin));
  		     	 	$("[name=type]").val(getBusTypeVal(indexdata.type));
  		     	 	$("[name=comefrom]").val(getcomefromVal(indexdata.comefrom));
  		     	 	$("[name=city]").val(getcomefromValue(indexdata.city));
  		     	 	initAttachment('proof,proofb,proof2,photo');
  					document.getElementById("motForm1").action="<%=basePath%>mot/pnRegRespUpdateAction.action?pid="+indexdata.id;
  					$("#regrespremark").text(indexdata.regrespremark);
  					if (indexdata.regresp==1) {
						$("#button").hide();
						$("#button1").show();
					}
  					$("#train").attr("disabled","disabled");
  					$("#resume").attr("disabled","disabled");
  					$("#perf").attr("disabled","disabled");
  	});
  	
  </script>
	</head>
<body style="overflow: hidden;">
	<center style="border: 1px solid #369">
		<h1 style="padding:20px; background-color:#369; color: white; font-size: 22px; margin-top:0px">考评员报名申请初审</h1>
			<div id="motResp" style="margin: 0; padding: 5"></div>
			
	</center>
	<br/>
	<form method="post" id="motForm1" action="/jwr/mot/pnRegRespUpdateAction.action">
		<table cellspacing="5">
			<tr>
				<td>
					初审意见:
			    </td>
			    <td>
			    			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    				 
			    	<textarea    id="regrespremark"   name="pnRegInfo.regrespremark"  style="width: 400px;"></textarea>
			    </td>
			</tr>
			<tr>
				<td>
					初审结果:
			   </td>
				<td>
				 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select id="regresp"  name="pnRegInfo.regresp" value="0">
						<script type="text/javascript">
						 if(indexdata.regresp==null||indexdata.regresp=='0'||indexdata.regresp==''){
							 $("#regresp").append("<option value='0'  selected='selected'>尚未处理</option> <option value='1'>同意</option> <option value='2'>不同意</option>");
						 }else if(indexdata.regresp!=null&&indexdata.regresp=='1'){
							 $("#regresp").append("<option value='1'  selected='selected'>同意</option>");
						 }else if(indexdata.regresp!=null&&indexdata.regresp=='2'){
							 $("#regresp").append("<option value='2'  selected='selected'>不同意</option>");
						 } 
						</script>
					</select>
				</td>
			</tr>
			
		</table>
				<center>
					 <input type="button" id="button" class="button blue" value="提交" onclick="check213();" style="width: 50;height: 20"/>
					 <input type="button" id="button1" class="button blue" value="关闭" onclick="javascript:window.parent.ligerwindow.close();" style="width: 50;height: 20;display: none;"/>
				</center>
	</div>
	<div id="popupContact" align="center" >
		<a id="popupContactClose">x</a>
		<p id="contactArea">
			<img id="img0" src=""/>
		</p>
	</div>
	</form>
</body>
</html>

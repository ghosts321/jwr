<%@ page language="java" import="java.util.*,com.wr4.domain.OrgInfo" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>
<%
	String userid = request.getParameter("userid");
	String bustype = request.getParameter("type");
	String certnumber=request.getParameter("certnumber");
	request.setAttribute("certnumber", certnumber);
	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP 'pntail.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript">
var ligerwindow;
var indexdata = "";
	//换证申请
	/* function changeBook(){
		var id=indexdata.id;
		
		ligerwindow=$.ligerDialog.open({
    		url:'JSP/org/org/changeBook.jsp?id='+id+'&certnumber=${certnumber }',
	     	width:400,
	     	height:340
	 	});
   ;
	} */
	
	$(function() {
			var totalSize = "";
			var selValue=$("#certnumber").val();
			 $.ajax({
					    type:"POST",
					    async:false,
					    url:"/jwr/bookChange/getBookDetailListAction.action",
					    data:{'certnumber':selValue},
					    success:function(returnValue){
					    	 indexdata=eval("("+returnValue+")").Rows[0];
							indexdata.userType="考评机构";
							if(indexdata.grade=='2'){
								indexdata.grade='二级';
							}else if(indexdata.grade=='3'){
								indexdata.grade='三级';
							}
							if(indexdata.renew=='1'){
					    		indexdata.renew='考评员：资格证书到期';
					    	}else if(indexdata.renew=='2'){
					    		indexdata.renew='考评员：户籍所在地或常住地发生省际间变更';
					    	}else if(indexdata.renew=='3'){
					    		indexdata.renew='企业：达标等级证书到期';
					    	}else if(indexdata.renew=='4'){
					    		indexdata.renew='考评机构：资质证书到期';
					    	}else{
					    		indexdata.renew='无';
					    	}
							indexdata.province=getcomefromVal(indexdata.province);
							indexdata.city=getcomefromValue(indexdata.city);
					    }
					});
			 
			 
			 var ss= $("#motResp").ligerForm({
	           	 inputWidth:200, labelWidth: 180, space:10,
	           	appendID: true,
	                fields:[  
	                { display: "用户ID", name: "userId", newline: true,type:"text",disabled:true}, 
	                { display: "主管机关", name: "orgname", newline: false,  type:"text",disabled:true},
	                { display: "所在市", name: "city", newline: true,  type:"text",disabled:true}, 
	                { display: "名称", name: "motname", newline: true, type:"text", disabled:true},
	                { display: "证件号", name: "pid", newline: false,  disabled:true}, 
	                { display: "法人代表", name: "legalp", newline: true,  disabled:true}, 
	                { display: "联系人姓名", name: "contact", newline: false,  disabled:true}, 
	                { display: "手机", name: "mobile", newline: true, disabled:true},
	                { display: "联系人邮箱", name: "email", newline: false, disabled:true}, 
	                { display: "等级", name: "grade", newline: true, disabled:true},
	                { display: "业务类型", name: "typename", newline: false, disabled:true},
	                { display: "专职考评员人数", name: "pnumber", newline: true, disabled:true},
	                { display: "高级技术职称考评员人数", name: "pnumber2", newline: false, disabled:true},
	                { display: "开始从事相应业务年份", name: "startdate", newline: true, disabled:true},
	                { display: "通讯地址", name: "address", newline: false, disabled:true},
	                { display: "邮编", name: "pcode", newline: true, disabled:true},
	                { display: "联系电话", name: "tel", newline: false, disabled:true},
	                { display: "考评管理制度", name: "man", newline: true, disabled:true},
	                { display: "传真号码", name: "fax", newline: false, disabled:true},
	                { display: "其他材料", name: "orher", newline: true, disabled:true},
	                { display: " 换证原因", name: "renew", newline: false, disabled:true},
	                { display: "专职考评员聘用证明与职称证明", name: "pns", newline: true, disabled:true},
	                { display: "发证时间", name: "cdate", newline: false, disabled:true},
	                { display: "单位基本情况相关材料", name: "met", newline: true, disabled:true},
	                { display: "受理结果", name: "resp", newline: false, disabled:true},
	                { display: "受理日期", name: "respdate", newline: true, disabled:true},
	                { display: "日期", name: "createdate", newline: false, disabled:true},
	                { display: "备注", name: "remark", newline: true, disabled:true},
	                { display: "用户类型", name: "userType", newline: false, disabled:true},
	                { display: "处理意见", name: "advice", newline: true, disabled:true,type:"textarea"}
	               
	                
	                ]
	           });
			ss.setData(indexdata);
			initAttachment('met,pns,man,orher');
			$("#advice").attr("disabled","disabled");
	})
	function changeBook(){
		var id=indexdata.id;
		var certnumber=$("#certnumber").val();
		var reason=$("#reason").val();
		if(reason.length>30){
			alert("换证原因字数不能超过30个，已输入"+reason.length+"个字!");
  			return false;
		}
		 $.ajax({
			    type:"POST",
			    async:false,
			    url:"/jwr/bookChange/updateReasonAction.action",
			    data:{'id':id,'reason':reason,certnumber:certnumber},
			    success:function(returnValue){
			    	if(returnValue=='0'){
			    		alert("更新失败");
			    	}else{
			    		alert("已提交，页面即将关闭");
			    		window.parent.gird.reload();
			    		window.parent.gird1.reload();
			    		window.parent.ligerwindow.close();
			    	}
			    }
			});
	}
</script>
</head>
<body  style="width: 100%;height: 100%">
	<input id="certnumber" value="${certnumber }" type="hidden"/>
	<input id="id" value="${id }" type="hidden"/>
	
	<center style="border: 1px solid #369">
		<h1 style="padding:20px; background-color:#369; color: white; font-size: 22px; margin-top:0px">考评机构等级证书申请详情</h1>
		
	</center>
		<div id="motResp" style="margin: 3; padding: 0;width: 95%"></div>
	<br/>
	
	<!-- <center><A id=undefined class="easyui-linkbutton l-btn" onclick="changeBook();" href="javascript:void(0)">
	<SPAN class=l-btn-left><SPAN class=l-btn-text>申请换证</SPAN></SPAN></A>
		 </center> -->
	
	<div style="margin-top: 10px"></div>换证原因:
		<textarea rows="20" cols="100" id="reason" name="reason" style="width: 800px;  margin-left: 10px;"></textarea>
	<div align="center" style="padding-top: 10px;">
		<button onclick="changeBook()" style="height: 30px;">提交换证申请</button>
	</div>
</body>
</html>

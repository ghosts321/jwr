<%@ page language="java" import="java.net.*" pageEncoding="UTF-8"%>
<%
String indexdata = URLDecoder.decode(request.getParameter("indexdata"), "UTF-8");
%>
<%@ include file="../../main.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
  <script type="text/javascript">
  var indexdata='<%=indexdata%>';
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
  if(indexdata.grade=='2'){
	  indexdata.grade='二级';
  }else if(indexdata.grade=='3'){
	  indexdata.grade='三级';
  }
  var sorg =indexdata.orgId1;
  if(sorg==null||sorg==''||sorg=='undefined'){
	  sorg =indexdata.orgid1;
  }
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
           	 inputWidth:220, labelWidth: 120, space: 20,
           	appendID: true,
                fields:[  
                { display: "用户ID", name: "userId", newline: true,type:"text",disabled:true}, 
                { display: "主管机关", name: "adminMotName", newline: false,  type:"text",disabled:true},
                { display: "所在市", name: "city", newline: true,  type:"text",disabled:true}, 
                { display: "名称", name: "enname", newline: false, type:"text", disabled:true},
                { display: "证件号", name: "cid", newline: true,  disabled:true}, 
                { display: "法人代表", name: "legalp", newline: false,  disabled:true}, 
                { display: "联系人姓名", name: "contact", newline: true,  disabled:true}, 
                { display: "手机", name: "mobile", newline: false, disabled:true},
                { display: "联系人邮箱", name: "email", newline: true, disabled:true}, 
                { display: "等级", name: "grade", newline: false, disabled:true},
                { display: "业务类型", name: "uppername", newline: true, disabled:true},
                { display: "业务类别", name: "filetext", newline: false, disabled:true},
                { display: "通讯地址", name: "address", newline: true, disabled:true},
                { display: "联系电话", name: "tel", newline: false, disabled:true},
                { display: "传真", name: "tax", newline: true, disabled:true},
                { display: "安全生产组织框架", name: "safe", newline: false, disabled:true},
                { display: "企业法人资格证件", name: "qual", newline: true, disabled:true},
                { display: "经营许可证", name: "license", newline: false, disabled:true},
                { display: "标准化达标自评报告", name: "zpreport", newline: true, disabled:true},
                { display: "换证原因", name: "reNew", newline: false, disabled:true},
                { display: "指定的考评机构", name: "orgid1", newline: true ,type:"select",options: { readonly : true ,valueField: "id1",textField:"name",data:sorgData} },
                { display: "日期", name: "date", newline: false, disabled:true},
                { display: "用户类型", name: "usertype", newline: true, disabled:true},
                { display: "考评意见", name: "orgadvice", newline: true, disabled:true},
                { display: "考评结果", name: "orgresult", newline: false, disabled:true},
                { display: "考评日期", name: "orgadvice", newline: true, disabled:true} ,
                { display: "", name: "id",type:"hidden"}
                ]
           });
		ss.setData(indexdata);
		$("input[name='usertype']").val("企业") ;
  	});
  
  </script>
	</head>
<body>
	<center style="border: 1px solid #369">
		<h1 style="padding:20px; background-color:#369; color: white; font-size: 22px; margin-top:0px">企业达标等级证书申请详情</h1>
		
	</center>
		<div id="motResp" style="margin: 3; padding: 0"></div>
	<br/>
</body>
</html>
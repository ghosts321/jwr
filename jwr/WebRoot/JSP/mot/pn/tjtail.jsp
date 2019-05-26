<%@ page language="java" import="java.util.*,java.net.*" pageEncoding="UTF-8"%>
<%@include file="../../main.jsp"  %>
<%
	String certnumber=request.getParameter("certnumber");
	request.setAttribute("certnumber", certnumber);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>My JSP 'pntail.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript" charset="UTF-8">
	$(function() {
		var indexdata = "",totalSize="",certnumber="",userid="",url="",bussinestype="";
		certnumber = $("#certnumber").val();
		$.ajax({
			type : "POST",
			async : false,
			url : "/jwr/motpn/pnTailAction.action?pnInfo.certnumber="+certnumber,
			success : function(returnValue) {
				indexdata = returnValue;
				indexdata = eval("("+indexdata+")");
			}
		});
		if(indexdata.Rows[0].auditresp=="0"){
			indexdata.Rows[0].auditresp="尚未处理";
		}else if(indexdata.Rows[0].auditresp=="1"){
			indexdata.Rows[0].auditresp="同意";
		}else if(indexdata.Rows[0].auditresp=="2"){
			indexdata.Rows[0].auditresp="不同意";
		}
		 var ss= $("#applyAccept").ligerForm({
            	 inputWidth:120, labelWidth: 90, space: 20,
                 fields:[  
                 { display: "用户ID", name: "userId", newline: true,type:"text",disabled:true  }, 
                 { display: "主管机关", name: "adminmot", newline: false,  type:"text",disabled:true},
                 { display: "名称", name: "pnname", newline: true,  type:"text",disabled:true}, 
                 { display: "证件号", name: "pid", newline: false, type:"text", disabled:true,inputWidth:120},
                 { display: "常住地", name: "fromaddress", newline: true,  disabled:true}, 
                 { display: "所在市", name: "city", newline: false,  disabled:true}, 
              	 { display: "单位组织", name: "org", newline: true,  disabled:true}, 
              	 { display: "通讯地址", name: "address", newline: false,  disabled:true}, 
              	 { display: "手机", name: "mobile", newline: true, disabled:true},
              	 { display: "业务类型", name: "bussinestype", newline: false, disabled:true},
                 { display: "日期", name: "createdate", newline: true,  disabled:true}, 
                 { display: "发证时间", name: "fzdate", newline: false, disabled:true},
                 { display: "文化程度                ", name: "edu", newline: true, disabled:true},
                 { display: "证书号", name: "cid", newline: false, disabled:true},
              	 { display: "受理结果", name: "auditresp", newline: true, disabled:true},
              	 { display: "受理日期", name: "auditdate", newline: false, disabled:true} ]
            });
       		 ss.setData(indexdata.Rows[0]);
        	 $("[name=bussinestype]").val(getBusTypeVal(indexdata.Rows[0].bussinestype));
        	 $("[name=adminmot]").val(getMotVal(indexdata.Rows[0].adminmot));
        	 $("[name=fromaddress]").val(getcomefromVal(indexdata.Rows[0].fromaddress));
        	 $("[name=city]").val(getcomefromValue(indexdata.Rows[0].city));
	});
</script>
</head>
<body>
<div id="applyAccept" style="margin: 5 3 3 30; padding: 0;width: 95%"></div>
	<input type="hidden" id="certnumber" value="<%=certnumber%>">
	
</body>
</html>

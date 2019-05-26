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

<script type="text/javascript" charset="UTF-8">
	var indexdata = window.parent.postdata;

	 $(function() {
		detial(1,indexdata);
	}); 
	function detial(flag,indexdata){
		indexdata=eval("("+indexdata+")");
		var ss;
	 
			indexdata.bussinestype = getBusTypeVal(indexdata.bussinestype)==null?indexdata.bustype:getBusTypeVal(indexdata.bussinestype);
			indexdata.adminmot = getMotVal(indexdata.adminmot)==null?indexdata.adminmot:getMotVal(indexdata.adminmot);
			if (indexdata.results==0) {
				indexdata.results="尚未处理";
			}else if(indexdata.results==1){
				indexdata.results="同意";
			}else if(indexdata.results==2){
				indexdata.results="不同意";
			}
			ss=$("#motResp").ligerForm({
	         	 inputWidth:120, labelWidth: 90, space: 20,
	              fields:[  
	              { display: "用户ID", name: "userid", newline: true,type:"text",disabled:true  }, 
	              { display: "主管机关", name: "adminmot", newline: false,  type:"text",disabled:true},
	              { display: "名称", name: "pnname", newline: false,  type:"text",disabled:true}, 
	              { display: "证件号", name: "pid", newline: true, type:"text", disabled:true,inputWidth:120},
	              { display: "常住地", name: "fromaddress", newline: false, type:"text", disabled:true,inputWidth:120},
	              { display: "所在市", name: "city", newline: false, type:"text", disabled:true}, 
	              { display: "受理结果", name: "respReg", newline: true,  disabled:true}, 
	              { display: "单位组织", name: "org", newline: false, type:"text", disabled:true}, 
	              { display: "职称", name: "title", newline: false,  disabled:true}, 
	              { display: "通讯地址", name: "address", newline: true,  disabled:true}, 
	              { display: "邮编", name: "pcode", newline: false,  disabled:true}, 
	              { display: "联系电话", name: "tel", newline: false, disabled:true}, 
	              { display: "传真", name: "fax", newline: true, disabled:true},
	              { display: "手机", name: "mobile", newline: false,  disabled:true}, 
	              { display: "联系人邮箱", name: "email", newline: false, disabled:true},
	              { display: "文化程度", name: "edu", newline: true, disabled:true},
	              { display: "所学专业", name: "major", newline: false, disabled:true},
	              { display: "专业从业年份", name: "begindate", newline: false,  disabled:true},
	              { display: "业务类型", name: "bussinestype", newline: true,  disabled:true}, 
	              { display: "受理日期", name: "auditdate", newline: false, disabled:true},
	              { display: "换证原因", name: "changereason", newline: false,  disabled:true}, 
	              { display: "直接颁发", name: "pass_direct", newline: true,  disabled:true}, 
	              { display: "培训结束日期", name: "train_end", newline: false,  disabled:true}, 
	              { display: "日期", name: "createdate", newline: false,  disabled:true}, 
	              { display: "专兼职", name: "parttime", newline: true,  disabled:true}, 
	              { display: "发证时间", name: "fzdate", newline: false,  disabled:true}, 
	              { display: "培训开始日期", name: "train_start", newline: false,  disabled:true}, 
	              { display: "聘用日期", name: "employdate", newline: true,  disabled:true}, 
	              { display: "解聘日期", name: "unemploydate", newline: false,  disabled:true}, 
	              { display: "处理意见", name: "advice", newline: false,  disabled:true}, 
	              { display: "培训学时", name: "train_hour", newline: true,  disabled:true}, 
	              { display: "考试分数", name: "exam_score", newline: false,  disabled:true}, 
	              { display: "证书号", name: "cid", newline: false,  disabled:true}, 
	              { display: "所属考评机构", name: "attrorg", newline: true,  disabled:true}, 
	              { display: "培训合格证号", name: "train_id", newline: false,  disabled:true}, 
	              { display: "考试日期", name: "exam_date", newline: false,  disabled:true}, 
	              { display: "照片", name: "photo", newline: true, type:"text", disabled:true},
	              { display: "学习/培训经历", name: "train", newline: true,  disabled:true,type:"textarea"}, 
	              { display: "主要工作简历", name: "workdoc", newline: false,  disabled:true,type:"textarea"}, 
	              { display: "专业工作业绩", name: "perf", newline: false,  disabled:true,type:"textarea"}
	           
	              ]
	         });
		ss.setData(indexdata);
		initAttachment('photo');
		$("[name=fromaddress]").val(getcomefromVal(indexdata.fromaddress));
		$("[name=city]").val(getcomefromValue(indexdata.city));
		/* $("input[name='photo']").parent().parent().parent() .append(" <li><a href='javascript:chakan()'>查看</a></li> ") ; */
		$("#train").attr("disabled","disabled");
		$("#workdoc").attr("disabled","disabled");
		$("#perf").attr("disabled","disabled");
	}
</script>
</head>
<body style="height: 370px;">
 
	<div id="motResp" style="width: 95%"></div>
	 
</body>
</html>

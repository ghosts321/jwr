<%@ page language="java" import="java.net.*" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
  <script type="text/javascript">
  var indexdata=window.parent.postdata;
  indexdata = eval("("+indexdata+")");
  indexdata.type = getBusTypeVal(indexdata.type);
  if(indexdata.grade=='2'){
	  indexdata.grade='二级';
  }else if(indexdata.grade=='3'){
	  indexdata.grade='三级';
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
           	 inputWidth:200, labelWidth: 120, space: 20,
           	appendID: true,
                fields:[  
                { display: "用户ID", name: "userId", newline: true,type:"text",disabled:true}, 
                { display: "主管机关", name: "adminMotName", newline: false,  type:"text",disabled:true},
                { display: "名称", name: "enname", newline: true, type:"text", disabled:true},
                { display: "所在市", name: "city", newline: false,  type:"text",disabled:true}, 
                { display: "日期", name: "date", newline: true, disabled:true},
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
                { display: "换证原因", name: "reNew", newline: true, disabled:true},
                { display: "指定的考评机构", name: "orgId1", newline: false ,disabled:true},
                { display: "安全生产组织框架", name: "safe", newline: true, disabled:true},
                { display: "企业法人资格证件", name: "qual", newline: false, disabled:true},
                { display: "经营许可证", name: "license", newline: true, disabled:true},
                { display: "标准化达标自评报告", name: "zpreport", newline: false, disabled:true},
                { display: "处理意见", name: "advice", newline: true, disabled:true,type:"textarea"},
                { display: "备注", name: "comment", newline: false, disabled:true,type:"textarea"},
                { display: "", name: "id",type:"hidden"}
                ]
           }); 
			ss.setData(indexdata);
			$("[name=province]").val(getcomefromVal(indexdata.province));
			$("[name=city]").val(getcomefromValue(indexdata.city));
			initAttachment('safe,qual,license,zpreport');
			$("input[name='usertype']").val("企业") ;
			$("input[name='orgId1']").val(sorgData[0].name) ;
			$("[name=reNew]").val(getChangeReason(indexdata.reNew));
			$("#advice").attr("disabled","disabled");
			$("#comment").attr("disabled","disabled");
  	});
  	
  </script>
	</head>
<body style="width: 100%;height: 100%">
	<center style="border: 1px solid #369">
		<h1 style="padding:20px; background-color:#369; color: white; font-size: 22px; margin-top:0px">企业达标等级证书申请详情</h1>
		
	</center>
		<div id="motResp" style="margin: 3; padding: 0;width: 700"></div>
	<br/>
	<div id="popupContact" align="center" >
		<a id="popupContactClose">x</a>
		<p id="contactArea">
			<img id="img0" src=""/>
		</p>
	</div>
</body>
</html>
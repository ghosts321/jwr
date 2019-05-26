<%@ page language="java" import="java.util.*,java.net.*" pageEncoding="UTF-8"%>
<%@include file="../../main.jsp"  %>
<%
String certnumber=request.getParameter("certnumber");
request.setAttribute("certnumber", certnumber);

String enUserid=request.getParameter("enUserid");
request.setAttribute("enUserid", enUserid);

String applyId=request.getParameter("applyId");
request.setAttribute("applyId", applyId);

String respReview=request.getParameter("respReview");
String enBusType=request.getParameter("enBusType");
request.setAttribute("respReview", respReview);
request.setAttribute("enBusType", enBusType);

String resp=request.getParameter("resp").toString();
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
var resultData = "";
var score;
var grade;
var sum;
var type;

var cardNo='';
var indexdata="";

$(function() {
	//此处为什么增加受理结果为同意的 不显示
	if('<%=resp%>'=='1'){
		//$("#hidn").hide();
	}
	var enUserid=$("#enUserid").val();
	var respReview=$("#respReview").val();
	var enBusType=$("#enBusType").val();
	var applyId=$("#applyId").val();
	 var sorg;
	$.ajax({
		type : "POST",
		async : false,
		url : "/jwr/respInfo/getEnDetailAction.action?enUserid="+enUserid+"&respReview="+respReview+"&enBusType="+enBusType+"&applyId="+applyId,
		success : function(returnValue) {
			indexdata = eval("("+returnValue+")")[0];
// 			indexdata.userType="企业";
				//alert(returnValue)
				  sorg =indexdata.orgid1;
		}
	});
	var apporg =indexdata.apporg;
	  var appData;
	  $.ajax({
		    type:"POST",
		    async:false,
		    url: "/jwr/enControl/getAppOrgNameAction.action?orgid1="+apporg,
		    success:function(returnValue){
		    	appData=returnValue;
		    }
		});
	 
	 var ss= $("#motResp").ligerForm({
       	 inputWidth:200, labelWidth: 190, space: 10,
       	appendID: true,
            fields:[  
            { display: "用户ID", name: "userid", newline: true,type:"text",disabled:true}, 
            { display: "主管机关", name: "adminmot", newline: false,  type:"text",disabled:true},
            { display: "所在市", name: "city", newline: true,  type:"text",disabled:true}, 
            { display: "名称", name: "enname", newline: true, type:"text", disabled:true},
            { display: "证件号", name: "pid", newline: false,  disabled:true}, 
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
            
            { display: "换证原因", name: "renew", newline: true, disabled:true},
            { display: "选择的两个考评机构", name: "orgid", newline: false, disabled:true},

            { display: "日期", name: "createdate", newline: true, disabled:true},
            { display: "考评结果", name: "kpresult", newline: false, disabled:true},
            { display: "指定的考评机构", name: "orgid1", newline: true, disabled:true},
            { display: "自评分数", name: "selfScore", newline: false, disabled:true},
            { display: "考评分数", name: "kaoScore", newline: true, disabled:true},
            { display: "考评日期", name: "kpdate", newline: false, disabled:true},
            { display: "考评意见", name: "kpadvice", newline: true, disabled:true},
            { display: "受理结果", name: "slresult", newline: false, disabled:true},
            
            { display: "用户类型", name: "", newline: true, disabled:true,
            	render: function (item)
                {
           		 return "企业";
                } 
            },
            
            { display: "受理日期", name: "sldate", newline: true, disabled:true}
            ]
       });
	ss.setData(indexdata);
	$("[name=bustype]").val(getBusTypeVal(indexdata.bustype));
    $("[name=adminmot]").val(getMotVal(indexdata.adminmot));
    $("[name=province]").val(getcomefromVal(indexdata.province));
    $("[name=city]").val(getcomefromValue(indexdata.city));
    $("[name=type2]").val(getCelltype(indexdata.type2));
   	$("#nas").text(indexdata.enname);
   	$("[name=renew]").val(getChangeReason(indexdata.renew));
	if(indexdata.grade=="2"){
		$("[name=grade]").val("二级");
	}else if(indexdata.grade=="3"){
		$("[name=grade]").val("三级");
	}
	if(indexdata.slresult=="0"){
		$("[name=slresult]").val("拒绝");
	}else if(indexdata.slresult=="1"){
		$("[name=slresult]").val("同意");
	}
	 $("[name=orgid]").val(appData);        
	  var sorgData;
	  $.ajax({
		    type:"POST",
		    async:false,
		    url: "/jwr/enControl/getOrgNameAction.action?orgid1="+sorg,
		    success:function(returnValue){
		    	sorgData=eval("("+returnValue+")");
		    }
		});
	 
	  var str="";
	  //str='<SELECT id="org.orgid1" name="orgid1">';
	  for(var i=0;i<sorgData.length;i++){
		 if(i== sorgData.length-1){
			 str+=sorgData[i].name;
		 }else{
			 str+=sorgData[i].name+",";
		 }
	  }	
	   		//  str+='</SELECT>';
	   		$("[name=orgid1]").val(str);
	   		//indexdata.orgid=str;
	 
});

var isBol='0',ligerwindow;

//打分
function scr(){
	var busClass=indexdata.type2;
	var grade=indexdata.grade;
	var id=indexdata.id;
	ligerwindow=$.ligerDialog.open({
        	url:'JSP/org/resp/enDbzpAdd.jsp?type='+busClass+'&applyid='+id+'&grade='+grade,
        	width:1000,
        	height:6500,
        	title:"企业考评打分"
    	});
	   ;
   }

//考评员选择
function pnSel(){
	var adminmot=indexdata.adminmot;
	var enname=encodeURI(encodeURI(indexdata.enname,'utf-8'));
	ligerwindow=$.ligerDialog.open({
    	url:'JSP/org/resp/pnSel.jsp?adminmot='+adminmot+'&enname='+enname,
    	width:1000,
    	height:600,
    	title:"考评员选择"
	});
   ;
}		

	// 同意
function agree(flagType){
// 	if(flagType=='1'){
	
		var adviceText=$("#adviceText").html();
		var adv=$("#adviceText").val();
		if(adv.length>800){
			alert("填写意见字数不能超过800个，已输入"+adv.length+"个字!");
  			return false;
		}
		var type2=indexdata.type2;
		var pid=indexdata.pid;
		var grade=indexdata.grade;
		var applyId=$("#applyId").val();
		
		if(cardNo==''){
			alert('请选择考评员');
			return;
		}
		if(sum==''||score==''){
			alert('请评分后提交');
			return;
		}
		$.ajax({
			type : "POST",
			async : false,
			url : "/jwr/respInfo/saveAdviceAction.action",
			data:{'flagType':flagType,'applyId':applyId,'adviceText':adv,'cardNo':cardNo,'pid':pid,'type2':type2,'grade':grade,'sum':sum,'score':score,'type':type},
			success : function(returnValue) {
				if(returnValue=='ok'){
					alert("已提交,企业达标等级证书申请处理结果!");
					window.parent.gird2.reload();
					window.parent.ligerwindow.close();
				}else{
					alert("操作失败，请与管理员联系!");
				}
			}
		});
// 	}else if(flagType=='2'){
// 		if (confirm("确认取消评分吗？")) {
// 			window.parent.ligerwindow.close();
// 	    }
// 	}
	
}
function showPn(pnStr){
	$("#pnnames").html(pnStr);
}

</script>
</head>
<body>
<input type="hidden" id="cid" value="${cid }"/>
<input type="hidden" id="applyId" value="${applyId }"/>
<input type="hidden" id="enUserid" value="${enUserid }"/>
<input type="hidden" id="respReview" value="${respReview }"/>
<input type="hidden" id="enBusType" value="${enBusType }"/>

	<center style="border: 1px solid #369">
		<h1 style="padding:20px; background-color:#369; color: white; font-size: 22px; margin-top:0px">交通运输企业申请--<span id="nas"></span></h1>
		
	</center>
		<div id="motResp" style="margin: 3; padding: 0"></div>
	<br/>
	
	<div id="hidn">
		<LABEL>第一步：</LABEL>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button id='' class="easyui-linkbutton l-btn" onclick="pnSel()" style="padding-top: 5"
			target=_blank><SPAN class=l-btn-left><SPAN
				class=l-btn-text>考评员选择</SPAN></SPAN></button> <div id="pnnames" style="padding-left: 20px;padding-top: 10px;color: red"></div>
		
		<BR>
		<BR>
		<LABEL>第二步：</LABEL>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button id='' class="easyui-linkbutton l-btn" onclick="scr()"style="padding-top: 5" >企业考评打分</button>
		<BR>
		<BR>
		<LABEL>填写意见：</LABEL>
		<TEXTAREA style="WIDTH: 600px" id='adviceText' class="easyui-validatebox validatebox-text"></TEXTAREA>
		<BR>
		<BR>
		<button id='' class="easyui-linkbutton l-btn" onclick="agree('1')" iconCls="icon-ok"><SPAN class=l-btn-left>
			<SPAN style="PADDING-LEFT: 20px" class="l-btn-text icon-ok">同 意</SPAN></SPAN>
		</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button id='' class="easyui-linkbutton l-btn" onclick="agree('0')" iconCls="icon-cancel"><SPAN class=l-btn-left>
			<SPAN style="PADDING-LEFT: 20px" class="l-btn-text icon-cancel">不同意</SPAN></SPAN>
		</button>
	</div>
	<BR>
	<BR>
	<BR>
	<BR>
</body>

</html>

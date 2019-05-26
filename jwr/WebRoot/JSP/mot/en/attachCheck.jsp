<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'pnApply.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script src="<%=basePath%>js/jquery.easyui.min.js" type="text/javascript"></script>
   
    
<script type="text/javascript">
var para,indexdata,orgSelect;
function submit(){
     
	var pid=orgSelect.findValueByText($("#txtGrid").val())	 ;
	var y;
	for(var i=0;i<indexdata.length;i++){
		if (indexdata[i].pid==pid){
			y=i;
		}
	}
	if($("#txtGrid").val()==''){
		alert("请选择考评机构！");
		return;
	}
	if($("#remark").val().length>1000){
		alert("请将意见控制在1000以内！");
		return;
	}
	 
	 $.ajax({
		    type:"POST",
		    async:false,
		   data:{certnumber:para,auditer:pid,auditermot:indexdata[y].adminmot, addedreason:$("#txtGrid1").val(),addedremark:$("#remark").val()},
		    url: "/jwr/enControl/insertAddedExamineAction.action",
		    success:function(returnValue){
		     if(returnValue=='yes'){
		    	 alert("附加考评成功！");
		    	 window.location.reload();
		     }else{
		    	 $.ligerDialog.error(returnValue);
		     }
		    }
		});
}
function getOrgByen(){
	 para = $('#in').combobox('getValue');
		if(para==''){
		alert("请输入企业证书号");
			return;
		}
		para=para.split(":")[1];
		   $.ajax({
			    type:"POST",
			    async:false,
			   data:{certnumber:para},
			    url: "/jwr/enControl/getOrgListByEnCertAction.action",
			    success:function(returnValue){
			   		indexdata=eval("("+returnValue+")");
			    }
			});
		orgSelect=$("#txtGrid").ligerComboBox({
	
		    columns: [
			            { header : '名称', name: 'orgname',  align: 'center' },
			            { header : '证件号', name: 'pid',  align: 'center'} ,
			            { header : '业务类别', name: 'filetext',  align: 'center'} 
			         ],
            parms:{certnumber:para},
            rownumbers: true,
            selectBoxWidth: 500, selectBoxHeight:200,
            textField:'orgname',
            valueField :'pid',
            url: "/jwr/enControl/getOrgListByEnCertAction.action" 
	});
}
 
</script>
</head>

<body style="padding:10px;">
	<H1>企业附加考评</H1>
<DIV class=eui-info>
	<DIV class="eui-tip icon-tip"></DIV>
	<DIV>以下输入框提供自动完成功能，请输入交通运输企业名称或证书号关键字，并选定列表中的一个交通运输企业。</DIV>
</DIV>
<LABEL>证书号：</LABEL>
<input style="WIDTH: 500px; DISPLAY: none" id="in" name="in" value="" class="easyui-combobox">
<BR><BR>
<LABEL>附加考评原因：</LABEL>
<SELECT id="txtGrid1" value="1" >
<OPTION selected value="1">（一）企业发生重大及以上安全责任事故；</OPTION>
<OPTION value="2">（二）企业一年内连续发生二次及以上较大安全责任事故；</OPTION>
<OPTION value="3">（三）企业被举报并经核实其安全生产管理存在重大安全问题；</OPTION>
<OPTION value="4">（四）企业发生其他可能影响其安全生产管理的重大事件或主管机关认为确实必要的。</OPTION>
</SELECT>
<BR><BR>
<div>
<LABEL>指定附加考评机构：</LABEL>
<input type="text"  onclick="getOrgByen();" style="width:400" id="txtGrid"   >
</div>
<BR><BR>
<LABEL>意 见： </LABEL><TEXTAREA style="HEIGHT: 100px" id="remark" class="easyui-validatebox validatebox-text"></TEXTAREA>
<BR><BR>
<A id="button" class="easyui-linkbutton l-btn" onclick="submit();">提 交</A> 
<script type="text/javascript"> 
	     $('#in').combobox({
	        hasDownArrow: false,
	        valueField: 'id',
	        textField: 'text',
	        onChange: function(v1, v0) {
	            if ($.trim(v1) != '') {
	                $('#in').combobox('reload', encodeURI('/jwr/problemRecAction/getCertInfoAction.action?certNumber='+v1));
	            }
	        },
	        onSelect: function(r) {
	            $('#in').combobox('select', r.text); //显示选中项的文本
	        }
		});
	     $('#org').combobox({
		        hasDownArrow: false,
		        valueField: 'id',
		        textField: 'text',
		        onChange: function(v1, v0) {
		            if ($.trim(v1) != '') {
		                $('#org').combobox('reload', encodeURI('/jwr/orgControl/getOrgListAction.action?orgName='+v1));
		            }
		        },
		        onSelect: function(r) {
		            $('#org').combobox('select', r.text); //显示选中项的文本
		        }
			});
	</script>
</body>
</html>

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
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link type="text/css" href="css/main.css" rel="stylesheet">
<link type="text/css" href="css/easyui/default/easyui.css"
	rel="stylesheet">
<link type="text/css" href="css/easyui/icon.css" rel="stylesheet">
<script type="text/javascript">
	var indexdata="",totalSize="";
	var enname="",encid="",yyyy="",ta="",xxxxxx="",gg="";
	function query(){
		enname = document.getElementById("name").value;
		encid = document.getElementById("yyyy").value+'-'+document.getElementById("ta").value+'-'+document.getElementById("xxxxxx").value+'-'+document.getElementById("gg").value;
		var s=encodeURI(encodeURI(enname));
	    var params = {enname:s,encid:encid};
		initLiger(params);
	}
    function  initLiger(parms) {
    	window['g'] = 
            manager = $("#result").ligerGrid({
                columns: [ 
            { display: '名称', name: 'pnname', align: 'center'  },
            { display: '业务类型', name: 'bustype', align: 'center' ,render:function(item){return getBusTypeVal(item.bustype)==null?item.bustype:getBusTypeVal(item.bustype)}},
            { display: '主管机关', name: 'adminmot',  heightAlign: 'center',render:function(item){return getMotVal(item.adminmot)==null?item.adminmot:getMotVal(item.adminmot)} }], 
                rownumbers: true,
                url:"/jwr/enControl/pnBaseInfoAction.action?enname="+encodeURI(encodeURI(enname))+"&encid="+encid,
                parms: parms,
                width: '600', 
                height: '340'
            });
            $("#pageloading").hide();
    }
	
	$(function(){
		
	});
	
	function reset(){
		document.getElementById('fm1').reset();
	}
</script>
</head>

<body>
	<h1>考评员信息查询</h1>
	<div class="eui-info">
		<div class="eui-tip icon-tip"></div>
		<div>请输入考评员名称 或者 考评员证书编号进行查询</div>
	</div>
	<form id="fm1">
		<p>
			<label>考评员名称：</label><input
				class="easyui-validatebox validatebox-text" name="name" id="name" type="text">
		</p>
		<p>
			<label> 考评员证书编号：</label><input
				class="easyui-validatebox validatebox-text" name="yyyy" id="yyyy"
				style="width:50px" type="text">—<input
				class="easyui-validatebox validatebox-text" name="ta" id="ta"
				style="width:30px" type="text">—<input
				class="easyui-validatebox validatebox-text" name="xxxxxx" id="xxxxxx"
				style="width:70px" type="text">—<input
				class="easyui-validatebox validatebox-text" name="gg" id="gg"
				style="width:50px" type="text"><br>
		</p>
		<p>
			<a class="easyui-linkbutton l-btn" href="javascript:void(0);" iconcls="icon-ok"
				onclick="query();return false;"
				id="query"><span class="l-btn-left"><span
					class="l-btn-text icon-ok" style="padding-left: 20px;">查询</span></span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
				class="easyui-linkbutton l-btn" href="javascript:void(0);" iconcls="icon-undo"
				onclick="reset();return false;" id="reset"><span
				class="l-btn-left"><span class="l-btn-text icon-undo"
					style="padding-left: 20px;">重置</span></span></a>
		</p>
	</form>
	<div id="result"></div>
</body>
</html>

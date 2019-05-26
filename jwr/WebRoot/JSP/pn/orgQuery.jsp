<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../main.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'pnApply.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link type="text/css" href="/jwr/css/main.css" rel="stylesheet"/>
	<link type="text/css" href="/jwr/css/easyui/default/easyui.css" rel="stylesheet"/>
	<link type="text/css" href="/jwr/css/easyui/icon.css" rel="stylesheet"/>
<script type="text/javascript">
	var indexdata="",totalSize="";
	function query(){
		var orgname="",orgcid="",yyyy="",ta="",xxxxxx="";
		orgname = document.getElementById("name").value;
		orgcid = document.getElementById("yyyy").value+'-'+document.getElementById("ta").value+'-'+document.getElementById("xxxxxx").value;
		var parm = {"orgname":orgname,"orgcid":orgcid};
		initLiger(parm);
	}
	function initLiger(parms){
		window['g'] = 
            manager = $("#result").ligerGrid({
            columns: [ 
            { display: '名称', name: 'orgname',width:'15%', align: 'center'  },
            { display: '业务类型', name: 'bustype', width:'15%', align: 'center' ,render:function(item){return getBusTypeVal(item.bustype)==null?item.bustype:getBusTypeVal(item.bustype)}},
            { display: '主管机关', name: 'adminmot', width:'20%', heightAlign: 'center',render:function(item){return getMotVal(item.adminmot)==null?item.adminmot:getMotVal(item.adminmot)} }], 
                url:"/jwr/orgControl/orgBaseInfoAction.action",
                parms:parms,
				rownumbers: true,
                width: '70%', 
                height: '90%', 
                checkbox: false
            });
            $("#pageloading").hide();
	}
	function reset(){
		document.getElementById('fm1').reset();
	}
</script>
</head>

<body>
	<h1>考评机构信息查询</h1>
	<div class="eui-info">
		<div class="eui-tip icon-tip"></div>
		<div>请输入考评机构名称 或者 考评机构资质证书编号进行查询</div>
	</div>
	<form id="fm1">
		<p>
			<label>考评机构名称：</label><input
				class="easyui-validatebox validatebox-text" name="name" id="name" type="text">
		</p>
		<p>
			<label>考评机构资质证书编号：</label><input
				class="easyui-validatebox validatebox-text" name="yyyy" id = "yyyy"
				style="width:50px" type="text">—<input
				class="easyui-validatebox validatebox-text" name="ta" id = "ta"
				style="width:30px" type="text">—<input
				class="easyui-validatebox validatebox-text" name="xxxxxx" id = "xxxxxx"
				style="width:70px" type="text"><br>
		</p>
		<p>
			<a class="easyui-linkbutton l-btn" href="javascript:void(0);" iconcls="icon-ok"
				onclick="query();return false;"
				id="query"><span class="l-btn-left"><span
					class="l-btn-text icon-ok" style="padding-left: 20px;">查询</span></span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
				class="easyui-linkbutton l-btn" iconcls="icon-undo" href="javascript:void(0);" 
				onclick="reset();return false" id="reset"><span
				class="l-btn-left"><span class="l-btn-text icon-undo"
					style="padding-left: 20px;">重置</span></span></a>
		</p>
	</form>
	<div id="result"></div>

</body>
</html>

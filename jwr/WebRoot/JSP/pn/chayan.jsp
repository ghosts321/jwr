<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../main.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 
    <title>My JSP 'chayan.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
	var indexdata="",totalSize="";
	function enquery(){
		$("#fm1").show();
		$("#fm2").hide();
		$("#fm3").hide();
	}
	function orgquery(){
		$("#fm2").show();
		$("#fm1").hide();
		$("#fm3").hide();
		
	}
	function pnquery(){
		$("#fm3").show();
		$("#fm1").hide();
		$("#fm2").hide();
		
	}
	function query(){
		var enname="",encid="",yyyy="",ta="",xxxxxx="";
		enname = document.getElementById("name").value;
		encid = document.getElementById("yyyy").value+'-'+document.getElementById("ta").value+'-'+document.getElementById("xxxxxx").value;
   		window['g'] = 
            manager = $("#result").ligerGrid({
                columns: [ 
            { display: '名称', name: 'enname', align: 'center'  },
            { display: '业务类型', name: 'bustype', align: 'center' ,render:function(item){return getBusTypeVal(item.bustype)==null?item.bustype:getBusTypeVal(item.bustype)}},
            { display: '主管机关', name: 'adminmot', heightAlign: 'center',render:function(item){return getMotVal(item.adminmot)==null?item.bustype:getMotVal(item.adminmot)}}], 
            	url:"/jwr/motControl/enqueryAction.action",
            	parms:{enname:enname,encid:encid},
                rownumbers: true,
                width: 'auto', 
                height: '60%'
            });
   			$("#pageloading").hide();
	}
	function oquery(){
		var orgname="",orgcid="",yyyy="",ta="",xxxxxx="";
		orgname = document.getElementById("orgname").value;
		orgcid = document.getElementById("yyyyo").value+'-'+document.getElementById("tao").value+'-'+document.getElementById("xxxxxxo").value;
   		window['g'] = 
            manager = $("#result").ligerGrid({
                columns: [ 
            { display: '名称', name: 'orgname',align: 'center'  },
            { display: '业务类型', name: 'bustype', align: 'center' ,render:function(item){return getBusTypeVal(item.bustype)==null?item.bustype:getBusTypeVal(item.bustype)}},
            { display: '主管机关', name: 'adminmot', heightAlign: 'center',render:function(item){return getMotVal(item.adminmot)==null?item.adminmot:getMotVal(item.adminmot)}}], 
                url:"/jwr/motControl/orgqueryAction.action",
                parms:{orgname:orgname,orgcid:orgcid},
                width: 'auto', 
                height: '60%', 
                rownumbers: true,
                checkbox: false
            });
            $("#pageloading").hide();
	}
	function pquery(){
		var enname="",encid="",yyyy="",ta="",xxxxxx="",gg="";
		enname = document.getElementById("pnname").value;
		encid = document.getElementById("yyyyp").value+'-'+document.getElementById("tap").value+'-'+document.getElementById("xxxxxxp").value+'-'+document.getElementById("ggp").value;
   		window['g'] = 
            manager = $("#result").ligerGrid({
                columns: [ 
            { display: '名称', name: 'pnname', align: 'center'  },
            { display: '业务类型', name: 'bustype', align: 'center' ,render:function(item){return getBusTypeVal(item.bustype)==null?item.bustype:getBusTypeVal(item.bustype)}},
            { display: '主管机关', name: 'adminmot',  heightAlign: 'center',render:function(item){return getMotVal(item.adminmot)==null?item.adminmot:getMotVal(item.adminmot)}}], 
                url:"/jwr/motControl/pnqueryAction.action",
                parms:{enname:encodeURI(encodeURI(enname)),encid:encid},
                rownumbers: true,
                width: 'auto', 
                height: '60%'
            });
            //$("#pageloading").hide();
	}
	function reset(){
		document.getElementById('fm1').reset();
	}
	function reset1(){
		document.getElementById('fm2').reset();
	}
	function reset2(){
		document.getElementById('fm3').reset();
	}
	</script>

  </head>
  
  <body>
  	<h1 style="margin-left: 10">查验 企业/考评员/考评机构</h1>
  	<div class="eui-info">
		<div class="eui-tip icon-tip"></div>
		<div>请输入企业名称/考评员姓名/考评机构名称或者等级/资格/资质证书号查询其合法性。</div>
	</div>
    <p style="margin-left: 10">
		<a class="easyui-linkbutton l-btn" href="javascript:void(0);" iconcls="icon-ok"
			onclick="orgquery();return false;"id="query">
			<span class="l-btn-left">
				<span class="l-btn-text icon-ok" style="padding-left: 20px;">查验考评机构</span>
			</span>
		</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a class="easyui-linkbutton l-btn" href="javascript:void(0);" iconcls="icon-ok"
			onclick="enquery();return false;"id="query">
			<span class="l-btn-left">
				<span class="l-btn-text icon-ok" style="padding-left: 20px;">查验企业</span>
			</span>
		</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a class="easyui-linkbutton l-btn" href="javascript:void(0);" iconcls="icon-ok"
			onclick="pnquery();return false;"id="query">
			<span class="l-btn-left">
				<span class="l-btn-text icon-ok" style="padding-left: 20px;">查验考评员</span>
			</span>
		</a>
	</p>
	<form id="fm1" style="display: none;margin-left: 10">
		<p style="padding: 10">
			<label>企业名称：</label><input
				class="easyui-validatebox validatebox-text" name="name" id="name" type="text">
		</p>
		<p style="margin-left: 10">
			<label>企业达标等级证书编号：</label><input
				class="easyui-validatebox validatebox-text" name="yyyy" id="yyyy"
				style="width:50px" type="text">—<input
				class="easyui-validatebox validatebox-text" name="ta" id="ta"
				style="width:30px" type="text">—<input
				class="easyui-validatebox validatebox-text" name="xxxxxx" id="xxxxxx"
				style="width:70px" type="text"><br>
		</p>
		<p style="padding: 10">
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
	<form id="fm2" style="display: none;margin-left: 10">
		<p style="padding: 10">
			<label>考评机构名称：</label><input
				class="easyui-validatebox validatebox-text" name="name" id="orgname" type="text">
		</p>
		<p style="margin-left: 10">
			<label>考评机构资质证书编号：</label><input
				class="easyui-validatebox validatebox-text" name="yyyy" id = "yyyyo"
				style="width:50px" type="text">—<input
				class="easyui-validatebox validatebox-text" name="ta" id = "tao"
				style="width:30px" type="text">—<input
				class="easyui-validatebox validatebox-text" name="xxxxxx" id = "xxxxxxo"
				style="width:70px" type="text"><br>
		</p>
		<p style="padding: 10">
			<a class="easyui-linkbutton l-btn" href="javascript:void(0);" iconcls="icon-ok"
				onclick="oquery();return false;"
				id="query"><span class="l-btn-left"><span
					class="l-btn-text icon-ok" style="padding-left: 20px;">查询</span></span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
				class="easyui-linkbutton l-btn" iconcls="icon-undo" href="javascript:void(0);" 
				onclick="reset1();return false" id="reset"><span
				class="l-btn-left"><span class="l-btn-text icon-undo"
					style="padding-left: 20px;">重置</span></span></a>
		</p>
	</form>
	<form id="fm3" style="display: none;margin-left: 10">
		<p style="padding: 10">
			<label>考评员名称：</label><input
				class="easyui-validatebox validatebox-text" name="name" id="pnname" type="text">
		</p>
		<p style="margin-left: 10">
			<label> 考评员证书编号：</label><input
				class="easyui-validatebox validatebox-text" name="yyyy" id="yyyyp"
				style="width:50px" type="text">—<input
				class="easyui-validatebox validatebox-text" name="ta" id="tap"
				style="width:30px" type="text">—<input
				class="easyui-validatebox validatebox-text" name="xxxxxx" id="xxxxxxp"
				style="width:70px" type="text">—<input
				class="easyui-validatebox validatebox-text" name="gg" id="ggp"
				style="width:50px" type="text"><br>
		</p>
		<p style="padding: 10">
			<a class="easyui-linkbutton l-btn" href="javascript:void(0);" iconcls="icon-ok"
				onclick="pquery();return false;"
				id="query"><span class="l-btn-left"><span
					class="l-btn-text icon-ok" style="padding-left: 20px;">查询</span></span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
				class="easyui-linkbutton l-btn" href="javascript:void(0);" iconcls="icon-undo"
				onclick="reset2();return false;" id="reset"><span
				class="l-btn-left"><span class="l-btn-text icon-undo"
					style="padding-left: 20px;">重置</span></span></a>
		</p>
	</form>
	<div id="result" style="margin-right: 10"></div>
	<hr></hr>
	<a class="easyui-linkbutton l-btn" href="javascript:window.close();" iconcls="icon-undo" id="reset">
		<span class="l-btn-left" style="margin-left: 10">
			<span class="l-btn-text icon-undo" style="padding-left: 20px;">关闭</span>
		</span>
	</a>
  </body>
</html>

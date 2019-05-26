<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../main.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'zgzhzf.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
    <script type="text/javascript">
    var indexdata="";
    var totalSize="",manager;
    var ligerwindow;
    
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
        $(initLiger);
        function  initLiger(parms) {
            window['g'] = 
            manager = 
            $("#maingrid4").ligerGrid({
                columns: [ 
            { display: '主管机关', name: 'adminmot',width:'40%',  align: 'center',render:function(item){return getMotVal(item.adminmot)==null?item.adminmot:getMotVal(item.adminmot)} },
            { display: '名称', name: 'pnname', width:'35%', align: 'center' },
            { display: '业务类型', name: 'bussinestype',width:'25%',  align: 'center',render:function(item){return getBusTypeVal(item.bussinestype)==null?item.bussinestype:getBusTypeVal(item.bussinestype)} }], 
                url: "/jwr/motcert/certificateAction.action",
                width: '100%', 
                height: '50%',
                rownumbers: true,
                toolbar: { 
                	items: [
                	        { text: '文件导出（全部行）',id:'export', click: exportData, icon: 'down' },
                            { line: true },
                            { text: '详细信息', click: tail, icon: 'modify' },
                            { line: true },
                            { text: '发证', click: getCert, icon: 'add' },
                            { line: true }
                	       ]
                }
            });
        }
            function exportData(){
	        	window.location.href="<%=basePath%>/motcert/certificateExpAction.action";
	        }
	        function getCert(){
	        	var selected = manager.getSelected();
	            if (!selected) { 
	            	alert('请选择行');
	            	return; 
	            }else{
	            	var pnname=encodeURI(encodeURI(selected.pnname,'utf-8'));
		         	var pid=selected.pid;
		         	var photo=selected.photo;
		         	var bussinestype=encodeURI(encodeURI(selected.bussinestype));
		         	var createdate=selected.ctreatedate;
		         	var id=selected.id;
		         	var userid=selected.userid;
		         	var adminmot=selected.adminmot;
	            	ligerwindow=$.ligerDialog.open({
		         		url:'JSP/mot/pn/grantBook.jsp?pnname='+pnname+'&pid='+pid+'&photo='+photo+'&bussinestype='+bussinestype+'&createdate='+createdate+'&userid='+userid+'&id='+id+'&adminmot='+adminmot,
		 		     	width:600,
		 		     	height:500,
		 		     	title:'评审员<font color="red">'+manager.getSelected().pnname+'</font>详细信息'
		 		 	});
	            }
	        }
	        function reloadIndexData(){
				manager.reload(); 
	        }
	        function tail(){
	        	var selected = manager.getSelected();
	            if (!selected) { 
	            	alert('请选择行');
	            	return; 
	            }else{
	            	//获取到了选中的行
	            	$.ligerDialog.open({
	                 	url:'JSP/mot/pn/pntail.jsp?userid='+selected.userid+'&bussinestype='+encodeURI(encodeURI(selected.bussinestype))+'&flag=2',
	                 	width:790,
	                 	height:500,
	                 	title:'评审员<font color="red">'+selected.pnname+'</font>详细信息'
	             	});
	            }
	        }
            //$("#pageloading").hide();
    </script>
</head>

<body style="padding:10px;height:400;">
	<h1>评审员资格证制发</h1>
	<div class="eui-info">
		<div class="eui-tip icon-tip"></div>
		<div>所有已审核通过的申请，从系统可导出列表，由专业打印机进行打印制发。</div>
	</div>
	</span>
	</a>
	<div id="maingrid4" style="margin: 0; padding: 0"></div>
</body>
</html>

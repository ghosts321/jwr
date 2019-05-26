<%@taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String num = request.getAttribute("num").toString();
	int num1 = Integer.parseInt(num);
	System.out.println("num1=============="+num1);
	request.setAttribute("num", num1);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP 'pnApply.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link type="text/css" href="css/main.css" rel="stylesheet">
<link type="text/css" href="css/easyui/default/easyui.css"
	rel="stylesheet">
<link type="text/css" href="css/easyui/icon.css" rel="stylesheet">
   <link href="js/gradejs/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="js/gradejs/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerToolBar.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script> 
    <script src="js/gradejs/ligerUI/js/plugins/ligerFilter.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerGrid.showFilter.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerWindow.js" type="text/javascript"></script>
    <script src="js/gradejs/CustomersData.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/common.js"></script>

<!-- <script type="text/javascript" src="css/easyui/default/test.js"></script> -->
<script type="text/javascript">
	  var indexdata="";
    var totalSize="";
    
    $.ajax({
	    type:"POST",
	    async:false,
	    url:"/jwr/pnControl/pnTrainListAction.action",
	    success:function(returnValue){
	   		indexdata=returnValue;
	   		indexdata=eval("("+indexdata+")");
	    }
	});
	totalSize=indexdata.Rows.length;
   //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
        $(function ()
        {
            window['g'] = 
            manager = $("#applyMingrid").ligerGrid({
                columns: [ 
            
            { display: '名称', name: 'pnname', align: 'center'  },
            { display: '日期', name: 'createdate',  align: 'center' },
            { display: '业务类型', name: 'bussinestype',  align: 'center' ,
            	render:function(item){return getBusTypeVal(item.bussinestype)==null?item.bussinestype:getBusTypeVal(item.bussinestype)}},
            { display: '受理结果', name: 'auditresp',  align: 'center' ,
            	render: function (item)
                {
           		  if (item.auditresp=="1"){ return '同意';}
           		 else if (item.auditresp=="2"){ return '不同意';}
                }
            },
            { display: '受理日期', name: 'auditdate',    align: 'center' }], 
                data: indexdata,
                url: "",
                pageSize:  10,
               toolbar: { 
                	items: [
                	        { text: '详细信息', click: detial, icon: 'modify' },
                            { line: true }
                	       ]
                },
                width: '95%', 
                height: '95%', 
                checkbox: false,
                usePager:true
            });
            $("#pageloading").hide();
        });  
function detial(){
	var selected = manager.getSelected();
            if (!selected) {
            	alert('请选择行');
            	return; 
            }else{
            	$.ligerDialog.open({
                 	url:'JSP/pn/certapplydetail.jsp?id='+selected.id,
                 	width:550,
                 	height:400,
                 	title:'考评员<font color="red">'+selected.pnname+'</font>详细信息'
             	});
            }
}
/**
 * 返回数据在填充ligerUI grid前 对列值和颜色进行修改
 */
function resultsRender(item){
	var color = '';
	var font = '';
	if(item.results=='1'){
		font = '<strong><font style="font-weight:bold;"  color="green">同意</font></strong>';
	}else if(item.results=='0'){
		font = '<font style="font-weight:bold;" color="red">不同意</font>';
	}else if(item.results=='2'){
		font = '<strong><font color="green">已发证</font></strong>';
	}else{
		font = item.results;
	}
	return font;
}
  function certApply(){
	  var cert1;
	  $.ajax({
		    type:"POST",
		    async:false,
		    url:"pn/isTwoCertAction.action?userid=${userid } ",
		    success:function(returnValue){
		    	cert1=returnValue;
		    },
		    error:function(returnValue){
		    	cert1=returnValue;
		    }
		});
	  if (cert1=='true'){
		  alert('已经有两张证书,不能再次申请');
		  
	  }else  if (cert1=='error'){
		  alert('操作异常，请联系系统管理员！');	
	  }else {
		  window.location.href="<%= basePath%>pn/pnFirstApplyAction.action?userid=${userid }";
	  }
  }  
</script>
</head>

<body>
	<h1>考评员资格证申请</h1>
	<div class="eui-info">
		<div class="eui-tip icon-tip"></div>
		<div>已通过报名初审，可进行考评员资格证申请。</div>
	</div>
	<a class="easyui-linkbutton l-btn" href="javascript:void(0)" onclick="certApply()"
		style="margin:10px"> <span class="l-btn-left">
			<span class="l-btn-text">进行考评员资格证申请</span>
	</span>
	</a>
	
	<h2>已提交过<font color="red"><script type="text/javascript">document.write(totalSize)</script></font>次申请：</h2>
 <div id="applyMingrid" style="margin: 0; padding: 0"></div>
	<div style="display: none;"></div>
</body>
</html>

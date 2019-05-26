<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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
    <script src="js/gradejs/CustomersData.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/common.js"></script>
    
    <script type="text/javascript">
    var indexdata="";
    var totalSize="";
    
    $.ajax({
	    type:"POST",
	    async:false,
	    url:"/jwr/motpn/signOrgAction.action",
	    success:function(returnValue){
	   		indexdata=returnValue;
	    }
	});
    //删除del以及其值
    if(indexdata!=""){
    	var sss= indexdata;
    	indexdata = eval("("+sss+")");
    	totalSize = indexdata.Total;
    	//alert(indexdata.Rows[0].del);
    	for(var sdd in indexdata.Rows){
    		$.each(indexdata.Rows[sdd], function(key,value){
    			delete indexdata.Rows[sdd].del;
        	});
    	}
    }
    totalSize = indexdata.Rows.length;
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
        $(function ()
        {
            window['g'] = 
            $("#maingrid4").ligerGrid({
                columns: [ 
            { display: '姓名', name: 'username', align: 'center'  },
            { display: '主管机关', name: 'admin',  align: 'center',render:function(item){return getMotVal(item.admin)==null?item.admin:getMotVal(item.admin)} },
            { display: '业务类型', name: 'type',  align: 'center',render:function(item){return getBusTypeVal(item.type)} },
            { display: '机构名称', name: 'orgname',  align: 'center' },
            { display: '聘用日期', name: 'employdate',  align: 'center' },
            { display: '解聘日期', name: 'unemploydate',  align: 'center' },
            { display: '专兼职', name: 'parttime',  align: 'center' }], 
                data: indexdata,
                url: "",
                pageSize:  10,
                width: '95%', 
                height: '93%', 
                checkbox: false,
                usePager:false
            });
            $("#pageloading").hide();
        });
    </script>
</head>

<body style="padding:10px;">
	<h1>
		 <script type="text/javascript">
				if(totalSize==""){
					document.write("尚未受聘于考评机构");
				}else{
					document.write("已受聘于如下考评机构：");
				} 
		 </script>
	</h1>
	<div style="margin:10px auto;"></div>
	<div class="l-loading" style="display: block;" id="pageloading"></div>
	
	<div id="maingrid4" style="margin: 0; padding: 0"></div>
	<div style="display: none;"></div>
</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			String userId=(String)request.getSession().getAttribute("userid");
			String pid=(String)request.getSession().getAttribute("paperid");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title></title>

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
    <link href="js/gradejs/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />
    <link href="js/gradejs/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="js/ligerui.min.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerToolBar.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script> 
    <script src="js/gradejs/ligerUI/js/plugins/ligerFilter.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerGrid.showFilter.js" type="text/javascript"></script>
    <script src="js/gradejs/CustomersData.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerWindow.js" type="text/javascript"></script>
	    
    <script type="text/javascript">
    var indexdata="";
    var totalSize="";
	  var pid='<%=pid%>';
    var gird;
    $.ajax({
	    type:"POST",
	    async:false,
	    url:"/jwr/enScoreSum/getEnScoreSumListAction.action",
	    data:{'pid':pid},
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
    //详细信息
    function itemclick(){
    if(gird.getSelected()==null){
    	alert("请选中一行");
    }else{
    	 var selValue=gird.getSelected().cid;
	 	  var pid=gird.getSelected().pid;
      	 $.ligerDialog.open({
//          	url:'JSP/org/en/enDetail2.jsp?certnumber='+selValue+'&pid='+pid,
				url:'JSP//org/en/enDetail.jsp?pid='+pid+'&enname='+encodeURI(encodeURI(gird.getSelected().enname)),
            	width:550,
            	height:400,
            	title:'考评员<font color="red">'+gird.getSelected().enname+'</font>详细'
        	});
    	
   	 }
   	}
   	
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
        $(function ()
        {
            window['g'] = 
           gird=$("#maingrid4").ligerGrid({
                columns: [ 
            //{ display: '序号', name: 'ID', align: 'center'  },
            { display: '名称', name: 'enname',  align: 'center' },
            { display: '日期', name: 'createdate',  align: 'center' },
            { display: '业务类别', name: 'busclass',  heightAlign: 'center' },
            { display: '等级', name: 'grade',    align: 'center' },
            { display: '自评分数', name: 'selfScore',    align: 'center' },
            { display: '考评分数', name: 'kaoScore',    align: 'center' }], 
                rownumbers:true,
                data: indexdata,
                url: "",
                toolbar: { 
                	items: [
                	       
                            { text: '详情', click: itemclick, icon: 'modify' }
                	       ]
                },
                pageSize:  10,
                width: '100%', 
                height: '91%', 
                checkbox: false
            });
           
            $("#pageloading").hide();
            
        });
        
    </script>
</head>

<body style="padding:10px;">
	<h1>企业考评情况汇总表</h1>
	<div style="height: 20px"></div>
	<h2><span id="row2"></span>条考评记录</h2>
	<div class="l-loading" style="display: block;" id="pageloading"></div>
	
	<div id="maingrid4" style="margin: 0; padding: 0"></div>
	<div style="display: none;"></div>
</body>
</html>

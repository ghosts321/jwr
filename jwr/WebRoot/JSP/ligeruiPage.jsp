<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title></title>
    <link href="../js/gradejs/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="../js/gradejs/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />
    <link href="../js/gradejs/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="../js/gradejs/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="../js/gradejs/ligerUI/js/plugins/ligerToolBar.js" type="text/javascript"></script>
    <script src="../js/gradejs/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
    <script src="../js/gradejs/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script> 
    <script src="../js/gradejs/ligerUI/js/plugins/ligerFilter.js" type="text/javascript"></script>
    <script src="../js/gradejs/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>
    <script src="../js/gradejs/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
    <script src="../js/gradejs/ligerUI/js/plugins/ligerGrid.showFilter.js" type="text/javascript"></script>
    <script src="../js/gradejs/CustomersData.js" type="text/javascript"></script>
    <script type="text/javascript">

    //去掉  大于小于包括,并改变顺序
    $.ligerDefaults.Filter.operators['string'] =
    $.ligerDefaults.Filter.operators['text'] =
    ["like" , "equal", "notequal", "startwith", "endwith" ];
    var indexdata="";
    $.ajax({
				    type:"POST",
				    async:false,
				    url:"/jwr/menu/menuListAction.action",
				    success:function(returnValue){
				   		indexdata=returnValue;
				    }
	});
	
	function alert123(){
	}
	alert(indexdata);
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
        $(function ()
        {
            window['g'] = 
            $("#maingrid4").ligerGrid({
            	rownumbers :true,
                columns: [ 
            { display: '主键', name: 'name', align: 'center', width: 120 ,allowHideColumn:false},
            { display: '公司名', name: 'id', minWidth: 60, align: 'center',allowHideColumn:false},
            { display: '联系名', name: 'type', width: 120, align: 'center',allowHideColumn:false},
            { display: '城市', name: 'text', heightAlign: 'center' ,allowHideColumn:false},
            { display: '电话', name: 'state', width: 170, align: 'center' ,allowHideColumn:false},
            { display: '传真', name: 'isleaf', width: 170, align: 'center',allowHideColumn:false } 
                ], 
                data: indexdata,
                url: "<%= basePath%>/menu/menuListAction.action",
                pageSize:  10,
                toolbar: { items: [{ text: '高级自定义查询', click: itemclick, icon: 'search2'}]
                },
                width: '90%', height: '80%', checkbox: false
            });
            $("#pageloading").hide();
        });
        function itemclick()
        {
            g.options.data = $.extend(true,{}, CustomersData);
            g.showFilter();
        }
    </script>
</head>
<body style="padding: 4px; overflow: hidden;">
    <div class="l-loading" style="display: block" id="pageloading">
    </div>
    <div id="maingrid4" style="margin: 0; padding: 0">
    </div>
    <div style="display: none;">
    </div>
</body>
</html>

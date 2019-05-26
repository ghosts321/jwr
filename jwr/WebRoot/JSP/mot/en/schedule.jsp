<%@ page language="java" import="java.net.*" pageEncoding="UTF-8"%>
<%@include file="../../main.jsp" %>

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

    <script type="text/javascript">
    var indexdata="";
    var totalSize="";
    var data=window.parent.postdata;
    data = eval("("+data+")");
    var applyId = data.id;
    var bustype = data.type2;
    //alert(bustype)
    $.ajax({
	    type:"POST",
	    async:false,
	    url:"/jwr/enControl/getScheduleListAction.action?applyId="+applyId+"&bustype="+bustype,
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
    
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
        $(function ()
        {
            window['g'] = 
            grid=$("#maingrid4").ligerGrid({
                columns: [ 
            { display: '业务类型', name: 'bustype',  align: 'center',width:'18%' },
            { display: '处理人', name: 'auditername',    align: 'center' ,width:'28%'},
            { display: '处理日期', name: 'auditerdate',    align: 'center' ,width:'12%'},
            { display: '处理状态', name: 'status',    align: 'center' ,width:'8%'},
            { display: '处理结果', name: 'results',  align: 'center',width:'8%',
            	 render: function (item)
                 {
            		 if(item.results=="1"){return '同意';}
            		 else if(item.results=="0"){return '不同意';}
                 }
            },
            { display: '处理意见', name: 'advice',    align: 'center' ,width:'21%'}
           ], 
                data: indexdata,
                rownumbers: true,
                url: "",
                usePager:false,
                width: '100%', 
                height: '100%', 
                checkbox: false
            });
            $("#pageloading").hide();
        });
       
    </script>
</head>

<body style="padding:10px;overflow: hidden;">
	<h1>申请进度查询</h1>
	<div style="margin:10px auto;"></div>
	<div class="l-loading" style="display: block;" id="pageloading"></div>
	
	<div id="maingrid4" style="margin: 0; padding: 0;width: 100%"></div>
	<div style="display: none;"></div>
</body>
</html>

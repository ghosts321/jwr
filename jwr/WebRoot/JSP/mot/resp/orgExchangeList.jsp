<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>考评机构变更备案</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
	    
    <script type="text/javascript">
    var indexdata="";
    var indexdata2="";
    var totalSize="";
	  var ligerwindow;
    var gird2;
    var type='org';
    
	//查看详细信息
    function view(){
     	var selected = gird2.getSelected();
         if (!selected) { 
        	 alert('请选择行');
         	return; 
         }else{
        	 var id=selected.id;
		 	ligerwindow=$.ligerDialog.open({
		 		url:'JSP/mot/resp/ExchangeDetail.jsp?id='+id,
		     	width:620,
		     	height:550,
		     	title:'考评机构<font color="red">'+gird2.getSelected().pid+'</font>详细信息'
		 	});
	   ;
         }
     }
   	   	
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
        $(function ()
        {
            window['g'] = 
           gird2= $("#maingrid2").ligerGrid({
                     columns: [ 
                 { display: '考评机构名称', name: 'motname',  align: 'center' },
                 { display: '原因', name: 'reason',  align: 'center',
                  render: function (item)
                 {
                 if(item.reason=='1'){return '（一）法定代表人变更的';}
                 else if (item.reason=='2'){ return '（二）机构名称变更的';}
                 else if (item.reason=='3'){ return '（三）机构地址变更的';}
                 else if (item.reason=='4'){ return '（四）停业、破产或有其他原因终止业务的';}
                 else if (item.reason=='5'){ return '（五）从事专职管理和考评工作的人员发生重大变化的';}
                 }
                  },
                 { display: '申请日期', name: 'cdate',  heightAlign: 'center' },
                 { display: '受理状态', name: 'status',    align: 'center',
                	 render: function (item)
                     {
                		 if(item.status==""){return '尚未处理';}
                		 else{return item.status}
                     }
                 },
                 { display: '受理日期', name: 'updateDate',    align: 'center'}], 
                     rownumbers: true,
                     dataAction:"server",
                     url:"/jwr/orgExchange/getOrgExchangeListAction.action",
                     toolbar: { 
                     	items: [
                                 { text: '详细信息', click: view, icon: 'modify' }
                     	       ]
                     },
                     parms:{type:type},
                     width: '100%', 
                     height: '320', 
                     checkbox: false
                 });
                
                 $("#pageloading2").hide();
        });
      
        
    </script>
</head>

<body style="padding:10px;">
	
	
	<h1>受理考评机构变更备案申请</h1>
	<div style="height: 10px"></div>

	<H2>考评机构变更备案申请列表</H2>
	<div style="margin:10px auto;"></div>
	<div class="l-loading" style="display: block;" id="pageloading2"></div>
	
	<div id="maingrid2" style="margin: 0; padding: 0"></div>
</body>
</html>

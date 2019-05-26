<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../main.jsp" %>
<%
			String userId=(String)request.getSession().getAttribute("userid");
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

	    
    <script type="text/javascript">
    var indexdata="";
    var totalSize="";
	  var userId='<%=userId%>';
    var gird;
   var ligerwindow;
	
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
 	 	  var selValue=gird.getSelected().certnumber;
        	ligerwindow=$.ligerDialog.open({
        		url:'JSP/org/org/bookDetail.jsp?certnumber='+selValue,
        		width:900,
 		     	height:600,
		     	title:'考评机构资质证书详细信息'
		 	});
	   ;
   	 }
   	}
   	
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
        $(function ()
        {
            window['g'] = 
           gird=$("#maingrid4").ligerGrid({
                columns: [ 
            { display: '证书号', name: 'certnumber',  align: 'center' },
            { display: '业务类型', name: 'filetext',  align: 'center' },
            { display: '证书等级', name: 'grade',  heightAlign: 'center',
            	render: function (item)
                {
           	  if(item.grade=="2"){return '二级';}
           	  else if(item.grade=="3"){return '三级';}
                    else{return '';}
                }
            },
            { display: '发证日期', name: 'fzdate',    align: 'center' },
            { display: '证书状态', name: 'certstatus',    align: 'center' ,
            	render: function (item)
                {
           	  if(item.certstatus=="1"){return '有效';}
           	  else if(item.certstatus=="0"){return '无效';}
                    else{return '';}
                }
            }], 
                data: indexdata,
                rownumbers: true,
                url:"/jwr/bookInfo/getAllBookListAction.action",
                toolbar: { 
                	items: [
                	       
                            { text: '详细信息', click: itemclick, icon: 'modify' }
                	       ]
                },
                usePager:false,
                width: '800', 
                height: '340', 
                checkbox: false
            });
           
            $("#pageloading").hide();
            
            $.ajax({
        	    type:"POST",
        	    async:false,
        	    url:"/jwr/bookInfo/getAllBookListAction.action",
        	    data:{'userId':userId},
        	    success:function(returnValue){
        	    	indexdata=eval("("+returnValue+")");
//        		   	indexdata=returnValue;
        		   		totalSize=indexdata.Total;
        		        //将 查询参数 设置到 grid中 以便下次分页时候 可以获取到查询参数
        				gird.setOptions({ parms: {'userId':userId},newPage:'1'});
        		        //将grid 表格 刷新
        				gird.reload();
        		        //默认回到第一页
        				//gird.changePage('first');
        		        //向控制台打印信息
        	    }
        	});
        });
        
        
        function sendApply(){
			 window.location.href="/jwr/JSP/org/org/orgReg.jsp";
        }
        
    </script>
</head>

<body style="padding:10px;">
	<h1>考评机构资质证书</h1>
<!-- 	<div style="margin:10px auto;"></div> -->
	<div class="l-loading" style="display: block;" id="pageloading"></div>
	
	<div id="maingrid4" style="margin: 0; padding: 0"></div>
	<div style="display: none;"></div>
</body>
</html>

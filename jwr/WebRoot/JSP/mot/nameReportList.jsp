<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../main.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>实名举报列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	 <script type="text/javascript">
	  var indexdata="";
	  var indexdata2="";
	  var gird;
	  $(function (){
	  $.ajax({	
	  			
			    type:"POST",
			    async:false,
			    url:"/jwr/nameReport/getNameReportListAction.action",
			    success:function(returnValue){
			   		//indexdata=eval("("+returnValue+")");
			   		  indexdata=returnValue;
			   	}
			    })
			    
			   window['g'] = 
           gird=$("#maingrid4").ligerGrid({
                columns: [ 
     
             { display: '举报人时间', name: 'createdate',  align: 'center',
                editor: { type: 'text' } },
            { display: '举报人信息', name: 'jmessage',  align: 'center',
                editor: { type: 'textarea' } },
            { display: '主管机关 ', name: 'orgname',  align: 'center',
                editor: { type: 'text' } } 
              ], 
              data:indexdata,
                pageSize:30,
                 url:"/jwr/nameReport/getNameReportListAction.action",
                 rownumbers:true,
                 toolbar: { 
            	items: [
            	        { text: '详细信息', click: detial, icon: 'modify' },
                        { line: true }
            	       ]
            },
                width: '95%', 
                height: '95%', 
                usePager:false,
                
                checkbox: false 
            });
           
            $("#pageloading").hide();
            
     
      
        });  


//查看详情
function detial(){
	var selected = gird.getSelected();
    if (gird.getSelected() == null) {
    	alert("请选中一行");
    }else{
    	
    	 var id=selected.id;
        	ligerwindow=$.ligerDialog.open({
        		url:'JSP/mot/nameReportDetail.jsp?id='+id,
 		     	width:650,
 		     	height:490,
 		     	title:'实名举报信息'
 		 	});
 	   ;
    	
    }
}
			    
	 </script>
  </head>
  
 <body>
 <body>
	<h1>实名投诉举报申请受理</h1>
	<DIV class=eui-info>
		<DIV class="eui-tip icon-tip"></DIV>
		<DIV>任何单位和个人对考评机构的考评行为，有权向主管机关进行实名举报，主管机关会及时受理、组织调查处理，并为举报人保密。</DIV>
	</DIV>

	<div id="maingrid4" style="margin: 0; padding: 0"></div>
	<div style="display: none;"></div> 
	</div>
</body>
 
 </body>

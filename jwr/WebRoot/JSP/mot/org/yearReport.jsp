<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../main.jsp" %>
<%
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

    
    <script type="text/javascript">
    var indexdata="";
    var totalSize="";
    var gird;
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
    
     //查看
        function see(){
        	if(gird.getSelected()==null){
            	alert("请选中一行");
            }else{
        	var freport=gird.getSelected().freport;
        	 var ss=freport.split('.');
    		 var fileType=ss[1];
    		 //alert(fileType+"格式 ");
    		if(freport !=""){
    			if(fileType =='doc'){
	        		alert("本文件是"+fileType+"格式,请点击下载后，再查看！");
	        		return false;
        		}
        		seeImg('img0',freport);
    		}else{
    			alert("文件不存在，无法查看 ！");
    		}
        	}
        	
        }
    

   	
   	   //下载
    function download(){
    	if(gird.getSelected()==null){
        	alert("请选中一行");
        }else{
    	var name=gird.getSelected().freport;
    	 if(gird.getSelected()==null){
    	    	alert("请选中一行");
    	    }else{
				 if(name !=""){
				 	 window.location.href='<%= basePath%>updown/downloadFileAction?file='+name;
				 }else{
				 	alert("文件不存在，无法下载 ！");
				 }
    	         
    	   	 }
        }
    }
    
   	
   	
    
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
        $(initLiger);
        function  initLiger(parms) {
            window['g'] = 
            gird=$("#maingrid4").ligerGrid({
                columns: [ 
            { display: '年度', name: 'year',  align: 'center',width:100 },
            { display: '考评机构名称', name: 'commonname',  align: 'center' },
            { display: '报送日期', name: 'createdate',  heightAlign: 'center' },
            { display: '文件', name: 'freport',    align: 'center' }], 
                rownumbers: true,
                url:"/jwr/orgYearReport/getMotYearReportListAction.action",
                width: '800', 
                height: '340', 
                checkbox: false,
                 toolbar: { 
                	items: [
                	       
                            { text: '查看', click: see, icon: 'modify' },
                            { text: '下载', click: download, icon: 'add' }
                	       ]
                } 
            });
            $("#pageloading").hide();
        }
    </script>
</head>

<body style="padding:10px;">
	<h1>考评机构年度工作报告：</h1>
	
	<div style="margin:10px auto;"></div>
	<div class="l-loading" style="display: block;" id="pageloading"></div>
	
	<div id="maingrid4" style="margin: 0; padding: 0"></div>
	<div style="display: none;"></div>
	
	<!-- 	查看弹出框 -->
<!-- 	<div id="popupContact"> -->
<!-- 		<a id="popupContactClose" ><font color="blue">关闭</font></a> -->
<!-- 		<p id="contactArea"> -->
<!-- 			<img id="img0" src=""/> -->
<!-- 		</p> -->
<!-- 	</div> -->
<!-- 	<div id="backgroundPopup"></div> -->
</body>
</html>

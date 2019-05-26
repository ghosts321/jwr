<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@ include file="../main.jsp"%> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>报名申请初审</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script>
	 	var indexdata="";
	    var totalSize="";
	    
	    $.ajax({
		    type:"POST",
		    async:false,
		    url:"/jwr/mot/motRegRespAction.action",
		    success:function(returnValue){
		   		indexdata=returnValue;
		    }
		});
	  
	var motGrid;
	var enGrid;
		 $(function(){
			 indexdata=eval("("+indexdata+")");
			  //删除del以及其值
			    
			    	for(var sdd in indexdata.Rows){
			    		$.each(indexdata.Rows[sdd], function(key,value){
			    			 if(key=='adminmot'){
			    			 }
			        	});
			    	}
				 motGrid= 
			            $("#maingrid4").ligerGrid({
			                columns: [ 
			            { display: '主管机关', name: 'adminmot',  align: 'center'  },
			            { display: '名称', name: 'motname', align: 'center'  }, 
			            { display: '日期', name: 'createdate',  align: 'center'  }, 
			            { display: '初审结果', name: 'regresp',  align: 'center' }], 
		                data: indexdata,
		                pageSize: 10, 
			               width: '100%', 
			                height: '100%', 
			                checkbox: true,
			                onBeforeCheckAllRow: function(checked, grid,element) 
				                {  
				                	var rowi=rowGrid.getCheckedRows ();
				             		for(var i=0;i<rowi.length;i++){
				             			alert(rowi[i])
				             		}
				                     return false; 
				                }  
			            });
				 $("#pageloading").hide();
			 
		 });
	 
		 function save(){
			 
		 }
		 function view(){
					 
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

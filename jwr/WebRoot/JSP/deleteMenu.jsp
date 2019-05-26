<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<link href="../framework/style/css/ligerui-all.css" rel="stylesheet" type="text/css" /> 
	<link href="/jwr/css/easyui/icon.css" rel="stylesheet" type="text/css" /> 
    <link rel="stylesheet" href="../framework/style/css/common.css" type="text/css" />
    <script src="../framework/jquery/jquery-1.3.2.min.js" type="text/javascript"></script> 
    <script src="../framework/jquery/ligerui.min.js" type="text/javascript"></script> 
     <script type="text/javascript" src="../framework/jquery/jquery.easyui.min.js"></script>
       <script src="/jwr/js/gradejs/ligerUI/js/plugins/ligerTree.js" type="text/javascript"></script> 
	 <script type="text/javascript">
	 var data;
	 var userid ='<%= request.getParameter("userid")%>';
	 var usertype ='<%= request.getParameter("usertype")%>';
            $(function (){
                 //创建一个indexdata =ajax调用返回的json
             var manager=null;
             var indexdata="";
             $.ajax({
 			    type:"POST",
 			    async:false,
 			    data:{usertype:usertype},
 			    url:"/jwr/menu/menuListAction.action",
 			    success:function(returnValue){
 			    	indexdata=eval("("+returnValue+")");
 			    	//alert(indexdata);
 			       //遍历JSON对象  
 			       for(var index in indexdata){  
 			    	//删除Json数据中的icon属性
 			    	  delete indexdata[index].icon ;  
 			    	  
 			       }  
 			    }
 			});
             $.ajax({
  			    type:"POST",
  			    async:false,
  			    data:{userid:userid,usertype:usertype},
  			    url:"/jwr/menu/getUserRoleMenuAction.action",
  			    success:function(returnValue){
  			    	var menuids=returnValue.split(",");
  			       //遍历JSON对象  
  			      for(var index in indexdata){  
  			    	//删除Json数据中的icon属性
  			    	for(var mid in menuids)
  			    	  if(indexdata[index].id ==menuids[mid]){
  			    	  	indexdata[index].ischecked=true;
  			    	  }
  			       }  
  			    }
  			});
             tre=   $("#tree1").ligerTree({
                	data:   indexdata ,
                 checkbox: true,
                 slide: false,
                 nodeWidth: 120,
                 textFieldName:'text',
                 idFieldName:'id',
                 parentIDFieldName:'parentid' 
   			});
           
            });
    	     //树
            var tre ;
            var checkids="";
            function insertTree(){
            	 //遍历JSON对象  
            	  checkids="";
            	 var checktree=tre.getChecked();
            	 //定义一个 父节点ID  原因： 选中子节点时 获取不到父节点 ID
            	 var parentid;
			       for(var index in checktree){  
			    	   if(parentid==null){
			    		   checkids+=","+checktree[index].data.parentid;
			    		   checkids+=","+checktree[index].data.id;
			    	   }else{
			    		   if(parentid==checktree[index].data.parentid){
				    		   checkids+=","+checktree[index].data.id;
				    	   }else if(parentid!=checktree[index].data.parentid){
				    		   checkids+=","+checktree[index].data.parentid;
				    		   checkids+=","+checktree[index].data.id;
				    	   }
			    	   }
			    	   parentid=checktree[index].data.parentid;
			       }  
			       checkids=checkids.substr(1,checkids.length)
			        
              if (checkids ==""){
              	alert("请选择要分配的菜单！");
              	return;
              }else{
            	  $.ajax({
       			    type:"POST",
       			    async:false,
       			    data:{usertype:usertype,userid:userid,checkids:checkids},
       			    url:"/jwr/menu/menuRoleInsertAction.action",
       			    success:function(returnValue){
       			    	 if(returnValue=='yes'){
       			    		 alert("操作成功，页面将关闭");
       			    		window.parent.ligerwindow.close();
       			    	 }else{
       			    		 alert(returnValue);
       			    	 }
       			    }
       			});
              }
            }
            </script>
		<title>
		分配菜单
		</title>
	</head>
	<body>
	 
	  
		<form method="post"  id="menuDeletes" action="/jwr/menu/menuDeletesAction.action">
		<table width="80%" align="center" class="grid">
			  
				<tr align="left">
					<td>
						<input type="button" onclick="insertTree()" value="确认"  style="width: 50px" class="button" />
						 
					</td>
				</tr>
			</table>
		<table width="80%" align="center" class="grid">
		 
		 	  	 
	<tr  >
                 <td align="left"> 
                 	菜单
                      <div style="width:400px; height:500px; margin:10px; float:left; border:1px solid #ccc; overflow:auto;  ">
   						 <ul id="tree1"></ul>
   				     </div>
                  </td>
         </tr>
			
		 </table>
			
		</form>
	</body>
</html>

<%@ page language="java" pageEncoding="UTF-8"%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<link href="../framework/style/css/ligerui-all.css" rel="stylesheet" type="text/css" /> 
    <link rel="stylesheet" href="../framework/style/css/common.css" type="text/css" />
    <script src="../framework/jquery/jquery-1.3.2.min.js" type="text/javascript"></script> 
    <script src="../framework/jquery/ligerui.min.js" type="text/javascript"></script> 
     <script type="text/javascript" src="../framework/jquery/jquery.easyui.min.js"></script>
	 <script type="text/javascript">
	 var data;
	
			 function subRole(){
			  var checkids="";
			 	manager= $("#tree1").ligerGetTreeManager();
			 	var nodes=manager.getChecked(); 
			 	 if (checkids!=null){	
			 	 	for(var i=0;i<nodes.length;i++){
				 		if(i!=nodes.length)	{
				 			checkids+="'"+nodes[i].data.id+"'"+",";
				 		}else{
				 			checkids+="'"+nodes[i].data.id+"'";
				 		}
				 	}
			 	 }else{
				 	alert("菜单不能为空!请分配菜单");
				 	return;
				 }
				 alert(checkids)
			 	if(document.getElementById("roleInfo.roleid").value==""){
			 		alert("角色编号不能为空!请填写");
				 	return;
			 	}
			 	if(document.getElementById("roleInfo.rolename").value==""){
			 		alert("角色名称不能为空!请填写");
				 	return;
			 	}
			 	if(document.getElementById("roleInfo.roletype").value==""){
			 		alert("角色类型不能为空!请选择");
				 	return;
			 	}
			 	
				
			 	document.getElementById("roleInfo.menuids").value=checkids;
			 	document.insertRoleForm.submit();
				
			 }
            $(function (){
                 //创建一个indexdata =ajax调用返回的json
             var manager=null;
             var indexdata="";
                 $.post("/jwr/menu/menuAllListAction.action",function(returnValue){
		                 indexdata=returnValue;
		                 data=indexdata;
		                 });
            });
            
          
              function getTree(){
            	     //树
                $("#tree1").ligerTree({
                   	data: eval( data  ),
                    checkbox: true,
                    slide: false,
                    nodeWidth: 120,
                    attribute: ['nodename', 'url'],
                 
                    // 展开节点时向当前节点添加数据
	                onExpand:function(node){
	                    
	                    var t=node.data.children.length;
	                    if(t==0){
	                    	 $.ajax({
							    type:"POST",
							    async:false,
							    url:"/jwr/menu/menuListAction.action?menuID="+node.data.id,
							    success:function(returnValue){
								    var dat= eval('(' + returnValue + ')');
								   	  	// 追加若干个节点 
									manager.append(node.target,dat);
									if(dat!=null){
			              	 		    manager.collapseAll();//折叠所有节点
								   	}
							    }
							  });
							}
	                    }  
                });
                 manager= $("#tree1").ligerGetTreeManager();
                manager.collapseAll();//折叠所有节点
             $("#getTree1").attr({disabled:"disabled"});   
            }
            </script>
	
		<title>
		  添加角色
		</title>
	</head>
	<body>
		<form method="post" action="/jwr/role/roleInsertAction.action" name="insertRoleForm" id="insertRoleForm">
			<table width="80%" align="center" class="grid">
				<tr height="25px" bgcolor="#ffffff">
					<td width="15%" align="left" class="label"> 
						角色编号 
						<font color="red">*</font>
					</td>
					<td width="35%" class="content">
						<input type="text" id="roleInfo.roleid" name="roleInfo.roleid" class="text"
							maxlength="50" />
					</td>
				</tr>
				<tr height="25px" bgcolor="#ffffff">
					<td width="15%" align="left" class="label">
						角色名称
						<font color="red">*</font>
					</td>
					<td width="35%" class="content">
						<input type="text" id="roleInfo.rolename" name="roleInfo.rolename" class="text"
							maxlength="50" />
					</td>
					</tr>
					<tr>
					<td width="15%" align="left" class="label">
						角色类型
						<font color="red">*</font>
					</td>
					<td width="35%" class="content">
						<select  id="roleInfo.roletype" name="roleInfo.roletype"  > 
							 <option value ="">----请选择----</option>
							  <option value ="mot">主管机关</option>
							  <option value ="en">企业</option>
							  <option value="pn">考评员</option>
							  <option value="org">考评机构</option>
						</select>
					</td>
				</tr>
			 	<tr align="left" >
					<td>
						<input type="button"   id="getTree1"  onclick="getTree()" value="获取菜单"  style="width: 50px" class="button" />
						 
					</td>
				</tr>
				<tr align="center">
	                 <td> 
	                 	菜单
	                 	<font color="red">*</font>
	                  </td>
	                  <td align="left">
	                  	   <ul id="tree1" style="margin-top:3px;">
	                       </ul>
	                       <input type="hidden" id="roleInfo.menuids" name="roleInfo.menuids"/>
	                  </td>
	               
	         	</tr>
				 
			</table>
			
			<table width="80%" align="center" class="grid">
				<tr align="center">
					<td>
						<input type="button" onclick="subRole()" value="提交"  style="width: 50px" class="button" />
						 
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../main.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>
		 密钥用户管理
		</title>
	 <script type="text/javascript">
    var indexdata="";
    var totalSize="";
    var gird;
    $.ajax({
	    type:"POST",
	    async:false,
	    url:"/jwr/motControl/getMotUserListAction.action",
	    success:function(returnValue){
	   		indexdata=returnValue;
	    }
	});
    //详细信息信息a
    
    function userview(){
    if(gird.getSelected()==null){
    	alert("请选中一行");
    }else{
 	 	  var selValue=gird.getSelected().certnumber;
 	 	ligerwindow=  	$.ligerDialog.open({
            	url:'/jwr/JSP/mot/motUserDetail.jsp?id='+gird.getSelected().id+'&usertype='+gird.getSelected().usertype+'&commonname='+encodeURI(encodeURI(gird.getSelected().commonname)),
            	width:860,
            	height:500,
            	title:'主管机关<font color="red">'+gird.getSelected().motname+'</font>详细信息'
        	});
   	 }
   	}
    
    //重置密码
    function resetPwd(){
    	 if(gird.getSelected()==null){
    	    	alert("请选中一行");
    	    }else{
    	 	 	  var selValue=gird.getSelected().user_id;
    	 	 	$.ajax({
    	 		    type:"POST",
    	 		    async:false,
    	 		    url:"/jwr/motControl/resetPwdAction.action",
    	 		    data:{username:selValue},
    	 		    success:function(returnValue){
    	 		   		if(returnValue=='1'){
    	 		   			alert("重置成功");
    	 		   		}else{
    	 		   			alert("重置密码失败，请与管理员联系");
    	 		   		}
    	 		    }
    	 		});
    	   	 }
    }
    function mdelete(){
    	 if(gird.getSelected()==null){
    	    	alert("请选中一行");
    	    }else{
    	 	 	  var selValue=gird.getSelected().user_id;
    	 	 	  var id =gird.getSelected().id;
    	 	 	  var commonname=gird.getSelected().commonname;
    	 	 	if (confirm('确定删除用户名称为'+commonname+'的用户信息?')) 
 	           { 
    	 	 	$.ajax({
    	 		    type:"POST",
    	 		    async:false,
    	 		    url:"/jwr/motControl/mdeleteAction.action",
    	 		    data:{username:selValue,id:id},
    	 		    success:function(returnValue){
    	 		   		if(returnValue=='1'){
    	 		   			alert("删除成功");
    	 		   			gird.reload();
    	 		   		}else{
    	 		   			alert("删除失败，请与管理员联系");
    	 		   		}
    	 		    }
    	 		});
 	           }
    	   	 }
    }
    
//给用户分配权限
    var ligerwindow;
    function userrole(){
    if(gird.getSelected()==null){
    	alert("请选中一行");
    }else{
 	 	  var selValue=gird.getSelected().certnumber;
 	 	ligerwindow=	$.ligerDialog.open({
            	url:'/jwr/JSP/deleteMenu.jsp?userid='+gird.getSelected().user_id+'&usertype='+gird.getSelected().usertype+'&commonname='+gird.getSelected().commonname,
            	width:600,
            	height:600,
            	title:'主管机关<font color="red">'+gird.getSelected().motname+'</font>详细信息'
        	});
   	 }
   	}
    var upperData = '<%= request.getSession().getAttribute("mot") == null ?"" :request.getSession().getAttribute("mot").toString()%>';
   	
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
        $(initLiger);
        function  initLiger(parms) {
            window['g'] = 
           gird=$("#maingrid4").ligerGrid({
                columns: [ 
            { display: '用户名称', name: 'commonname',  align: 'center' },
            { display: '主管机关', name: 'motname',  align: 'center'  },
            { display: '联系人', name: 'contact',  heightAlign: 'center'   },
             { display: '联系人手机', name: 'mobiletelephone',  heightAlign: 'center' },
             { display: '证件号', name: 'paperid',  heightAlign: 'center' },
             { display: '用户ID', name: 'user_id',  heightAlign: 'center' },
             { display: '可用/停用', name: 'usable',  heightAlign: 'center',render:function(item){
            	 if(item.usable=='0'){
            		 return "停用";
            	 }else{
            		 return "可用";
            	 }
             } }
                        ], 
               toolbar: { 
               	items: [
                           { text: '查看', click: userview, icon: 'modify' },
                           {line:true},
                           /* { text: '分配权限', click: userrole, icon: 'modify' },
                           {line:true}, */
                           { text: '重置密码', click: resetPwd, icon: 'modify' },
                           {line:true},
                           { text: '删除', click: mdelete, icon: 'modify' }
               	       ]
               },
               url:"/jwr/motControl/getMotUserListAction.action",
               parms:parms,
  	            width: '100%', 
                height: '320', 
                rownumbers: true
            });
           
            $("#pageloading").hide();
        }
    
        function beginEdit() {
            var row = gird.getSelectedRow();
            if (!row) { alert('请选择行'); return; }
            gird.beginEdit(row);
        }
        function cancelEdit() {
            var row = gird.getSelectedRow();
            if (!row) { alert('请选择行'); return; }
            gird.cancelEdit(row);
        }
        function cancelAllEdit()
        {
        	gird.cancelEdit();
        }
        var returnResult;
        function endSubmit(){
        	//确认添加行
        	gird.submitEdit();
        }
        function endEdit()
        {
        	var row = gird.getSelectedRow();
            if (!row) { alert('请选择行'); return; }
            if(row['__index']+1 != gird.getData().length &&returnResult !=null) {alert('请选择新增的行！'); return;}
            else{
            	if(returnResult!=null&&!returnResult){
	           	 $.ajax({
	            	    type:"POST",
	            	    async:false,
	            	    data:"json="+JSON2.stringify(row),
	            	    url:"/jwr/motControl/motAddAction.action",
	            	    success:function(returnValue){
	            	   		if(returnValue=='yes'){
	            	   			returnResult=true;
	            	   			alert(row.motname+"新增成功！");
	            	   			gird.endEdit(row);
	            	   		}else{
	            	   			alert(returnValue);
	            	   		}
	            	    }
	            	});
            	}else{
            		$.ajax({
	            	    type:"POST",
	            	    async:false,
	            	    data:"json="+JSON2.stringify(row),
	            	    url:"/jwr/motControl/motUpdateAction.action",
	            	    success:function(returnValue){
	            	   		if(returnValue=='yes'){
	            	   			returnResult=true;
	            	   			alert(row.motname+"修改成功！");
	            	   		}else{
	            	   			alert(returnValue);
	            	   		}
	            	    }
	            	});
            	}
            }
           
            
        }
        function endAllEdit()
        {
        	gird.endEdit();
        }
        function deleteRow()
        { 
        	gird.deleteSelectedRow();
        }
        var newrowid = 100;
        function addNewRow()
        {
        	//确认添加行
        	gird.submitEdit();
        	if(!returnResult&&returnResult!=null){alert("请提交修改！");return;}
        	gird.addEditRow();
        	returnResult=false;
        	alert('操作完成后请点击确认,并选中操作的行进行提交！');
        } 
         
        function getSelected()
        { 
            var row = gird.getSelectedRow();
            if (!row) { alert('请选择行'); return; }
            alert(JSON2.stringify(row));
        }
        function getData()
        { 
            var data = gird.getData();
            alert(JSON2.stringify(data));
        } 
      
    function motAdd(){
    	 var ligerwindow;
    	 /*
	        	ligerwindow=$.ligerDialog.open({
	        		url:'JSP/mot/en/enDbzpDetail.jsp?type='+selected.busclass,
	            	width:400,
	            	height:200,
	             	title:'交通运输企业<font color="red">'+selected.name+'</font>达标自评详情'
	         	});
	        	;
	        	*/
    }
    function query(){
    	var indexdata;
    	var admin = $("#admin").val();
    	var val = $("#selInfo").val();
    	var pid = $("#pid").val();
    	var parms = {"admin":admin,"motname":val,"pid":pid};
    	initLiger(parms);
    }
    function reset(){
    	var val = $("#selInfo").val("");
    	var pid = $("#pid").val("");
    }
    </script>
	</head>
<body>
			<div class="eui-info">
				<div class="eui-tip icon-tip"></div>
				<div>管理本主管机关的下级主管机关。</div>
			</div>
		 <table style="margin-left: 10">
			<tr style="width: 100%">
				<td>
					<label>用户类型：</label>
					<select id="admin">
						<option value="mot" selected="selected">主管机关</option>
						<option value="org">考评机构</option>
						<option value="pn">考评员</option>
						<option value="en">企业</option>
					</select>
				</td>
				<td style="margin-left:10">
					<label>名称：</label>
					<input type="text" id="selInfo" name="selInfo"/>
				</td>
				<td style="margin-left:10">
					<label>证件号：</label>
					<input type="text" id="pid" name="selInfo"/>
				</td>
				<td style="margin-left: 10">
					<a onclick="query();" iconcls="icon-reload" href="javascript:void(0);" class="easyui-linkbutton l-btn"id="ss"
						 style="margin-top: 10px; margin-left: 10px;">
						<span class="l-btn-left">
							<span class="l-btn-text icon-reload" style="padding-left: 20px;">查询</span>
						</span>
					</a>
					<a onclick="reset();" iconcls="icon-reload" href="javascript:void(0);" class="easyui-linkbutton l-btn"id="ss"
						 style="margin-top: 10px; margin-left: 10px;">
						<span class="l-btn-left">
							<span class="l-btn-text icon-reload" style="padding-left: 20px;">重置</span>
						</span>
					</a>
				</td>
			</tr>
		</table>
<div class="l-clear"></div>
		<div class="l-loading" style="display: block" id="pageloading">
    </div>
    <div id="maingrid4" style="margin: 0; padding: 0">
    </div>
    <div style="display: none;">
    </div>
	
</body>
</html>

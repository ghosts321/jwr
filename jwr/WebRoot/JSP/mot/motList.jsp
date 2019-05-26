<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../main.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>
		  下级列表
		</title>
	 <script type="text/javascript">
    var indexdata="";
    var totalSize="";
    var gird;
    $.ajax({
	    type:"POST",
	    async:false,
	    url:"/jwr/motControl/getMotListAction.action",
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
    //详细信息
    function itemclick(){
    if(gird.getSelected()==null){
    	alert("请选中一行");
    }else{
 	 	  var selValue=gird.getSelected().certnumber;
        	$.ligerDialog.open({
            	url:'JSP/motControl/scanDetail.jsp?certnumber='+selValue,
            	width:550,
            	height:400,
            	title:'主管机关<font color="red">'+gird.getSelected().motname+'</font>详细信息'
        	});
    	
   	 }
   	}
    var upperData = '<%= request.getSession().getAttribute("mot") == null ?"" :request.getSession().getAttribute("mot").toString()%>';
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
        $(function ()
        {
        	
            window['g'] = 
           gird=$("#maingrid4").ligerGrid({
                columns: [ 
            { display: '代码编号', name: 'motcode',  align: 'center',
                editor: { type: 'text',readonly:true }},
            { display: '名称', name: 'motname',  align: 'center' ,
                    editor: { type: 'text'} },
            { display: '上级机关', name: 'motupper', align: 'center', heightAlign: 'center' ,
                        editor: { type: 'text',  value:upperData,readonly:true} } 
                        ], 
                rownumbers: true,
                url: "<%=basePath%>motControl/getMotListAction.action",
                height: 400, 
                enabledEdit: true,
                clickToEdit: false,
                pageSize:20,
                page:1
            });
           
            $("#pageloading").hide();
        });
    
    	//删除左右两端的空格
	     function trim(str){ 
	            return str.replace(/(^\s*)|(\s*$)/g, "");
	     }
  		//校验确认后的数据 是否满足提交
  		var sureEndit='no';
  		function checkSubmit()
  		{
  			if(sureEndit=='no'){
  				alert('请先确认新增行！');return false;
  			}
  			var row = gird.getSelectedRow();
        	if (!row) { alert('请选择行'); return; }
            if(row['__index']+1 != gird.getData().length &&returnResult !=null) {alert('请选择新增的行！'); return;}
            var motcode=trim(row.motcode);
        	var motname=trim(row.motname);
        	//alert("---"+motcode+"--"+motname);
        	if(motcode==''||motcode==null){
        		alert("代码编号不能为空！");
        		gird.beginEdit(row);
        		sureEndit='no';
        		return false;
        	}
        	if(motname==''||motname==null){
        		alert("名称不能为空！");
        		gird.beginEdit(row);
        		sureEndit='no';
        		return false;
        	}
        	
        	return true;
  		}
        var returnResult;
        function endSubmit(){
        	//确认添加行
        	//gird.submitEdit();  
        	gird.endEdit();  
        	sureEndit='yes';	
        }
        function endEdit()
        {
        	if(!checkSubmit()){return;}
        	var row = gird.getSelectedRow();
        	
            if (!row) { alert('请选择行'); return; }
            if(row['__index']+1 != gird.getData().length &&returnResult !=null) {alert('请选择新增的行！'); return;}
            else{
            	if(returnResult!=null&&!returnResult){
            		var isbol=false; 
            		var motcode=row.motcode;
            		$.ajax({
	            	    type:"POST",
	            	    async:false,
	            	    data:{motcode:motcode},
	            	    url:"/jwr/motControl/getMotCodeIsRealyAction.action",
	            	    success:function(returnValue){
	            	   		if(returnValue=='yes'){
	            	   			isbol=true;
	            	   		}else{
	            	   			isbol=false;
	            	   		}
	            	    }
	            	});
            		if(isbol){
						alert("此主管机关代码已存在，请修改！");            		
            			return;
            		};
	           	 $.ajax({
	            	    type:"POST",
	            	    async:false,
	            	    data:"json="+JSON2.stringify(row),
	            	    url:"/jwr/motControl/motAddAction.action",
	            	    success:function(returnValue){
	            	   		if(returnValue=='yes'){
	            	   			returnResult=true;
	            	   			alert(row.motname+"新增成功！");
	            	   			//gird.endEdit(row);
	            	   			gird.setOptions({newPage:'1'});
	            	   			gird.reload();
	            	   			temp=true;
	            	   		}else{
	            	   			alert(returnValue);
	            	   		}
	            	    }
	            	});
            	}else{
            		/*
            		$.ajax({
	            	    type:"POST",
	            	    async:false,
	            	    data:"json="+JSON2.stringify(row),
	            	    url:"/jwr/motControl/motUpdateAction.action",
	            	    success:function(returnValue){
	            	   		if(returnValue=='yes'){
	            	   			returnResult=true;
	            	   			alert(row.motname+"修改成功！");
	            	   			gird.reload();
	            	   		}else{
	            	   			alert(returnValue);
	            	   		}
	            	    }
	            	});
            		*/
            	}
            }
           
            
        }
        function endAllEdit()
        {
        	gird.endEdit();
        }
        var temp='';
        
        function deleteRow()
        { 
        	var row = gird.getSelectedRow();
            if (!row) { alert('请选择行'); returnResult=true; return; }
            if(row.id==''||row.id==null){
            	returnResult=true;
            	gird.deleteSelectedRow();
            	if(temp==''){
            	 window.location.reload();
            	}
            }else{
                var motName=gird.getSelected().motname;
            	if (confirm('确定删除名称为'+motName+'的机构?')) 
 	           { 
            	$.ajax({
            	    type:"POST",
            	    async:false,
            	    data:"json="+JSON2.stringify(row),
            	    url:"/jwr/motControl/motUpdateDelAction.action",
            	    success:function(returnValue){
            	   		if(returnValue=='yes'){
            	   			returnResult=true;
            	   			alert(row.motname+"删除成功！");
            	   			gird.setOptions({newPage:'1'});
            	   			gird.reload();
            	   		}else{
            	   			alert(returnValue);
            	   		}
            	    } 
            	});
            }
            }
        }
        function addNewRow()
        {
			        	 
        	$.ajax({
  				  type:"POST",
  				  async:true,
  				  cache: false,
  				  pageSize:20,
  				  page: 1,
  			      url: "<%=basePath%>motControl/getNowMotCodeAction.action",
  			      success:function(returnValue){
  			   		if(returnValue.length>0){
  			   		 var rowData={
  			   			motcode:returnValue,
  			   			motname:'',
  			   			motupper:upperData
  			   		   };
	        	       gird.addEditRow(rowData);
  			   		}
  			    }
  			});
            if(!returnResult&&returnResult!=null){alert("请提交修改！");return;}
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
    </script>
	</head>
<body>
			<div class="eui-info">
				<div class="eui-tip icon-tip"></div>
				<div>管理本主管机关的下级主管机关。</div>
			</div>
			<a class="l-button" style="width:100px;float:left; margin-left:6px;" onclick="addNewRow()">添加</a>
			<a class="l-button" style="width:80px;float:left; margin-left:6px;" onclick="endSubmit()">确认</a>
  			<a class="l-button" style="width:80px;float:left; margin-left:6px;" onclick="endEdit()">提交</a>
			<a class="l-button" style="width:120px;float:left; margin-left:6px;" onclick="deleteRow()">删除</a>

<div class="l-clear"></div>
		<div class="l-loading" style="display: block" id="pageloading">
    </div>
    <div id="maingrid4" style="margin: 0; padding: 0; width:95%;">
    </div>
    <div style="display: none;">
    </div>
	
</body>
</html>

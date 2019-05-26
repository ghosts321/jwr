<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>
<%@ page contentType="text/html; charset=utf-8" %>

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
    var indexdata2="";
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
 	 	  var id=gird.getSelected().id;
        	ligerwindow=$.ligerDialog.open({
        		url:'JSP/mot/org/applyDetail.jsp?id='+id,
		     	width:838,
		     	height:580,
		     	title:'考评机构<font color="red">'+gird.getSelected().orgname+'</font>详细信息'
		 	});
	  // ;
    	
   	 }
   	}
   	
   	//发证
   	function grantBook(){
   	 if(gird.getSelected()==null){
    	alert("请选中一行");
      }else{
 	 	  var userId=gird.getSelected().userId;
 	 	  var busType=gird.getSelected().busType;
 	      var filetext=encodeURI(encodeURI(gird.getSelected().filetext,'utf-8'));
		  var orgname=encodeURI(encodeURI(gird.getSelected().orgname,'utf-8'));
		 	 var grade=gird.getSelected().grade;
		 var applyid=gird.getSelected().id;
		 var remark=gird.getSelected().remark; 
		 var pid=gird.getSelected().pid;
		 var adminmot=gird.getSelected().adminmot;
			//判断是否有此类型证书
			$.ajax({
		    type:"POST",
		    async:false,
		    url:"/jwr/orgListControl/getOrgList2Action.action",
		    data:{bustype:busType,userid:userId},
		    success:function(returnValue){
		   		if(returnValue=="error"){
		   			alert("已经存在此类型证书");
		   			return false;
		   		}else{
		   			ligerwindow=$.ligerDialog.open({
		         		url:'JSP/mot/org/grantBook.jsp?userId='+userId+'&busType='+busType+'&orgname='+orgname+'&grade='+grade+'&remark='+remark+'&applyid='+applyid+'&pid='+pid+'&filetext='+filetext+'&adminmot='+adminmot,
		 		     	width:950,
		 		     	height:600,
		 		     	title:'考评机构<font color="red">'+gird.getSelected().orgname+'</font>详细信息'
		 		 	});
		   		}
		    }
			});
		 
         	
 	   ;
   	  }
   	}
   	
// 	删除记录
	function delOrgApply(){
		 if(gird.getSelected()==null){
 	    	alert("请选中一行");
 	    }else{
			var id=gird.getSelected().id;
			if (confirm('确定删除?')) 
	         { 
			 $.ajax({
				    type:"POST",
				    async:false,
				    url:"/jwr/respOrg/delOrgApplyAction.action",
				    data:{"id":id},
				    success:function(returnValue){
				   		if(returnValue=='ok'){
				   			alert("已删除");
				   		}else if(returnValue=='error'){
				   			alert("删除失败");
				   		}
				    }
				});
			//关闭页面重新加载表格数据
	        gird.reload();
	         }
 	    }
	}
   	
   	function exportExcel(){
	   	 window.location.href="/jwr/orgControl/exportAction.action";
   		 	}
   		 	
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
        $(initLiger);
        function  initLiger(parms) {
            window['g'] = 
           gird= $("#maingrid4").ligerGrid({
                columns: [ 
            { display: '主管机关', name: 'motname',  align: 'center',width:180 },
            { display: '名称', name: 'orgname',  align: 'center' ,width:180},
            { display: '业务类别', name: 'filetext',  heightAlign: 'center' },
            { display: '等级', name: 'grade',    align: 'center' ,
            	render: function (item)
                {
           		 if(item.grade=="2"){return '二级';}
           		 else if (item.grade=="3"){ return '三级';}
                    else{return ' ';}
                }},
            { display: '证书号', name: 'cid',  align: 'center' }, 
            { display: '发证时间', name: 'cdate',  align: 'center' }], 
                rownumbers: true,
                url:"/jwr/orgControl/getOrgBookListAction.action",
                toolbar: { 
                	items: [
                	       
                	        { text: '文件导出(全部'+totalSize+'行)', click: exportExcel, icon: 'add' },
                            { text: '详细信息', click: itemclick, icon: 'modify' },
                            { text: '发证', click: grantBook, icon: 'orgImg' },
                            { text: '删除', click: delOrgApply, icon: 'delete' }
                            
                	       ]
                },
                width: '900', 
                height: '320', 
                checkbox: false
            });
            $("#pageloading").hide();
        }
    </script>
</head>

<body style="padding:10px;">
	<h1>考评机构资质证书制发</h1>
	<DIV class=eui-info>
		<DIV class="eui-tip icon-tip"></DIV>
		<DIV>所有已审核通过的申请，从系统可直接套打A3纸，也可生成电子证书送印刷机构批量套印。</DIV>
	</DIV>
	<div style="margin:10px auto;"></div>
	<div class="l-loading" style="display: block;" id="pageloading"></div>
	
	<div id="maingrid4" style="margin: 0; padding: 0"></div>
	<div style="display: none;"></div>
</body>
</html>

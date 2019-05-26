<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../main.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


    <script type="text/javascript">
    var indexdata="";
    var totalSize="";
    var gird;
    //页面中声明一个变量
  	var postdata;
    //详细信息
    function itemclick(){
    	var selected = gird.getSelected();
        if (selected==null) { 
        	alert('请选择行');
        	return; 
        }else{
        	var name = selected.enname;
        	var str = JSON2.stringify(selected);
        	postdata=str;
        	manager1 = $.ligerDialog.open({
        		url:'JSP/mot/en/entail.jsp?flag=1',
             	width:750,
             	height:550,
             	title:'交通运输企业<font color="red">'+name+'</font>详细信息'
         	});
        }
   	}
   	
    //导出
   	   	function exportExcel(){
	   	   	var selected = gird.getSelected();
	   	   	 
	   	   	var pid = "";
	   	   	var id = "";
		   	 window.location.href="/jwr/enProduce/exportExcelAction.action?pid="+pid+"&id="+id;
   		}
   		 	
   		//发证
   	   	function grantBook(){
   	   	 if(gird.getSelected()==null){
   	    	alert("请选中一行");
   	      }else{
   	 	 	  var userId=gird.getSelected().userId;
   	 	 	  var busType=gird.getSelected().type2;
   			 var enname=gird.getSelected().enname;
   			 var grade=gird.getSelected().grade;
   			 var remark=gird.getSelected().remarks;
   			 var respdate=gird.getSelected().respDate;
   			 var adminmot=gird.getSelected().adminmot;
   			 if(remark=='undefined'||remark==null||remark==null){
   				 remark="";
   			 }
   			 var applyid=gird.getSelected().id;
   			 var pid=gird.getSelected().pid; 
   	        	$.ligerDialog.open({
   	            	url:'<%=basePath%>JSP/org/en/grantBook.jsp?userId='+encodeURI(encodeURI(userId))+'&busType='+busType+'&enname='+encodeURI(encodeURI(enname))+'&grade='+grade+'&remark='+encodeURI(encodeURI(remark))+'&applyid='+applyid+'&pid='+pid+'&respdate='+respdate+'&adminmot='+adminmot,
   	            	width:950,
   	            	height:600,
   	            	title:'交通运输企业<font color="red">'+gird.getSelected().enname+'</font>详细信息'
   	        	});
   	    	
   	   	  }
   	   	}
   	
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
        $(initLiger);
        function  initLiger() {
            window['g'] = 
           gird=$("#maingrid4").ligerGrid({
                columns: [ 
            { display: '主管机关', name: 'adminMotName',  align: 'center'},
            { display: '名称', name: 'enname',  align: 'center'},
            { display: '业务类别', name: 'filetext',  heightAlign: 'center'},
            { display: '等级', name: 'grade',    align: 'center',
            	render: function (item){
            		if(item.grade=="2"){
            			return "二级";
            		}else if(item.grade=="3"){
            			return "三级";
            		}
            	}}], 
                rownumbers: true,
                url:"/jwr/enControl/getEnProduceListAction.action",
                toolbar: { 
                	items: [
                            { text: '详情', click: itemclick, icon: 'modify' },
                            { text: '发证', click: grantBook, icon: 'modify' }
                	       ]
                },
                width: '75%', 
                height: '60%', 
                checkbox: false
            });
           
            $("#pageloading").hide();
            
        }
        
    </script>
</head>

<body style="padding:10px;">
	<h1>企业达标等级证书制发</h1>
	<DIV class=eui-info>
		<DIV class="eui-tip icon-tip"></DIV>
		<DIV>所有已审核通过的申请，从系统可直接套打A3纸，也可生成电子证书送印刷机构批量套印。</DIV>
	</DIV>
	<DIV><A style="MARGIN: 10px" id=ap class="easyui-linkbutton l-btn" onclick="exportExcel()" ><SPAN class=l-btn-left><SPAN class=l-btn-text>导出电子表格</SPAN></SPAN></A></DIV>
	<div class="l-loading" style="display: block;" id="pageloading"></div>
	
	<div id="maingrid4" style="margin: 0; padding: 0"></div>
	<div style="display: none;"></div>
</body>
</html>

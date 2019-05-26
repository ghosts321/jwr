<%@ page language="java" import="java.util.*,java.net.*" pageEncoding="UTF-8"%>
<%@include file="../../main.jsp" %>
<%
 
			String userId=(String)request.getSession().getAttribute("userid");
			

String adminmot=request.getParameter("adminmot");
request.setAttribute("adminmot", adminmot);
String enname=request.getParameter("enname");
request.setAttribute("enname", enname);

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
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

    <script type="text/javascript">
    var indexdata="";
    var totalSize="";
    var len;
	  var userId='<%=userId%>';
	  var pid='<%=adminmot%>';
    var gird;
    $.ajax({
	    type:"POST",
	    async:false,
	    url:"/jwr/respInfo/getPnListByPidAction.action",
	    data:{pid:pid,userId:userId},
	    success:function(returnValue){
	   		indexdata=eval("("+returnValue+")");
// 	   		len=indexdata.Rows.length;
	    }
	});
	var manager1;
	//页面中声明一个变量
  	var postdata;
    //详细信息
    function itemclick(){
    if(gird.getSelected()==null){
    	alert("请选中一行");
    }else{
    	var str = JSON2.stringify(gird.getSelected());
    	postdata=str;
        	$.ligerDialog.open({
        		url:'JSP/mot/pn/applyedetialpn.jsp',
            	width:750,
            	height:500,
            	title:'考评员<font color="red">'+gird.getSelected().pnname+'</font>详细'
        	});
    	 
   	 }
   	}
   	
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
        $(function ()
        {
            window['g'] = 
           gird=$("#maingrid4").ligerGrid({
                columns: [ 
            { display: '姓名', name: 'pnname',  align: 'center' },
            { display: '证书类别', name: 'bussinestype',  align: 'center' ,render:function(item){return getBusTypeVal(item.bussinestype)==null?item.bustype:getBusTypeVal(item.bussinestype)} },
            { display: '证书编号', name: 'cid',  heightAlign: 'center' },
            { display: '专兼职', name: 'parttime',    align: 'center' },
            { display: '聘用日期', name: 'employdate',    align: 'center' }], 
                data: indexdata,
                rownumbers: true,
                url: "",
                toolbar: { 
                	items: [
                	       
                            { text: '详细信息', click: itemclick, icon: 'modify' }
                	       ]
                },
                usePager:false,
                width: '100%', 
                height: '60%', 
                checkbox: true
            });
           
            $("#pageloading").hide();
        });
        

       
        
        //保存考评员
        function savePn(){
        	var cardNo='';
        	var pnName="";
        	for(var i=0;i<gird.selected.length;i++){
//         		将身份证号凭借称cid;cid形式
        		if(cardNo==''){
        			cardNo=gird.getSelectedRows()[i].cid;
        		}else{
        		cardNo=cardNo+";"+gird.getSelectedRows()[i].cid;
        		}
        		pnName += gird.getSelectedRows()[i].pnname+"　　";
        	}
        	if(eval(cardNo) =='' || eval(cardNo) == null){
        		alert("请选择考评员");
		    }else if(cardNo.split(";").length<3){
		    	alert("至少选择三个考评员");
		    }else{
		    	alert(cardNo);
		    	alert("提交成功，窗口将关闭");
				if(window.parent.isBol=='1'){
					 window.parent.iniData();
				 }
				window.parent.cardNo=cardNo;
				window.parent.showPn(pnName);
				 window.parent.ligerwindow.close();
		    }
        }
        
        
        
    </script>
</head>

<body style="padding:10px;">
	<h1>为<%=URLDecoder.decode(request.getAttribute("enname").toString(), "UTF-8")%>选择考评员：</h1>
	<div style="margin:10px auto;"></div>
	<div class="l-loading" style="display: block;" id="pageloading"></div>
	
	<div id="maingrid4" style="margin: 0; padding: 0"></div>
	<div style="display: none;"></div>
	
	<br>
	<button class="easyui-linkbutton l-btn" href="#" iconcls="icon-ok"
		onclick="savePn()" id=""><span
		class="l-btn-left"><span class="l-btn-text icon-ok"
			style="padding-left: 20px; " >确定</span></span></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button class="easyui-linkbutton l-btn" onclick="window.parent.ligerwindow.close();"
		id=""><span class="l-btn-left"><span
			class="l-btn-text">关闭</span></span></button>
</body>
</html>

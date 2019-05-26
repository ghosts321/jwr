<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../main.jsp" %>
<%

			String userId=(String)request.getSession().getAttribute("userid");
// 			String realPath=request.getSession().getServletContext().getRealPath("/images");
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

    <script type="text/javascript">
    var filePath = "",indexdata="",totalSize="",userId = '<%=userId%>';
    var fileName="";
    var gird;
    function scan(){
    if(gird.getSelected()==null){
    	alert("请选中一行");
    }else{
 	 	  var selValue=gird.getSelected().certnumber;
        	$.ligerDialog.open({
            	url:'JSP/org/org/bookDetail.jsp?certnumber='+selValue,
            	width:550,
            	height:400,
            	title:'评审员<font color="red">'+gird.getSelected().orgname+'</font>详细'
        	});
    	
   	 }
   	}
    //下载
    function download(){
    	
//     	var path='<%=basePath%>images/';
//     	var fileName=path+name;
    	//alert(fileName);
    	 if(gird.getSelected()==null){
    	    	alert("请选中一行");
    	    }else{
//     	    	alert(gird.getSelected().freport)
//     	 	 	var selValue=gird.getSelected().certnumber;
				var name=gird.getSelected().fReport;
    	        window.location.href='<%= basePath%>updown/downloadFileAction?file='+name;
    	   	 }
    }
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
        $(function ()
        {
            window['g'] = 
           gird=$("#maingrid4").ligerGrid({
                columns: [ 
            { display: '年度', name: 'year',  align: 'center' },
            { display: '上报时间', name: 'createDate',  align: 'center'  },
            { display: '报告', name: 'fReport',  align: 'center' }
            ], 
            parms:{userId:userId},
            rownumbers: true,
            url:"/jwr/yearReport/getYearReportListAction.action",
            toolbar: { 
           	items: [
                       { text: '下载', click: download, icon: 'modify' },
                       { text: '查看', click: see, icon: 'modify' }
           	       ]
            },
             width: '1024', 
             height: '320', 
             checkbox: false
            });
            $("#pageloading").hide();
            
        });
        
        
        function sendApply(){
			 window.location.href="/jwr/JSP/org/org/orgReg.jsp";
        }
        
        var windowRetrun;
    	var stid;
    	/**
    	* <input type="hidden" name ="bean.属性"  id="id+'*'"
    	*弹出预览以后执行
    	*/
    	function afterItemclick(id){
    		var styleid=id+"_";//显示上传成功
    		var hiddenid=id+"*";//记录文件名
    		var ostyleid = document.getElementById(styleid);
    		var ohiddenid = document.getElementById(hiddenid);
    		if(ostyleid!=null || ostyleid!=undefined){
    			ostyleid.style.display = 'block';
    			
    			ohiddenid.value = windowRetrun;
    		}
    		var fileName=document.getElementById("pns*").value;
    		$("#seeImg").val(fileName);
    		if(fileName!=""||fileName!=undefined){
    			$("#button")[0].style.display="inline";
    		}
//     		var filePath='<%=basePath%>images/'+fileName;
// 			document.getElementById("img0").src=filePath;
    	}
        //隐藏查看
        function itemclick(id){
        	stid=id;
        		//  var m = $.ligerDialog.open({ url: 'JSP/pn/pnupload.jsp',width:800, height: 400, isResize: true }); 
        		window.open(
        			'<%=basePath%>/JSP/pn/pnupload.jsp',
        			'newwindow',
        			'height=200,width=400,top=100,left=100,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
        }
        
        //查看
        function see(){
	        if(gird.getSelected()==null){
	        	alert("请选中一行");
	        }else{
	        	 var freport=gird.getSelected().fReport;
	        	 
	        	 var ss=freport.split('.');
	    		 var fileType=ss[1];
	    		 //alert(fileType+"格式 ");
	        	if(fileType =='doc'){
	        		alert("本文件是"+fileType+"格式,请点击下载后，再查看！");
	        		return false;
	        	}
	        	seeImg('img0',freport);
	        }
        }
        function seeHid(){
        	var freport=$("#seeImg").val();
        	 var ss=freport.split('.');
    		 var fileType=ss[1];
    		 //alert(fileType+"格式 ");
        	if(fileType =='doc'){
        		look(freport);
        	}else{
				seeImg('img0',freport);
        	}
        }
        //保存
        function save(){
        
        	var fileName=document.getElementById("pns*").value;
        	  $.ajax({
        	    type:"POST",
        	    async:false,
        	    url:"/jwr/bookYearReport/saveYearReportAction.action",
        	    data:{'fileName':fileName},
        	    success:function(returnValue){
        	    	alert(returnValue);
//         	   		indexdata=returnValue;
//         	   		indexdata=eval("("+returnValue+")");
					gird.reload();
        	    }
        	});  
        }
        
    </script>
</head>

<body style="padding:10px;">
	<h1> 年度工作报告</h1>
	<input id="seeImg" type="hidden"/>
	<div class="l-loading" style="display: block; height: 30px" id="pageloading"></div>
	
	<div id="maingrid4" style="margin: 0; padding: 0"></div>
	<div id="hid" style="display: none;"></div>
	<!-- 	查看弹出框 -->
	<div id="popupContact">
		<a id="popupContactClose" ><font color="blue">关闭</font></a>
		<p id="contactArea">
			<img id="img0" src=""/>
		</p>
	</div>
	<div id="backgroundPopup"></div>
</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link type="text/css" href="css/main.css" rel="stylesheet">
<link type="text/css" href="css/easyui/default/easyui.css"
	rel="stylesheet">
<link type="text/css" href="css/easyui/icon.css" rel="stylesheet">

    <link href="js/gradejs/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="js/gradejs/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />
    <link href="js/gradejs/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
   	<link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />
    <script src="js/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="js/ligerui.min.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerToolBar.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script> 
    <script src="js/gradejs/ligerUI/js/plugins/ligerFilter.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerGrid.showFilter.js" type="text/javascript"></script>
    <script src="js/gradejs/CustomersData.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerWindow.js" type="text/javascript"></script>
	 <script src="js/popup.js" type="text/javascript"></script>
    <script type="text/javascript">
    var filePath = "",indexdata="",totalSize="",userId = '<%=userId%>';
    var fileName="";
    var gird;
    $.ajax({
	    type:"POST",
	    async:false,
	    url:"/jwr/yearReport/getYearReportListAction.action",
	    data:{'userId':userId},
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
    	var fileName=gird.getSelected().freport;
//     	var path='<%=basePath%>images/';
//     	var fileName=path+freport;
    	 $.ajax({
    		    type:"POST",
    		    async:false,
    		    url:"/jwr/bookYearReport/downloadReportAction.action",
    		    data:{'fileName':fileName},
    		    success:function(returnValue){
    		   		indexdata=returnValue;
    		    }
    		});
    }
    
   	
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
        $(function ()
        {
            window['g'] = 
           gird=$("#maingrid4").ligerGrid({
                columns: [ 
            { display: '年度', name: 'year',  align: 'center' },
            { display: '上报时间', name: 'createDate',  align: 'center'  }], 
                data: indexdata,
                rownumbers: true,
                url: "",
                toolbar: { 
                	items: [
                	       
                            { text: '下载', click: download, icon: 'modify' },
                            { text: '查看', click: see, icon: 'modify' }
                	       ]
                },
                
//                 pageSize: 30,
				usePager :false,
                width: '39.5%', 
                height: '85%', 
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
    		if(fileName!=""||fileName!=undefined){
    			$("#button")[0].style.display="inline";
    		}
    		var filePath='<%=basePath%>images/'+fileName;
			document.getElementById("img0").src=filePath;
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
        	var freport=gird.getSelected().freport;
        	var path='<%=basePath%>images/';
        	var fileName=path+freport;
        	document.getElementById("img0").src=fileName;
        	centerPopup();
    		loadPopup();
//         	document.getElementById("button").trigger("click"); 
        }
        //保存
        function save(){
        	var fileName=document.getElementById("pns*").value;
        	$.ajax({
        	    type:"POST",
        	    async:false,
        	    url:"/jwr/yearReport/saveYearReportAction.action",
        	    data:{'fileName':fileName},
        	    success:function(returnValue){
        	   		indexdata=returnValue;
        	    }
        	});
        }
    </script>
</head>

<body style="padding:10px;">
	<h1>2013 年度工作报告</h1>
	<div class="l-loading" style="display: block; height: 30px" id="pageloading"></div>
	<div style="height: 30px;margin-top: 10px">
		<LABEL>年度报告：</LABEL>
		    <SPAN id="button" style="display: none;margin-left: 0px;margin-right: 0px"><a>查看</a></SPAN>
		<span><td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="pns*" name="orgInfo.pns"
								  title="照片文件请勿超过10M大小；多次上传会覆盖之前的。"
								type="hidden" value=""><span></span><a
								class="easyui-linkbutton l-btn" 
								onclick="itemclick(this.id)" id="pns"><span
									class="l-btn-left"><span class="l-btn-text">上传文件..</span></span></a></td>
								<td style="border-bottom:1px dotted gray">
									<span id="pns_" style="display:none;color:blue;">
										             
									</span>
							    </td>	</span>
							    
	</div>
	<div style="height: 30px">
		<span><A id=save class="easyui-linkbutton l-btn" onclick="save();" href="/jwr/yearReport/enYearReportAction.action" ><SPAN class=l-btn-left><SPAN class=l-btn-text>保 存</SPAN></SPAN></A></span>
	</div>
	<div id="maingrid4" style="margin: 0; padding: 0"></div>
	<div style="display: none;"></div>
	<!-- 	查看弹出框 -->
	<div id="popupContact">
		<a id="popupContactClose">x</a>
		<p id="contactArea">
			<img id="img0" src=""/>
		</p>
	</div>
	<div id="backgroundPopup"></div>
</body>
</html>

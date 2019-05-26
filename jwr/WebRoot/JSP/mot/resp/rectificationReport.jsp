<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>
<%
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'pnApply.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

    
    <script type="text/javascript">
    var indexdata="";
    var totalSize="";
    var stid;
    var rowId;
   var initData=function (){ $.ajax({
	    type:"POST",
	    async:false,
	    url:"/jwr/problemRecAction/getRecInfosAction.action",
	    success:function(returnValue){
	   		indexdata=returnValue;
	    }
	});
   }
   initData();
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
    
  //下载
    function download(){
    	var name=grid.getSelected().refine_doc;
    	if(name==null||name==""){
    		alert("请先上传报告...");
    	}else{
//     	var path='<%=basePath%>images/';
//     	var fileName=path+name;
    	//alert(fileName);
    	 if(grid.getSelected()==null){
    	    	alert("请选中一行");
    	    }else{
//     	 	 	  var selValue=gird.getSelected().certnumber;
    	          window.location.href='<%= basePath%>updown/downloadFileAction?file='+name;
    	   	 }
    	}
    }
    
    //相见ligerGrid.showFilter.js
        $(function ()
        {
            window['g'] = 
            grid=$("#maingrid4").ligerGrid({
                columns: [ 
            { display: '日期', name: 'createDate',  align: 'center' },
            { display: '用户ID', name: 'userId',  align: 'center',width:120 },
            { display: '整改意见', name: 'advice_Refine',    align: 'center' },
            { display: '整改报告', name: 'refine_doc',  align: 'center' },
            { display: '整改报告日期', name: 'respdate_Refine',  heightAlign: 'center' }], 
            	url:"/jwr/problemRecAction/getRecInfosAction.action",
                rownumbers: true,
                toolbar: { 
               	items: [
               	       
                           { text: '下载', click: download, icon: 'modify' },
                           { text: '查看', click: see, icon: 'modify' }
               	       ]
                },
                width: '950', 
                height: '100%', 
                checkbox: false
            });
            $("#pageloading").hide();
        });
        function afterItemclick(id){
        	var styleid=id+"_";//显示上传成功
    		var hiddenid=id+"*";//记录文件名
    		var ostyleid = document.getElementById(styleid);
    		var ohiddenid = document.getElementById(hiddenid);
    		if(ostyleid!=null || ostyleid!=undefined){
    			ostyleid.style.display = 'block';
    			ohiddenid.value = windowRetrun;
    		}
    		//查看显示
    		var fileName=document.getElementById("pns*").value;
    		$("#seeImg").val(fileName);
    		if(fileName!=""||fileName!=undefined){
    			$("#button")[0].style.display="inline";
    		}
    	}
        
      //查看
        function see(){
        	var freport=grid.getSelected().refine_doc;
        	if(freport==null||freport==""){
        		alert("请先上传报告...");
        	}else{
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
        
        function itemclick(id){
        	var selected = grid.getSelected();
            if (!selected) { 
            	alert('请选择行');
            	return; 
            }else{
        		stid=id;
        		rowId = selected.id;
        		window.open(
        			'<%=basePath%>/JSP/pn/pnupload.jsp',
        			'newwindow',
        			'height=200,width=400,top=100,left=100,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
            }
        }
        
        function seeHid(){
        	var freport=$("#seeImg").val();
        	 var ss=freport.split('.');
    		 var fileType=ss[1];
    		 //alert(fileType+"格式 ");
        	if(fileType =='doc'){
        		alert("本文件是"+fileType+"格式,请点击下载后，再查看！");
        		return false;
        	}else{
        		seeImg('img0',freport);
        	}
        }
        
        function save(){
        	var fileName=document.getElementById("pns*").value;
        	if(fileName ==""){
        		alert("请上传文件!");
        		return;
        	}
        	$.ajax({
        	    type:"POST",
        	    async:false,
        	    url:"/jwr/problemRecAction/saveRecReportAction.action",
        	    data:{'stid':rowId,'fileName':fileName},
        	    success:function(returnValue){
        	    	if(returnValue=='yes'){
        	    		alert("提交成功");
	        	    	initData();
	        	   		indexdata=eval("("+indexdata+")");
	        	   		grid.loadData(indexdata);
        	    	}else{
        	    		alert(returnValue);
        	    	}
        	    }
        	});
        }
    </script>
</head>

<body style="padding:10px;">
	<h1>整改意见及报告</h1>
	<input id="seeImg" type="hidden"/>
	<div class="l-loading" style="display: block; height: 30px" id="pageloading"></div>
	<div style="height: 30px;margin-top: 10px">
		<LABEL>整改报告：</LABEL>
		 <SPAN id="button" style="display: none;margin-left: 0px;margin-right: 0px"><a id="see" onclick="seeHid()">查看</a></SPAN>
		<span><td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="pns*" name="orgInfo.pns"
								  title="照片文件请勿超过10M大小；多次上传会覆盖之前的。"
								type="hidden" value=""><span></span><a
								class="easyui-linkbutton l-btn" 
								onclick="itemclick(this.id)" id="pns"><span
									class="l-btn-left"><span class="l-btn-text">上传报告</span></span></a></td>
										<td style="border-bottom:1px dotted gray"><span id="met_"
								style="display:none;color:blue;"> 上传成功 </span></td>
							<td><font color="red">*</font></td>
									<span id="pns_" style="display:none;color:blue;">
										             
									</span>
							    </td>	</span>
							    
	</div>
	<div style="height: 30px">
		<span><A id="save" class="easyui-linkbutton l-btn" onclick="save();" href="javascript:void(0)" ><SPAN class=l-btn-left><SPAN class=l-btn-text>保 存</SPAN></SPAN></A></span>
	</div>
	
	<div id="maingrid4" style="margin: 0; padding: 0"></div>
	<div style="display: none;"></div>
	<!-- 	查看弹出框 -->
<!-- 	<div id="popupContact"> -->
<!-- 		<a id="popupContactClose" ><font color="blue">关闭</font></a> -->
<!-- 		<p id="contactArea"> -->
<!-- 			<img id="img0" src=""/> -->
<!-- 		</p> -->
<!-- 	</div> -->
<!-- 	<div id="backgroundPopup"></div> -->
</body>
</html>

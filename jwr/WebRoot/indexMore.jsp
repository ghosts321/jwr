<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="JSP/main.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>首页更多</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
 <link href="esp.css" rel="stylesheet" type="text/css" />
<link type="text/css" href="css/main.css" rel="stylesheet"/>
  <script src="js/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerToolBar.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script> 
    <script src="js/gradejs/ligerUI/js/plugins/ligerFilter.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerGrid.showFilter.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerWindow.js" type="text/javascript"></script>
    <script src="js/gradejs/CustomersData.js" type="text/javascript"></script>
	  <script type="text/javascript" language="java">
	  function HTMLEnCode(str) {
		  var s = "";
			  if (str.length == 0) return "";
			  s = str.replace(/&/g, "&gt;");
			  s = s.replace(/</g, "");
			  s = s.replace(/>/g, "");
			  s = s.replace(/ /g, "");
			  s = s.replace(/\"/g, "");
			  s = s.replace(/\'/g, "");
			  s = s.replace(/\n/g, "");
			  s = s.replace(/\//g, "");
			  s = s.replace(/\(/g, "");
			  s = s.replace(/\)/g, "");
			  s = s.replace(/\=/g, "");
		      return s;
		 }
	  function bm(id,text,fileName){
  		  var url="";
		  if(text!=""){
		  	 url="/jwr/updown/downloadFileAction?file="+fileName;
		  }else{
		  	url="synrDetail.jsp?id="+id; 
		  }
			 window.open(url);
	 }
	  function toContent(id){
			 window.open("/jwr/JSP/mot/content.jsp?id="+id);
		}
	   var a = "";
	   var type=<%=request.getParameter("type")%>;  
	   var ss1=""; 
	   var ss2=""; 
	   var ss3=""; 
	   var ss4=""; 
	   var ss5=""; 
	 
	  $(function (){
           $.ajax({
		    type:"POST",
		    async:false,
		    url:"/jwr/motControl/getIndexListFromTypeAction.action",
		    success:function(returnValue){
		   		a=eval("("+returnValue+")");
		   		a=a.Rows;
		   	}
		    });
		    for(var i=0;i<a.length;i++){
				var title=a[i].ptitle;
				var linkh=a[i].linkhref;
				var text=a[i].contenttext;
				var fileName=a[i].filename;
				var id =a[i].id;
				if(a[i].ptype == '1' && type == 1){
						ss1+="<li>";
						if(a[i].linkhref !=""){
							ss1+="<a href='javascript:void(0);' onclick=\"toContent('"+id+"');\">"+a[i].ptitle+"</a>"
							}else{
							ss1+="<a href='javascript:void(0);' onclick=\"bm('"+id+"');\">"+title+"</a>";
						}
						ss1+="</li>";
				}else if(a[i].ptype == '2' && type == 2){
						ss2+="<li>";
						if(a[i].linkhref !=""){
							ss2+="<a href='javascript:void(0);' onclick=\"toContent('"+id+"');\">"+a[i].ptitle+"</a>"
							}else{
							ss2+="<a href='javascript:void(0);' onclick=\"bm('"+id+"');\">"+title+"</a>";
						}
						ss2+="</li>";
				}else if(a[i].ptype == '3' && type == 3){
						ss3+="<li>";
						if(a[i].linkhref !=""){
							ss3+="<a href='javascript:void(0);' onclick=\"toContent('"+id+"');\">"+a[i].ptitle+"</a>"
							}else{
							ss3+="<a href='javascript:void(0);' onclick=\"bm('"+id+"');\">"+title+"</a>";
						
						}
						ss3+="</li>";
				}else if(a[i].ptype == '4' && type == 4){
						ss4+="<li>";
						if(a[i].linkhref !=""){
							ss4+="<a href='javascript:void(0);' onclick=\"toContent('"+id+"');\">"+a[i].ptitle+"</a>"
							}else{
							ss4+="<a href='javascript:void(0);' onclick=\"bm('"+id+"');\">"+title+"</a>";
						
						}
						ss4+="</li>";
				}else if(a[i].ptype == '5' && type == 5){
						ss5+="<li>";
						if(a[i].linkhref !=""){
							ss5+="<a href='javascript:void(0);' onclick=\"bm('"+id+"','"+text+"','"+fileName+"');\">"+title+"</a>";
						}else{
							ss5+="<a href='javascript:void(0);' onclick=\"bm('"+id+"');\">"+title+"</a>";
						
						}
						ss5+="</li>";
				}
			}
			
			
			if(ss1!=""){
	 			$("#detail").html(ss1);
	 			$("#title").html("政策法规 ");
	 		}else if(ss2!=""){
	 			$("#detail").html(ss2);
	 			$("#title").html("图片新闻");
	 		}else if(ss3!=""){
	 			$("#detail").html(ss3);
	 			$("#title").html("工作动态 ");
	 		}else if(ss4!=""){
	 			$("#detail").html(ss4);
	 			$("#title").html("公告公示 ");
	 		}else if(ss5!=""){
	 			$("#detail").html(ss5);
	 			$("#title").html("相关下载 ");
	 		}
	 })	;
	 
</script>	
  </head>
  
  <body>
    <center><h1>
    <div id="title" align="left"></div>
    <br/>
    <div align="left">
   	<ul id="detail"></ul>
    </div>
  </body>
</html>

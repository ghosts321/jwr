<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"  deferredSyntaxAllowedAsLiteral="true"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ include file="../main.jsp" %> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>文件上传</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<% String imgnames = request.getParameter("imgnames"); %>
<script type="text/javascript">
    function sub(){
    	var fileValue=document.getElementById("fileid").value;
    	var type ='<%=request.getParameter("filetype")%>';
    	 if(fileValue!=null){
    		 // url?fileType=jpg
    				 // 通过fileType 判断如何限制上传文件类型
    		var fileType=fileValue.substring(fileValue.lastIndexOf(".")+1);
    		if(fileType !='bmp'&&fileType !='BMP'&&fileType !='jpg'&&fileType !='JPG'&&fileType !='jpeg'&& fileType !='JPEG'&&fileType !='png'&&fileType !='PNG'&&fileType !='gif'&&fileType !='GIF'){
   		 	   	alert("上传的文件只能是图片格式!");
   		 		return false;
    		}
    	 }else{
    		 alert("请选择要上传的文件！");
    		 return false;
    	 }
    	  document.forms[0].action="<%=basePath%>/updown/uploadAction.action?flg=upload&imgnames=<%=imgnames%>";
    	 document.forms[0].submit();
    	 windowRetrun = document.getElementById("fileid").value;
         //;
    }
     
</script>
</head>

<body>
	<form action="" method="post" enctype="multipart/form-data" name="upload">
		<td>
		<input type="file" name="image" id="fileid" >
                <!-- <input type="submit"  value="上传" /> -->
        <input type="button" value="上传" onclick="sub();"/></td>
        <s:if test="#request.ms == 'yes'"> 
			<input type="text"  id="retvalue" value="<s:property value="#request.fileName"/>" />
		</s:if>
	</form>
</body>
	   <script type="text/javascript">
	     var retvalue=document.getElementById("retvalue");
	     if(retvalue!=null){
	     	retvalue=retvalue.value;
		     if(retvalue!=null&&retvalue!=""){
		    	window.opener.location.reload();
		     	window.close();
		     }
	     }
	   </script>
 
</html>

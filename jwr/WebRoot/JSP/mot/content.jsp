<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@include file="../main.jsp" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>内容查看</title>
<script src="/jwr/js/jquery-1.4a2.min.js" type="text/javascript"></script>
<style type="text/css">
<!--
.STYLE1 {font-size: 24px;color: #409BE1;}
.STYLE2 {font-size: 14px;color: #CCCCCC;}
.tab1Style {
border: 1px solid #E5E5E5;
text-align: center;
-webkit-box-shadow: 3px 3px 50px #E5E5E5;
box-shadow: 3px 3px 50px #E5E5E5;
}
body{
      width:auto; margin-top:12px; 
      float:center; font-family:Arial, Helvetica, sans-serif;
      font-size:14px; 
      color:#999999;
      line-height:25px;
      letter-spacing:1px
}
-->
</style>
<script type="text/javascript">
 
 $(function(){
	$.ajax({
	    type:"POST",
	    async:false,
	    url:"/jwr/motControl/toContentAction.action",
	    data:{"id":<%=request.getParameter("id")%>},
	    success:function(returnValue){
	    	  json_obj=eval('('+returnValue+')');
	    	  var ptype=json_obj.ptype;
	    	  var ptypeStr="";
	    	  if(ptype=="1"){
	    		  ptypeStr="政策法规";
	    	  }else if(ptype=="2"){
	    		  ptypeStr="图片新闻";
	    	  }else if(ptype=="3"){
	    		  ptypeStr="工作动态";
	    	  }else if(ptype=="4"){
	    		  ptypeStr="公告公示";
	    	  }else if(ptype=="5"){
	    		  ptypeStr="相关下载";
	    	  }
	    	  $("#ptitle").html(json_obj.ptitle);
	    	  $("#createdate").html("("+ptypeStr+")"+json_obj.createdate.substring(0,19));
	    	  $("#contenttext").html(json_obj.contenttext);
	    	  
	    	  var name=json_obj.filename;
	    	  var spanHtml="";
	    	  var bathPath='<%=basePath%>';
	    	  
	    	  if(name!=""){
	    		  //获取后缀
	    		  var pos = name.lastIndexOf(".");
	    		  var lastname = name.substring(pos,name.length);
	    		  
	    		  if(lastname=="jpg" || lastname=="png" || lastname=="jpeg"){
	    			  
			    	  var images=name.split(",");
			    	  
			    	  for(var i=0;i<images.length;i++){
			    		  var imagePath=images[i];
			    		  var imageName=imagePath.substring(imagePath.lastIndexOf("\\")+1,imagePath.lastIndexOf("."));
			    		  
			    		  var p=imagePath.split("images")[1];
			    		  
			    		  var pSub=p.substring(1,p.length);
			    		  
			    		  pSub=pSub.replace("\\","/");
			    		 
			    		  var path=bathPath+'images/'+pSub;
			    		  spanHtml+='<tr>';
			    		  spanHtml+='<td height="602"><p align="center"><img src="'+path+'" width="756" height="567"/></p>';
			    		  spanHtml+='<p align="center">'+imageName+'</p></td>';
			    		  spanHtml+='</tr>';
			    	  }
	    		  }else{
	    			  alert("pos");
	    			  var files=name.split(",");
	    			  for(var i=0;i<files.length;i++){
	    				  var filePath=files[i];
	    				  var fileName=imagePath.substring(imagePath.lastIndexOf("\\")+1,imagePath.lastIndexOf("."));
			    		  
						  var p=filePath.split("images")[1];
			    		  var pSub=p.substring(1,p.length);
			    		  pSub=pSub.replace("\\","/");
			    		  var path=bathPath+'images/'+pSub;
			    		  spanHtml+='<tr>';
			    		  spanHtml+='<td height="602"><p align="center"><a href="'+path+'" >'+fileName+'</a></td>';
			    		  spanHtml+='</tr>';
	    				  
	    			  }
	    		  }
		    	  $("#imageTr").html(spanHtml);
	    	  }
	   	}
	});
	
 })
</script>
</head>

<body>
<table width="70%" height="70%" class="tab1Style" align="center">
  <tr>
    <td><table width="50%" height="99%" border="0" cellpadding="0" cellspacing="0" align="center">
	  <tr>
	    <td>
	      <br>
  	    </td>
	  </tr>
      <tr>
        <td><div align="center" class="STYLE1" id="ptitle"></div></td>
      </tr>
	  <tr>
        <td align="right"><div id="createdate"></div></td>
      </tr>
      <tr>
        <td bordercolor="0"><div id="contenttext"></div></td>
      </tr>
      <tr>
         <td id="imageTr">
             
         </td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../main.jsp"%> 
<%
	String type = request.getParameter("type");
	request.setAttribute("type", type);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'jinduchaxun.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type="text/javascript">
	<%String   msg=request.getAttribute("ms")==null?"":request.getAttribute("ms").toString();
		 if(msg!=null&&!msg.equals("yes")&&!msg.equals("")){
			%>
				alert('<%=msg%>');
			<%
		}else{%>
			 
	<%
	}
	%>
	var indexdata="",totalSize="";
		function searchList(){
    	var userid=document.getElementById("userid").value;
    	if($.trim(userid)=="" || userid==null){
    		alert("请填写用户ID！");
    		return;
    	}
    	var password=document.getElementById("password").value;
    	if($.trim(password)=="" || password==null){
    		alert("请填写密码！");
    		return;
    	}
    	var type=document.getElementById("type").value;
    	   $.ajax({
    		    type:"POST",
    		    async:false,
    		    url:"/jwr/respInfo/jdcxAction.action",
    		    data: {"userid":userid,"password":password,"type":type},
    		    success:function(returnValue){
    		   		indexdata=returnValue;
    		    }
    		});
    		indexdata=eval("("+indexdata+")");
    	   if(indexdata.Total==0)
    	   {
    		   alert('未查询到满足条件的数据,请联系主管机关！');
    	   }else
    	   {
	    	  
	    	   var manager = $("#maingrid4").ligerGetGridManager(); 
	    	   manager.loadData(indexdata); 
    	   }
    }
     $(function ()
        {
          
          window['g'] = 
            $("#maingrid4").ligerGrid({
                columns: [ 
            { display: '用户ID', name: 'userId', align: 'center'  },
            { display: '审核结果', name: 'regresp',  align: 'center',render: function (item)
	        {
	   		  if (item.regresp=="0"){ return '尚未处理';}
	   		 else if (item.regresp=="1"){ return '同意';}
	   		 else if (item.regresp=="2"){ return '不同意';}
	            else{return '尚未处理';}
	        }  }, 
	        { display: '是否可登陆', name: 'regresp',  align: 'center',render: function (item)
	        {
	   		  if (item.regresp=="1"){ return '是';}
	          else{return '否';}
	        }  },
            { display: '审核意见', name: 'regrespremark',  align: 'center' }], 
                data: indexdata,
                url: "",
                width: '65%', 
                height: '65%',
                usePager:false
            });
        });
        function sub(){
        var userid=document.getElementById("yhm").value;
    	if($.trim(userid)=="" || userid==null){
    		alert("请填写用户ID！");
    		return;
    	}
    	var password=document.getElementById("mm").value;
    	if($.trim(password)=="" || password==null){
    		alert("请填写密码！");
    		return;
    	}
    	var code=document.getElementById("code").value;
    	if($.trim(code)=="" || code==null){
    		alert("请填身份证号！");
    		return;
    	}
    	var type=document.getElementById("type").value;
    	     document.form.action="/jwr/pn/regUpdataAction.action?type="+type;
    	     $("#updateForm").submit();
        }
        
        
        
	</script>
  </head>
  
  <body style="">
  <input id="type" value="${type}" type="hidden"/>
  <h1>报名申请信息修改</h1>
  	<div style="padding-bottom: 50" >
  		<form action="" id="updateForm" name="form" method="post">
	       <table>
	       	<tr>
	       		<td>
	       			<label>用户ID:</label>
	       			<input type="text" id="yhm" name="orgRegInfo.userid" value="${userid}" />
	       		</td>
	       		<td>
	       			<label>密码:</label>
	       			<input type="password" id="mm"   name="orgRegInfo.userpass"value="${password}"/>
	       		</td>
	       		<td>
	       			<label>身份证号:</label>
	       			<input type="text" id="code"  name="orgRegInfo.cpid"value="${code}"/>
	       		</td>
	       		<td>
	       			<input type="button" style="cursor: pointer;" value="提交查询" class="submit" onclick="sub();" align="right"/>
	       		</td>
	       	</tr>
	       </table>
	   </form>
  	</div>
  	
  <h1>申请进度查询</h1>
   <div>
       <td>
          <span style="color:blue">用户ID:</span>
          <input type="text" id="userid"align="left"/>
          <span style="color:blue">密码:</span>	  
          <input type="password" id="password"align="left"/>
          <input type="button" style="cursor: pointer;" value="提交查询" class="submit" onclick="searchList();" align="right"/>
       </td>
	</div>
	<div id="maingrid4" style="margin: 0; padding: 0" ></div>
  </body>
</html>

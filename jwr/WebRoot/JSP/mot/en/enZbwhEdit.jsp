<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>
<% 
String username=request.getSession().getAttribute("username").toString();%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>
<style>
    textarea{  
        border:0;  
        background-color:transparent;  
        width: 341px;
        height: 100px;  
    } 
</style>
<script type="text/javascript">
         var indexdata="";
         $(function (){  
        	  $.ajax({
        		    type:"POST",
        		    async:false,
        		    url:"/jwr/enControl/enZbwhListAction.action?type=<%=request.getParameter("type")%>",
        		    success:function(returnValue){
        		    	indexdata=eval("("+returnValue+")");
        		    	var optionstring="<option value='-1'>--------------请选择-------------</option>";
        		    	for(var item in indexdata){
        		    		optionstring+="<option value="+indexdata[item].i+">"+indexdata[item].name+"</option>";
        		    	}
        		    	$("#khnr").html(optionstring);
        		    }
        		});
        	 
         });
       //获取考核内容获取考核要点左侧子项
       function getKhydzuoByPid(i){
    	   $.ajax({
   		    type:"POST",
   		    async:false,
   		    url:"/jwr/enControl/enZbwhListAction.action?type=<%=request.getParameter("type")%>&i="+i,
   		    success:function(returnValue){
   		    	indexdata=eval("("+returnValue+")");
   		    	var optionstring="<option value='-1'>--------------请选择-------------</option>";
   		    	for(var item in indexdata){
   		    		optionstring+="<option value="+indexdata[item].j+">"+indexdata[item].name+"</option>";
   		    	}
   		    	$("#khyd1").html(optionstring);
   		    }
   		});
       }
       //获取考核内容获取考核要点右侧子项
       function getKhydyouByPid(j){
    	   var i=$('#khnr option:selected') .val();
    	   $.ajax({
      		    type:"POST",
      		    async:false,
      		    url:"/jwr/enControl/enZbwhListAction.action?type=<%=request.getParameter("type")%>&i="+i+"&j="+j,
      		    success:function(returnValue){
      		    	indexdata=eval("("+returnValue+")");
      		    	var cell1=indexdata[0].cell1; //考核要点
      		    	var cell2=indexdata[1].cell2; //考核细则
      		    	var trStr="";
      		    	for(var item in cell1){
	      		    	var k=cell2[item].k;
	      		        trStr+="<tr id='"+item+"'><td width='35%'><textarea disabled=true name='khyd"+item+"' id='khyder"+item+"'>"+cell1[item].name+"</textarea></td>"+
	      		    	"<td width='35%'><textarea disabled=true name='kpxz"+item+"' id='kpxz"+item+"'>"+cell2[item].name.replace(/\ +/g,"\r") +"</textarea></td>"+
	      		    	"<td width='10%'><input type='text' disabled=true name='fs"+item+"' size='5' id='fs"+item+"' value='"+cell1[item].score+"'/><input type='hidden' value='"+k+"'/></td>"+
	      		    	"<td width='10%'><input type='text' disabled=true name='xj"+item+"' size='5' id='xj"+item+"' value='"+cell1[item].star+"'/></td>"+
	      		    	"<td width='10%'><a id='xg"+item+"' href='javascript:void(0)' onclick='changeStyle("+item+")' href='#'>修改</a><br>"+
	      		    	"<a href='javascript:void(0)' onclick='updateKhyd("+item+","+i+","+j+","+k+")' id='bc"+item+"' style='display:none'>保存</a><br><br><a href='javascript:void(0)' onclick='deleteRow(this,"+item+","+i+","+j+","+k+")'>删除</a></td></tr>";
      		    	}
      		    	$("#trStr").html(trStr);
      		    }
      		});
       }
       
       function changeStyle(item){
    	   $("#khyder"+item).attr("disabled",false);
    	   $("#kpxz"+item).attr("disabled",false);
    	   $("#fs"+item).attr("disabled",false);
    	   $("#xj"+item).attr("disabled",false);
    	   $("#bc"+item).show();
    	   $("#xg"+item).hide();
    	 
       }
       function updateKhyd(item,i,j,k){
    	   
    	   var  type=<%=request.getParameter("type")%>; //类型
    	  
    	   var khyd=$("#khyder"+item).val(); //考核要点
    	   var kpxz=$("#kpxz"+item).val();   //考评细则
    	   var fs=$("#fs"+item).val();       //分数
    	   var xj=$("#xj"+item).val();       //星级
    	   
    	   if(khyd=="" || kpxz=="" || fs=="" || xj=="" ){
    		   alert("请完善数据");
    		   return false;
    	   }
    	   if(xj<0 || xj>3){
    		   alert("星级范围0~3");
    		   return false;
    	   }
    	   if(isNaN(fs) || fs<0){
    		   alert("分数格式有误");
    		   return false;
    	   }
    	   
    	   $.ajax({
     		    type:"POST",
     		    async:false,
     		    url:"/jwr/enControl/updateZbwhAction.action",
     		    data:{type:type,i:i,j:j,k:k,fs:fs,xj:xj,khyd:khyd,kpxz:kpxz},		
     		    success:function(returnValue){
     		    	var val=(eval("("+returnValue+")"));
     		    	if(val==true){
     		    		alert("修改成功");
     		    		shuaxin();
	     		    	/* parent.$.ligerDialog.close();
	     		    	parent.$(".l-dialog,.l-window-mask").remove();  */
     		    	}else{
     		    		alert("修改失败");
     		    	}
     		    }
    	   })
       }
       function addRow(){
    	   var tab =document.getElementById("trStr");
    	   var rowIndex=tab.rows.length+1;
    	   
    	   var nowId=$("#trStr").find("tr:last").attr("id");
    	   nowId=++nowId;
    	   //添加一行
    	   var tr=tab.insertRow();
    	   
    	   var td1=tr.insertCell();
    	   var td2=tr.insertCell();
    	   var td3=tr.insertCell();
    	   var td4=tr.insertCell();
    	   var td5=tr.insertCell();
    	   td1.width='35%';
    	   td2.width='35%';
    	   td3.width='10%';
    	   td4.width='10%';
    	   td5.width='10%';
    	   
    	   
    	   td1.innerHTML="<textarea  name='khyd"+nowId+"' id='khyder"+nowId+"'></textarea>";
    	   td2.innerHTML="<textarea  name='kpxz"+nowId+"' id='kpxz"+nowId+"'></textarea>";
    	   td3.innerHTML="<input type='text' name='fs"+nowId+"' size='5' id='fs"+nowId+"'/>";
    	   td4.innerHTML="<input type='text' name='xj"+nowId+"' size='5' id='xj"+nowId+"'/>";
    	   td5.innerHTML="<a href='javascript:void(0)' onclick='addKhyd("+nowId+")' id='bc"+nowId+"' style='display:block'>保存</a><br><br><a href='javascript:void(0)' onclick='delRow(this)'>删除</a>";
    	   //初始化行;  
           initRows(tab);  
    	   
       }
       //初始化行;  
       function initRows(tab){  
    	     var tabRows = tab.rows.length;  
    	     for(var i = 0;i<tabRows.length;i++){  
    	            tab.rows[i].cells[0].firstChild.value=i;  
    	    }  
    	}  
       //删除行;(obj代表连接对象)  
       function deleteRow(obj,item,i,j,k){  
    	   if(i==-1 || j==-1){
    		   alert("考核内容或者考核要点(1)没有选择");
    		   return false;
    	   }
    	   
    	   var  type=<%=request.getParameter("type")%>; //类型
           var tab = document.getElementById('trStr');  
           //获取tr对象;  
           var tr = obj.parentNode.parentNode;  
         
           tr.parentNode.removeChild(tr);
	           $.ajax({
	   		    type:"POST",
	   		    async:false,
	   		    url:"/jwr/enControl/deleteEnZbwhAction.action",
	   		    data:{type:type,i:i,j:j,k:k},		
	   		    success:function(returnValue){
	   		    	var val=(eval("("+returnValue+")"));
	   		    	if(val==true){
	   		    		alert("删除成功");
	   		    		shuaxin();
		     		    	/* parent.$.ligerDialog.close();
		     		    	parent.$(".l-dialog,.l-window-mask").remove();  */
	   		    	}else{
	   		    		alert("删除失败");
	   		    	}
	   		    }
	  	   })
       } 
       function delRow(obj){
    	   var tab = document.getElementById('trStr');  
    	   //获取tr对象;  
           var tr = obj.parentNode.parentNode;  
         
           tr.parentNode.removeChild(tr);
       }
       
       //添加指标维护
       function addKhyd(item){
    	   
    	   var tr=$("#trStr tr").eq(-2);
    	   var k=tr.find("td").find("input[type=hidden]").val();
    	   k=++k;
    	   var  type=<%=request.getParameter("type")%>; //类型
    	   var i=$('#khnr option:selected').val();
    	   var j=$('#khyd1 option:selected').val();
    	   
    	   if(i==-1 || j==-1){
    		   alert("考核内容或者考核要点(1)没有选择");
    		   return false;
    	   }
     	  
    	   var khyd=$("#khyder"+item).val(); //考核要点
    	   var kpxz=$("#kpxz"+item).val();   //考评细则
    	   var fs=$("#fs"+item).val(); //分数
    	   var xj=$("#xj"+item).val(); //星级
    	   
    	   if(khyd=="" || kpxz=="" || fs=="" || xj=="" ){
    		   alert("请完善数据");
    		   return false;
    	   }
    	   if(xj<0 || xj>3){
    		   alert("星级范围0~3");
    		   return false;
    	   }
    	   if(isNaN(fs) || fs<0){
    		   alert("分数格式有误");
    		   return false;
    	   }
    	   
    	   
    	   $.ajax({
    		    type:"POST",
    		    async:false,
    		    url:"/jwr/enControl/addEnZbwhAction.action",
    		    data:{type:type,i:i,j:j,k:k,fs:fs,xj:xj,khyd:khyd,kpxz:kpxz},		
    		    success:function(returnValue){
    		    	var val=(eval("("+returnValue+")"));
    		    	if(val==true){
    		    		alert("添加成功");
    		    		shuaxin();
	     		    	/* parent.$.ligerDialog.close();
	     		    	parent.$(".l-dialog,.l-window-mask").remove();  */
    		    	}else{
    		    		alert("添加失败");
    		    	}
    		    }
   	   })
       }
       
       function shuaxin(){
    	   var i=$('#khyd1 option:selected') .val();
    	   if(i==-1){
    		   i=1;
    	   }
   		   getKhydyouByPid(i);
       }
</script>
<body>
<form action="">
			<center>
			<h1>请选择要修改的内容</h1>
			<br>
			</center>
<table width="100%" border="1">
         <tr>
            <td width="40%">&nbsp;考核内容：
              <select name="select" id="khnr" onchange="getKhydzuoByPid(this.value)">
              </select></td>
           <td width="60%" colspan="4">&nbsp;考核要点(1)：
             <select name="select2" id="khyd1" onchange="getKhydyouByPid(this.value)">
              </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" onclick="addRow()">添加</a>
              </td>
         </tr>
         
         <tr>
           <td width="35%">&nbsp;考核要点</td>
           <td width="35%">&nbsp;考评细则</td>
           <td width="10%">&nbsp;分数</td>
           <td width="10%">&nbsp;星级</td>
           <td width="10%">&nbsp;操作</td>
         </tr>
           <tr>
             <td colspan="5"><table width="100%" id="trStr" border="1"></table></td>
           </tr>
     </table>
<form>
</body>
</html>
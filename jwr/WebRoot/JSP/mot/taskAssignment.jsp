<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ include file="../main.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<base href="<%=basePath%>">
		<title>
		</title>
<style type="text/css">
    .box
    {
        float: left;
    }
    .tree
    {
        width: 300px;
        height: 250px;
        margin: 5px;
        border: 1px solid #ccc;
        overflow: auto;
    }
    h4
    { margin: 10px;
    }
</style>
	 <script type="text/javascript">
	 //获取所有城市
	 $(function(){
		 $.ajax({
		    type:"POST",
		    async:false,
		    url:"/jwr/respInfo/getcityAction.action",
		    success:function(returnValue){
		   		indexdata=returnValue;
		   		var obj2=(eval("("+indexdata+")")).Rows;
		   		var str1="";
		   	    str1='<SELECT selected id="task_city" name="task_city" onchange="showMot(this.options[this.selectedIndex].value)">';
		   	    for(var i=0;i<obj2.length;i++){
		   			if(i==0){
		   				str1+='<OPTION selected value="">--请选择--</OPTION>';
		   				if('${orgInfo.city}'==obj2[i].du_code){
		   					str1+='<OPTION  value='+obj2[i].du_code+'>'+obj2[i].du_name+'</OPTION>';
		   				}else{
		   					str1+='<OPTION  value='+obj2[i].du_code+'>'+obj2[i].du_name+'</OPTION>';
		   				}
		   			}else{
		   				if('${orgInfo.city}'==obj2[i].du_code){
		   					str1+='<OPTION selected value='+obj2[i].du_code+'>'+obj2[i].du_name+'</OPTION>';
		   				}else{
		   					str1+='<OPTION  value='+obj2[i].du_code+'>'+obj2[i].du_name+'</OPTION>';
		   				}
		   			}
		   		}
		   		  str1+='</SELECT>';
		   		$("#city").html(str1); 
		    }
		 });
	 });
	 $(function(){
		 tree = $("#tree1").ligerTree({
	         url: '/jwr/taskAssignation/getValueTextAction.action',
	         isExpand:true,
	         nodeWidth : 240
	     });
	 });
	 function isSelected(motCode){
		 var dataStr = "abc";
		 $.ajax({
			    type:"POST",
			    async:false,
			    url:"/jwr/taskAssignation/getFileIdByMotCodeAction.action",
			    data:{motCode:motCode},
			    success:function(returnValue){
			    	dataStr = returnValue;
			    }
		 });
	    var parm = function(data){
			return dataStr.indexOf("'"+data.code+"'") != -1;
	    };
	    tree.selectNode(parm);
	 }
	 
	 function getChecked(){
		 var nodes = $("#tree1").ligerTree('getChecked');
		 var fileidStr = "";
		 for(var i=0;i<nodes.length;i++){
			fileidStr += nodes[i].data.code + ",";
		 }
		 $("#fileids").val(fileidStr);
	 }
	 var loginCity = "<%=request.getSession().getAttribute("motCity")%>"
	 //主管机关
	 function showMot(city){
		 var url="";
		 if(loginCity.length != 2 ){
			 if(city!=loginCity){
				 alert("请正确选择当前机构所在所在区域!");
				 $("#sa").html("");
				 return ;
			 }else{
				 url="/jwr/respInfo/getMotByCityMotAction.action";
			 }
		 }else{
			 url="/jwr/respInfo/getMotByCityAction.action";
		 }
		 $.ajax({
			    type:"POST",
			    async:false,
			    url:url,
			    data:{city:city},
			    success:function(returnValue){
			   		indexdata=returnValue;
			   		var obj1=(eval("("+indexdata+")")).Rows;
			   		var str="";
			   	    str='<SELECT id="mot" name="mot" onChange="isSelected(this.options[this.selectedIndex].value)">';
			   	    str+='<OPTION selected value="">--请选择--</OPTION>';
			   		for(var i=0;i<obj1.length;i++){
			   			if(i==0){
			   				str+='<OPTION value='+obj1[i].motcode+'>'+obj1[i].motname+'</OPTION>';
			   			}else{
			   				str+='<OPTION  value='+obj1[i].motcode+'>'+obj1[i].motname+'</OPTION>';
			   			}
			   		}
			   		str+='</SELECT>';
			   		$("#sa").html(str);
			    }
		  });
	 }
	 function check(){
		 var task_city = document.getElementById("task_city").value;
		 if(task_city == ""){
			 alert("请选择所在区域!");
			 return ;
		 }
		 var mot = document.getElementById("mot").value;
		 if(mot == ""){
			 alert("请选择主管机关!");
			 return ;
		 }
		 getChecked();
		 document.forms[0].submit();
	 }
    </script>
	</head>
<body>
	<div class="eui-info">
		<div class="eui-tip icon-tip"></div>
		<div>主管机关任务分配</div>
	</div> 
	 <form id="fm1" method="POST" action="/jwr/taskAssignation/saveTaskAssingationAction.action">
			<table style="margin-left: 30px">
				<caption style="padding: 5px">
					<h1 align="center">主管机关任务分配</h1>
				</caption>
				<tbody>
					<tr>
						<td
							style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>所在区域：</label></td>
						<td style="border-bottom:1px dotted gray" id="provinceSel">
							<span id="city"></span>
						</td>
						<td><font color="red">*</font> <input type="hidden" id="fileids" name="fileids"></td>
					</tr>
					<tr>
						<td
							style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
							title="省级交通厅、交委请选择“交通运输部”">主管机关：</label></td>
						<td style="border-bottom:1px dotted gray">
							<span id="sa"></span>
						</td>
						<td><font color="red">*</font></td>
					</tr>
					<tr>
						<td
							style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>专业分类：</label></td>
						<td style="border-bottom:1px dotted gray">
							 <div class="box" >
						         <div class="tree"> 
						            <ul id="tree1"></ul> 
						        </div> 
						    </div>
						</td>
						<td><font color="red">*</font></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td align="center" colspan="3" style="padding: 15px"><p>
								注：带红色<font color="red">*</font>的为必填项。
							</p>
							 <input type="button" class="button blue" value="提交" onclick="check()" id="send"style="width: 50;height: 20"/>
							 <input type="reset" calss="button blue" value="重置"  style="width: 50;height: 20"/> 
					</tr>
				</tfoot>
			</table>
		</form>
	
</body>
</html>

<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../main.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>
		  首页内容维护
		</title>
		<base href="<%=basePath%>">
<title>My JSP 'pntail.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
	 <script type="text/javascript">
    var indexdata="";
    var totalSize="";
    var gird;
   var iniData=function (){
	   $.ajax({
	    type:"POST",
	    async:false,
	    url:"<%= basePath %>motControl/getIndexListAction.action",
	    success:function(returnValue){
	   		indexdata=returnValue;
	   		indexdata=eval("("+indexdata+")");
	    }
		});
	   }
    iniData();
     //删除
     function deleteIndex(){
    	 if(gird.getSelected()==null){
 	    	alert("请选中一行");
 	    }else{
 	 	 	  var selValue=gird.getSelected().id;
 	 	 	  var ptitle=gird.getSelected().ptitle;
 	 	 	if (confirm('确定删除标题为'+ptitle+'的首页内容?')) 
	           { 
 	 	 	$.ajax({
        	    type:"POST",
        	    async:false,
        	    url:"/jwr/motControl/deleteIndexByIdAction.action?id="+selValue,
        	    success:function(returnValue){
        	   		if(returnValue=='yes'){
        	   			returnResult=true;
        	   			$.ligerDialog.warn("删除成功！");
        	   			 gird.reload();
        	   			 
        	   		}else{
        	   			alert(returnValue);
        	   		}
        	    }
        	});
 	     //$.ligerDialog.warn('操作完成后请点击确认,并选中操作的行进行提交！');
	           }
 	   	 }    	 
     }
    var ligerwindow;
    //详细信息
    function detail(){
	    if(gird.getSelected()==null){
	    	alert("请选中一行");
	    }else{
	 	 	  var id=gird.getSelected().id;
	 	 	ligerwindow=$.ligerDialog.open({
	            	url:'JSP/mot/motIndexDetail.jsp?id='+id,
	            	width:550,
	            	height:500,
	            	title:'首页内容详细信息'
	        	});
	    	
	   	 }
   	}
    var upperData = '测试';
   	
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
        $(function ()
        {
        	
            window['g'] = 
           gird=$("#maingrid4").ligerGrid({
                columns: [ 
            { display: '类型', name: 'ptype',  align: 'center',
            	render: function (item)
                {
           		 if(item.ptype=="1"){return '政策法规';}
           		 else  if(item.ptype=="2"){return '图片新闻';}
           		else  if(item.ptype=="3"){return '工作动态';}
           		else  if(item.ptype=="4"){return '公告公示';}
           		else  if(item.ptype=="5"){return '相关下载';}
                }
            },
            { display: '标题', name: 'ptitle',  align: 'center'},
            { display: '日期', name: 'createdate',  heightAlign: 'center'} ,
             { display: '附件', name: 'filename',  heightAlign: 'center' 
             },
            { display: '主键', name: 'id',  heightAlign: 'center' ,isAllowHide:false,hide:true  }
                        ], 
                toolbar: { 
                	items: [
							{ text: '详情', click: detail, icon: 'modify' },
                	        { text: '删除', click: deleteIndex, icon: 'delete' }
                	       ]
                },        
                url:"<%= basePath %>motControl/getIndexListAction.action",
                rownumbers: true,
                width: '700', 
                height: '340', 
                usePager:false
            });
           
            $("#pageloading").hide();
        });
    
       //提交
    function sendForm(){
    	 var tpe = document.getElementById("indexInfo.ptype").value;
    	var title = document.getElementById("indexInfo.ptitle").value;
    	 if(tpe==""||tpe==null||tpe==undefined){
    		 alert("类型不能为空");
    		 return false;
    	 }
    	 
    	 if(title==""||title==null||title==undefined){
    		 alert("标题不能为空");
    		 return false;
    	 }
    	$("#fm1").submit();
    	
    }
    //上传文件
     var windowRetrun;
	var stid;
    function itemclick(id) {
		stid=id;
		//  var m = $.ligerDialog.open({ url: 'JSP/pn/pnupload.jsp',width:800, height: 400, isResize: true }); 
		window.open(
			'<%=basePath%>/JSP/pn/pnupload.jsp',
			'newwindow',
			'height=100,width=400,top=100,left=100,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
		
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
		var fileName=document.getElementById("filename*").value;
		$("#seeImg").val(fileName);
		if(fileName!=""||fileName!=undefined){
			$("#button")[0].style.display="inline";
		}
	}
    
    
    //重置
    function rest(){
    	$(':input','#fm1')  
    	 .not(':button, :submit, :reset, :hidden')  
    	 .val('')  
    	 .removeAttr('checked')  
    	 .removeAttr('selected'); 

    }
    </script>
   
	</head>
<body>
	<form action="<%=basePath%>motControl/indexMotInsertAction.action" id="fm1" method="POST">
	<input id="seeImg" type="hidden"/>
		<table style="margin-left: 30px">
			<caption style="padding: 5px">
				<h1>首页栏目内容维护</h1>
			</caption>
			<tbody>
				<tr>
					<td style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray">
						<label>类型：</label>
					</td>
					<td style="border-bottom:1px dotted gray">
					<select id="indexInfo.ptype" name="indexInfo.ptype"  value="${indexInfo.ptype}" >
					
						    <option id="op1" value="1">政策法规</option>
							<option id="op2" value="2">图片新闻</option>
							<option id="op3" value="3">工作动态</option>
							<option id="op4" value="4">公告公示</option>
							<option id="op5" value="5">相关下载</option>
					</select>
							<script type="text/javascript">
								var ptype='${indexInfo.ptype}';
								if(ptype!=null&&ptype!=''){
									document.getElementById("op"+ptype).setAttribute("selected","selected" );
								}
							</script>
					</td>
					<td><font color="red">*</font></td>
				</tr>
				<tr>
					<td
						style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>标题：</label></td>
					<td style="border-bottom:1px dotted gray"><input
						class="easyui-validatebox validatebox-text" id="indexInfo.ptitle"
						name="indexInfo.ptitle"  value="${indexInfo.ptitle}" style="width:500px" type="text"></td>
					<td><font color="red">*</font></td>
				</tr>
				<%-- <tr>
					<td
						style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>连接：</label></td>
					<td style="border-bottom:1px dotted gray">
					<input class="easyui-validatebox validatebox-text" value="${indexInfo.linkhref}" id="indexInfo.linkhref" name="indexInfo.linkhref" style="width:500px" type="text">
					
					</td>
					<td><font color="lightgray">*</font></td>
				</tr> --%>
				<tr>
					<td
						style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray">
						<label>正文：</label>
						</td>
					<td style="border-bottom:1px dotted gray">
					<textarea class="easyui-validatebox validatebox-text" value="${indexInfo.contenttext}" id="indexInfo.contenttext" name="indexInfo.contenttext" style="width:800px;height:200px"></textarea></td>
					<td><font color="lightgray">*</font></td>
				</tr>
				<tr>
					<td
						style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>附件：&nbsp;&nbsp;<SPAN id="button" style="display: none;margin-left: 0px;margin-right: 0px"><a id="see" onclick="seeHid()">查看</a></SPAN>&nbsp;&nbsp;&nbsp;</label></td>
						<td style="border-bottom:1px dotted gray"><input
								class="easyui-validatebox validatebox-text" id="filename*"
								name="indexInfo.filename" title="注：多次上传会覆盖之前的。" type="hidden" value=""><a
								class="easyui-linkbutton l-btn"
								href="javascript:void(0)" onclick="itemclick(this.id)" id="filename"> 
								<span class="l-btn-left">
									<span class="l-btn-text">上传文件</span> 
								</span> 
								</a></td>
								<td style="border-bottom:1px dotted gray">
									<span id="filename_" style="display:none;color:blue;">
										              上传成功
									</span>
							    </td>		
					<td><font color="lightgray">*</font></td>
				</tr>
				<%-- <tr>
					<td
						style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
						title="缺省可不填，填1、2、3等，0表示置顶。">排序号：</label></td>
					<td style="border-bottom:1px dotted gray"><input
						class="easyui-validatebox validatebox-text" id="indexInfo.pno" name="indexInfo.pno" value="${indexInfo.pno}"
						title="缺省可不填，填1、2、3等，0表示置顶。" type="text"></td>
					<td><font color="lightgray">*</font></td>
				</tr> --%>
			</tbody>
			<tfoot>
				<tr>
					<td align="center" colspan="3" style="padding: 15px"><p>
							注：带红色<font color="red">*</font>的为必填项。
						</p>
					<a class="easyui-linkbutton l-btn" href="javascript:void(0)" iconcls="icon-undo"
						onclick="sendForm()" id="sendForm">
						<span class="l-btn-left">
						<span class="l-btn-text icon-undo" style="padding-left: 20px; ">提交</span>
						</span>
						</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a class="easyui-linkbutton l-btn" href="javascript:void(0)" iconcls="icon-undo"
						onclick="rest()" id="resert">
						<span class="l-btn-left">
						<span class="l-btn-text icon-undo" style="padding-left: 20px; ">重置</span>
						</span>
						</a>
				   </td>
				</tr>
			</tfoot>
		</table>
	</form>


	<div class="l-clear"></div>
		<div class="l-loading" style="display: block" id="pageloading">
    </div>
    <div id="maingrid4" style="margin: 0; padding: 0">
    </div>
    <div style="display: none;">
    </div>
	
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

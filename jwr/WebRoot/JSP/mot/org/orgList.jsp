<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 
    <script type="text/javascript">
    var indexdata="";
    var totalSize="";
    var gird;
    var ligerwindow;
    $(function(){
		//管理机关
        		 $.ajax({
        			    type:"POST",
        			    async:false,
        			    url:"/jwr/respInfo/getMotAction.action",
        			    success:function(returnValue){
        			   		indexdata1=returnValue;
        			   		var obj1=(eval("("+indexdata1+")")).Rows;
        			   		var str="";
        			   	    str='<SELECT id="adminmot" name="adminmot" style="width: 150px;">';
        			   		for(var i=0;i<obj1.length;i++){
        			   			if(i==0){
        			   				str+='<OPTION selected value="%">请选择</OPTION>';
        			   				str+='<OPTION value='+obj1[i].motcode+'>'+obj1[i].motname+'</OPTION>';
        			   			}else{
        			   				str+='<OPTION  value='+obj1[i].motcode+'>'+obj1[i].motname+'</OPTION>';
        			   			}
        						
        			   		}
        			   		
        			   		  str+='</SELECT>';
        			   		$("#sa").append(str);
        			    }
        			});
		});
    //详细信息
    function itemclick(){
    if(gird.getSelected()==null){
    	alert("请选中一行");
    }else{
 	 	  var selValue=gird.getSelected().id;
         	ligerwindow=$.ligerDialog.open({
         		url:'JSP/mot/org/scanDetail.jsp?id='+selValue,
 		     	width:880,
 		     	height:580,
 		     	title:'考评机构<font color="red">'+gird.getSelected().orgname+'</font>详细信息'
 		 	});
 	   ;
    	
   	 }
   	}
   	
    //导出excel
   	   	function exportExcel(){
	   	 window.location.href="/jwr/orgListControl/exportAction.action";
   		 	}
   	
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
    $(initLiger);
        function  initLiger(parms) {
            window['g'] = 
           gird=$("#maingrid4").ligerGrid({
                columns: [ 
            { display: '主管机关', name: 'adminmot',  align: 'center' },
            { display: '名称', name: 'orgname',  align: 'center' },
            { display: '业务类别', name: 'bustype',  heightAlign: 'center' },
            { display: '证书号', name: 'certnumber',  heightAlign: 'center' },
            { display: '等级', name: 'grade',    align: 'center',
            	render: function (item)
                {
           		 if(item.grade=="2"){return '二级';}
           		 else if (item.grade=="3"){ return '三级';}
                    else{return ' ';}
                }} ], 
                rownumbers: true,
                url: "/jwr/orgListControl/getOrgListAction.action",
                toolbar: { 
                	items: [
                	       
                	        { text: '文件导出(全部'+totalSize+'行)', click: exportExcel, icon: 'add' },
                            { text: '详细信息', click: itemclick, icon: 'modify' }
                	       ]
                },
                parms:parms,
                width: '100%', 
                height: '320', 
                checkbox: false
            });
           
            $("#pageloading").hide();
        }
         function query(){
       	 var adminmot=$("#adminmot").val();
       	 var entype=$("#entype").val();
       	 var grade=$("#grade").val();
       	 var ename=$("#ename").val();
       	 var cid=$("#cid").val();
       	 var data = {adminmot:adminmot,entype:entype,grade:grade,ename:ename,cid:cid};
       	initLiger(data);
       } 
       function recover(){
       	$("#adminmot").val("%");
       	$("#entype").val("");
       	$("#grade").val("");
       	$("#ename").val("");
       	$("#cid").val("");
		//query();
       }
    </script>
</head>

<body style="padding:10px;">
	<h1>考评机构 列表</h1>
	<DIV class=eui-info>
		<DIV class="eui-tip icon-tip"></DIV>
		<DIV>仅列出已经获得交通运输企业安全生产标准化考评机构资质证书的考评机构</DIV>
	</DIV>
	<div id="search_bar" class="mt10">
			    <div class="box" style="margin-bottom: 5px">
			       <div class="box_border">
			         <div class="box_top" style="width: 100%;">
	         	<div style="display:block; float:left;margin-left: 10px">
	         		<b class="pl15" sytle="display:block;float:left;">
		         		<font size="4">搜索</font>
		         	</b>
	         	</div>
	         	<div style="display:block; float:right;margin-right: 10">
	         		<a href="javascript:void(0);" onclick="zhankai()" style="" >展开</a> ||
	         		<a href="javascript:void(0);" onclick="shouqi()" style="">收起</a>
	         	</div>
	         </div>
	         <div class="box_center pt10 pb10" id="deg" style="height: 18%;display: none;">
	         	<div id="button" class="mt10" style="margin-left: 5px;">
				 	<input type="button" name="button" class="btn btn82 btn_search" value="查询" onclick="query()">
				 	<input type="button" name="button" class="btn btn82 btn_config" value="重置" onclick="recover()">    
			    </div>
	           <table class="form_table" border="0" cellpadding="0" cellspacing="0">
	             <tr>
	               <td>主管机关：</td>
	               <td>
	               	<span id="sa"></span>
	               </td>
	               <td>业务类别：</td>
	               <td>
	               	<select id="entype" name="" required="true" > 
						<option selected="true"	value="">--请选择--</option>
						<option value="1">道路运输</option>
						<option value="2">水路运输</option>
						<option value="3">港口运营</option>
						<option value="4">城市客运</option>
						<option value="5">交通运输工程建设</option>
						<option value="6">其他</option>
					</select>
	               </td>
	               <td>等级：</td>
	               <td>
	                 <select id="grade" >
	                 	<option value="">--请选择--</option>
	                 	<option value="2">二级</option>
	                 	<option value="3">三级</option>
	                 </select>
	               </td>
	               <td>企业名称：</td>
	               <td>
	               	<input type="text" name="" id="ename" style="width: 140px;">
	               </td>
	               <td>证书号：</td>
	               <td>
	               	<input type="text" name="" id="cid"style="width: 140px;" >
	               </td>
	             </tr>
	           </table>
	         </div>
	       </div>
	   </div>
	</div>
	<div style="margin:10px auto;"></div>
	<div class="l-loading" style="display: block;" id="pageloading"></div>
	
	<div id="maingrid4" style="margin: 0; padding: 0"></div>
	<div style="display: none;"></div>
</body>
</html>

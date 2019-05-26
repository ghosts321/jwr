<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>
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
	    
    <script type="text/javascript">
    var indexdata="";
    var indexdata2="";
    var totalSize="";
	  var ligerwindow;
    var gird2;
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
        			   		$("#zgjg").append(str);
        			    }
        			});
		});
	//查看详细信息
    function view(){
     	var selected = gird2.getSelected();
         if (!selected) { 
        	 alert('请选择行');
         	return; 
         }else{
        	var id=selected.id;
        	//判断是否已经审核
        	var hid=selected.resp;
        	if(hid=="同意" ||hid=="不同意"){
        		hid='1';
        	}else {
        		hid="0";
        	}
		 	ligerwindow=$.ligerDialog.open({
		 		url:'JSP/mot/resp/scanOrgDetail.jsp?id='+id+'&hid='+hid,
		     	width:838,
		     	height:850,
		     	title:'考评机构<font color="red">'+gird2.getSelected().orgname+'</font>详细信息'
		 	});
	   ;
         }
     }
   	   	
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
    
        $(initLiger);
        function  initLiger(parms) { 
        	window['g'] = 
           gird2= $("#maingrid2").ligerGrid({
                     columns: [ 
                 { display: '主管机关', name: 'motname',  align: 'center' },
                 { display: '所在市', name: 'city',hide:true,  align: 'center'},
                 { 	display: '考评机构名称', name: 'orgname',  heightAlign: 'center'},
                 { display: '证件号', name: 'pid',    align: 'center' },
                 { display: '业务类型', name: 'filetext',    align: 'center' },
                 { display: '等级', name: 'grade',    align: 'center' ,
                	 render: function (item)
                     {
                		 if(item.grade=="2"){return '二级';}
                		 else  if(item.grade=="3"){return '三级';}
                     }},
                 { display: '日期', name: 'createdate',    align: 'center' },
                 { display: '受理结果', name: 'resp',    align: 'center' }
//                  { display: '审核结果', name: 'respreview',    align: 'center' ,width:70}
                 ], 
                     async:true,
                     url:"/jwr/respOrg/getOrgApplyListAction.action",
                     parms:parms,
                     rownumbers: true,
                     width: '100%', 
                     height: '320',
                     checkbox: false,
                     toolbar: { 
                     	items: [
                                 { text: '详细信息', click: view, icon: 'modify' }
                     	       ]
                     }
                 });
                 $("#pageloading2").hide();
        }
    
        function query(){
       	 var adminmot=$("#adminmot").val();
       	 var orgtype=$("#orgtype").val();
       	 var pid=$("#pid").val();
       	 var grade=$("#grade").val();
       	 var orgname=$("#orgname").val();
       	 var resp=$("#resp").val();
       	 var parm = "{adminmot:"+adminmot+",orgtype:"+orgtype+",pid:"+pid+",grade:"+grade+",orgname:"+orgname+",resp:"+resp+"}";
       	 initLiger(parm);
       } 
       function recover(){
       	$("#adminmot").val("%");
       	$("#orgtype").val("");
       	$("#pid").val("");
       	$("#grade").val("");
       	$("#orgname").val("");
       	$("#resp").val("");
       }
    </script>
</head>

<body style="padding:10px;">
	
	
	<h1>受理考评机构资质证书申请</h1>
	<DIV class=eui-info>
		<DIV class="eui-tip icon-tip"></DIV>
		<DIV>请点击详情/查看进行处理。</DIV>
	</DIV>

	<div id="filter1" class="mt10">
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
	         <div class="box_center pt10 pb10" id="deg" style="height: 25%;display: none;">
	         	<div id="button" class="mt10" style="margin-left: 5px;">
				 	<input type="button" name="button" class="btn btn82 btn_search" value="查询" onclick="query()">
				 	<input type="button" name="button" class="btn btn82 btn_config" value="重置" onclick="recover()">    
			    </div>
	           <table class="form_table" border="0" cellpadding="0" cellspacing="0">
	             <tr>
	               <td>主管机关：</td>
	               <td>
	               	<span id="zgjg"></span>
	               </td>
	               <td>证件号：</td>
	               <td>
	                 <input type="text" name="" id="pid" style="width: 150px;">
	               </td>
	               <td>考评机构名称：</td>
	               <td>
	               	<input type="text" name="" id="orgname" style="width: 150px;">
	               </td>
	               <td>企业等级：</td>
	               <td>
	                 <select id="grade" style="width: 150px;">
	                 	<option value="">--请选择--</option>
	                 	<option value="2">二级</option>
	                 	<option value="3">三级</option>
	                 </select>
	               </td>
                </tr>
                <tr>
	               <td>受理结果：</td>
	               <td>
	                 <select id="resp" style="width: 150px;">
	                 	<option value="">--请选择--</option>
	                 	<option value="2">尚未处理</option>
	                 	<option value="1">同意</option>
	                 	<option value="0">不同意</option>
	                 </select>
	               </td>
	               <td>业务类型：</td>
	               <td>
	                 <select id="orgtype" style="width: 150px;">
	                 	<option value="">--请选择--</option>
						<OPTION value="1">道路运输</OPTION>
						<OPTION value="2">水路运输</OPTION>
						<OPTION value="3">港口运营</OPTION>
						<OPTION value="4">城市客运</OPTION>
						<OPTION value="5">交通运输工程建设</OPTION>
						<OPTION value="6">其他</OPTION>
	                 </select>
	               </td>
	             </tr>
	           </table>
	         </div>
	       </div>
	   </div>
	</div>
	
	<div style="height: 10px"></div>

	<H2>考评机构资质证书申请列表</H2>
	<div style="margin:10px auto;"></div>
	<div class="l-loading" style="display: block;" id="pageloading2"></div>
	
	<div id="maingrid2" style="margin: 0; padding: 0"></div>
</body>
</html>

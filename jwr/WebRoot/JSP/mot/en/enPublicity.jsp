<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../main.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

    <script type="text/javascript">
    var indexdata="";
    var totalSize="";
    var ligerwindow;
     
    //页面中声明一个变量
  	var postdata;
    function view(){
    	var selected = grid.getSelected();
        if (!selected) { 
        	alert('请选择行');
        	return; 
        }else{
        	var name = selected.name;
        	var str = JSON2.stringify(selected);
        	postdata=str;
        	ligerwindow=$.ligerDialog.open({
        		url:'JSP/mot/en/enPublicityDetail.jsp?flag=1',
             	width:1000,
             	height:950,
             	title:'交通运输企业申请<font color="red">'+grid.getSelected().enname+'</font>详细信息'
 		 	});
 	  // ;
        }
    }
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
        $(initLiger);
        function  initLiger(parms) {
            window['g'] = 
            grid=$("#maingrid4").ligerGrid({
                columns: [ 
            { display: '名称', name: 'enname',  align: 'center' ,width:'120'},
            { display: '业务类别', name: 'filetext',  heightAlign: 'center' ,width:'120'},
            { display: '等级', name: 'grade',    align: 'center' ,width:'120',
            	render: function (item)
            	{
            		if(item.grade=="2"){return '二级';}
            		else if(item.grade=="3"){return '三级';}
            		else{return ''}
            	}
            },
            { display: '日期', name: 'date',    align: 'center' ,width:'120'},
            { display: '自评分数', name: 'selfScore',  align: 'center' ,width:'120'}, 
            { display: '考评分数', name: 'kaoScore',  align: 'center' ,width:'120'},
            { display: '受理结果', name: 'respResult',  align: 'center' ,width:'120',
            	render: function (item)
                {
           		 if(item.respResult==""){return '尚未处理';}
           		 else if (parseInt(item.respResult) == 0){ return '拒绝';}
                    else{return '通过';}
                }},
            { display: '考评结果', name: 'orgresult',  align: 'center' ,width:'120',
            	render: function (item)
                {
           		 if(item.orgresult==""){return '尚未处理';}
           		 else if (parseInt(item.orgresult) == 0){ return '拒绝';}
                    else{return '通过';}
                }},
            { display: '审核结果', name: 'auditResult',  align: 'center',width:'120' ,
            	render: function (item)
                {
           		 if(item.auditResult==""){return '尚未处理';}
           		 else if (parseInt(item.auditResult) == 0){ return '拒绝';}
                    else{return '通过';}
                }}], 
                parms:parms,
                url:"/jwr/enControl/getEnPublicityListAction.action",
                rownumbers: true,
                toolbar: { 
                	items: [
							{ text: '文件导出（全部行）',id:'export', click: exportData, icon: 'down' },
							{ line: true }
                	       ]
                },
                width: '100%', 
                height: 340, 
                checkbox: false
            });
            $("#pageloading").hide();
        }
  //文件导出
  function exportData(){
	  window.location.href="/jwr/enControl/exportEnpublicityAction.action";
  }
  
  //查询
  function query(){
	var ename = $("#ename").val();
	var entype = $("#entype").val();
	var grade = $("#grade").val();
	var resp = $("#resp").val();
	var respreview = $("#respreview").val();
	var resprevel = $("#resprevel").val();
	var data = {ename:ename,entype:entype,grade:grade,resp:resp,respreview:respreview,resprevel:resprevel};
	initLiger(data);
  }
  function recover(){
       	$("#entype").val("");
       	$("#grade").val("");
       	$("#ename").val("");
       	$("#resp").val("");
       	$("#respreview").val("");
       	$("#resprevel").val("");
       	$("#respreviewfirst").val("");
		//query();
       }
    </script>
</head>

<body style="padding:10px;">
	<h1>企业公示</h1>
	<DIV class=eui-info>
		<DIV class="eui-tip icon-tip"></DIV>
		<DIV>1、导出可进行公示的企业列表进行公示；2、为完成公示的企业设置证书号及证书开始日期；</DIV>
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
	         <div class="box_center pt10 pb10" id="deg" style="height: 22%;display: none;">
	         	<div id="button" class="mt10" style="margin-left: 5px;">
				 	<input type="button" name="button" class="btn btn82 btn_search" value="查询" onclick="query()">
				 	<input type="button" name="button" class="btn btn82 btn_config" value="重置" onclick="recover()">    
			    </div>
	           <table class="form_table" border="0" cellpadding="0" cellspacing="0">
	             <tr>
	               <td>业务类别：</td>
	               <td>
	               	<select id="entype" name="" required="true" style="width: 150px;"> 
						<option selected value="">--请选择--</option>
						<option value="11">道路旅客运输</option>
						<option value="12">道路危险货物运输</option>
						<option value="13">汽车客运站</option>
						<option value="14">道路普通货运</option>
						<option value="15">道路货物运输场站</option>
						<option value="16">机动车维修</option>
						<option value="21">水路旅客运输</option>
						<option value="22">水路危险货物运输</option>
						<option value="23">水路普通货物运输</option>
						<option value="31">港口客运（滚装、渡船渡口）码头</option>
						<option value="32">危险货物码头运输</option>
						<option value="33">港口散杂货（集装箱）码头</option>
						<option value="41">城市公共汽车客运</option>
						<option value="42">城市轨道交通运输</option>
						<option value="43">出租汽车营运</option>
						<option value="51">交通运输建筑施工</option>
						<option value="61">其他</option>
					</select>
	               </td>
	               <td>等级：</td>
	               <td>
	                 <select id="grade" style="width: 150px;">
	                 	<option value="">--请选择--</option>
	                 	<option value="1">一级</option>
	                 	<option value="2">二级</option>
	                 	<option value="3">三级</option>
	                 </select>
	               </td>
	               <td>企业名称：</td>
	               <td>
	               	<input type="text" name="" id="ename" style="width: 150px;">
	               </td>
	             </tr>
	             <tr>
	               <td>受理结果：</td>
	               <td>
	                 <select id="resp" style="width: 150px;">
	                 	<option value="">--请选择--</option>
	                 	<option value="2">尚未处理</option>
	                 	<option value="1">通过</option>
	                 	<option value="0">拒绝</option>
	                 </select>
	               </td>
	               <td>考评结果：</td>
	               <td>
	                 <select id="resprevel" style="width: 150px;">
	                 	<option value="">--请选择--</option>
	                 	<option value="2">尚未处理</option>
	                 	<option value="1">通过</option>
	                 	<option value="0">拒绝</option>
	                 </select>
	               </td>
	               <td>审核结果：</td>
	               <td>
	                 <select id="respreview" style="width: 150px;">
	                 	<option value="">--请选择--</option>
	                 	<option value="2">尚未处理</option>
	                 	<option value="1">通过</option>
	                 	<option value="0">拒绝</option>
	                 </select>
	               </td>
	             </tr>
	           </table>
	         </div>
	       </div>
	   </div>
	</div>
	<div style="margin:10px auto;"></div>
	<div class="l-loading" style="display: block;" id="pageloading"></div>
	<h2>审核通过待公示发证书的企业</h2>
	<div id="maingrid4" style="margin: 0; padding: 0"></div>
	<div style="margin:10px auto;"></div>
	<!-- <h2>公示期满可发证企业一览</h2>
	<DIV class=eui-info>
		<DIV class="eui-tip icon-tip"></DIV>
		<DIV>无公示期满的企业</DIV>
	</DIV>  -->
	
</body>
</html>

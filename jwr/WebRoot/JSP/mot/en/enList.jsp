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
    $.ajax({
	    type:"POST",
	    async:false,
	    url:"/jwr/enControl/getEnListAction.action",
	    success:function(returnValue){
	   		indexdata=eval("("+returnValue+")");
	   		totalSize=indexdata.Total;
	    }
	});
    function exportFile(){
    	window.location.href="/jwr/enControl/exportAction.action";
    }
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
        	manager1 = $.ligerDialog.open({
             	url:'JSP/mot/en/enBaseTail.jsp?indexdata='+encodeURI(encodeURI(str))+'&flag=1',
             	width:750,
             	height:420,
             	title:'交通运输企业<font color="red">'+grid.getSelected().enname+'</font>详细信息'
         	});
        }
    }
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
        $(function ()
        {
            window['g'] = 
            grid=$("#maingrid4").ligerGrid({
                columns: [ 
            { display: '主管机关', name: 'adminMotName',  align: 'center' },
            { display: '名称', name: 'enname',  align: 'center' },
            { display: '业务类别', name: 'filetext',  heightAlign: 'center' },
            { display: '等级', name: 'grade',    align: 'center',
            	 render: function (item)
                 {
            		 if(item.grade=="2"){return '二级';}
                     else if(item.grade=="3"){return '三级';}
                 }},
            { display: '证书号', name: 'cid',  align: 'center' }, 
            { display: '发证时间', name: 'cDate',  align: 'center' }], 
                data: indexdata,
                rownumbers: true,
                url:"/jwr/enControl/getEnListAction.action",
                toolbar: { 
                	items: [
                	       
                	        { text: '文件导出(全部'+totalSize+'行)', click:exportFile, icon: 'add' },
                            { text: '详细信息', click: view, icon: 'modify' }
                	       ]
                },
                
                pageSize: 10,
                width: '100%', 
                height: '80%', 
                checkbox: false
            });
            $("#pageloading").hide();
        });
        function query(){
       	 var adminmot=$("#adminmot").val();
       	 var entype=$("#entype").val();
       	 var grade=$("#grade").val();
       	 var ename=$("#ename").val();
       	 var cid=$("#cid").val();
       	 $.ajax({
       			    type:"POST",
       			    async:false,
       			    url:"/jwr/enControl/getEnListAction.action",
       			    data:{adminmot:adminmot,entype:entype,grade:grade,ename:ename,cid:cid},
       			    success:function(returnValue){
       			   		indexdata2=eval("("+returnValue+")");
//        			   	indexdata2=returnValue;
       			   		totalSize=indexdata2.Total;
       			        //将 查询参数 设置到 grid中 以便下次分页时候 可以获取到查询参数
 						grid.setOptions({ parms: {adminmot:adminmot,entype:entype,grade:grade,ename:ename,cid:cid},newPage:'1'});
       			        //将grid 表格 刷新
 						grid.reload();
       			        //默认回到第一页
 						//gird2.changePage('first');
       			        //向控制台打印信息
       			    }
       			  });
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
	<h1>交通运输企业 列表</h1>
	<DIV class=eui-info>
		<DIV class="eui-tip icon-tip"></DIV>
		<DIV>仅列出已经获得交通运输企业安全生产标准化企业达标等级证书的交通运输企业</DIV>
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
	         <div class="box_center pt10 pb10" id="deg" style="height: 20%;display: none;">
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
	               	<select id="entype" name="" required="true" style="width: 150px;" > 
						<option selected="true"	value="">--请选择--</option>
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
	                 <select id="grade" >
	                 	<option value="">--请选择--</option>
	                 	<option value="1">一级</option>
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
	               	<input type="text" name="" id="cid" style="width: 140px;">
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

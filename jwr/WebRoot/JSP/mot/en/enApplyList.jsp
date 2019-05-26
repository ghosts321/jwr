<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../main.jsp" %>


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
    var totalSize="";
    var ligerwindow;
    var indexdata2="";
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
        	ligerwindow=$.ligerDialog.open({
        		url:'JSP/mot/en/enApplyDetial.jsp?flag=1',
             	width:800,
             	height:800,
             	title:'交通运输企业申请<font color="red">'+grid.getSelected().enname+'</font>详细信息'
 		 	});
 	  // ;
        }
    }
    function query(){
    	 var admin = $("#adminmot").val();
    	 var pid = $("#pid").val();
    	 var enname = $("#enname").val();
    	 var grade = $("#grade").val();
    	 var resp = $("#resp").val();
    	 var type2 = $("#type2").val();
    	 var parm = "{admin:"+admin+",pid:"+pid+",enname:"+enname+",grade:"+grade+",resp:"+resp+",type2:"+type2+"}";
       	 initLiger(parm);
    }
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
        $(initLiger);
        function  initLiger(parms) {
            window['g'] = 
            grid=$("#maingrid4").ligerGrid({
                columns: [
            { display: '主管机关', name: 'adminMotName',  align: 'center' },
            {display:'城市',name:'city',hide:true},
            { display: '名称', name: 'enname',  align: 'center' },
            { display: '业务类别', name: 'filetext',  heightAlign: 'center' },
            { display: '等级', name: 'grade',    align: 'center' ,
            	 render: function (item)
                 {
            		 if(item.grade=="2"){return '二级';}
            		 else if(item.grade=="3"){return '三级';}
            		 else{return ''}
                 }},
            { display: '证件号', name: 'pid',  align: 'center' }, 
            { display: '日期', name: 'date',  align: 'center' },
            { display: '受理结果', name: 'resp',  align: 'center' ,
             render: function (item)
	        {
	   		  if (item.resp==""){ return '尚未处理';}
	   		 else if (item.resp=="1"){ return '同意';}
	   		 else if (item.resp=="0"){ return '不同意';}
	   		 else if (item.resp=="2"){ return '已初受理';}
	   		 else{return item.resp}
	        }},
            { display: '审核结果', name: 'respReview',  align: 'center' ,
            render: function (item)
	        {
	   		  if (item.respReview==""){ return '尚未处理';}
	   		 else if (item.respReview=="1"){ return '同意';}
	   		 else if (item.respReview=="0"){ return '不同意';}
	        }},
            { display: '考评结果', name: 'orgresult',  align: 'center' ,
            render: function (item)
	        {
	   		  if (item.orgresult==""){ return '尚未处理';}
	   		 else if (item.orgresult=="1"){ return '同意';}
	   		 else if (item.orgresult=="0"){ return '不同意';}
	        }}
            ], 
                rownumbers: true,
                url:"/jwr/enControl/getApplyListAction.action",
                toolbar: { 
                	items: [
                            { text: '查看详情', click: view, icon: 'modify' },
                            {text: '删除', click: del, icon: 'delete'}
                	       ]
                },
                width: '100%',
                parms:parms,
                height: '320',
                scrollToPage:true,
                checkbox: false
            });
            $("#pageloading").hide();
        }
        
        function del(){
		var selected = grid.getSelected();
        if (!selected) { 
        	alert('请选择行');
        	return; 
        }else{
        	var applyId = selected.id;
			$.ligerDialog.confirm('是否确认删除此申请记录？', function (yes) {
				if(yes==true){
					$.ajax({
					    type:"POST",
					    async:false,
					    data:{applyId:applyId},
					    url:"/jwr/enControl/delApplyInfoAction.action",
					    success:function(returnValue){
					    	if(eval(returnValue)=='0'){
					    		alert("提示信息：删除企业等级证书申请记录成功!");
					    		grid.reload();
					    	}else{
					    		alert("提示信息：删除企业等级证书申请记录失败，请与管理员联系!");
					    	}
					    }
					});
				}else{
					return;
				}
			});
		} 
	}
	function recover(){
		 $("#adminmot").val("%");
    	 $("#pid").val("");
    	 $("#enname").val("");
    	 $("#grade").val("");
    	 $("#resp").val("");
    	 $("#type2").val("");
	}
    </script>
</head>

<body style="padding:10px;">
	<h1>受理企业达标等级证书申请</h1>
	<DIV class=eui-info>
		<DIV class="eui-tip icon-tip"></DIV>
		<DIV>请点击查看详情按钮进行处理，指派一个考评机构进行企业考评(注：尚未预选两个考评机构的企业不显示)</DIV>
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
	               <td>企业名称：</td>
	               <td>
	               	<input type="text" name="" id="enname" style="width: 150px;">
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
	               <td>业务类别：</td>
	               <td>
	                 <select id="type2" style="width: 150px;">
	                 	<option value="">--请选择--</option>
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

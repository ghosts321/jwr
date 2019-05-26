<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>
<%
			String userId=(String)request.getSession().getAttribute("userid");
%>

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
	  var userId='<%=userId%>';
	  var ligerwindow;
    var gird;
    var gird2;
	
    //详细信息
    function itemclick(){
    if(gird.getSelected()==null){
    	alert("请选中一行");
    }else{
 	 	  var selValue=gird.getSelected().cid;
 	 	  var pid=gird.getSelected().pid;
 	 	 var id=gird.getSelected().id;
        	ligerwindow=$.ligerDialog.open({
        		url:'JSP/org/org/scanDetail.jsp?certnumber='+selValue+'&id='+id,
            	width:800,
            	height:460,
            	title:'考评员<font color="red">'+gird.getSelected().orgname+'</font>详细'
        	});
   	 }
   	}
   	
   	   	function exportExcel(){
	   	 window.location.href="/jwr/orgListControl/exportAction.action";
   		 	}
   	
   	 function view(){
     	var selected = gird2.getSelected();
         if (!selected) { 
        	 alert('请选择行');
         	return; 
         }else{
        	var resp=gird2.getSelected().resp;
          	if(resp=="同意"||resp=="不同意"){
          		resp='1';
          	}else{
          		resp='0';
          	}
        	ligerwindow=$.ligerDialog.open({
        		url:'JSP/org/resp/scanDetail.jsp?enBusType='+gird2.getSelected().type2+'&enUserid='+gird2.getSelected().userId+'&applyId='+gird2.getSelected().id+'&respReview='+gird2.getSelected().respReview+'&resp='+resp,
            	width:'1040',
            	height:850,
            	title:'企业<font color="red">'+gird2.getSelected().enname+'</font>详细信息'
        	});
    	   ;
         }
     }
   	   	
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
       var ftype='';
       var val='';
       $(initLiger4);
        $(initLiger2);
        function  initLiger4(parms) {
            window['g'] = 
           gird=$("#maingrid4").ligerGrid({
                columns: [ 
            { display: '日期', name: 'createdate',  align: 'center',minWidth:120 },
            { display: '业务类型', name: 'typename',  align: 'center',minWidth:120 },
            { display: '受理结果', name: 'resp',  heightAlign: 'center',width:80 },
            { display: '受理日期', name: 'respdate',    align: 'center' }], 
                url:"/jwr/bookApply/getBookApplyAction.action",
                parms:{userId:userId},
                toolbar: { 
                	items: [
                            { text: '详细信息', click: itemclick, icon: 'modify' }
                	       ]
                },
                rownumbers: true,
                width: '600', 
                height: '140px', 
                checkbox: false
            });
           
            $("#pageloading").hide();
        }
        function  initLiger2(parms) {     
           gird2= $("#maingrid2").ligerGrid({
                     columns: [ 
                 { display: '主管机关', name: 'motname',  align: 'center' },
                 { display: '名称', name: 'enname',  heightAlign: 'center' },
                 { display: '证件号', name: 'pid',    align: 'center' },
                 { display: '业务类别', name: 'filetext',    align: 'center' },
                 { display: '等级', name: 'grade',    align: 'center' ,
                	 render: function (item)
                     {
                		 if(item.grade=="2"){return '二级';}
                		 else if(item.grade=="3"){return '三级';}
                		 else{return ''}
                     } },
                 { display: '日期', name: 'date',    align: 'center' },
                 { display: '受理结果', name: 'resp',    align: 'center',
                	 render: function (item)
                 {
            		 if(item.resp==""){return '尚未处理';}
            		 else if (item.resp=="1"){ return '同意';}
	   		 		 else if (item.resp=="0"){ return '不同意';}
                 } },
                 { display: '审核结果', name: 'respReview',    align: 'center',
                	 render: function (item)
                 {
            		 if(item.respReview==""){return '尚未处理';}
            		 else if (item.respReview=="1"){ return '同意';}
	   				 else if (item.respReview=="0"){ return '不同意';}
                 } }
                  ],  
                     rownumbers: true,
                     url:"/jwr/respInfo/getListByMotAction.action",
                     prams:{"ftype":ftype,"admin":val},
                     toolbar: { 
                     	items: [
                                 { text: '详细信息', click: view, icon: 'modify' }
                     	       ]
                     },
                     pageSize: 10,
                     width: '900px', 
                     height: '340px', 
                     checkbox: false
                 });
                
                 $("#pageloading2").hide();
        }
                 
        //筛选
        function sel(){
        	var obj=$("#ftype  option:selected");
        	var ftype=obj.val();
        	var val=$("#selInfo").val();
        	var parms={"ftype":ftype,"admin":val};
        	initLiger2(parms);
        }
        
        //联动
        function selChange(){
        	$("#span1").empty();
        	var obj=$("#ftype  option:selected");
        	var val=obj.val();
        	if(val=='admin'){
        		//管理机关
        		 $.ajax({
        			    type:"POST",
        			    async:false,
        			    url:"/jwr/respInfo/getMotAction.action",
        			    success:function(returnValue){
        			   		indexdata=returnValue;
        			   		var obj1=(eval("("+indexdata+")")).Rows;
        			   		var str="";
        			   	    str='<SELECT id=selInfo onchange="" name=selInfo>';
        			   		for(var i=0;i<obj1.length;i++){
        						str+='<OPTION selected value='+obj1[i].motcode+'>'+obj1[i].motname+'</OPTION>';
        			   		}
        			   		  str+='</SELECT>';
        			   		$("#span1").append(str);
        			    }
        			});
        	}else if(val=='name'){
        		//姓名名称
        		$("#span1").append('<input type="text" id="selInfo" name="selInfo"/>');
        	}else if(val=='pid'){
        		//证件号
        		$("#span1").append('<input type="text" id="selInfo" name="selInfo"/>');
        	}else if(val=='resp'){
        		//受理结果
        		$("#span1").append('<select id="selInfo" name="selInfo"><option>同意</option><option>尚未处理</option><option>不同意</option></select>');
        	}else if(val=='province'){
        		//所在省市
        		$("#span1").append('<select id="selInfo" name="selInfo">');
        		$("#selInfo").append('<option	value="00" selected="selected">--请选择--</option>  '     );
	    		$("#selInfo").append('<option value="02">北京市</option>            '    );  
				$("#selInfo").append('<option value="03">天津市</option>            '    );  
				$("#selInfo").append('<option value="04">河北省</option>            '    );  
				$("#selInfo").append('<option value="05">山西省</option>            '    );  
				$("#selInfo").append('<option value="06">内蒙古自治区</option>			'    );  
				$("#selInfo").append('<option value="07">辽宁省</option>            '    );  
				$("#selInfo").append('<option value="08">吉林省</option>            '    );  
				$("#selInfo").append('<option value="09">黑龙江省</option>          '    );  
				$("#selInfo").append('<option value="10">上海市</option>            '    );  
				$("#selInfo").append('<option value="11">江苏省</option>            '    );  
				$("#selInfo").append('<option value="12">浙江省</option>            '    );  
				$("#selInfo").append('<option value="13">安徽省</option>            '    );  
				$("#selInfo").append('<option value="14">福建省</option>            '    );  
				$("#selInfo").append('<option value="15">江西省</option>            '    );  
				$("#selInfo").append('<option value="16">山东省</option>            '    );  
				$("#selInfo").append('<option value="17">河南省</option>            '    );  
				$("#selInfo").append('<option value="18">湖北省</option>            '    );  
				$("#selInfo").append('<option value="19">湖南省</option>            '    );  
				$("#selInfo").append('<option value="20">广东省</option>            '    );  
				$("#selInfo").append('<option value="21">海南省</option>            '    );  
				$("#selInfo").append('<option value="22">广西壮族自治区</option> 		'   );   
				$("#selInfo").append('<option value="23">重庆市</option>            '    );  
				$("#selInfo").append('<option value="24">四川省</option>            '    );  
				$("#selInfo").append('<option value="25">贵州省</option>            '    );  
				$("#selInfo").append('<option value="26">云南省</option>            '    );  
				$("#selInfo").append('<option value="27">西藏自治区</option>        '    );  
				$("#selInfo").append('<option value="28">陕西省</option>            '    );  
				$("#selInfo").append('<option value="29">甘肃省</option>            '    );  
				$("#selInfo").append('<option value="30">青海省</option>            '    );  
				$("#selInfo").append('<option value="31">宁夏回族自治区</option>    ');      
				$("#selInfo").append('<option value="32">新疆维吾尔自治区</option>  ');      
				$("#selInfo").append('<option value="33">新疆生产建设兵团</option>  ');   
				$("#selInfo").append('<option value="34">长江航务管理局</option>  ');   
				$("#selInfo").append('<option value="35">珠江航务管理局</option>  ');      
        		$("#span1").append('</select>');
        	}else if(val=='grade'){
        		//等级
        		$("#span1").append('<select id="selInfo" name="selInfo"><option value="2">二级</option><option value="3">三级</option></select>');
        	}
        }
        
        function sendApply(){
			 window.location.href="/jwr/respInfo/getOrgRegInfoAction.action";
       }
    </script>
</head>


<body style="padding:10px;">
	
	
	<h1>受理企业达标等级证书申请</h1>
	<DIV class=eui-info>
		<DIV class="eui-tip icon-tip"></DIV>
		<DIV>请点击详情/查看进行处理，指派一个考评机构进行企业考评（注：尚未预选两个考评机构的企业不显示）。</DIV>
	</DIV>

	<DIV id=filter>
		<H2>进行企业申请的筛选</H2>
			<LABEL>筛选条件：</LABEL>
				<SELECT id=ftype onchange="selChange()" name=ftype>
					<OPTION selected value="">--全部--</OPTION>
					<OPTION value=admin>主管机关</OPTION>
					<OPTION value=name>姓名/名称</OPTION>
					<OPTION value=pid>证件号</OPTION>
					<OPTION value=grade>级别</OPTION>
					<OPTION value=resp>受理结果</OPTION>
				</SELECT>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<LABEL>筛选内容：</LABEL>
			<SPAN id=span1>
			  <FONT color=gray>全部</FONT>
			</SPAN>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<button id='' class="easyui-linkbutton l-btn"
				onclick="sel();"
				iconCls="icon-reload">
			<SPAN class=l-btn-left><SPAN style="PADDING-LEFT: 20px"
					class="l-btn-text icon-reload">按筛选条件刷新列表
			</SPAN>
			</SPAN>
			</button>
	</DIV>
	
	<div style="height: 10px"></div>

	<H2>企业达标等级证书申请列表</H2>
	<div style="margin:10px auto;"></div>
	<div class="l-loading" style="display: block;" id="pageloading2"></div>
	
	<div id="maingrid2" style="margin: 0; padding: 0"></div>
</body>
</html>

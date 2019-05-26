<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../main.jsp"%> 



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>报名申请初审</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link type="text/css" href="/jwr/css/main.css" rel="stylesheet"/>
	<link type="text/css" href="/jwr/css/easyui/default/easyui.css" rel="stylesheet"/>
	<link type="text/css" href="/jwr/css/easyui/icon.css" rel="stylesheet"/>
    
	<script>
		function layout_load_center(tabid,text,url){
			var tab = $("#framecenter").ligerGetTabManager();
			 tab.addTabItem({ tabid : tabid,text: text, url: url });
			window.location.href=url;
		}
		
	</script>
	 <script type="text/javascript">

    //去掉  大于小于包括,并改变顺序
    /* $.ligerDefaults.Filter.operators['string'] =
    $.ligerDefaults.Filter.operators['text'] =
    ["like" , "equal", "notequal", "startwith", "endwith" ]; */
    var indexdata="";
    var totalSize="";
    
    $.ajax({
	    type:"POST",
	    async:false,
	    url:"/jwr/pnControl/pnTrainListAction.action",
	    success:function(returnValue){
	   		indexdata=returnValue;
	    }
	});
    /* 条件查询 */
    function searchList(name, type, train_id){
    	//alert(name+type+train_id);
    	var name=document.getElementById(name).value;
    	var type=document.getElementById(type).value;
    	var train_id=document.getElementById(train_id).value;
    	//alert("name"+name+" ,type="+type+" ,train_id="+train_id);
    	   $.ajax({
    		    type:"POST",
    		    async:false,
    		    url:"/jwr/pnControl/pnTrainListAction.action",
    		    data: "name="+name+"&type="+type+"&train_id="+train_id,
    		    success:function(returnValue){
    		   		indexdata=returnValue;
    		    }
    		});
    	   //alert(indexdata);
    	   indexdata=eval("("+indexdata+")");
    	   var manager = $("#maingrid4").ligerGetGridManager(); 
    	   manager.loadData(indexdata); 
    }
    //删除del以及其值
    if(indexdata!=""){
    	var sss= indexdata;
    	indexdata = eval("("+sss+")");
    	totalSize = indexdata.Total;
    	//alert(indexdata.Rows[0].del);
    	for(var sdd in indexdata.Rows){
    		$.each(indexdata.Rows[sdd], function(key,value){
    			delete indexdata.Rows[sdd].del;
        	});
    	}
    }
    var rowid="";
    var rowGrid;
    //alert(typeof indexdata);
    //indexdata = JSON2.stringify(indexdata); 
    //alert(typeof indexdata);
	//alert(indexdata.Rows[0].del);
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
        $(function ()
        {
           rowGrid= window['g'] = 
        	   
            $("#maingrid4").ligerGrid({
            	rownumbers :true,//是否启用行索引
                columns: [ 
            { display: '姓名', name: 'name', align: 'center'  },
            { display: '主管机关', name: 'adminmot',  align: 'center' },
            { display: '名称', name: 'motname',  align: 'center' },
            { display: '日期', name: 'createdate',  heightAlign: 'center' },
            { display: '初审结果', name: 'resp_reg',    align: 'center' }], 
                data: indexdata,
                rownumbers: true,
                url: "<%= basePath%>pnControl/pnTrainListAction.action",
                pageSize: 10,
                /* toolbar: { 
                	items: [
                	       
                	        { text: '增加', click: itemclick, icon: 'add' },
                            { line: true },
                            { text: '修改', click: itemclick, icon: 'modify' },
                            { line: true },
                	       ]
                }, */
               
                width: '95%', 
                height: '95%', 
                checkbox: true,
                onCheckRow: function (checked, rowdata, rowindex, rowDomElement) {
                	
                     checkisSelect(rowGrid,rowdata,rowindex); 
                }
               
            });
            $("#pageloading").hide();
        });
        /* function itemclick()
        {
        	var m = $.ligerDialog.open({ url: 'JSP/pn/certApply.jsp',width:800, height: 400, isResize: true }); 
        } */
    </script>
  </head>
  
  <body>
	<div class="panel layout-panel layout-panel-center" style=" top: 70px; width: 1158px; ">
		<div border="false" region="center" split="false" style="padding: 20px; width: 1118px; height: 205px; " class="layout-body panel-body panel-body-noheader panel-body-noborder" title="">
			<h1>进行报名申请初审</h1>
			<div class="eui-info">
				<div class="eui-tip icon-tip"></div>
				<div>对考评员、考评机构、企业、主管机关用户填写的初步报名申请信息进行审批。</div>
			</div>
			<a class="easyui-linkbutton l-btn" href="#" onclick="motGrid(); " style="margin:5px" title="有0个尚未处理/共1个报名申请" id="undefined"><span class="l-btn-left"><span class="l-btn-text">主管机关 <font color="red">0</font>/1
				</span></span></a><a class="easyui-linkbutton l-btn" href="#" onclick="pnGrid(); " style="margin:5px" title="有0个尚未处理/共0个报名申请" id="undefined"><span class="l-btn-left"><span class="l-btn-text">考评员 <font color="red">0</font>/0
				</span></span></a><a class="easyui-linkbutton l-btn" href="#" onclick="orgGrid();" style="margin:5px" title="有0个尚未处理/共0个报名申请" id="undefined"><span class="l-btn-left"><span class="l-btn-text">考评机构 <font color="red">0</font>/0
				</span></span></a><a class="easyui-linkbutton l-btn" href="#" onclick="enGrid();" style="margin:5px" title="有0个尚未处理/共0个报名申请" id="undefined"><span class="l-btn-left"><span class="l-btn-text">企业 <font color="red">0</font>/0
				</span></span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="easyui-linkbutton l-btn" href="/c/esp/reg-olap" iconcls="icon-bar" onclick="" target="_blank" id="undefined"><span class="l-btn-left"><span class="l-btn-text icon-bar" style="padding-left: 20px; ">本省报名数统计</span></span></a>
			<div id="motGrid"></div>
			<div id="pnGrid"></div>
			<div id="orgGrid"></div>
			<div id="enGrid"></div>
		</div>
	</div>
</body>
</html>

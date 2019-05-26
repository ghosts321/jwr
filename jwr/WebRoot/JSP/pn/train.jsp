<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	System.out.println("train==========trian");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'pnApply.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" href="css/main.css" rel="stylesheet">
	<link type="text/css" href="css/easyui/default/easyui.css" rel="stylesheet">
	<link type="text/css" href="css/easyui/icon.css" rel="stylesheet">
	
    <link href="js/gradejs/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="js/gradejs/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerToolBar.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script> 
    <script src="js/gradejs/ligerUI/js/plugins/ligerFilter.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
    <script src="js/gradejs/ligerUI/js/plugins/ligerGrid.showFilter.js" type="text/javascript"></script>
    <script src="js/gradejs/CustomersData.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript">

    //去掉  大于小于包括,并改变顺序
    /* $.ligerDefaults.Filter.operators['string'] =
    $.ligerDefaults.Filter.operators['text'] =
    ["like" , "equal", "notequal", "startwith", "endwith" ]; */
    /* 条件查询 */
    function searchList(name, type, train_id){
    	var name=document.getElementById("pnTrain.pnname").value;
    	var type=document.getElementById("pnTrain.type").value;
    	var train_id=document.getElementById("pnTrain.train_id").value;
    	var parm = {"name":name,"type":type,"train_id":train_id};
        initLiger(parm);
    }
    //删除del以及其值
    /*if(indexdata!=""){
    	var sss= indexdata;
    	indexdata = eval("("+sss+")");
    	totalSize = indexdata.Total;
    	for(var sdd in indexdata.Rows){
    		$.each(indexdata.Rows[sdd], function(key,value){
    			delete indexdata.Rows[sdd].del;
        	});
    	}
    }*/
    var rowid="";
    var rowGrid;
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
        $(initLiger);
        function  initLiger(parms) {
           rowGrid= window['g'] = 
            $("#maingrid4").ligerGrid({
                columns: [ 
            { display: '姓名', name: 'pnname', align: 'center'  },
            { display: '主管机关', name: 'adminmot',  align: 'center',render:function(item){return getMotVal(item.adminmot)} },
            { display: '业务类型', name: 'bustype',  align: 'center',render:function(item){return getBusTypeVal(item.bustype)}},
            { display: '培训开始日期', name: 'train_start',  heightAlign: 'center' },
            { display: '培训结束日期', name: 'train_end',    align: 'center' },
            { display: '培训学时', name: 'train_hour',  align: 'center' }, 
            { display: '培训合格证号', name: 'train_id',  align: 'center' } ,
            { display: '考试日期', name: 'exam_date',  align: 'center' }, 
            { display: '考试分数', name: 'exam_score',  align: 'center' }], 
                url: "/jwr/mottrain/selectAllpnAction.action",
                parms:parms,
                width: '95%', 
                height: '95%',
                rownumbers: true
            });
            $("#pageloading").hide();
        }
    </script>
</head>

<body>
	<h1>考评员培训、考试情况</h1>
	<div class="eui-info">
		<div class="eui-tip icon-tip"></div>
		<div>1、首次培训时间不少于24个学时；2、年度继续教育时间不少于8个学时；</div>
	</div>
	 
		 <h3>
		 培训和考试记录
		</h3>
	
	<div style="margin:10px auto;"></div>
	<div class="l-loading" style="display: block;" id="pageloading"></div>
	
	<!-- 条件查询 -->
	<div>
	   <form action="#">
	       <td>
	          <span style="color:blue">姓名:</span>
	          <input type="text" id="pnTrain.pnname" name="pnTrain.name" value="" align="left"/>
	          <span style="color:blue">业务类型:</span> 
	          <select id="pnTrain.type"
					title="考评员申请的专业类型不得多于二种" value="1" class="combobox-f combo-f"
					name="pnTrain.type" >
						<option selected="selected" value="1">道路运输</option>
						<option value="2">水路运输</option>
						<option value="3">港口运营</option>
						<option value="4">城市客运</option>
						<option value="5">交通运输工程建设</option>
						<option value="6">其他</option>
			</select>
	     
	          <span style="color:blue">培训合格证号:</span>
	          <input type="text" value=""  id="pnTrain.train_id" name="pnTrain.train_id"  align="left"/>
	          <input type="button" style="cursor: pointer;" value="提交查询" class="submit" onclick="searchList('pnTrain.name','pnTrain.type','pnTrain.train_id');" align="right"/>
	       </td>
	   </form>
	</div>
	
	<div id="maingrid4" style="margin: 0; padding: 0"></div>
	<div style="display: none;"></div>
</body>
</html>

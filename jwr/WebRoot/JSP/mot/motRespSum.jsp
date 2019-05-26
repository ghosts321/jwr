<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link type="text/css" href="<%=path%>/css/main.css" rel="stylesheet">
<link type="text/css" href="<%= path%>/css/easyui/default/easyui.css" rel="stylesheet">
<link type="text/css" href="<%= path%>/css/easyui/icon.css" rel="stylesheet">

    <link href="<%= path%>/js/gradejs/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="<%= path%>/js/gradejs/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />
    <link href="<%= path%>/js/gradejs/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <script src="<%= path%>/js/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="<%= path%>/js/gradejs/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="<%= path%>/js/gradejs/ligerUI/js/plugins/ligerToolBar.js" type="text/javascript"></script>
    <script src="<%= path%>/js/gradejs/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
    <script src="<%= path%>/js/gradejs/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script> 
    <script src="<%= path%>/js/gradejs/ligerUI/js/plugins/ligerFilter.js" type="text/javascript"></script>
    <script src="<%= path%>/js/gradejs/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>
    <script src="<%= path%>/js/gradejs/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
    <script src="<%= path%>/js/gradejs/ligerUI/js/plugins/ligerGrid.showFilter.js" type="text/javascript"></script>
    <script src="<%= path%>/js/gradejs/CustomersData.js" type="text/javascript"></script>
    
    <script type="text/javascript">
    var indexdata="";
    var totalSize="";
   <%--  
    $.ajax({
	    type:"POST",
	    async:false,
	    url:"/jwr/pnControl/pnTrainListAction.action",
	    success:function(returnValue){
	   		indexdata=returnValue;
	    }
	});
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
    
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
        $(function ()
        {
            window['g'] = 
            $("#maingrid4").ligerGrid({
                columns: [ 
            { display: '姓名', name: 'name', align: 'center'  },
            { display: '主管机关', name: 'admin',  align: 'center' },
            { display: '业务类型', name: 'type',  align: 'center' },
            { display: '培训开始日期', name: 'train_start',  heightAlign: 'center' },
            { display: '培训结束日期', name: 'train_end',    align: 'center' },
            { display: '培训学时', name: 'train_hour',  align: 'center' }, 
            { display: '培训合格证号', name: 'train_id',  align: 'center' } ,
            { display: '考试日期', name: 'exam_date',  align: 'center' }, 
            { display: '考试分数', name: 'exam_score',  align: 'center' }], 
                data: indexdata,
                rownumbers: true,
                url: "<%= basePath%>pnControl/pnTrainListAction.action",
                pageSize: 10,
                width: '95%', 
                height: '95%', 
                checkbox: false
            });
            $("#pageloading").hide();
        }); --%>
        function sendUrl(tabid,text,url1){
        	top.tab.addTabItem({ tabid : tabid,text: text, url: url1 });
        }
        
        
        function initSum(){ 
	    	$.ajax({
			    type:"POST",
			    async:false,
			    url:"/jwr/mot/regRespTjAllAction.action",
			    success:function(returnValue){
			    	 sumData=returnValue;
			    	 sumData=eval("("+sumData+")");
			    	 //报名申请初审
			    	 $("#regResp").html(sumData.respList);
			    	 $("#regAll").html(sumData.allList);
			    	 //考评员申请受理
			    	 $("#pnApplyAll").html(sumData.pnApplyAll);
			    	 $("#pnApplyResp").html(sumData.pnApplyResp);
			    	 //考评员换证申请受理
			    	 $("#pnChangeAll").html(sumData.pnChangeAll);
			    	 $("#pnChangeResp").html(sumData.pnChangeResp);
			    	 //考评机构申请受理
			    	 $("#orgApplyAll").html(sumData.orgApplyAll);
			    	 $("#orgApplyResp").html(sumData.orgApplyResp);
			    	 //考评机构备案申请受理
			    	 $("#orgExchangeAll").html(sumData.orgExchangeAll);
			    	 $("#orgExchangeResp").html(sumData.orgExchangeResp);
			    	 //考评机构换证申请受理
			    	 $("#orgChangeAll").html(sumData.orgChangeAll);
			    	 $("#orgChangeResp").html(sumData.orgChangeResp);
			    	//企业初次申请受理
			    	 $("#enFirstApplyAll").html(sumData.enFirstApplyAll);
			    	 $("#enFirstApplyResp").html(sumData.enFirstApplyResp);
			    	 //企业考评结论审核
			    	 $("#enScanAll").html(sumData.enScanAll);
			    	 $("#enScanResp").html(sumData.enScanResp);
			    	//企业变更备案申请受理
			    	 $("#enExchangeAll").html(sumData.enExchangeAll);
			    	 $("#enExchangeResp").html(sumData.enExchangeResp);
			    	 //企业换证
			    	 $("#enChangeAll").html(sumData.enChangeAll);
			    	 $("#enChangeResp").html(sumData.enChangeResp);
			    	 //举报
			    	 $("#nameReportAll").html(sumData.nameReportAll);
			    	 $("#nameReportResp").html(sumData.nameReportResp);
			    },
			    error:function(error){
			    	alert("数据异常，请联系系统管理员");
			    }
			});
	    }
        
       
        $(function(){
        	 initSum();
        })
    </script>
</head>

<body style="padding:10px;">
	<div class="panel layout-panel layout-panel-center"
		style="width: 1050px; ">
		<div border="false" region="center" split="false"
			style="padding: 20px; width: 1118px; height: 100%; "
			class="layout-body panel-body panel-body-noheader panel-body-noborder"
			title="">
			<div class="eui-info">
				<div class="eui-tip icon-tip"></div>
				<div>待办事宜中各项目的数量提示：</div>
			</div>
			<ul>
				<li>
					<a href="javascript:void(0)" onclick="sendUrl('030102','报名申请初审','/jwr/mot/regApplicationAction.action');">
					  <h2> 报名申请初审（<font color="lightgray"><span id="regResp"></span></font>/ <span id="regAll"></span> ）</h2>
					</a>
				</li>
				<li>
					<a href="javascript:void(0)" onclick="sendUrl('030103','考评员申请受理','/jwr/pn/applyAcceptAction.action');">
					  <h2> 考评员申请受理（<font color="lightgray"><span id="pnApplyResp"></span></font>/<span id="pnApplyAll"></span>）</h2>
					</a>
				</li>
				<li>
					<a href="javascript:void(0)" onclick="sendUrl('030104','考评员换证申请受理','/jwr/pnApplyAccep/applyChangeSendAction.action');">
					  <h2> 考评员换证申请受理（<font color="lightgray"><span id="pnChangeResp"></span></font>/<span id="pnChangeAll"></span>）</h2>
					</a>
				</li>
				
				<li>
					<a href="javascript:void(0)" onclick="sendUrl('030105','考评机构申请受理','/jwr/respOrg/respOrgApplyManageAction.action');">
					  <h2> 考评机构申请受理（<font color="lightgray"><span id="orgApplyResp"></span></font>/<span id="orgApplyAll"></span>）</h2>
					</a>
				</li>
				<li>
					<a href="javascript:void(0)" onclick="sendUrl('030106','考评机构变更备案受理','/jwr/orgExchange/orgExchangeAction.action');">
					  <h2> 考评机构变更备案受理（<font color="lightgray"><span id="orgExchangeResp"></span></font>/<span id="orgExchangeAll"></span>）</h2>
					</a>
				</li>
				<li>
					<a href="javascript:void(0)" onclick="sendUrl('030107',' 考评机构换证申请受理','/jwr/certChange/certChangeAction.action');">
					  <h2> 考评机构换证申请受理（<font color="lightgray"><span id="orgChangeResp"></span></font>/<span id="orgChangeAll"></span>）</h2>
					</a>
				</li>
				<li>
					<a href="javascript:void(0)" onclick="sendUrl('030108','企业初次申请受理','/jwr/enControl/enDoFirstApplyAction.action');">
					  <h2> 企业初次申请受理（<font color="lightgray"><span id="enFirstApplyResp"></span></font>/<span id="enFirstApplyAll"></span>）</h2>
					</a>
				</li>
				<li>
					<a href="javascript:void(0)" onclick="sendUrl('030109',' 企业考评结论审核','/jwr/enControl/enAuditAction.action');">
					  <h2> 企业考评结论审核（<font color="lightgray"><span id="enScanResp"></span></font>/<span id="enScanAll"></span>）</h2>
					</a>
				</li>
				<li>
					<a href="javascript:void(0)" onclick="sendUrl('030110',' 企业变更备案申请受理','/jwr/orgExchange/enExchangeAction.action');">
					  <h2> 企业变更备案申请受理（<font color="lightgray"><span id="enExchangeResp"></span></font>/<span id="enExchangeAll"></span>）</h2>
					</a>
				</li>
				<li>
					<a href="javascript:void(0)" onclick="sendUrl('030111','企业换证申请受理','/jwr/motcert/changeAuditAction.action');">
					  <h2> 企业换证申请受理（<font color="lightgray"><span id="enChangeResp"></span></font>/<span id="enChangeAll"></span>）</h2>
					</a>
				</li>
				<li>
					<a href="javascript:void(0)" onclick="sendUrl('030112','投诉举报受理','/jwr/JSP/mot/nameReportList.jsp');">
					  <h2> 投诉举报受理（<font color="lightgray"><span id="nameReportResp"></span></font>/<span id="nameReportAll"></span>）</h2>
					</a>
				</li>
		 
			</ul>
		</div>
	</div>
</body>
</html>

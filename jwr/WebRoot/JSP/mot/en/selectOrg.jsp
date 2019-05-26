<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>
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

    
    <script type="text/javascript">
    var indexdata="";
    var totalSize="";
    var grid;
    
   
    
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
        $(function ()
        {
            window['g'] = 
            grid=$("#maingrid4").ligerGrid({
                columns: [ 
            { display: '主管机关', name: 'adminmot',  align: 'center' },
            { display: '名称', name: 'orgname',  align: 'center' },
            { display: '业务类型', name: 'busType',  align: 'center',render:function(item){return getBusTypeVal(item.busType)==null?item.busType:getBusTypeVal(item.busType)}  },
            { display: '等级', name: 'grade',    align: 'center' },
            { display: '证书号', name: 'cid',  align: 'center' },
            { display: '联系人姓名', name: 'contact',  align: 'center' },
            { display: '联系人电话', name: 'tel',  heightAlign: 'center' }], 
                data: indexdata,
                rownumbers: true,
                url: "/jwr/orgControl/getOrgBookListAction.action?flag=1",
                toolbar: { 
                	items: [
                            { text: '提交', click: submit, icon: 'modify' }
                	       ]
                },
                pageSize: 10,
                width: '101%', 
                height: '100%', 
                checkbox: true
            });
            $("#pageloading").hide();
            $.ajax({
        	    type:"POST",
        	    async:false,
        	    url:"/jwr/orgControl/getOrgBookListAction.action?flag=1",
        	    success:function(returnValue){
        	   		indexdata=eval("("+returnValue+")");
        	   		totalSize = indexdata.Total;
        	   	   //默认回到第一页    manager.setOptions({ parms: { page:'1'}});
    		        gird.setOptions({ parms: { page:'1'}});
        	   		grid.reload();
         	        //默认回到第一页
         			//grid.changePage('first');
        	    }
        	});
        });
        function itemclick(){
        	
        }
        function submit(){
        	var selected = grid.getCheckedRows();
        	var cids=[];
        	if(selected.length>2){
        		alert('最多只能选择2个考核机构');
            	return; 
        	}else{
        		for(var i=0;i<selected.length;i++){
        			cids[i]=selected[i].pid;
        		}
        		$.ajax({
        		    type:"POST",
        		    async:false,
        		    data:{cids:cids},
        		    url:"/jwr/enControl/submitAuditOrgsAction.action",
        		    success:function(returnValue){
        		    	if(eval(returnValue)=='0'){
				    		alert("提示信息：选择考评机构成功!");
				    	}else{
				    		alert("提示信息：选择考评机构失败，请与管理员联系!");
				    	}
        		    }
       		    })
        	}
        }
    </script>
</head>

<body style="padding:10px;">
	<h1>考评机构列表</h1>
	<DIV class=eui-info>
		<DIV class="eui-tip icon-tip"></DIV>
		<DIV>请在如下考评机构列表中为新申请的资质证书自行选择两个</DIV>
	</DIV>
	<div style="margin:10px auto;"></div>
	<div class="l-loading" style="display: block;" id="pageloading"></div>
	
	<div id="maingrid4" style="margin: 0; padding: 0"></div>
	<div style="display: none;"></div>
</body>
</html>

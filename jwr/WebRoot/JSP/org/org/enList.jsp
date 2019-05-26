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

<script type="text/javascript">
	var indexdata="",totalSize="",cid="";
	$(initLiger);
    function  initLiger(parms) {
    	window['g'] = 
            manager = $("#result").ligerGrid({
                columns: [ 
            { display: '名称', name: 'pnname', align: 'center'  },
            { display: '业务类型', name: 'bussinestype',  align: 'center',render:function(item){return getBusTypeVal(item.bussinestype)} },
            { display: '证书编号', name: 'cid',  align: 'center' },
            { display: '专兼职', name: 'parttime',  heightAlign: 'center' },
            { display: '聘用日期', name: 'employdate',    align: 'center' },
            { display: '解聘日期', name: 'unemploydate',    align: 'center' }], 
                data: indexdata,
                url:"/jwr/motpn/selectAllInOrgAction.action",
                rownumbers: true,
                toolbar: { 
                	items: [
                	        { text: '详细信息', click: detial, icon: 'modify' },
                            { line: true } 
                	       ]
                },
                parms:parms,
                width: '100%', 
                height: '345', 
                checkbox: false
            });
            $("#pageloading").hide();
    }
	function pykpy(){
		var selected = manager.getSelected();
        if (!selected) { 
        	alert('请选择考评员');
        	return; 
        }else{
			$.ajax({
			    type:"POST",
			    async:false,
			    data:{id:selected.id,isbol:'0'},
			    url:"/jwr/orgControl/employPnAction.action",
			    success:function(returnValue){
			   		if(returnValue=='yes'){
			   			alert("聘用考评员成功！");
			   			manager.reload();
			   		}else{
			   			alert(returnValue);
			   		}
			    },
			    error:function(e){
			    	alert("系统出现异常，请联系系统管理员");
			    }
			});
        }
	}
	
	function jpkpy(){
		
	}
	var ligerWindow;
	function detial(){
		var selected = manager.getSelected();
        if (!selected) { 
        	alert('请选择行');
        	return; 
        }else{
        	ligerWindow=$.ligerDialog.open({
             	url:'JSP/mot/org/orgpntail.jsp?certnumber='+selected.cid+'&flag=1',
             	width:810,
             	height:550,
             	title:'考评员<font color="red">'+selected.pnname+'</font>详细信息'
         	});
        }
	}
	function query(){
		cid=$("#cid").val();
		var param = {cid:cid};
		initLiger(cid);
	}
</script>
</head>

<body style="padding:10px;">
		<h1>本机构当前在职考评人员</h1>
		<div style="margin:15px" id="hire">
			<div class="eui-info">
				<div class="eui-tip icon-tip"></div>
				<div>聘用考评员需提供其资格证书号；已聘用的考评员可以点击详情查看后进行解聘。</div>
			</div>
			<label>通过资质证书号查询考评员：</label><input type="text" id="cid"
				class="easyui-validatebox validatebox-text">&nbsp;&nbsp;&nbsp;<a
				onclick="query();" href="javascript:void(0);"
				class="easyui-linkbutton l-btn" id="undefined"><span
				class="l-btn-left"><span class="l-btn-text">查询</span> </span> </a>
		</div>
		<div id="result"></div>
		<br> <br>
</body>
</html>

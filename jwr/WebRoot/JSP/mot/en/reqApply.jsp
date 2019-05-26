<%@taglib uri="/struts-tags" prefix="s"%><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../main.jsp" %>
<%
	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>My JSP 'pnApply.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript">
var indexdata="",indexdata1="",totalSize="",manager1,manager,manager2;
var iniData,applyedData;
        $(function ()
        {
    	iniData= function (){
    	    $.ajax({
    		    type:"POST",
    		    async:false,
    		    url:"/jwr/exchangecert/getEnCertByUserIdAction.action",
    		    success:function(returnValue){
    		   		indexdata=returnValue;
    		   		indexdata = eval("("+indexdata+")");
    		   		if(manager!=null){
    		   			manager.loadData(indexdata);
    		   		}
    		    }
    		});
    	}
    	applyedData = function(){
    		$.ajax({
    		    type:"POST",
    		    async:false,
    		    url:"/jwr/exchangecert/enapplyedDataAction.action",
    		    success:function(returnValue){
    		    	indexdata1=returnValue;
    		    	indexdata1 = eval("("+indexdata1+")");
    		   		if(manager!=null){
    		   			manager2.loadData(indexdata1);
    		   		}
    		    }
    		});
    	}
    	iniData();
    	applyedData();
            window['g'] = 
            manager = $("#exchangeCert").ligerGrid({
                columns: [ 
	            { display: '名称', name: 'enname',width:'20%',align: 'center'  },
	            { display: '证件号', name: 'pid',width:'15%', align: 'center'  },
	            { display: '证书号', name: 'certnumber',width:'15%',  align: 'center'
	              },
	            { display: '业务类型', name: 'certtype', width:'10%', align: 'center', 
		            	render:function(item){return  getCelltype(item.certtype)} },
	            { display: '发证日期', name: 'fzdate',  width:'15%',heightAlign: 'center' },
	            { display: '证书到期日', name: 'stopdate', width:'15%',   align: 'center' }], 
                data: indexdata,
                title:'拥有证书列表',
                url: "",
              	toolbar: { 
                	items: [
                	        { text: '详细信息', click: detial, icon: 'modify' },
                            { line: true }
                	       ]
                },
                width: '95%', 
                height: '55%',
                usePager:false
            });
            window['g'] = 
                manager2 = $("#applyed").ligerGrid({
                    columns: [ 
    	            { display: '企业名称', name: 'enname',width:'20%', align: 'center'  },
    	            { display: '证件号', name: 'pid', width:'15%',align: 'center'  },
    	            { display: '证书号', name: 'cid',width:'15%',  align: 'center' },
    	            { display: '业务类型', name: 'type2name', width:'10%',  align: 'center' },
    	            { display: '发证日期', name: 'fzdate',  width:'15%',  heightAlign: 'center' },
    	            { display: '证书到期日', name: 'stopdate',width:'15%', align: 'center' }], 
                    data: indexdata1,
                    title:'已申请换证列表',
                    url: "",
                  	toolbar: { 
                    	items: [
                    	        { text: '详细信息', click: detial2, icon: 'modify' },
                                { line: true }
                    	       ]
                    },
                    width: '95%', 
                    height: '35%',
                    usePager:false
                });
            $("#pageloading").hide();
        }); 
 //页面中声明一个变量
  var postdata;
function detial(){
	var selected = manager.getSelected();
            if (!selected) {
            	alert('请选择行');
            	return; 
            }else{
            	var username = selected.enname;
            	var str = JSON2.stringify(selected);
            	postdata=str;
            	manager1 = $.ligerDialog.open({
                 	url:'JSP/mot/en/exchangedetial.jsp?indexdata='+encodeURI(encodeURI(str))+'&flag=1',
                 	width:550,
                 	height:510,
                 	title:'交通运输企业<font color="red">'+username+'</font>换证申请详细信息'
             	});
            }
}
//页面中声明一个变量
  var postdata1;
function detial2(){
	var selected = manager2.getSelected();
            if (!selected) {
            	alert('请选择行');
            	return; 
            }else{
            	var username = selected.enname;
            	var str = JSON2.stringify(selected);
            	postdata1=str;
            	manager1 = $.ligerDialog.open({
                 	url:'JSP/mot/en/applyedetial.jsp?indexdata='+encodeURI(encodeURI(str))+'&flag=1',
                 	width:550,
                 	height:510,
                 	title:'交通运输企业<font color="red">'+username+'</font>详细信息'
             	});
            }
}
</script>
</head>
<body>
			<h1>换证申请	</h1>
			 
			<div id="exchangeCert" style="margin: 0; padding: 0"></div>
			<div id="applyed" style="margin: 0; padding: 0"></div>
</body>
</html>
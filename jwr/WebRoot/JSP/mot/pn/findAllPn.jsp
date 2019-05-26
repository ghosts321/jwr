<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>
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
    
    
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
       $(initLiger);
        function  initLiger(parms) {
            window['g'] = 
             manager =$("#pnlist").ligerGrid({
                columns: [ 
            { display: '主管机关', name: 'adminmot',  align: 'center',render:function(item){return getMotVal(item.adminmot)==null?item.adminmot:getMotVal(item.adminmot)} },
            { display: '名称', name: 'pnname',  align: 'center' },
            { display: '单位组织', name: 'org',  heightAlign: 'center' },
            { display: '业务类型', name: 'bussinestype', align: 'center',render:function(item){return getBusTypeVal(item.bussinestype)==null?item.bussinestype:getBusTypeVal(item.bussinestype)} },
            { display: '证书号', name: 'cid', align: 'center' }, 
            { display: '发证时间', name: 'fzdate',   align: 'center' }], 
                rownumbers: true,
                parms:parms,
                url:"/jwr/motpn/findAllPnAction.action",
                width: '100%', 
                height: '55%', 
                toolbar: { 
                	items: [
                	       
                	        { text: '文件导出（全部'+totalSize+'行）',id:'export', click: exportData, icon: 'down' },
                            { line: true },
                            { text: '详细信息', click: tail, icon: 'modify' },
                            { line: true }
                	       ]
                }
            });
        }
        function exportData(){
			window.location.href="<%=basePath%>/motpn/exportAllPnAction.action";
        }
        function tail(){
        	var selected = manager.getSelected();
            if (!selected) { 
            	alert('请选择行');
            	return; 
            }else{
            	$.ligerDialog.open({
                 	url:'JSP/mot/pn/pntail.jsp?certnumber='+selected.cid+'&flag=1',
                 	width:810,
                 	height:500,
                 	title:'评审员<font color="red">'+manager.getSelected().pnname+'</font>详细信息'
             	});
            }
        }
        function query(){
       		var mot=$("#adminmot").val();
       		var name=$("#pnname").val();
       		var type=$("#pntype").val();
       		var cid=$("#cid").val();
       		var data={mot:mot,name:name,type:type,cid:cid};
       		initLiger(data);
       }
       function recover(){
       	$("#adminmot").val("%");
       	$("#pnname").val("");
       	$("#pntype").val("");
       	$("#cid").val("");
       }
    </script>
</head>
<body style="padding:10px;height:405;">
<div class="eui-info"><div class="eui-tip icon-tip"></div><div>仅列出已经获得交通运输企业安全生产标准化评审员资格证的评审员</div></div>
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
         <div class="box_center pt10 pb10" id="deg" style="height: 17%;display: none;">
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
               <td>评审员姓名：</td>
               <td>
                 <input type="text" name="" id="pnname">
               </td>
               <td>业务类型：</td>
               <td>
               	<select id="pntype" name="" required="true"> 
					<option selected="true"	value="">--请选择--</option>
					<option value="1">道路运输</option>
					<option value="2">水路运输</option>
					<option value="3">港口运营</option>
					<option value="4">城市客运</option>
					<option value="5">交通运输工程建设</option>
					<option value="6">其他</option>
				</select>
               </td>
               <td>证书号：</td>
               <td>
                 <input type="text" name="" id="cid">
               </td>
             </tr>
           </table>
         </div>
       </div>
   </div>
</div>
<div id="pnlist" style="margin: 0; padding: 0"></div>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>
<% 
String username=request.getSession().getAttribute("username").toString();%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <script type="text/javascript">
    var indexdata="";
    var busclass;
    var totalSize="";
    var grid;
    //页面初始化数据
  var iniData=  function  () {
	    $.ajax({
		    type:"POST",
		    async:false,
		    url:"/jwr/enControl/getEnZpListAction.action",
		    success:function(returnValue){
		   		indexdata=returnValue;
		   		indexdata=eval("("+indexdata+")");
		   		if(grid!=null){
		   			grid.loadData(indexdata);
		   		}
		    }
		});
    }
  iniData();
    function getBusClass(){
	    $.ajax({
		    type:"POST",
		    async:false,
		    url:"/jwr/enControl/getEnClassAction.action",
		    success:function(returnValue){
		    	busclass=eval("("+returnValue+")");
		    }
		});
    }
    getBusClass();
    function exportFile(){
    	window.location.href="/jwr/enControl/exportAction.action";
    }
    var ligerwindow;
    function view(){
    	var selected = grid.getSelected();
    	 var uname='<%=username%>';
        if (!selected) { 
        	alert('请选择行');
        	return; 
        }else{
        	ligerwindow=$.ligerDialog.open({
        		url:'JSP/mot/en/enDbzpDetail.jsp?type='+selected.busclass+'&grade='+selected.leval,
            	width:1000,
            	height:6500,
             	title:'交通运输企业<font color="red">'+uname+'</font>达标自评详细信息'
         	});
        	//;
        }
    }
    //这个例子展示了本地过滤，你也可以在服务器端过滤(将过滤规则组成json，以一个参数提交给服务器)
    //相见ligerGrid.showFilter.js
    	
        $(function ()
        {
            grid=$("#maingrid4").ligerGrid({
                columns: [ 
            { display: '日期', name: 'createdate', width:250, align: 'center' },
            { display: '业务编码', name: 'busclass',  width:250,heightAlign: 'center' ,hide:true},
            { display: '业务类别', name: 'bustext',  width:250,heightAlign: 'center'},
            { display: '评分', name: 'scoresum',    width:250,align: 'center' },
            { display: '等级', name: 'leval',    width:260,align: 'center',render: function (item)
	        {
	   		  if (item.leval=="1"){ return '一级';}
	   		 else if (item.leval=="2"){ return '二级';}
	   		 else if (item.leval=="3"){ return '三级';}
	            
	        } }], 
       			//是否使用分页
       			usePager:false,
                data: indexdata,
                rownumbers: true,
                url: "",
                title:"已经提交过的达标自评",
                toolbar: { 
                	items: [
                            { text: '详细信息', click: view, icon: 'modify' }
                	       ]
                },
                
                pageSize: 10,
                width: '100%', 
                height: '50%', 
                checkbox: false
            });
            $("#pageloading").hide();
        });
    </script>
    
    <script type="text/javascript">
    /*
    var ss="";
    for (var i=1;i<127;i++){
    	ss+=("<tr id='"+i+"'> <input type='text' value='"+i+"'> </tr>");
        
    	 $("#table").html(ss);
    }
   
    var y=0;
    var t2=0;
    var td1list=[{name:"123"},{name:"456"}];
    var td2list=[{name:"ccc"},{name:"ddd"}];
    var td2jlist=[{j:2},{j:3}];
    for(var i=1;i<123;i++){
    	 var td1="";
    	 var td2="";
    	if(i==1){
    		td1+="<td rowspan='7' >"+td1list[y].name+" </td>";
    		y++;
    		td2+="<td rowspan='"+td2jlist[0].j+""' >"+td2list[t2].name+" </td>"
    		t2++;
    		$("#"+i+"").html(td1+td2);
    	}
    	 
    }
    
   */
   // $("#"+i+"").html("")
     //name :  道路运输  水路运输
    function writeField(name){
				for(var sdd in busclass.Rows){
					if(busclass.Rows[sdd].uppername==name){
							//str="<a class='easyui-linkbutton l-btn' href='javascript:void(0)' onclick='dbzp("+busclass.Rows[sdd].fileid+");' style='margin: 5px' target='_blank' id='"+busclass.Rows[sdd].fileid+"'> <span class='l-btn-left'><span class='l-btn-text'>"+busclass.Rows[sdd].filetext+"</span></span></a>";
							//不弹出空白页面
							str="<a class='easyui-linkbutton l-btn' onclick='dbzp("+busclass.Rows[sdd].fileid+");' style='margin: 5px' target='_blank' id='"+busclass.Rows[sdd].fileid+"'> <span class='l-btn-left'><span class='l-btn-text'>"+busclass.Rows[sdd].filetext+"</span></span></a>";
							document.write(str);
					}
		    	}
			}
   function dbzp(el){
	   ligerwindow=$.ligerDialog.open({
        	url:'JSP/mot/en/enDbzpAdd.jsp?type='+el,
        	width:1000,
        	height:6500,
        	title:"企业自评分"
    	});
	  // ;
   }
    </script>
</head>

<body style="padding:10px;">
	<table id="table">
	
	</table>

			<div style="margin:10px auto;"></div>
		<div class="l-loading" style="display: block;width: 560px" id="pageloading"></div>

		<div id="maingrid4" style="margin: 0; padding: 0"></div>
		<div style="display: none;"></div>
		<br>
			<center>
			<h1>达标标准考评（五大类16小类）</h1>
			</center>
		<div class="eui-info">
			<div class="eui-tip icon-tip"></div>
			<div>注意：企业根据交通运输部颁布的下列某项标准进行达标自评打分！</div>
		</div>
		<h2>道路运输：</h2>
		<script type="text/javascript"> 
			var str;
			writeField("道路运输");
			str="";
		</script>
		
		<h2>水路运输：</h2>
		<script type="text/javascript"> 
		writeField("水路运输");
		str="";
		</script>
		<h2>港口运营：</h2>
		<script type="text/javascript"> 
		writeField("港口运营");
		str="";
		</script>
		<h2>城市客运：</h2>
		<script type="text/javascript"> 
		writeField("城市客运");
		str="";
		</script>
		<h2>交通运输工程建设：</h2>
		<script type="text/javascript"> 
		writeField("交通运输工程建设");
		str="";
		</script>
		 
		<h2>其它：</h2>
		<script type="text/javascript"> 
		writeField("其它");
		str="";
		</script>
 
</body>
</html>

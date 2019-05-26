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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script>
		var searchtype="";
	 	var indexdata="";
	    var totalSize="";
	    var sdel="";
	    var regrespsumData="",sumData;
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
        			   	    str='<SELECT id="adminmot2" name="adminmot" style="width: 150px;">';
        			   		for(var i=0;i<obj1.length;i++){
        			   			if(i==0){
        			   				str+='<OPTION selected value="%">请选择</OPTION>';
        			   				str+='<OPTION  value='+obj1[i].motcode+'>'+obj1[i].motname+'</OPTION>';
        			   			}else{
        			   				str+='<OPTION  value='+obj1[i].motcode+'>'+obj1[i].motname+'</OPTION>';
        			   			}
        						
        			   		}
        			   		
        			   		  str+='</SELECT>';
        			   		$("#zgjg2").append(str);
        			    }
        			});
		});
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
        			   	    str='<SELECT id="adminmot3" name="adminmot" style="width: 150px;">';
        			   		for(var i=0;i<obj1.length;i++){
        			   			if(i==0){
        			   				str+='<OPTION selected value="%">请选择</OPTION>';
        			   				str+='<OPTION  value='+obj1[i].motcode+'>'+obj1[i].motname+'</OPTION>';
        			   			}else{
        			   				str+='<OPTION  value='+obj1[i].motcode+'>'+obj1[i].motname+'</OPTION>';
        			   			}
        						
        			   		}
        			   		
        			   		  str+='</SELECT>';
        			   		$("#zgjg3").append(str);
        			    }
        			});
		});
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
        			   	    str='<SELECT id="adminmot4" name="adminmot" style="width: 150px;">';
        			   		for(var i=0;i<obj1.length;i++){
        			   			if(i==0){
        			   				str+='<OPTION selected value="%">请选择</OPTION>';
        			   				str+='<OPTION  value='+obj1[i].motcode+'>'+obj1[i].motname+'</OPTION>';
        			   			}else{
        			   				str+='<OPTION  value='+obj1[i].motcode+'>'+obj1[i].motname+'</OPTION>';
        			   			}
        						
        			   		}
        			   		
        			   		  str+='</SELECT>';
        			   		$("#zgjg4").append(str);
        			    }
        			});
		});
	    function initSum(){ 
	    	$.ajax({
			    type:"POST",
			    async:false,
			    url:"/jwr/mot/regRespTjAction.action",
			    success:function(returnValue){
			    	 sumData=returnValue;
			    	 sumData=eval("("+sumData+")");
			    },
			    error:function(error){
			    	alert("数据异常，请联系系统管理员");
			    }
			});
	    }
		initSum();
		function sumHTML(id,text){
			sumData='';
			initSum();
			if(text=='主管机关'){
				//主管机关
				$("#"+id).html("<span class='l-btn-left'><span class='l-btn-text'>"+text+"<font color='red'>"+sumData.mot+"</font>/"+sumData.motALL+"</span></span>")
				$("#motResp").attr("title","有"+sumData.mot+"个尚未处理/共"+ sumData.motALL+"个报名申请");
			}else if(text=='考评员'){
				//考评员
				$("#pnResp").attr("title","有"+sumData.pn+"个尚未处理/共"+sumData.pnALL+"个报名申请");
				$("#"+id).html("<span class='l-btn-left'><span class='l-btn-text'>"+text+"<font color='red'>"+sumData.pn+"</font>/"+sumData.pnALL+"</span></span>")
			}else if(text=='考评机构'){
				//考评机构
				$("#orgResp").attr("title","有"+sumData.org+"个尚未处理/共"+sumData.orgALL+"个报名申请");
				$("#"+id).html("<span class='l-btn-left'><span class='l-btn-text'>"+text+"<font color='red'>"+sumData.org+"</font>/"+sumData.orgALL+"</span></span>")
			}else if(text=='企业'){
				//企业
				$("#enResp").attr("title","有"+sumData.en+"个尚未处理/共"+sumData.enALL+"个报名申请");
				$("#"+id).html("<span class='l-btn-left'><span class='l-btn-text'>"+text+"<font color='red'>"+sumData.en+"</font>/"+sumData.enALL+"</span></span>")
			}
		}
		function initSumHTML(){
			
			sumHTML("motResp","主管机关");
			sumHTML("pnResp","考评员");
			sumHTML("orgResp","考评机构");
			sumHTML("enResp","企业");
		}
	    function initData(){
		    $.ajax({
			    type:"POST",
			    async:false,
			    url:"/jwr/mot/regRespSumAction.action",
			    success:function(returnValue){
			    	regrespsumData=returnValue;
			    	 regrespsumData=eval("("+regrespsumData+")");
			    }
			});
	    }
	    /* 条件查询 
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
	*/
	var motGrid;
	var enGrid;
	var orgGrid;
	var pnGrid;
	
		/**
		 打开窗口后 提交完成 调用 function 重新刷新grid
		  gridName 为 执行刷新grid 的 function 名称
		*/
		var iniData=function initGrid (gridName){
			 if(gridName=='motGrid'){
					 if(motGrid!=null){
						 initSum();
						 sumHTML("motResp","主管机关");
						 motGrid.reload();
					 }
			 }else  if(gridName=='enGrid'){
					 if(enGrid!=null){
						 initSum();
						 sumHTML("enResp","企业");
						 enGrid.reload();
					 }
			 }else  if(gridName=='orgGrid'){
					 if(orgGrid!=null){
						 initSum();
						 sumHTML("orgResp","考评机构");
						 orgGrid.reload();
					 }
			 }else  if(gridName=='pnGrid'){
					 if(pnGrid!=null){
						 initSum();
						 sumHTML("pnResp","考评员");
						 pnGrid.reload();
					 }
			 }
		 }
		$(function(){
			$("#motResp").attr("title","有"+sumData.mot+"个尚未处理/共"+ sumData.motALL+"个报名申请");
			$("#enResp").attr("title","有"+sumData.en+"个尚未处理/共"+sumData.enALL+"个报名申请");
			$("#orgResp").attr("title","有"+sumData.org+"个尚未处理/共"+sumData.orgALL+"个报名申请");
			$("#pnResp").attr("title","有"+sumData.pn+"个尚未处理/共"+sumData.pnALL+"个报名申请");
		});
		
	  function initMotGrid () {
	  utype='mot';
		 //将其余三个隐藏
		 searchtype="mot";
		 document.getElementById("motGrid").style.display="block";
		 document.getElementById("enGrid").style.display="none";
		 document.getElementById("orgGrid").style.display="none";
		 document.getElementById("pnGrid").style.display="none";
		 document.getElementById("filter2").style.display="none";
		 document.getElementById("filter3").style.display="none";
		 document.getElementById("filter4").style.display="none";
		 document.getElementById("filter1").style.display="block";
		 motGrid= 
	            $("#motGrid").ligerGrid({
	            	title:"主管机关报名申请列表",
	                columns: [ 
	            { display: '主管机关', name: 'adminmot',  align: 'center',render:function(item){return getMotVal(item.adminmot)==null?item.adminmot:getMotVal(item.adminmot)}  },
	            { display: '名称', name: 'motname', align: 'center'  }, 
	            { display: '日期', name: 'createdate',  align: 'center'  }, 
	            { display: '证件号', name: 'pid',  align: 'center'  }, 
	            { display: '初审结果', name: 'regresp',  align: 'center',
	            	render: function (item)
	                {
	           		 if(item.regresp=="0"||item.regresp==""){return '尚未处理';}
	           		 else if (item.regresp=="1"){ return '同意';}
	           		 else if (item.regresp=="2"){ return '不同意';}
	                    else{return '尚未处理';}
	                }  }], 
	            url:"/jwr/mot/motRegRespAction.action",
	            parms: [],  
                toolbar: { 
                	items: [
                            { text: '查看', click: motView, icon: 'modify' },
                            {line:true},
                            { text: '删除', click: deleteReg , icon: 'delete' }
                	       ]
                },
	            width: '100%', 
                height: '340', 
                onSelectRow: function (rowdata, rowindex, rowDomElement){
                		pid=rowdata.id;
                		sdel=rowdata.regresp;
	                }  
	            });
        }
	 function initEnGrid () {
	 utype='en';
		 //将其余三个隐藏
		 searchtype="en";
		 document.getElementById("enGrid").style.display="block";
		 document.getElementById("motGrid").style.display="none";
		 document.getElementById("orgGrid").style.display="none";
		 document.getElementById("pnGrid").style.display="none";
		 document.getElementById("filter2").style.display="none";
		 document.getElementById("filter1").style.display="none";
		 document.getElementById("filter3").style.display="none";
		 document.getElementById("filter4").style.display="block";
		 enGrid= 
	            $("#enGrid").ligerGrid({
	            	title:"企业报名申请列表",
	                columns: [ 
	            { display: '主管机关', name: 'adminmot',  align: 'center',render:function(item){return getMotVal(item.adminmot)==null?item.adminmot:getMotVal(item.adminmot)}  },
	            { display: '名称', name: 'username', align: 'center'  }, 
	            { display: '业务类型', name: 'bustype', align: 'center',render:function(item){return getBusTypeVal(item.bustype)==null?item.bustype:getBusTypeVal(item.bustype)}  }, 
	            { display: '证件号', name: 'pid', align: 'center' },
	            { display: '等级', name: 'grade', align: 'center' , render:function(item){
	            	if(item.grade=='2'){return '二级';}
	            	else if(item.grade=='3'){return '三级';}
	            }   }, 
	            { display: '日期', name: 'createdate',  align: 'center'  }, 
	            { display: '初审结果', name: 'resp_reg',  align: 'center',
	            	render: function (item)
	                {
	           		 if(item.regresp=="0"||item.regresp==""){return '尚未处理';}
	           		 else if (item.regresp=="1"){ return '同意';}
	           		 else if (item.regresp=="2"){ return '不同意';}
	                    else{return '尚未处理';}
	                }  }], 
	            url:"/jwr/mot/enRegRespAction.action",
	            parms: [],  
                toolbar: { 
                	items: [
                            { text: '查看', click: enView, icon: 'modify' },
                            {line:true},
                            { text: '删除', click: deleteReg, icon: 'delete' }
                	       ]
                },
	            width: '100%', 
                height: '340', 
                onSelectRow: function (rowdata, rowindex, rowDomElement){
                		pid=rowdata.id;
                		sdel=rowdata.regresp;
	                }  
		              
	            });
			  
        }
	 function initOrgGrid () {
	 utype='org';
		 //将其余三个隐藏
		 searchtype="org";
		 document.getElementById("orgGrid").style.display="block";
		 document.getElementById("enGrid").style.display="none";
		 document.getElementById("motGrid").style.display="none";
		 document.getElementById("pnGrid").style.display="none";
		 document.getElementById("filter2").style.display="none";
		 document.getElementById("filter4").style.display="none";
		 document.getElementById("filter1").style.display="none";
		 document.getElementById("filter3").style.display="block";
		 orgGrid= 
	            $("#orgGrid").ligerGrid({
	            	title:"考评机构报名申请列表",
	                columns: [ 
	            { display: '主管机关', name: 'adminmot',  align: 'center',render:function(item){return getMotVal(item.adminmot)==null?item.adminmot:getMotVal(item.adminmot)}  },
	            { display: '名称', name: 'orgname', align: 'center'  }, 
	            { display: '证件号', name: 'pid', align: 'center'  }, 
	            { display: '业务类型', name: 'bustype', align: 'center',render:function(item){return getBusTypeVal(item.bustype)==null?item.bustype:getBusTypeVal(item.bustype)}  }, 
	            { display: '等级', name: 'grade', align: 'center', render:function(item){
	            	if(item.grade==2){return '二级';}
	            	else if(item.grade==3){return '三级';}
	            }  }, 
	            { display: '日期', name: 'createdate',  align: 'center'  }, 
	            { display: '初审结果', name: 'regresp',  align: 'center',
	            	render: function (item)
	                {
	           		 if(item.regresp=="0"||item.regresp==""){return '尚未处理';}
	           		 else if (item.regresp=="1"){ return '同意';}
	           		 else if (item.regresp=="2"){ return '不同意';}
	                    else{return '尚未处理';}
	                }  }], 
	            url:"/jwr/mot/orgRegRespAction.action",
               parms: [],  
                toolbar: { 
                	items: [
                            { text: '查看', click: orgView, icon: 'modify' },
                            {line:true},
                            { text: '删除', click: deleteReg, icon: 'delete' }
                	       ]
                },
	            width: '100%', 
                height: '340', 
                onSelectRow: function (rowdata, rowindex, rowDomElement){
                		pid=rowdata.id;
                		sdel=rowdata.regresp;
	                }  
	            });
        }
	 function initPnGrid () {
	 utype='pn';
		 //将其余三个隐藏
		 searchtype="pn";
		 document.getElementById("orgGrid").style.display="none";
		 document.getElementById("enGrid").style.display="none";
		 document.getElementById("motGrid").style.display="none";
		 document.getElementById("pnGrid").style.display="block";
		 document.getElementById("filter1").style.display="none";
		 document.getElementById("filter3").style.display="none";
		 document.getElementById("filter4").style.display="none";
		 document.getElementById("filter2").style.display="block";
		 pnGrid= 
	            $("#pnGrid").ligerGrid({
	            	title:"考评员报名申请列表",
	                columns: [ 
	            { display: '主管机关', name: 'admin',  align: 'center',render:function(item){return getMotVal(item.admin)==null?item.admin:getMotVal(item.admin)}  },
	            { display: '姓名', name: 'username', align: 'center'  }, 
	            { display: '证件号', name: 'pid', align: 'center'  },
	            { display: '单位组织', name: 'org', align: 'center'  },
	            { display: '职称', name: 'title', align: 'center'  },
	            { display: '业务类型', name: 'type', align: 'center' ,render:function(item){return getBusTypeVal(item.type)==null?item.type:getBusTypeVal(item.type)} }, 
	            { display: '日期', name: 'cdate',  align: 'center'  }, 
	            { display: '初审结果', name: 'regresp',  align: 'center',
	            	render: function (item)
	                {
	           		 if(item.regresp=="0"||item.regresp==""){return '尚未处理';}
	           		 else if (item.regresp=="1"){ return '同意';}
	           		 else if (item.regresp=="2"){ return '不同意';}
	                    else{return '尚未处理';}
	                } 
	            }], 
                url:"/jwr/mot/pnRegRespAction.action",
                parms: [],  
                toolbar: { 
                	items: [
                            { text: '查看', click: pnView, icon: 'modify' },
                            {line:true},
                            { text: '删除', click: deleteReg, icon: 'delete' }
                	       ]
                },
	            width: '100%', 
                height: '340', 
                onSelectRow: function (rowdata, rowindex, rowDomElement){
                		pid=rowdata.id;
                		sdel=rowdata.regresp;
	                }  
	            });
		  
        }
         var pid;
		 function motsave(){
			 if (pid==null){
				 alert('请选择行');
	            	return; 
	          }else{
		            	 
	            	 $.ajax({
	         		    type:"POST",
	         		    async:false,
	         		    url:'<%=basePath%>mot/motRegRespUpdateAjaxAction.action?pid='+pid+'&flag=1',
	         		    success:function(returnValue){
	         		    	 if(returnValue=='yes'){
	         		    		alert("审批成功!");	
	         		    		//审批成功后  刷新表格数据 并将pid 置为空
	         					 if(motGrid!=null){
	         						 motGrid.reload();
	         					 }
	         		    	 }else{
	         		    		$.ligerDialog.error(returnValue);	         		    		 
	         		    	 }
	         		    }
	         		});     	
	            	
		                  
	            }
			 
		 }
		 //企业
		 function save(){
			 if (pid==""){
				 alert('请选择行');
	            	return; 
	            }else{
	            	 $.ajax({
	         		    type:"POST",
	         		    async:false,
	         		    url:'<%=basePath%>mot/enRegRespUpdateAction.action?pid='+pid+'&flag=1',
	         		    success:function(returnValue){
	         		    	 if(returnValue=='yes'){
	         		    		alert("提交审批成功");	
	         		    		//审批成功后  刷新表格数据 并将pid 置为空
	         		    		//审批成功后 待处理数据会有变化  刷新 标题行 数据信息
	         		    		initSumHTML();
	         		    		pid="";
	         					 if(enGrid!=null){
	         						 enGrid.reload();
	         					 }
	         		    	 }else{
	         		    		alert(returnValue);	         		    		 
	         		    	 }
	         		    }
	         		});     	
	            	
		                  
	            }
			 
		 }
		 //企业
		 function ensave(){
			 if (pid==""){
				 alert('请选择行');
	            	return; 
	            }else{
	            	 $.ajax({
	         		    type:"POST",
	         		    async:false,
	         		    url:'<%=basePath%>mot/enRegRespUpdateAjaxAction.action?pid='+pid+'&flag=1',
	         		    success:function(returnValue){
	         		    	 if(returnValue=='yes'){
	         		    		alert("提交审批成功");	
	         		    		//审批成功后  刷新表格数据 并将pid 置为空
	         		    		//审批成功后 待处理数据会有变化  刷新 标题行 数据信息
	         		    		initSumHTML();
	         		    		pid="";
	         					 if(enGrid!=null){
	         						 enGrid.reload();
	         					 }
	         		    	 }else{
	         		    		$.ligerDialog.error(returnValue);	         		    		 
	         		    	 }
	         		    }
	         		});     	
	            	
		                  
	            }
			 
		 }
		 //考评员
		 function pnsave(){
			 if (pid==""){
				 alert('请选择行');
	            	return; 
	            }else{
	            	 $.ajax({
	         		    type:"POST",
	         		    async:false,
	         		    url:'<%=basePath%>mot/pnRegRespUpdateAjaxAction.action?pid='+pid+'&flag=1',
	         		    success:function(returnValue){
	         		    	 if(returnValue=='yes'){
	         		    		alert("提交审批成功");	
	         		    		//审批成功后  刷新表格数据 并将pid 置为空
	         		    		//审批成功后 待处理数据会有变化  刷新 标题行 数据信息
	         		    		initSumHTML();
	         		    		pid="";
	         					 if(pnGrid!=null){
	         						 pnGrid.reload();
	         					 }
	         		    	 }else{
	         		    		$.ligerDialog.error(returnValue);	         		    		 
	         		    	 }
	         		    }
	         		});     	
	            }
		 }
		 //考评机构
		 function orgsave(){
			 if (pid==""){
				 alert('请选择行');
	            	return; 
	            }else{
		            	 
	            	 $.ajax({
	         		    type:"POST",
	         		    async:false,
	         		    url:'<%=basePath%>mot/orgRegRespUpdateAjaxAction.action?pid='+pid+'&flag=1',
	         		    success:function(returnValue){
	         		    	
	         		    	 if(returnValue=='yes'){
	         		    		alert("提交审批成功");	
	         		    		//审批成功后  刷新表格数据 并将pid 置为空
	         		    		//审批成功后 待处理数据会有变化  刷新 标题行 数据信息
	         		    		initSumHTML();
	         		    		pid="";
	         					 if(orgGrid!=null){
	         						 orgGrid.reload();
	         					 }
	         		    	 }else{
	         		    		$.ligerDialog.error(returnValue);	         		    		 
	         		    	 }
	         		    }
	         		});     	
	            }
		 }
		 var ligerwindow;
		 function motView(){
				if (motGrid.getSelected()==null){
					alert('请选择行');
	            	return; 
	            }else{
	           	 var name = motGrid.getSelected().motname;
	            	ligerwindow=$.ligerDialog.open({
		                 	url:'<%=basePath%>mot/motRegRespDetailAction.action?pid='+pid+'&flag=1',
		                 	width:1000,
		                 	height:600,
		                 	title:'<font color="red">'+name+'</font>详细信息'
		             	});
	            	}
			 }
		 function enView(){
			if (enGrid.getSelected()==null){
				alert('请选择行');
            	return; 
            }else{
            	var username =enGrid.getSelected().username;
           		ligerwindow=$.ligerDialog.open({
	                 	url:'<%=basePath%>mot/enRegRespDetailAction.action?pid='+pid+'&flag=1',
	                 	width:1000,
	                 	height:600,
	                 	title:'<font color="red">'+username+'</font>详细信息'
	             	});
            	}
		 }
		 function orgView(){
				if (orgGrid.getSelected()==null){
					alert('请选择行');
	            	return false; 
	            }else{
	            var username =orgGrid.getSelected().orgname;
	           		ligerwindow=$.ligerDialog.open({
		                 	url:'<%=basePath%>mot/orgRegRespDetailAction.action?pid='+pid+'&flag=1',
		                 	width:1000,
		                 	height:700,
		                 	title:'<font color="red">'+username+'</font>详细信息'
		             	});
	            	}
			 }
		 
		 /**
		 删除
		 */
		 var utype="";
		 function deleteReg(){
			 var usertype="";
			 var flag=true;
			 /* if(sdel==1){
			 	alert("该用户已被使用不能删除,请去密钥用户管理处停用");
			 	return;
			 } */
			 if(utype=="mot"){
				if(motGrid.getSelected()==null){
					flag=false;
				}
			 }
			 if(utype=="en"){
				 if (enGrid.getSelected()==null){
					flag=false;
				 }	
			 }
			 if(utype=="org"){
				 if (orgGrid.getSelected()==null){
					flag=false;
				 }
			 }
			 if(utype=="pn"){
				 if (pnGrid.getSelected()==null){
					flag=false;
				 }
			 }
			 if (!flag){
				 alert('请选择行');
	            	return false; 
             }else{
            	 if (confirm('如果删除处理已同意申请的，请到秘钥用户管理也把该用户删除。')){ 
	            	 $.ajax({
		         		    type:"POST",
		         		    async:false,
		         		    url:'<%=basePath%>mot/deleteRegRespAction.action?pid='+pid+'&usertype='+utype,
		         		    success:function(returnValue){
		         		    	 if(returnValue=='yes'){
		         		    		 alert("删除成功");
		         		    		 if(utype=='mot'){
		         		    			iniData('motGrid');
		         	    			 }else  if (utype=='en'){
		         	    				iniData('enGrid');
		         	    			 }else  if(utype=='org'){
		         	    				iniData('orgGrid');
		         	    			 }else if(utype=='pn'){
		         	    				iniData('pnGrid');
		         	    			 }
		         		    	 }else{
		         		    		$.ligerDialog.error(returnValue);
		         		    	 }
		         		    }
	            	 });
            	 }
		 	} 
		 }
		 function pnView(){
				if (pnGrid.getSelected()==null){
					alert('请选择行');
	            	return false; 
	            }else{
	             var username =pnGrid.getSelected().username;
	           		ligerwindow=$.ligerDialog.open({
		                 	url:'<%=basePath%>mot/pnRegRespDetailAction.action?pid='+pid+'&flag=1',
		                 	width:1000,
		                 	height:810,
		                 	title:'<font color="red">'+username+'</font>详细信息'
		             	});
            	}
			 }
		 
		 function query(){
				var admin = $("#adminmot").val();
				var admin2 = $("#adminmot2").val();
				var admin3 = $("#adminmot3").val();
				var admin4 = $("#adminmot4").val();
				var cid = $("#zjh").val();
				var motname = $("#mc").val();
				var resp = $("#resp").val();
				var pnpid = $("#pnpid").val();
				var pnresp = $("#pnresp").val();
				var pnname = $("#pnname").val();
				var pntype = $("#pntype").val();
				var orgname = $("#orgname").val();
				var orgpid = $("#orgpid").val();
				var orgtype = $("#orgtype").val();
				var orggrade = $("#orggrade").val();
				var orgresp = $("#orgresp").val();
				var enname = $("#enname").val();
				var enpid = $("#enpid").val();
				var entype = $("#entype").val();
				var engrade = $("#engrade").val();
				var enresp = $("#enresp").val();
				if(searchtype=="mot"){
				    var data={admin:admin,cid:cid,motname:motname,resp:resp};
		    		//motGrid.loadData(indexdata);
			   	 	//将 查询参数 设置到 grid中 以便下次分页时候 可以获取到查询参数
			   		motGrid.setOptions({parms: data});
			   		//将grid 表格 刷新
       				motGrid.reload();
       				//默认回到第一页
			   		//motGrid.changePage('first');
				}else if(searchtype=="pn"){
				    var data = {admin:admin2,pnpid:pnpid,pnname:pnname,pnresp:pnresp,pntype:pntype};
		    		//pnGrid.loadData(indexdata);
			   	 	//将 查询参数 设置到 grid中 以便下次分页时候 可以获取到查询参数
			   		pnGrid.setOptions({ parms: data});
			   	 	//将grid 表格 刷新
       				pnGrid.reload();
       				//默认回到第一页
			   		//pnGrid.changePage('first');
				}else if(searchtype=="org"){
				    var data = {admin:admin3,orgpid:orgpid,orgname:orgname,orgresp:orgresp,orgtype:orgtype,orggrade:orggrade};
		    		//orgGrid.loadData(indexdata);
			   	 	//将 查询参数 设置到 grid中 以便下次分页时候 可以获取到查询参数
			   		orgGrid.setOptions({ parms: data});
			   		//将grid 表格 刷新
       				orgGrid.reload();
       				//默认回到第一页
			   		//orgGrid.changePage('first');	
				}else if(searchtype=="en"){
				    var data = {admin:admin4,enpid:enpid,enname:enname,enresp:enresp,entype:entype,engrade:engrade};
		    		//enGrid.loadData(indexdata);
			   	 	//将 查询参数 设置到 grid中 以便下次分页时候 可以获取到查询参数
			   	 	enGrid.setOptions({ parms: data});
			   		//将grid 表格 刷新
       				enGrid.reload();
       				//默认回到第一页
			   		//enGrid.changePage('first');	
				}
			}
	function recover(){
		$("#adminmot").val("%");
		$("#adminmot2").val("%");
		$("#adminmot3").val("%");
		$("#adminmot4").val("%");
		$("#zjh").val("");
		$("#mc").val("");
		$("#resp").val("");
		$("#pnpid").val("");
		$("#pnresp").val("");
		$("#pnname").val("");
		$("#pntype").val("");
		$("#selInfo").val("");
		$("#selInfo4").val("");
		$("#orgname").val("");
		$("#orgpid").val("");
		$("#orgtype").val("");
		$("#orggrade").val("");
		$("#orgresp").val("");
		$("#enname").val("");
		$("#enpid").val("");
		$("#entype").val("");
		$("#engrade").val("");
		$("#enresp").val("");
	}
	</script>
  </head>
  
  <body>
	<div class="panel layout-panel layout-panel-center"
		style="  ">
		<div border="false" region="center" split="false"
			style="padding: 20px; width: 1050px; "
			class="layout-body panel-body panel-body-noheader panel-body-noborder"
			title="">
			<h1>进行报名申请初审</h1>
			<div class="eui-info">
				<div class="eui-tip icon-tip"></div>
				<div>对考评员、考评机构、企业、主管机关用户填写的初步报名申请信息进行审批。</div>
			</div>
				<a class="easyui-linkbutton l-btn" href="javascript:void(0)"
				onclick="initMotGrid(); "  id="motResp"
				style="margin:5px"  >
				     <script type="text/javascript">
				     	sumHTML("motResp","主管机关");
				     </script>
				</a> 
				<a class="easyui-linkbutton l-btn" href="javascript:void(0)"
				onclick="initPnGrid(); "  id="pnResp"
				style="margin:5px"  >
					<script type="text/javascript">
				     	sumHTML("pnResp","考评员");
				     </script>				 
				 </a> 
				<a class="easyui-linkbutton l-btn" href="javascript:void(0)"
				onclick="initOrgGrid(); "  id="orgResp"
				style="margin:5px"  >
					 <script type="text/javascript">
				     	sumHTML("orgResp","考评机构");
				     </script>	
				     
				     </a> 
				<a class="easyui-linkbutton l-btn" href="javascript:void(0)"
				onclick="initEnGrid(); "  id="enResp"
				style="margin:5px"  >
					<script type="text/javascript">
				     	sumHTML("enResp","企业");
				     </script>	
				</a> 
			<div id="filter1" class="mt10" style="display: none;">
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
	         <div class="box_center pt10 pb10" id="deg" style="height: 15%;display: none;">
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
	                 <input type="text" name="" id="zjh" style="width: 150px;">
	               </td>
	               <td>名称：</td>
	               <td>
	               	<input type="text" name="" id="mc" style="width: 150px;">
	               </td>
	               <td>受理结果：</td>
	               <td>
	                 <select id="resp" style="width: 150px;">
	                 	<option value="">--请选择--</option>
	                 	<option value="0">尚未处理</option>
	                 	<option value="1">同意</option>
	                 	<option value="2">不同意</option>
	                 </select>
	               </td>
	             </tr>
	           </table>
	         </div>
	       </div>
	   </div>
	</div>
	<div id="filter2" class="mt10" style="display: none;">
			    <div class="box" style="margin-bottom: 5px">
			       <div class="box_border">
			         <div class="box_top" style="width: 100%;">
	         	<div style="display:block; float:left;margin-left: 10px">
	         		<b class="pl15" sytle="display:block;float:left;">
		         		<font size="4">搜索</font>
		         	</b>
	         	</div>
	         	<div style="display:block; float:right;margin-right: 10">
	         		<a href="javascript:void(0);" onclick="zhankai2()" style="" >展开</a> ||
	         		<a href="javascript:void(0);" onclick="shouqi2()" style="">收起</a>
	         	</div>
	         </div>
	         <div class="box_center pt10 pb10" id="deg2" style="height: 20%;display: none;">
	         	<div id="button" class="mt10" style="margin-left: 5px;">
				 	<input type="button" name="button" class="btn btn82 btn_search" value="查询" onclick="query()">
				 	<input type="button" name="button" class="btn btn82 btn_config" value="重置" onclick="recover()">    
			    </div>
	           <table class="form_table" border="0" cellpadding="0" cellspacing="0">
	             <tr>
	               <td>主管机关：</td>
	               <td>
	               	<span id="zgjg2"></span>
	               </td>
	               <td>证件号：</td>
	               <td>
	                 <input type="text" name="" id="pnpid" style="width: 150px;">
	               </td>
	               <td >业务类型：</td>
	               <td>
	               	<select id="pntype" name="" required="true" style="width: 150px;"> 
						<option selected="true"	value="">--请选择--</option>
						<option value="1">道路运输</option>
						<option value="2">水路运输</option>
						<option value="3">港口运营</option>
						<option value="4">城市客运</option>
						<option value="5">交通运输工程建设</option>
						<option value="6">其他</option>
					</select>
	               </td>
	             </tr>
	             <tr>
	               <td>考评员姓名：</td>
	               <td>
	               	<input type="text" name="" id="pnname" style="width: 150px;">
	               </td>
	               <td>受理结果：</td>
	               <td>
	                 <select id="pnresp" style="width: 150px;">
	                 	<option value="">--请选择--</option>
	                 	<option value="0">尚未处理</option>
	                 	<option value="1">同意</option>
	                 	<option value="2">不同意</option>
	                 </select>
	               </td>
	             </tr>
	           </table>
	         </div>
	       </div>
	   </div>
	</div>
	<div id="filter3" class="mt10" style="display: none;">
			    <div class="box" style="margin-bottom: 5px">
			       <div class="box_border">
			         <div class="box_top" style="width: 100%;">
	         	<div style="display:block; float:left;margin-left: 10px">
	         		<b class="pl15" sytle="display:block;float:left;">
		         		<font size="4">搜索</font>
		         	</b>
	         	</div>
	         	<div style="display:block; float:right;margin-right: 10">
	         		<a href="javascript:void(0);" onclick="zhankai3()" style="" >展开</a> ||
	         		<a href="javascript:void(0);" onclick="shouqi3()" style="">收起</a>
	         	</div>
	         </div>
	         <div class="box_center pt10 pb10" id="deg3" style="height: 20%;display: none;">
	         	<div id="button" class="mt10" style="margin-left: 5px;">
				 	<input type="button" name="button" class="btn btn82 btn_search" value="查询" onclick="query()">
				 	<input type="button" name="button" class="btn btn82 btn_config" value="重置" onclick="recover()">    
			    </div>
	           <table class="form_table" border="0" cellpadding="0" cellspacing="0">
	             <tr>
	               <td>主管机关：</td>
	               <td>
	               	<span id="zgjg3"></span>
	               </td>
	               <td>证件号：</td>
	               <td>
	                 <input type="text" name="" id="orgpid" style="width: 150px;">
	               </td>
	               <td>业务类型：</td>
	               <td>
	               	<select id="orgtype" name="" required="true" style="width: 150px;"> 
						<option selected="true"	value="">--请选择--</option>
						<option value="1">道路运输</option>
						<option value="2">水路运输</option>
						<option value="3">港口运营</option>
						<option value="4">城市客运</option>
						<option value="5">交通运输工程建设</option>
						<option value="6">其他</option>
					</select>
	               </td>
	               <td id="jb1">等级：</td>
	               <td>
	                 <select id="orggrade" style="width: 150px;">
	                 	<option value="">--请选择--</option>
	                 	<option value="1">一级</option>
	                 	<option value="2">二级</option>
	                 	<option value="3">三级</option>
	                 </select>
	               </td>
	             </tr>
	             <tr>
	               <td>名称：</td>
	               <td>
	               	<input type="text" name="" id="orgname" style="width: 150px;">
	               </td>
	               <td>受理结果：</td>
	               <td>
	                 <select id="orgresp" style="width: 150px;">
	                 	<option value="">--请选择--</option>
	                 	<option value="0">尚未处理</option>
	                 	<option value="1">同意</option>
	                 	<option value="2">不同意</option>
	                 </select>
	               </td>
	             </tr>
	           </table>
	         </div>
	       </div>
	   </div>
	</div>
	<div id="filter4" class="mt10" style="display: none;">
			    <div class="box" style="margin-bottom: 5px">
			       <div class="box_border">
			         <div class="box_top" style="width: 100%;">
	         	<div style="display:block; float:left;margin-left: 10px">
	         		<b class="pl15" sytle="display:block;float:left;">
		         		<font size="4">搜索</font>
		         	</b>
	         	</div>
	         	<div style="display:block; float:right;margin-right: 10">
	         		<a href="javascript:void(0);" onclick="zhankai4()" style="" >展开</a> ||
	         		<a href="javascript:void(0);" onclick="shouqi4()" style="">收起</a>
	         	</div>
	         </div>
	         <div class="box_center pt10 pb10" id="deg4" style="height: 20%;display: none;">
	         	<div id="button" class="mt10" style="margin-left: 5px;">
				 	<input type="button" name="button" class="btn btn82 btn_search" value="查询" onclick="query()">
				 	<input type="button" name="button" class="btn btn82 btn_config" value="重置" onclick="recover()">    
			    </div>
	           <table class="form_table" border="0" cellpadding="0" cellspacing="0">
	             <tr>
	               <td>主管机关：</td>
	               <td>
	               	<span id="zgjg4"></span>
	               </td>
	               <td>证件号：</td>
	               <td>
	                 <input type="text" name="" id="enpid" style="width: 150px;">
	               </td>
	               <td >业务类型：</td>
	               <td>
	               	<select id="entype" name="" required="true" style="width: 150px;"> 
						<option selected="true"	value="">--请选择--</option>
						<option value="1">道路运输</option>
						<option value="2">水路运输</option>
						<option value="3">港口运营</option>
						<option value="4">城市客运</option>
						<option value="5">交通运输工程建设</option>
						<option value="6">其他</option>
					</select>
	               </td>
	               <td id="jb1">等级：</td>
	               <td>
	                 <select id="engrade" style="width: 150px;">
	                 	<option value="">--请选择--</option>
	                 	<option value="1">一级</option>
	                 	<option value="2">二级</option>
	                 	<option value="3">三级</option>
	                 </select>
	               </td>
	             </tr>
	             <tr>
	               <td>名称：</td>
	               <td>
	               	<input type="text" name="" id="enname" style="width: 150px;">
	               </td>
	               <td>受理结果：</td>
	               <td>
	                 <select id="enresp" style="width: 150px;">
	                 	<option value="">--请选择--</option>
	                 	<option value="0">尚未处理</option>
	                 	<option value="1">同意</option>
	                 	<option value="2">不同意</option>
	                 </select>
	               </td>
	             </tr>
	           </table>
	         </div>
	       </div>
	   </div>
	</div>
			<div id="motGrid" style="margin: 0; padding: 0; display: none"></div>
			 <div id="pnGrid" style="margin: 0; padding: 0; display: none"></div>
			<div id="orgGrid" style="margin: 0; padding: 0; display: none"></div>
			<div id="enGrid" style="margin: 0; padding: 0; display: none"></div>
		</div>
			
			</div>
		
	</div>
		 
</body>
</html>

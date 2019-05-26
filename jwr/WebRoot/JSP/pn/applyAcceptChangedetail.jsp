<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../main.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
  <script type="text/javascript">
  	var trainData,pass_direct_open;
  	var indexdata = window.parent.postdata,totalSize="";
  	$(function(){
		indexdata = eval("("+indexdata+")");
		var bustype = indexdata.BUSSINESTYPE;
	 	 if(indexdata.AUDITRESP=='0'){
			document.getElementById("sure").style.display="none";
			document.getElementById("close").style.display="block";
		}else{
				document.getElementById("sure").style.display="block";
				document.getElementById("close").style.display="none";
			}
  		//indexdata.BUSSINESTYPE = getBusTypeVal(indexdata.BUSSINESTYPE)==null?indexdata.BUSSINESTYPE:getBusTypeVal(indexdata.BUSSINESTYPE);
		//indexdata.ADMINMOT = getMotVal(indexdata.ADMINMOT)==null?indexdata.ADMINMOT:getMotVal(indexdata.ADMINMOT);
		$("#advice").text(indexdata.ADVICE);
		$.ajax({
		    type:"POST",
		    async:false,
		    data:{adminmot:indexdata.ADMINMOT,bustype:bustype,userid:indexdata.USERID},
		    url:"/jwr/pnApplyAccep/applyAcceptChangeDetailAction.action",
		    success:function(returnValue){
		    	//trainData = eval("("+returnValue+")");
		    }
		});
		/*
		window['g'] = 
            manager = $("#traintable").ligerGrid({
                columns: [ 
	            { display: '名称', name: 'PNNAME',width:'10%',align: 'center'  },
	            { display: '业务类型', name: 'BUSTYPE',width:'15%', align: 'center',render:function(item){return getBusTypeVal(item.BUSTYPE)==null?item.BUSTYPE:getBusTypeVal(item.BUSTYPE)}  },
	            { display: '培训合格证号', name: 'TRAIN_ID',width:'15%',  align: 'center' },
	            { display: '培训学时', name: 'TRAIN_HOUR', width:'10%', align: 'center'},
	            { display: '考试日期', name: 'EXAM_DATE',  width:'15%',heightAlign: 'center' },
	            { display: '考试分数', name: 'EXAM_SCORE', width:'15%',   align: 'center' }], 
                data: trainData,
                title:'该考评员"'+indexdata.BUSSINESTYPE+'"类型的培训、考试记录',
                width: '95%', 
                height: '30%',
                usePager:false
            });
		*/
        var ss= $("#applyAccept").ligerForm({
            	 inputWidth:200, labelWidth: 150, space: 20,
                 fields:[  
                 { display: "用户ID", name: "USERID", newline: true,type:"text",disabled:true  }, 
                 { display: "主管机关", name: "ADMINMOT", newline: false,  type:"text",disabled:true},
                 { display: "名称", name: "PNNAME", newline: true,  type:"text",disabled:true}, 
                 { display: "证件号", name: "PID", newline: false, type:"text", disabled:true,inputWidth:120},
                 { display: "常住地", name: "FROMADDRESS", newline: true,  disabled:true}, 
                 { display: "所在市", name: "CITY", newline: false,  disabled:true}, 
               	 { display: "业务类型", name: "BUSSINESTYPE", newline: true, disabled:true},
              	 { display: "单位组织", name: "ORG", newline: false,  disabled:true}, 
              	 { display: "通讯地址", name: "ADDRESS", newline: true,  disabled:true}, 
                 { display: "邮编", name: "PCODE", newline: false,  disabled:true}, 
                 { display: "联系电话", name: "TEL", newline: true, disabled:true},
                 { display: "手机", name: "MOBILE", newline: false, disabled:true}, 
                 { display: "文化程度", name: "EDU", newline: true, disabled:true},
                 { display: "所学专业", name: "MAJOR", newline: false, disabled:true},
              	 { display: "现从事专业", name: "PROF", newline: true, disabled:true},
              	 { display: "专业从业年份", name: "BEGINDATE", newline: false, disabled:true},
              	 { display: "照片", name: "PHOTO", newline: true,  disabled:true}, 
              	 { display: "换证原因", name: "RENEW", newline: true,  disabled:true,type:"textarea"}, 
              	 { display: "学习/培训经历", name: "TRAIN", newline: false, disabled:true,type:"textarea"},
              	 { display: "主要工作简历", name: "WORKDOC", newline: true, disabled:true,type:"textarea"},
              	 { display: "专业工作业绩", name: "PERF", newline: false, disabled:true,type:"textarea"}   ]
            });
			ss.setData(indexdata);
			$("[name=BUSSINESTYPE]").val(getBusTypeVal(indexdata.BUSSINESTYPE));
        	$("[name=ADMINMOT]").val(getMotVal(indexdata.ADMINMOT));
        	$("[name=FROMADDRESS]").val(getcomefromVal(indexdata.FROMADDRESS));
        	$("[name=CITY]").val(getcomefromValue(indexdata.CITY));
        	initAttachment('PHOTO');
        	/* $("input[name='PHOTO']").parent().parent().parent() .append(" <li><a href='javascript:chakan()'>查看</a></li> ") ; */
        	$("#RENEW").attr("disabled","disabled");
        	$("#TRAIN").attr("disabled","disabled");
			$("#WORKDOC").attr("disabled","disabled");
			$("#PERF").attr("disabled","disabled");
			
  	});
  	function chakan(){
  		var freport=$("input[name='PHOTO']").val();
    	if(freport!=null && freport!=""){
	 			var ftype = freport.split('.');
	 			var filetype=ftype[1];
 			 if(filetype =='bmp'||filetype =='BMP'||filetype =='jpg'||filetype =='JPG'||filetype =='jpeg'||filetype =='JPEG'||filetype =='png'||filetype =='PNG'||filetype =='gif'||filetype =='GIF'){
	  				seeImg('img0',freport);
	  			}else{
	  				window.location.href='<%= basePath%>updown/downloadFileAction?file='+freport;
	  			} 
  		}else{
  			alert("没有上传相关文件");
  		}
  	}
  	function pass_direct(){
  		if(!document.getElementById("pass-direct1").checked){
  			document.getElementById("pass-direct1").checked='checked';
  	  		document.getElementById("direct-name").disabled='';
  	  		document.getElementById("direct-title").disabled='';
  	  		$("#content").text('取消直接颁发操作');
  		}else{
  			document.getElementById("pass-direct1").checked='';
  	  		document.getElementById("direct-name").disabled='disabled';
  	  		document.getElementById("direct-title").disabled='disabled';
  	  		document.getElementById("direct-name").value='';
  	  		document.getElementById("direct-title").value='';
  	  		$("#content").text('直接颁发操作');
  		}
  	}
  	function submitAudit(type){
		var data = $("#advice").val();
		var pid1 = indexdata.PID;
		var id1=indexdata.ID;
		var busType = indexdata.BUSSINESTYPE;
		var adminmot = indexdata.ADMINMOT;
		var userid = indexdata.USERID;
		$.ajax({
		    type:"POST",
		    async:false,
		    data:{advice:data,pid:pid1,busType:busType,adminmot:adminmot,type:type,usertype:'pn',id:id1,userid:userid},
		    url:"/jwr/enControl/submitAuditChangeAction.action",
		    success:function(returnValue){
				if(returnValue=="0"){
					alert('处理成功！');
					window.parent.initData();
					window.parent.manager1.close();
				}else{
					alert('处理失败！');
				}
		    }
		});
	}
  </script>
	</head>
<body style="height: 100%;width: 100%">
	<center>
		<h1 style="padding:20px; background-color:#369; color: white; font-size: 22px; margin-top:0px;">考评员资格证申请审批</h1>
	</center>
	<div id="applyAccept" style="margin: 5 3 3 20; padding: 0;width: 99%"></div>
	
	
	<br>
	<br>
	<label style="margin: 5 3 3 20; padding: 0">换证申请审批意见：</label>
	<textarea id="advice" class="easyui-validatebox validatebox-text" style="width:600px;margin: 5 3 3 20; padding: 0"></textarea>
	<br>
	<br>
	<div id="sure" style="display:none;" align="center">
		<a onclick="submitAudit('0')" iconcls="icon-ok" href="javascript:void(0);" class="easyui-linkbutton l-btn" id="ty"><span class="l-btn-left"><span class="l-btn-text icon-ok" style="padding-left: 20px;">同  意</span></span></a>
	<a onclick="submitAudit('1')" iconcls="icon-cancel" href="javascript:void(0);" class="easyui-linkbutton l-btn" id="bty"><span class="l-btn-left"><span class="l-btn-text icon-cancel" style="padding-left: 20px;">不同意</span></span></a>
	</div>
	<div id="close" style="display:none;" align="center"> 
			<a   href="javascript:window.parent.manager1.close();" iconcls="icon-cancel" class="easyui-linkbutton l-btn" id="undefined" >
			<span class="l-btn-left">
			<span class="l-btn-text icon-cancel" style="padding-left: 20px;">关闭</span> 
			</span> </a>
	</div>
</body>
</html>
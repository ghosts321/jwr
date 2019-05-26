<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../main.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<!-- $("[ligeruiid=USERID]").append("&nbsp;<a href='javascript:seeImg("+indexdata.ID+")'   > 查看文件)</a>"); -->
	<head>
  <script type="text/javascript">
  	var trainData,pass_direct_open;
  	var indexdata = window.parent.postdata,totalSize="";
  	$(function(){
		indexdata = eval("("+indexdata+")");
		var bustype = indexdata.BUSSINESTYPE;
		//YPE = getBusTypeVal(indexdata.BUSSINESTYPE)==null?indexdata.BUSSINESTYPE:getBusTypeVal(indexdata.BUSSINESTYPE);
		//indexdata.ADMINMOT = getMotVal(indexdata.ADMINMOT)==null?indexdata.ADMINMOT:getMotVal(indexdata.ADMINMOT);
		$("#advice").text(indexdata.ADVICE);
		$.ajax({
		    type:"POST",
		    async:false,
		    data:{adminmot:indexdata.ADMINMOT,bustype:bustype,userid:indexdata.USERID},
		    url:"/jwr/pnApplyAccep/applyAcceptGetTrainAction.action",
		    success:function(returnValue){
		    	trainData = eval("("+returnValue+")");
		    }
		});
		 
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
                title:'该考评员"'+getBusTypeVal(indexdata.BUSSINESTYPE)+'"类型的培训、考试记录',
                width: '90%', 
                height: '20%',
                usePager:false
            });
		
        var ss= $("#applyAccept").ligerForm({
            	 inputWidth:200, labelWidth:150, space: 20,
                 fields:[  
                 { display: "用户ID", name: "USERID", newline: true,type:"text",disabled:true  }, 
                 { display: "主管机关", name: "ADMINMOT", newline: false,  type:"text",disabled:true},
                 { display: "名称", name: "PNNAME", newline: true,  type:"text",disabled:true}, 
                 { display: "证件号", name: "PID", newline: false, type:"text", disabled:true,inputWidth:120},
                 { display: "常住地", name: "ADDRESS", newline: true,  disabled:true}, 
                 { display: "所在市", name: "CITY", newline: false,  disabled:true}, 
                 { display: "照片", name: "PHOTO", newline: true,  disabled:true},
              	 { display: "单位组织", name: "ORG", newline: false,  disabled:true}, 
              	 { display: "通讯地址", name: "ADDRESS", newline: true,  disabled:true}, 
                 { display: "邮编", name: "PCODE", newline: false,  disabled:true}, 
                 { display: "联系电话", name: "TEL", newline: true, disabled:true},
                 { display: "手机", name: "MOBILE", newline: false, disabled:true}, 
                 { display: "文化程度", name: "EDU", newline: true, disabled:true},
                 { display: "所学专业", name: "MAJOR", newline: false, disabled:true},
              	 { display: "现从事专业", name: "PROF", newline: true, disabled:true},
              	 { display: "专业从业年份", name: "BEGINDATE", newline: false, disabled:true},
              	 { display: "业务类型", name: "BUSSINESTYPE", newline: true, disabled:true},
              	 { display: "申请日期", name: "CREATEDATE", newline: false, disabled:true} ,
              	 { display: "身份证明文件", name: "PROOF", newline: true, disabled:true} ,
              	 { display: "工作业绩证明", name: "PROOFORG", newline: false, disabled:true}, 
              	 { display: "继续教育证明", name: "EDU2", newline: true, disabled:true} , 
              	 { display: "身份证（背面）", name: "PROOFB", newline: false, disabled:true},
              	 { display: "学历证明文件", name: "PROOF2", newline: true, disabled:true} , 
              	 { display: "培训合格证明文件", name: "PROOF3", newline: false, disabled:true} , 
              	 { display: "专业工作业绩附件", name: "PERF2", newline: true, disabled:true} ,
              	 { display: "专业技术职称及相关材料", name: "PERF1", newline: false, disabled:true} ,
              	 { display: "主要工作简历", name: "WORKDOC", newline: true, disabled:true,type:"textarea"}, 
              	 { display: "学习/培训经历", name: "TRAIN", newline: false, disabled:true,type:"textarea"},   
              	 { display: "专业工作业绩", name: "PERF", newline: true, disabled:true,type:"textarea"} 
              	 ]
            });
       		ss.setData(indexdata);
        	 $("[name=BUSSINESTYPE]").val(getBusTypeVal(indexdata.BUSSINESTYPE));
        	 $("[name=ADMINMOT]").val(getMotVal(indexdata.ADMINMOT));
        	 $("[name=FROMADDRESS]").val(getcomefromVal(indexdata.FROMADDRESS));
        	 $("[name=CITY]").val(getcomefromValue(indexdata.CITY));
			 initAttachment('PHOTO,PERF1,PERF2,PROOF,PROOFB,PROOF2,PROOF3,EDU2,PROOFORG');
			$("#TRAIN").attr("disabled","disabled");
			$("#WORKDOC").attr("disabled","disabled");
			$("#PERF").attr("disabled","disabled");
			if(indexdata.AUDITRESP=="1"){
				$("#advice").attr("readonly","readonly");
				document.getElementById("ad1").style.display="none";
				document.getElementById("ad2").style.display="block";
			}else{
				document.getElementById("ad1").style.display="block";
				document.getElementById("ad2").style.display="none";
			}
			$("#advice").val(indexdata.advice);
  			
  	});
  	var isdirect=false;
  	function pass_direct(){
  		if(!document.getElementById("pass-direct1").checked){
  			document.getElementById("pass-direct1").checked='checked';
  	  		document.getElementById("direct-name").disabled='';
  	  		document.getElementById("direct-title").disabled='';
  	  		$("#content").text('取消直接颁发操作');
  	  		//isdirect=true;
  		}else{
  			document.getElementById("pass-direct1").checked='';
  	  		document.getElementById("direct-name").disabled='disabled';
  	  		document.getElementById("direct-title").disabled='disabled';
  	  		document.getElementById("direct-name").value='';
  	  		document.getElementById("direct-title").value='';
  	  		$("#content").text('直接颁发操作');
  	  		isdirect=false;
  		}
  	}
  	function submitAudit(type){
		var data = $("#advice").val();
		if(data.length>50){
			alert("初审意见字数不能超过50个，已输入"+data.length+"个字!");
  			return false;
		}
		var pid1 = indexdata.PID;
		var busType = indexdata.BUSSINESTYPE;
		var id1=indexdata.ID;
		var adminmot = indexdata.ADMINMOT;
		var userid = indexdata.USERID;
		var passdirect=document.getElementById("pass-direct1");//是否直接颁发
		var directtitle='';
		var directname='';
		if(passdirect.checked=='checked'||passdirect.checked==true){
			passdirect='直接颁发';
			directname=document.getElementById("direct-name").value;//颁发人职务
			directtitle=document.getElementById("direct-title").value;//颁发人职务
		}else{
			passdirect='';
		}
		if(isdirect){
			$.ajax({
			    type:"POST",
			    async:false,
			    data:{advice:data,pid:pid1,busType:busType,adminmot:adminmot,type:type,usertype:'pn',id:id1,userid:userid,passdirect:passdirect,directtitle:directtitle,directname:directname},
			    url:"<%=basePath%>/enControl/submitAuditAction.action",
			    success:function(returnValue){
					if(returnValue=="0"){
						$.ajax({
						    type:"POST",
						    async:false,
						    url:"/jwr/motcert/getCertAction.action?",
						    data:{userid:userid,bussinestype:busType,id:id1,pid:pid1,isdirect:'true'},
						    success:function(returnValue){
						   		if(returnValue=='yes'){
						   			alert('发证成功');
						   			window.parent.initLiger();
									window.parent.manager1.close();    
						   		}else{
						   			alert('发证失败');
						   		}
						    }
							});
						
					}else{
						alert('处理失败！');
					}
			    }
			});
		}else{
			$.ajax({
			    type:"POST",
			    async:false,
			    data:{advice:data,pid:pid1,busType:busType,adminmot:adminmot,type:type,usertype:'pn',id:id1,userid:userid},
			    url:"<%=basePath%>/enControl/submitAuditAction.action",
			    success:function(returnValue){
					if(returnValue=="0"){
						alert('处理成功！');
						window.parent.initLiger();
						window.parent.manager1.close();
					}else{
						alert('处理失败！');
					}
			    }
			});
		}
		
			
	}
  </script>
	</head>
<body style="height: 100%;width: 100%">
	<center>
		<h1 style="padding:20px; background-color:#369; color: white; font-size: 22px; margin-top:0px">考评员资格证申请审批</h1>
	</center>
	<div id="applyAccept" style="margin: 5 3 3 20; padding: 0;width: 90%;"></div>
	<div id="traintable" style="margin: 5 3 3 20; padding: 0;width: 90%;"></div>
	<div style="margin: 5 3 3 20;border:1px solid lightgray; padding: 10px;width: 90%;">
		<div class="eui-info">
			<div class="eui-tip icon-tip"></div>
			<div>直接从事交通运输安全生产行政管理工作10年以上，熟悉掌握交通运输安全生产相关法规和企业安全生产标准化规定者：</div>
		</div>
		<br>
		<a onclick="pass_direct();" href="javascript:void(0);"
			class="easyui-linkbutton l-btn" id="pass_direct"><span
			class="l-btn-left"><span class="l-btn-text" id = 'content'>直接颁发操作</span>
		</span>
		</a><br>
		<br>操作结果：（ <input type="checkbox" id="pass-direct1"
			disabled="true" class="easyui-validatebox validatebox-text">&nbsp;&nbsp;直接颁发&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;签发人姓名：<input
			type="text" value="" id="direct-name" disabled="true"
			class="easyui-validatebox validatebox-text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;签发人职务：<input
			type="text" value="" id="direct-title" disabled="true"
			class="easyui-validatebox validatebox-text"> ）
	</div>
	<br>
	<br>
	<label style="margin: 5 3 3 20; padding: 0">填写意见：</label>
	<textarea id="advice" class="easyui-validatebox validatebox-text" style="width:600px;margin: 5 3 3 20; padding: 0"  ></textarea>
	<br>
	<br>
	<div style="margin: 5 3 5 20; padding: 0 0 5 0;width: 90%"id="ad1" style="display:block" align="center">
		<a onclick="submitAudit('1')" iconcls="icon-ok" href="javascript:void(0);" class="easyui-linkbutton l-btn" id="ty"><span class="l-btn-left"><span class="l-btn-text icon-ok" style="padding-left: 20px;">同  意</span></span></a>
	<a onclick="submitAudit('2')" iconcls="icon-cancel" href="javascript:void(0);" class="easyui-linkbutton l-btn" id="bty"><span class="l-btn-left"><span class="l-btn-text icon-cancel" style="padding-left: 20px;">不同意</span></span></a>
	</div>
	<div id="ad2" style="display:none">
	<center>
	<a   href="javascript:window.parent.manager1.close();"
			iconcls="icon-cancel" class="easyui-linkbutton l-btn" id="undefined"><span
			class="l-btn-left"><span class="l-btn-text icon-cancel"
				style="padding-left: 20px;">关闭</span> </span> 
		</a>
		</center>
	</div>
	<div id="popupContact" align="center" >
		<a id="popupContactClose">x</a>
		<p id="contactArea">
			<img id="img0" src=""/>
		</p>
	</div>
</body>
</html>
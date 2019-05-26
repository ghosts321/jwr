<%@ page language="java" import="java.net.*" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
  <script type="text/javascript">
  var indexdata=window.parent.postdata;
  
  indexdata = eval("("+indexdata+")");
  indexdata.type = getBusTypeVal(indexdata.type);
 
  var sorg =indexdata.orgId1;
  var sorgData;
  $.ajax({
	    type:"POST",
	    async:false,
	    url: "/jwr/enControl/getOrgNameAction.action?orgid1="+sorg,
	    success:function(returnValue){
	    	
	    	sorgData=eval("("+returnValue+")");
	    }
	});

  	$(function(){
      var ss= $("#motResp").ligerForm({
           	 inputWidth:200, labelWidth: 120, space: 20,
                fields:[  
                { display: "用户ID", name: "userId", newline: true,type:"text",disabled:true}, 
                { display: "主管机关", name: "motname", newline: false,  type:"text",disabled:true},
                { display: "所在市", name: "city", newline: true,  type:"text",disabled:true}, 
                { display: "名称", name: "enname", newline: true, type:"text", disabled:true},
                { display: "证件号", name: "pid", newline: false,  disabled:true}, 
                { display: "法人代表", name: "legalp", newline: true,  disabled:true}, 
                { display: "联系人姓名", name: "contact", newline: false,  disabled:true}, 
                { display: "手机", name: "mobile", newline: true, disabled:true},
                { display: "联系人邮箱", name: "email", newline: false, disabled:true}, 
                { display: "等级", name: "grade", newline: true, disabled:true},
                { display: "业务类型", name: "busType", newline: false, disabled:true},
                { display: "业务类别", name: "type2", newline: true, disabled:true},
                { display: "通讯地址", name: "address", newline: false, disabled:true},
                { display: "联系电话", name: "tel", newline: true, disabled:true},
                { display: "传真", name: "tax", newline: false, disabled:true},
                { display: "换证原因", name: "reNew", newline: true, disabled:true},
                { display: "指定的考评机构", name: "orgId1", newline: false ,disabled:true},
                { display: "用户类型", name: "usertype", newline: true, disabled:true},
                { display: "安全生产组织框架", name: "safe", newline: false, disabled:true},
                { display: "企业法人资格证件", name: "qual", newline: true, disabled:true},
                { display: "经营许可证", name: "license", newline: false, disabled:true},
                { display: "标准化达标自评报告", name: "zpreport", newline: true, disabled:true},
                
                { display: "", name: "id",type:"hidden"}
                ]
           });
		ss.setData(indexdata);
		$("[name=province]").val(getcomefromVal(indexdata.province));
		$("[name=city]").val(getcomefromValue(indexdata.city));
		$("[name=busType]").val(getBusTypeVal(indexdata.busType));
		$("[name=type2]").val(getCelltype(indexdata.type2));
		initAttachment('safe,qual,license,zpreport');
		/* $("input[name='safe']").parent().parent().parent() .append(" <li><a href='javascript:chakan()'>查看</a></li> ") ;
		$("input[name='qual']").parent().parent().parent() .append("<li><a href='javascript:chakan1()'>查看</a></li>") ;
		$("input[name='license']").parent().parent().parent() .append("<li><a href='javascript:chakan2()'>查看</a></li>") ;
		$("input[name='zpreport']").parent().parent().parent() .append("<li><a href='javascript:chakan3()'>查看</a></li>") ; */
		$("input[name='usertype']").val("企业") ;
		$("[name=reNew]").val(getChangeReason(indexdata.reNew));
		if(indexdata.grade=="2"){
			$("input[name='grade']").val("二级") ;
		}else if(indexdata.grade=="3"){
			$("input[name='grade']").val("三级") ;
		}
		$("input[name='orgId1']").val(sorgData[0].name) ;
  	});
  	function chakan(){
  		var freport=$("input[name='safe']").val();
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
  	function chakan1(){
  		var freport=$("input[name='qual']").val();
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
  	function chakan2(){
  		var freport=$("input[name='license']").val();
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
  	function chakan3(){
  		var freport=$("input[name='zpreport']").val();
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
  </script>
	</head>
<body>
	 
		<div id="motResp" style="margin: 3; padding: 0;width: 95%"></div>
	<br/>
	 
<script type="text/javascript">
	function submitAudit(type){
		var data = $("#changereason").val();
		var pid = indexdata.pid;
		var busType = indexdata.type2;
		var uppername=indexdata.uppername;
		var userId = indexdata.userId;
		var adminmot = indexdata.adminmot;
		var orgId = $.ligerui.get("orgId1").getValue();
		if(orgId==''||orgId==null||orgId=='undefined'||orgId.length>12){
			alert("请选择考评机构！");
			return false;
		}
		var applyId = indexdata.id;
		var usertype = "en";
		$.ligerDialog.confirm('是否确认处理此申请记录？', function (yes) {
			if(yes==true){
				$.ajax({
				    type:"POST",
				    async:false,
				    data:{advice:data,pid:pid,busType:busType,adminmot:adminmot,orgId:orgId,type:type,applyId:applyId,usertype:usertype,userid:userId,uppername:uppername},
				    url:"/jwr/enControl/submitAuditAction.action",
				    success:function(returnValue){
				    	if(eval(returnValue)=='0'){
				    		alert("提示信息：企业等级证书申请处理成功!");
				    		window.parent.grid.reload();
				    		window.parent.ligerwindow.close();
				    	}else{
				    		alert("提示信息：企业等级证书申请处理失败，请检查是否存在证书后与管理员联系!");
				    	}
				    }
				});
			}else{
				return;
			}
		});
	}
	function del(){
		var applyId = indexdata.id;
		$.ligerDialog.confirm('是否确认删除此申请记录？', function (yes) {
			if(yes==true){
				$.ajax({
				    type:"POST",
				    async:false,
				    data:{applyId:applyId},
				    url:"/jwr/enControl/delApplyInfoAction.action",
				    success:function(returnValue){
				    	if(eval(returnValue)=='0'){
				    		alert("提示信息：删除企业等级证书申请记录成功!");
				    	}else{
				    		alert("提示信息：删除企业等级证书申请记录失败，请与管理员联系!");
				    	}
				    }
				});
			}else{
				return;
			}
		});
	}
</script>
	<div id="popupContact" align="center" >
		<a id="popupContactClose">x</a>
		<p id="contactArea">
			<img id="img0" src=""/>
		</p>
	</div>
</body>
</html>
<%@ page language="java" import="java.net.*" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
  <script type="text/javascript">
  var indexdata=window.parent.postdata;
  indexdata = eval("("+indexdata+")");
  indexdata.type = getBusTypeVal(indexdata.type);
  if(indexdata.respResult=='1'){
	  indexdata.respResult='同意';
  }else if(indexdata.respResult=='0'){
	  indexdata.respResult='不同意';
  }
  if(indexdata.orgresult=='1'){
	  indexdata.orgresult='同意';
  }else if(indexdata.orgresult=='0'){
	  indexdata.orgresult='不同意';
  }
  if(indexdata.auditResult=='1'){
	  indexdata.auditResult='同意';
  }else if(indexdata.auditResult=='0'){
	  indexdata.auditResult='不同意';
  }
  if(indexdata.resp=='1'){
	  indexdata.resp='同意';
  }else if(indexdata.resp=='0'){
	  indexdata.resp='不同意';
  }
  
  
  if(indexdata.respReview=='1'){
	  indexdata.respReview='同意';
  }else if(indexdata.respReview=='0'){
	  indexdata.respReview='不同意';
  }
  if(indexdata.grade=='2'){
	  indexdata.grade='二级';
  }else if(indexdata.grade=='3'){
	  indexdata.grade='三级';
  }
  var sorg =indexdata.orgId1;
  if(sorg==null||sorg==''||sorg=='undefined'){
	  sorg =indexdata.orgid1;
  }
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
           	appendID: true,
                fields:[  
                { display: "用户ID", name: "userid", newline: true,type:"text",disabled:true}, 
                { display: "主管机关", name: "adminMotName", newline: false,  type:"text",disabled:true},
                { display: "所在市", name: "city", newline: true,  type:"text",disabled:true}, 
                { display: "名称", name: "enname", newline: false, type:"text", disabled:true},
                { display: "证件号", name: "pid", newline: true,  disabled:true}, 
                { display: "法人代表", name: "legalp", newline: false,  disabled:true}, 
                { display: "联系人姓名", name: "contact", newline: true,  disabled:true}, 
                { display: "手机", name: "mobile", newline: false, disabled:true},
                { display: "联系人邮箱", name: "email", newline: true, disabled:true}, 
                { display: "等级", name: "grade", newline: false, disabled:true},
                { display: "业务类型", name: "uppername", newline: true, disabled:true},
                { display: "业务类别", name: "filetext", newline: false, disabled:true},
                { display: "通讯地址", name: "address", newline: true, disabled:true},
                { display: "联系电话", name: "tel", newline: false, disabled:true},
                { display: "传真", name: "tax", newline: true, disabled:true},
                { display: "换证原因", name: "renew", newline: false, disabled:true},
                { display: "指定的考评机构", name: "orgid1", newline: true ,disabled:true},
                { display: "用户类型", name: "", newline: true, disabled:true},
                { display: "自评分数", name: "zpscore", newline: false, disabled:true},
                { display: "考评分数", name: "kpscore", newline: true, disabled:true},
                { display: "受理意见", name: "respAdvice", newline: false, disabled:true},
                { display: "受理结果", name: "resp", newline: true , disabled:true},
                { display: "受理日期", name: "respdate", newline: false, disabled:true},
                { display: "考评意见", name: "kpadvice", newline: true, disabled:true},
                { display: "考评结果", name: "kpresult", newline: false, disabled:true},
                { display: "考评日期", name: "kpdate", newline: true, disabled:true},
                { display: "安全生产组织框架", name: "safe", newline: false, disabled:true},
                { display: "企业法人资格证件", name: "qual", newline: true, disabled:true},
                { display: "经营许可证", name: "license", newline: false, disabled:true},
                { display: "标准化达标自评报告", name: "zpreport", newline: true, disabled:true},
                { display: "", name: "id",type:"hidden"}
                ]
           });
		ss.setData(indexdata);
		$("[name=province]").val(getcomefromVal(indexdata.province));
		$("input[name='usertype']").val("企业") ;
		initAttachment('safe,qual,license,zpreport');
		/* $("input[name='safe']").parent().parent().parent() .append(" <li><a href='javascript:chakan()'>查看</a></li> ") ;
		$("input[name='qual']").parent().parent().parent() .append("<li><a href='javascript:chakan1()'>查看</a></li>") ;
		$("input[name='license']").parent().parent().parent() .append("<li><a href='javascript:chakan2()'>查看</a></li>") ;
		$("input[name='zpreport']").parent().parent().parent() .append("<li><a href='javascript:chakan3()'>查看</a></li>") ; */
		$("[name=renew]").val(getChangeReason(indexdata.renew));
		$("input[name='orgid1']").val(sorgData[0].name) ;
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
  	
    	
  	}	function chakan3(){
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
	<center style="border: 1px solid #369">
		<h1 style="padding:20px; background-color:#369; color: white; font-size: 22px; margin-top:0px">企业达标等级证书申请详情</h1>
		
	</center>
		<div id="motResp" style="margin: 3; padding: 0;width: 95%"></div>
	<br/>
</body>
</html>
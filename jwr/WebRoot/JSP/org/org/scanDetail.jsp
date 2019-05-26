<%@ page language="java" import="java.util.*,com.wr4.domain.OrgInfo" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>
<%
	String userid = request.getParameter("userid");
	String bustype = request.getParameter("type");
	String id=request.getParameter("id");
	request.setAttribute("id", id);
	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP 'pntail.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


    <script type="text/javascript">
	$(function() {
			var indexdata = "";
			var totalSize = "";
			var selValue=$("#id").val();
			 $.ajax({
					    type:"POST",
					    async:false,
					    url:"/jwr/orgListControl/scanDetailAction.action",
					    data:{'id':selValue},
					    success:function(returnValue){
					    	indexdata = eval("("+returnValue+")")[0];
					    	indexdata.orgtype="考评机构";
					    	if(indexdata.grade=='2'){
					    		indexdata.grade='二级';
					    	}else if(indexdata.grade=='3'){
					    		indexdata.grade='三级';
					    	}
							if(indexdata.renew=='1'){
					    		indexdata.renew='考评员：资格证书到期';
					    	}else if(indexdata.renew=='2'){
					    		indexdata.renew='考评员：户籍所在地或常住地发生省际间变更';
					    	}else if(indexdata.renew=='3'){
					    		indexdata.renew='企业：达标等级证书到期';
					    	}else if(indexdata.renew=='4'){
					    		indexdata.renew='考评机构：资质证书到期';
					    	}else if(indexdata.renew=='0'){
					    		indexdata.renew='无';
					    	}
					    	
					    	indexdata.busType=getBusTypeVal(indexdata.busType);
					    }
					});
	
	
	  var ss= $("#motResp").ligerForm({
           	 inputWidth:200, labelWidth: 150, space: 10,
           	appendID: true,
                fields:[  
                { display: "用户ID", name: "userId", newline: true,type:"text",disabled:true}, 
                { display: "主管机关", name: "motname", newline: false,  type:"text",disabled:true},
                { display: "所在市", name: "city", newline: true,  type:"text",disabled:true}, 
                { display: "名称", name: "orgname", newline: false, type:"text", disabled:true},
                { display: "证件号", name: "pid", newline: true,  disabled:true}, 
                { display: "法人代表", name: "legalp", newline: false,  disabled:true}, 
                { display: "联系人姓名", name: "contact", newline: true,  disabled:true}, 
                { display: "手机", name: "mobile", newline: false, disabled:true},
                { display: "联系人邮箱", name: "email", newline: true, disabled:true}, 
                { display: "等级", name: "grade", newline: false, disabled:true},
                { display: "业务类型", name: "busType", newline: true, disabled:true},
                { display: "专职考评员人数", name: "pnumber", newline: false, disabled:true},
                { display: "高级技术职称考评员人数", name: "pnumber2", newline: true, disabled:true},
                { display: "开始从事相应业务年份", name: "startdate", newline: false, disabled:true},
                { display: "联系电话", name: "tel", newline: true, disabled:true},
                { display: "传真号码", name: "fax", newline: false, disabled:true},
                { display: "换证原因", name: "renew", newline: true, disabled:true},
                { display: "处理意见", name: "advice", newline: false,  disabled:true},
                { display: " 日期", name: "createdate", newline: true, disabled:true},
                { display: "单位基本情况相关材料", name: "met", newline: false, disabled:true},
                { display: "用户类型", name: "orgtype", newline: true, disabled:true},
                { display: "考评员聘用证明/职称证明", name: "pns", newline: false,  disabled:true}
                ]
           });
		ss.setData(indexdata);
		initAttachment('met,pns');
		/* $("input[name='met']").parent().parent().parent() .append(" <li><a href='javascript:chakan()'>查看</a></li> ") ;
		$("input[name='pns']").parent().parent().parent() .append("<li><a href='javascript:chakan1()'>查看</a></li>") ; */
		$("[name=province]").val(getcomefromVal(indexdata.province));
		$("[name=city]").val(getcomefromValue(indexdata.city));
		$("[name=busType]").val(getBusTypeVal(indexdata.busType));
  	});
	function chakan(){
  		var freport=$("input[name='met']").val();
  		
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
  		var freport=$("input[name='pns']").val();
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
<body >
	<input id="id" value="${id }" type="hidden"/>
	<center style="border: 1px solid #369">
		<h1 style="padding:20px; background-color:#369; color: white; font-size: 22px; margin-top:0px">考评机构等级证书申请详情</h1>
		
	</center>
		<div id="motResp" style="margin: 3; padding: 0;width: 95%"></div>
	<br/>
</body>
</html>

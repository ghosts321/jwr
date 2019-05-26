<%@ page language="java" import="java.util.*,com.wr4.domain.OrgInfo" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>
<%
	String id=request.getParameter("id");
	request.setAttribute("id", id);
	String hid=request.getParameter("hid");
	request.setAttribute("hid", hid);
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
var indexdata = "";
var totalSize = "";
var indexdata2="";
	$(function() {
			var id=$("#id").val();
			var hid=$("#hid").val();
			if(hid=='0'){
				$("#age").show();
			}
			 $.ajax({
					    type:"POST",
					    async:false,
					    url:"/jwr/respOrg/scanOrgDetailAction.action",
					    data:{'id':id},
					    success:function(returnValue){
					    	indexdata=eval("("+returnValue+")").Rows[0];
					    	var del=indexdata.del==null?"":indexdata.del;
					    	if(del=='1'){
					    		indexdata.del="已删除";
					    	}else{
					    		indexdata.del="未删除";
					    	}
					    	indexdata.userType="考评机构";
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
					    	}else{
					    		indexdata.renew='无';
					    	}
					    }
					});
			 
			 var ss= $("#motResp").ligerForm({
	           	 inputWidth:200, labelWidth: 180, space: 10,
	           	appendID: true,
	                fields:[  
	                { display: "用户ID", name: "userid", newline: true,type:"text",disabled:true}, 
	                { display: "主管机关", name: "motname", newline: false,  type:"text",disabled:true},
	                { display: "所在市", name: "city", newline: false,  type:"text",disabled:true},
	                { display: "通讯地址", name: "address", newline: true, disabled:true},
	                { display: "名称", name: "orgname", newline: false, type:"text", disabled:true},
	                { display: "证件号", name: "pid", newline: true,  disabled:true}, 
	                { display: "法人代表", name: "legalp", newline: false,  disabled:true}, 
	                { display: "联系人姓名", name: "contact", newline: true,  disabled:true}, 
	                { display: "手机", name: "mobile", newline: false, disabled:true},
	                { display: "联系人邮箱", name: "email", newline: true, disabled:true}, 
	                { display: "等级", name: "grade", newline: false, disabled:true},
	                { display: "业务类型", name: "filetext", newline: true, disabled:true},
	                { display: "专职考评员人数", name: "pnumber", newline: false, disabled:true},
	                { display: "高级技术职称考评员人数", name: "pnumber2", newline: true, disabled:true},
	                { display: "开始从事相应业务年份", name: "startdate", newline: false, disabled:true},
	                
	                { display: "受理意见", name: "sladvice", newline: true, disabled:true},
	                { display: "邮编", name: "pcode", newline: false, disabled:true},
	                
	                { display: "联系电话", name: "tel", newline: true, disabled:true},
	                { display: "传真号码", name: "fax", newline: false, disabled:true},
	                
	              
	                { display: " 换证原因", name: "renew", newline: true, disabled:true},
	                { display: "日期", name: "createdate", newline: false, disabled:true},
	                { display: "删除标志", name: "del", newline: true, disabled:true},
	                
	                { display: "用户类型", name: "userType", newline: false, disabled:true},
	                
	                { display: "单位基本情况相关材料", name: "met", newline: true, disabled:true},
	                { display: "专职考评员聘用证明与职称证明", name: "pns", newline: false, disabled:true}
	                ]
	           });
			ss.setData(indexdata);
			$("[name=province]").val(getcomefromVal(indexdata.province));
			$("[name=city]").val(getcomefromValue(indexdata.city));
			initAttachment('met,pns');
			/* $("input[name='met']").parent().parent().parent() .append(" <li><a href='javascript:chakan()'>查看</a></li> ") ;
			$("input[name='pns']").parent().parent().parent() .append("<li><a href='javascript:chakan1()'>查看</a></li>") ; */
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
// 	删除记录
	function delOrgApply(){
		var id=$("#id").val();
		 $.ajax({
			    type:"POST",
			    async:false,
			    url:"/jwr/respOrg/delOrgApplyAction.action",
			    data:{"id":id},
			    success:function(returnValue){
			   		if(returnValue=='ok'){
			   			alert("已删除");
			   		}else if(returnValue=='error'){
			   			alert("删除失败");
			   		}
			    }
			});
		//关闭页面重新加载表格数据
        window.parent.gird2.reload();
		window.parent.ligerwindow.close();
	}
	
	//同意不同意
	function agree(type){
		var advice=$("#advice").text();
		if(advice.length>800){
			alert("填写意见字数不能超过800个，已输入"+advice.length+"个字!");
  			return false;
		}
		var pid=indexdata.pid;
		var busType=indexdata.bustype;
		var adminmot=indexdata.motname;
		var id=$("#id").val();
// 		流程表auditer字段pid
		var orgId="";
		var usertype="org";
	
		 $.ajax({
			    type:"POST",
			    async:false,
			    data:{"applyId":id,"advice":advice,"pid":pid,"busType":busType,"adminmot":adminmot,"orgId":orgId,"type":type,"usertype":usertype},
			    url:"/jwr/enControl/submitAuditAction.action",
			    success:function(returnValue){
			   		if(returnValue==0){
			   			alert("已处理");
// 						window.gird2.reload();
       			        //默认回到第一页
// 			   			window.parent.ligerwindow.close();
// 			   			window.location.href="/jwr/respOrg/getOrgApplyListAction.action";
			   		}else if(returnValue==1){
			   			alert("操作失败");
			   		}
			    }
			});
		 //关闭页面重新加载表格数据
		 window.parent.gird2.reload();
		 window.parent.ligerwindow.close();
	}
</script>
</head>
<body style="overflow: hidden;">
	<input id="id" value="${id }" type="hidden"/>
	<input id="hid" value="${hid }" type="hidden"/>
	
	<center style="border: 1px solid #369">
		<h1 style="padding:20px; background-color:#369; color: white; font-size: 22px; margin-top:0px">考评机构资质证书申请受理</h1>
		
	</center>
	<button style="MARGIN: 10px" id='' onclick="delOrgApply()" class="easyui-linkbutton l-btn"><SPAN
		class=l-btn-left><SPAN style="PADDING-LEFT: 20px"
			class="l-btn-text icon-cancel">删除此申请记录（放入垃圾箱）</SPAN></SPAN>
	</button>
		<div id="motResp" style="margin: 3; padding: 0"></div>
	<br/>
	
	<BR>
	<BR>
	<div id="age" style="display: none;">
	<LABEL>填写意见：</LABEL>
	<TEXTAREA style="WIDTH: 600px" id=advice class="easyui-validatebox validatebox-text"></TEXTAREA>
	<BR>
	<BR>
	<!-- <button id='' class="easyui-linkbutton l-btn" onclick="agree('1')" iconCls="icon-ok" ><SPAN class=l-btn-left><SPAN style="PADDING-LEFT: 20px" class="l-btn-text icon-ok">同 意</SPAN></SPAN></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button id='' class="easyui-linkbutton l-btn" onclick="agree('0')" iconCls="icon-cancel" ><SPAN class=l-btn-left><SPAN style="PADDING-LEFT: 20px" class="l-btn-text icon-cancel">不同意</SPAN></SPAN></button> -->
	<div id="sure" align="center">
		<a onclick="agree('1')" iconcls="icon-ok" href="javascript:void(0);" class="easyui-linkbutton l-btn" id="ty"><span class="l-btn-left"><span class="l-btn-text icon-ok" style="padding-left: 20px;">同  意</span></span></a>
		<a onclick="agree('0')" iconcls="icon-cancel" href="javascript:void(0);" class="easyui-linkbutton l-btn" id="bty"><span class="l-btn-left"><span class="l-btn-text icon-cancel" style="padding-left: 20px;">不同意</span></span></a>
	</div>		
	</div>
<!-- 	<div id="popupContact" align="center" > -->
<!-- 		<a id="popupContactClose">x</a> -->
<!-- 		<p id="contactArea"> -->
<!-- 			<img id="img0" src=""/> -->
<!-- 		</p> -->
<!-- 	</div> -->
</body>
</html>

<%@ page language="java" import="java.util.*,com.wr4.domain.OrgInfo" pageEncoding="UTF-8"%>
<%@ include file="../../main.jsp" %>
<%
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
var indexdata = "";
var totalSize = "";
var bustypes ="";
var grade1="";
	$(function() {
		var id=$("#id").val();
			 $.ajax({
					    type:"POST",
					    async:false,
					    url:"/jwr/certChange/scanCertChangeDetailAction.action",
					    data:{'id':id},
					    success:function(returnValue){
					    	indexdata=eval("("+returnValue+")").Rows[0];
					    	
					    	var del=indexdata.del;
					    	if(del=='1'){
					    		indexdata.del="已删除";
					    	}else{
					    		indexdata.del="未删除";
					    	}
					    	indexdata.userType="考评机构";
					    	indexdata.adminmot=getMotVal(indexdata.adminmot);
					    	bustypes=indexdata.bustype;
					    	grade1=indexdata.grade;
					    	if(indexdata.grade=='2'){
					    		indexdata.grade='二级';
					    	}else if(indexdata.grade=='3'){
					    		indexdata.grade='三级';
					    	}
							indexdata.province=getcomefromVal(indexdata.province);				    	
							indexdata.city=getcomefromValue(indexdata.city);				    	
					    }
					});
			 
			 var ss= $("#motResp").ligerForm({
	           	 inputWidth:220, labelWidth: 190, space: 10,
	           	appendID: true,
	                fields:[  
	                { display: "用户ID", name: "userid", newline: true,type:"text",disabled:true}, 
	                { display: "主管机关", name: "adminmot", newline: false,  type:"text",disabled:true},
	                { display: "所在市", name: "city", newline: true,  type:"text",disabled:true}, 
	                { display: "名称", name: "orgname", newline: true, type:"text", disabled:true},
	                { display: "证件号", name: "pid", newline: false,  disabled:true}, 
	                { display: "法人代表", name: "legalp", newline: true,  disabled:true}, 
	                { display: "联系人姓名", name: "contact", newline: false,  disabled:true}, 
	                { display: "手机", name: "mobile", newline: true, disabled:true},
	                { display: "联系人邮箱", name: "email", newline: false, disabled:true}, 
	                { display: "等级", name: "grade", newline: true, disabled:true},
	                { display: "业务类型", name: "bustype", newline: false, disabled:true},
	                { display: "专职考评员人数", name: "pnumber", newline: true, disabled:true},
	                { display: "高级技术职称考评员人数", name: "pnumber2", newline: false, disabled:true},
	                { display: "开始从事相应业务年份", name: "startdate", newline: true, disabled:true},
	                { display: "通讯地址", name: "address", newline: false, disabled:true},
	                { display: "邮编", name: "pcode", newline: true, disabled:true},
	                { display: "联系电话", name: "tel", newline: false, disabled:true},
	                { display: "单位基本情况相关材料", name: "met", newline: true, disabled:true},
	                { display: "传真号码", name: "fax", newline: false, disabled:true},
	                { display: "专职考评员聘用证明与职称证明", name: "pns", newline: true, disabled:true},
	                { display: " 换证原因", name: "renew", newline: false, disabled:true},
	                { display: "日期", name: "createdate", newline: true, disabled:true},
	                { display: "用户类型", name: "userType", newline: false, disabled:true},
	                { display: "删除标志", name: "del", newline: true, disabled:true}
	                ]
	           });
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
			ss.setData(indexdata);
			initAttachment('met,pns');
			/* $("input[name='met']").parent().parent().parent() .append(" <li><a href='javascript:chakan()'>查看</a></li> ") ;
			$("input[name='pns']").parent().parent().parent() .append("<li><a href='javascript:chakan1()'>查看</a></li>") ; */
		
	})
	
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
		var type="org";
		var id=indexdata.id;
		 $.ajax({
			    type:"POST",
			    async:false,
			    url:"/jwr/certChange/delCertChangeByIdAction.action",
			    data:{"id":id},
			    success:function(returnValue){
			   		if(returnValue=='ok'){
			   			alert("已删除");
			   			window.parent.gird2.reload();
			    		window.parent.ligerwindow.close();
			   		}else if(returnValue=='error'){
			   			alert("删除失败");
			   		}
			    }
			});
		 
	}
	
	//同意不同意
function agree(type){
		var advice=$("#advice").val();
		if(advice.length >800){
  				alert("输入填写意见字数不能超过800个，已输入"+advice.length+"个字!");
  				return;
  			}
		var pid=indexdata.pid;
		var id=indexdata.id;
		var busType=indexdata.bustype;
		var adminmot=indexdata.adminmot;
		var cid=indexdata.cid;
		//将相对应的 用户 userid  等级 grade  业务类型  bustype  置为 del='1' 已删除
	 	//var grade=indexdata.grade;
		var userid=indexdata.userid;
		//
// 		流程表auditer字段
		var orgId="";
		 $.ajax({
			    type:"POST",
			    async:false,
				//grade:grade,userid:userid,  此处增加传参
			    data:{'cid':cid,advice:advice,pid:pid,busType:bustypes,adminmot:adminmot,orgId:orgId,type:type,'id':id,grade:grade1,userid:userid},
			    url:"/jwr/certChange/changeBookAction.action",
			    success:function(returnValue){
			   		if(returnValue=='ok'){
			   			alert("已提交,换证申请审批!");
			   			window.parent.gird2.reload();
			    		window.parent.ligerwindow.close();
			   		}else if(returnValue=='error'){
			   			alert("操作失败");
			   		}
			    }
			});
		 //关闭页面重新加载表格数据
		 $.ajax({
			    type:"POST",
			    async:false,
			    url:"/jwr/certChange/getCertChangeListAction.action",
			    success:function(returnValue){
			   		indexdata=eval("("+returnValue+")");
			   		totalSize=indexdata.Total;
			        //将 查询参数 设置到 grid中 以便下次分页时候 可以获取到查询参数
			        window.parent.gird2.setOptions({ parms: { page:'1'}});
			        window.parent.gird2.reload();
			        //默认回到第一页
					//window.parent.gird2.changePage('first');
			        //向控制台打印信息
					window.parent.ligerwindow.close();
			    }
			});
	}
</script>
</head>
<body>
	<input id="id" value="${id }" type="hidden"/>
	<input id="cid" value="${cid }" type="hidden"/>
	
	<center style="border: 1px solid #369">
		<h1 style="padding:20px; background-color:#369; color: white; font-size: 22px; margin-top:0px">考评机构换证申请受理</h1>
		
	</center>
		<button style="MARGIN: 10px" id='' onclick="delOrgApply()" class="easyui-linkbutton l-btn"><SPAN
		class=l-btn-left><SPAN style="PADDING-LEFT: 20px"
			class="l-btn-text icon-cancel">删除此申请记录（放入垃圾箱）</SPAN></SPAN>
	</button>
		<div id="motResp" style="margin: 3; padding: 0;width: 95%"></div>
	<br/>
	<BR>
	<BR>
	<LABEL>填写意见：</LABEL>
	<TEXTAREA style="WIDTH: 600px" id=advice
		class="easyui-validatebox validatebox-text">
	</TEXTAREA>
	<BR>
	<BR>
	<div style="margin: 5 3 5 20; padding: 0 0 5 0;width: 90%"id="ad1" style="display:block" align="center">
		<a onclick="agree('1')" iconcls="icon-ok" href="javascript:void(0);" class="easyui-linkbutton l-btn" id="ty"><span class="l-btn-left"><span class="l-btn-text icon-ok" style="padding-left: 20px;">同  意</span></span></a>
	<a onclick="agree('0')" iconcls="icon-cancel" href="javascript:void(0);" class="easyui-linkbutton l-btn" id="bty"><span class="l-btn-left"><span class="l-btn-text icon-cancel" style="padding-left: 20px;">不同意</span></span></a>
	</div>
	<!-- <button id='' class="easyui-linkbutton l-btn" onclick="agree('1')" iconCls="icon-ok" style="">
		<SPAN class=l-btn-left><SPAN style="PADDING-LEFT: 20px" class="l-btn-text icon-ok">同 意</SPAN></SPAN>
	</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button id='' class="easyui-linkbutton l-btn"
		onclick="agree('0')" iconCls="icon-cancel" ><SPAN
		class=l-btn-left><SPAN style="PADDING-LEFT: 20px"
			class="l-btn-text icon-cancel">不同意</SPAN></SPAN></button> -->
</body>
</html>

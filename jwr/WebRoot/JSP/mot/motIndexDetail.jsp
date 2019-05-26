<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="../main.jsp" %>
<%
			String id=request.getParameter("id");
			request.setAttribute("id", id);
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>
		  详细信息
		</title>
<script type="text/javascript" src="/js/main.js"></script>
<script src="/js/app-esp.js" type="text/javascript"></script>
	 <script type="text/javascript">
		var indexdata = "";
		var totalSize = "";
	$(function() {
			var id=$("#id").val();
			 $.ajax({
					    type:"POST",
					    async:false,
					    url:"/jwr/motControl/motIndexDetailAction.action",
					    data:{'id':id},
					    success:function(returnValue){
					    	var exchangeInfo=eval("("+returnValue+")")[0];
					    	indexdata = exchangeInfo;
					    	//$("#ptype").text(exchangeInfo.ptype);
					    	$("#linkhref").text(exchangeInfo.linkhref);
					    	$("#contenttext").text(exchangeInfo.contenttext);
					    	$("#createdate").text(exchangeInfo.createdate);
					    	//$("#pno").text(exchangeInfo.pno);
					    	$("#filename").text(exchangeInfo.filename);
					    	$("#ptitle").text(exchangeInfo.ptitle);
					    	
					    	var ptype =exchangeInfo.ptype;
					    	if(ptype=='1'){
				  	  		$("#ptype").text("政策法规");
				  	  		}else if(ptype=='2'){
				  	  		$("#ptype").text("图片新闻");
				  	  		}else if(ptype=='3'){
				  	  		$("#ptype").text("工作动态");
				  	  		}else if(ptype=='4'){
				  	  		$("#ptype").text("公告公示");
				  	  		}else if(ptype=='5'){
				  	  		$("#ptype").text("相关下载");
				  	  		}
					    	
					    	
					    }
					   
					});
	})
	
	function chakan(){
  		var freport=indexdata.filename;
  		//alert(freport);
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
		
	
	
	function strChange(){
		alert("查看 首页信息完毕，窗口将关闭");
		 window.parent.ligerwindow.close();
	}
 	 </script>
	</head>
<body>
	<input type="hidden" id="id" value="${id }">
	<table style="margin-left: 30px">
			<caption style="padding: 5px">
				<h1>首页栏目内容维护</h1>
			</caption>
			<tbody>
				<tr>
					<td style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray">
						<label>类型：</label>
					</td>
					<td style="border-bottom:1px dotted gray" id="ptype">
						
					
					</td>
				</tr>
				<tr>
					<td
						style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>标题：</label></td>
					<td style="border-bottom:1px dotted gray" id="ptitle"></td>
				</tr>
				<tr>
					<td
						style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>连接：</label></td>
					<td style="border-bottom:1px dotted gray" id="linkhref">
					</td>
				</tr>
				<tr>
					<td
						style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray">
						<label>正文：</label>
						</td>
					<td style="border-bottom:1px dotted gray" id="contenttext">
				</tr>
				<tr>
					<td
						style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
						title="缺省可不填，填1、2、3等，0表示置顶。">日期：</label></td>
					<td style="border-bottom:1px dotted gray" id="createdate"></td>
				</tr>
				<tr>
					<td
						style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
						title="缺省可不填，填1、2、3等，0表示置顶。">相关附件：</label></td>
					<td style="border-bottom:1px dotted gray" id="filename"></td>
					<td><a href="javascript:void(0)" onclick="chakan()">查看</a></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td align="center" colspan="3" style="padding: 15px">
					<A id=undefined class="easyui-linkbutton l-btn" onclick="strChange();" href="#" jQuery163039564304368123043="1">
	<SPAN class=l-btn-left><SPAN class=l-btn-text>关闭</SPAN></SPAN></A>
				   </td>
				</tr>
			</tfoot>
		</table>
	
</body>
</html>

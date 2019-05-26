<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../main.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>
		  首页内容维护
		</title>
<script type="text/javascript">
var msg='<%=request.getAttribute("returnValue")%>';
if(msg!=null&&msg!='null'){
	if(msg=="yes"){
			alert("修改成功，窗口将关闭");
			 window.parent.iniData();
			 window.parent.ligerwindow.close();
	}else{
		alert(msg);
	}
}
    function sendForm(){
    	if(confirm("确认提交并修改")){
    		$("#fm1").submit();
    	}
    }
</script>
	</head>
<body>
	<form action="<%=basePath%>motControl/updateIndexDataAction.action" id="fm1" method="POST">
		<table style="margin-left: 30px">
			<caption style="padding: 5px">
				<h1>首页栏目内容维护</h1>
			</caption>
			<tbody>
			<input class="easyui-validatebox validatebox-text" id="indexInfoid" name="indexInfo.id"  value="${indexInfo.id}" style="width:500px" type="text">
				<tr>
					<td style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray">
						<label>类型：</label>
					</td>
					<td style="border-bottom:1px dotted gray">
					<select id="indexInfo.ptype" name="indexInfo.ptype"  value="${indexInfo.ptype}" >
						    <option id="op1" value="1">政策法规</option>
							<option id="op2" value="2">图片新闻</option>
							<option id="op3" value="3">工作动态</option>
							<option id="op4" value="4">公告公示</option>
							<option id="op5" value="5">相关下载</option>
					</select>
							<script type="text/javascript">
								var ptype='${indexInfo.ptype}';
								if(ptype!=null&&ptype!=''){
									document.getElementById("op"+ptype).setAttribute("selected","selected" );
								}
							</script>
					</td>
					<td><font color="red">*</font></td>
				</tr>
				<tr>
					<td
						style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>标题：</label></td>
					<td style="border-bottom:1px dotted gray">
					<input class="easyui-validatebox validatebox-text" id="indexInfo.ptitle"
						name="indexInfo.ptitle"  value="${indexInfo.ptitle}" style="width:500px" type="text"></td>
					<td><font color="red">*</font></td>
				</tr>
				<tr>
					<td
						style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>连接：</label></td>
					<td style="border-bottom:1px dotted gray">
					<input class="easyui-validatebox validatebox-text" value="${indexInfo.linkhref}" id="indexInfo.linkhref" name="indexInfo.linkhref" style="width:500px" type="text">
					
					</td>
					<td><font color="lightgray">*</font></td>
				</tr>
				<tr>
					<td
						style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray">
						<label>正文：</label>
						</td>
					<td style="border-bottom:1px dotted gray">
					<textarea class="easyui-validatebox validatebox-text" value="${indexInfo.contenttext}" id="indexInfo.contenttext" name="indexInfo.contenttext" style="width:500px;height:100px"></textarea></td>
					<td><font color="lightgray">*</font></td>
				</tr>
				<tr>
					<td
						style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label>附件：</label></td>
					<td style="border-bottom:1px dotted gray"><input
						class="easyui-validatebox validatebox-text" id="file" name="file"
						type="hidden" value=""><span></span><a
						class="easyui-linkbutton l-btn" href="#"
						onclick="fileupload_dlg_open('附件', 'file')" id="undefined"><span
							class="l-btn-left"><span class="l-btn-text">上传文件..</span></span></a></td>
					<td><font color="lightgray">*</font></td>
				</tr>
				<tr>
					<td
						style="font-family:微软雅黑;font-size:14px;vertical-align:center;height:35px;border-bottom:1px dotted gray"><label
						title="缺省可不填，填1、2、3等，0表示置顶。">排序号：</label></td>
					<td style="border-bottom:1px dotted gray"><input
						class="easyui-validatebox validatebox-text" id="indexInfo.pno" name="indexInfo.pno" value="${indexInfo.pno}"
						title="缺省可不填，填1、2、3等，0表示置顶。" type="text"></td>
					<td><font color="lightgray">*</font></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td align="center" colspan="3" style="padding: 15px"><p>
							注：带红色<font color="red">*</font>的为必填项。
						</p>
					<a class="easyui-linkbutton l-btn" href="javascript:void(0)" iconcls="icon-undo" 
						onclick="sendForm()" id="sendForm">
						<span class="l-btn-left">
						<span class="l-btn-text icon-undo" style="padding-left: 20px; ">提交</span>
						</span>
						</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a class="easyui-linkbutton l-btn" href="javascript:void(0)" iconcls="icon-undo"
						onclick="$('#fm1').get(0).reset()" id="resert">
						<span class="l-btn-left">
						<span class="l-btn-text icon-undo" style="padding-left: 20px; ">重置</span>
						</span>
						</a>
				   </td>
				</tr>
			</tfoot>
		</table>
	</form>
</body>
</html>

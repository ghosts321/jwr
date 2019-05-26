<%@ page language="java" pageEncoding="UTF-8"%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>
		  添加菜单
		</title>
	</head>
	<body>
		<form method="post" action="/jwr/menu/menuInsertAction.action">
			<table width="80%" align="center" class="grid">
				<tr height="25px" bgcolor="#ffffff">
					<td width="15%" align="left" class="label">
						菜单编号
						<font color="red">*</font>
					</td>
					<td width="35%" class="content">
						<input type="text" id="menuInfo.id" name="menuInfo.id" class="text"
							maxlength="50" />
					</td>
				</tr>
				<tr height="25px" bgcolor="#ffffff">
					<td width="15%" align="left" class="label">
						菜单名称
						<font color="red">*</font>
					</td>
					<td width="35%" class="content">
						<input type="text" id="menuInfo.text" name="menuInfo.text" class="text"
							maxlength="50" />
					</td>
					</tr>
						<tr height="25px" bgcolor="#ffffff">
					<td width="15%" align="left" class="label">
						URL
						<font color="red">*</font>
					</td>
					<td width="35%" class="content">
						<input type="text" id="menuInfo.url" name="menuInfo.url" class="text"
							maxlength="50" />
					</td>
					</tr>
					<tr>
					<td width="15%" align="left" class="label">
						是否叶子节点 1:是 0不是
						<font color="red">*</font>
					</td>
					<td width="35%" class="content">
						<input type="text" id="menuInfo.isleaf" name="menuInfo.isleaf" class="text" />
					</td>
				</tr>
				<tr height="25px" bgcolor="#ffffff">
					<td width="15%" align="left" class="label">
						上级编号
						<font color="red">*</font>
					</td>
					<td width="35%" class="content">
						<input type="text" name="menuInfo.parentid" class="menuInfo.parentid" maxlength="50" />
					</td>
				</tr>
				<tr height="25px" bgcolor="#ffffff">
					<td width="15%" align="left" class="label">
						菜单等级
						<font color="red">*</font>
					</td>
					<td width="35%" class="content">
						<input type="text" name="menuInfo.type" class="menuInfo.type" maxlength="50" />
					</td>
				</tr>
			</table>
			
			<table width="80%" align="center" class="grid">
				<tr align="center">
					<td>
						<input type="submit" value="提交"  style="width: 50px" class="button" />
						 
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

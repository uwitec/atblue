<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="<%=request.getContextPath() %>/css/css.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/images/css.css" rel="stylesheet" type="text/css">
<title>新增角色基本信息</title>
</head>
<body>
<form name="role_save" method="post" action="role_save.d">
<input type="hidden" name="action" value="add"/>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tablett" style="BORDER-COLLAPSE: collapse">
			<tr>
				<td class="head_left">角色名称：</td>
				<td class="head_right"><input name="role.roleName" type="text" id="roleName" /></td>
			</tr>
			<tr>
				<td class="head_left">角色描述：</td>
				<td class="head_right"><textarea name="role.roleDesc" cols="50" rows="5" id="roleDesc"></textarea></td>
			</tr>
			<tr>
				<td class="head_left">排列序号：</td>
				<td class="head_right"><input name="role.roleOrder" type="text" id="roleOrder" value=""/>
				</td>
			</tr>

		</table>
		
		</td>
	</tr>
	<tr>
		<td>
		<table width="100%" border="0" class="bgdh">
			<tr>
				<td width="16%">&nbsp;</td>
				<td width="7%"><input class="button" name="saveRole" type="submit"
					id="saveRole" value="提交信息" /></td>
				<td width="5%">&nbsp;</td>
				<td width="20%"><input class="button" name="returnHome" type="button"
					id="returnHome" value="返回列表" onclick="returnList()"/></td>
				<td width="52%">&nbsp;</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</form>
<script>
function returnList(){
	self.location.href="role_list.d";
}
</script>
</body>
</html>

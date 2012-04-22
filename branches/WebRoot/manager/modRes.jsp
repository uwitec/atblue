<%@ page language="java" contentType="text/html; charset=utf-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="<%=request.getContextPath() %>/css/css.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/images/css.css" rel="stylesheet" type="text/css">
<title>修改菜单基本信息</title>
</head>
<body>
<form name="resource_save" method="post" action="resource_save.d">
<input name="resId" type="hidden" id="resId" value="${resId}"/>
<input name="parentId" type="hidden" id="parentId" value="${resource.parentId}"/>
<input name="resource.parentId" type="hidden" value="${resource.parentId}"/>
<input name="resource.resId" type="hidden" value="${resource.resId}"/>
<input name="action" type="hidden" value="save"/>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td>

		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tablett" style="BORDER-COLLAPSE: collapse">
		  <tr>
			  <td class="head_left">菜单名称：</td>
			  <td class="head_right"><input name="resource.resName" type="text" id="resName" value="${resource.resName}"/></td>
		  </tr>
			
		  <tr>
			  <td class="head_left">菜单描述：</td>
			  <td class="head_right"><textarea name="resource.resDesc" cols="50" rows="5" id="resDesc" >${resource.resDesc}</textarea></td>
		  </tr>
          <tr>
                <td class="head_left">菜单排序：</td>
                <td class="head_right"><input name="resource.resOrder" type="text" id="resOrder" value="${resource.resOrder}"/>
                </td>
          </tr>
		</table>

		</td>
	</tr>
	<tr>
		<td >
		<table width="100%" border="0" cellpadding="0"  cellspacing="0" cellpadding="0" class="bgdh">
			<tr>
				<td width="16%">&nbsp;</td>
				<td width="7%"><input class="button" name="save" type="submit" id="save"
					value="提交" /></td>
				<td width="5%">&nbsp;</td>
				<td width="20%"><input class="button" name="returnHome" type="button"
					id="returnHome" value="返回列表" onclick="returnList()" /></td>
				<td width="52%">&nbsp;</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</form>
<script>
function returnList(){
    self.location.href = "resource_list.d";
}
</script>
</body>
</html>

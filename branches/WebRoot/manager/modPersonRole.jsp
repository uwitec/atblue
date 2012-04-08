<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<link href="<%=request.getContextPath() %>/manager/css.css" type="text/css" rel="stylesheet"/>
<link href="<%=request.getContextPath() %>/css/css.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="scripts/dtree.js"></script>
<title>选择角色模块</title>
</head>
<body>
<form name="person_saveRole" method="post" action="person_saveRole.d">
<input type="hidden" name="action" value="save">
<input type="hidden" name="userId" value="${userId}">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bgdh">
			<tr>
				<td><input class="button" name="ok" type="submit" id="ok" value="确定">
				<input class="button" name="return" type="button" id="return" value="返回" onClick="window.location.href='person_list.d'">
				<input id="len" name="len" type="hidden">
				</td>
			</tr>
		</table>
		<table width="100%" id="tab_id" border="0" cellspacing="0" cellpadding="0"  class="tab_id" style="BORDER-COLLAPSE: collapse">
		<tr align="center" >
			<td class="head">&nbsp;</td>
			<td class="head"><strong>角色名称</strong></td>
			<td class="head"><strong>角色描述</strong></td>
			<td class="head"><strong>角色序号</strong></td>
		<tr>
            <s:iterator value="dataList" status="stat">
                <tr>
                    <td class="form_th"  style="text-align: center; width: 50px;">
                        <s:if test="CN > 0">
                            <input name="roleIds" type="checkbox" checked="checked" value="${ROLE_ID}">
                        </s:if>
                        <s:else>
                            <input name="roleIds" type="checkbox" value="${ROLE_ID}">
                        </s:else>
                    </td>
                    <td class="form_th"  style="text-align: center;">&nbsp;${ROLE_NAME}</td>
                    <td class="form_th"  style="text-align: center;">&nbsp;${ROLE_DESC}</td>
                    <td class="form_th"  style="text-align: center;">&nbsp;${ROLE_ORDER}</td>
                </tr>
            </s:iterator>
		</table>
		</td>
	</tr>
</table>
</form>
</body>
</html>

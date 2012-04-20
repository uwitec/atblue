<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="<%=request.getContextPath() %>/images/css.css" type="text/css" rel="stylesheet"/>
    <link href="<%=request.getContextPath() %>/css/css.css" rel="stylesheet" type="text/css">
    <title>新增菜单基本信息</title>
</head>
<body>
<form name="resource_save" method="post" action="resource_save.d">
    <input name="parentId" type="hidden" value="${resource.resId}"/>
    <input name="action" type="hidden" value="add"/>
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table width="100%" border="1" cellspacing="0" class="tablett" style="BORDER-COLLAPSE: collapse">
                    <tr>
                        <td class="head_left">父节点名称：</td>
                        <td class="head_right"><input name="parName" type="text" id="parName" value="${resource.resName}"
                                                 disabled></td>
                    </tr>
                    <tr>
                        <td class="head_left">菜单名称：</td>
                        <td class="head_right"><input name="resource.resName" type="text" id="resName"/>
                            <input name="resource.resType" type="hidden" value="URL"/>
                        </td>
                    </tr>

                    <tr>
                        <td class="head_left">菜单描述：</td>
                        <td class="head_right"><textarea name="resource.resDesc" cols="50" rows="5" id="resDesc">/</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="head_left">菜单排序：</td>
                        <td class="head_right"><input name="resource.resOrder" type="text" id="resOrder"/></textarea>
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
                        <td width="7%"><input class="button" name="save" type="button"
                                              id="save" value="提交" onClick="checkBlank()"/></td>
                        <td width="5%">&nbsp;</td>
                        <td width="20%"><input class="button" name="returnHome" type="button"
                                               id="returnHome" value="返回" onclick="returnList()"/></td>
                        <td width="52%">&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
<script>
    function checkBlank() {
        if (document.all["resource.resName"].value == '') {
            alert("菜单名称不能为空，请重新输入！");
            document.all["resource.resName"].focus();
            return false;
        }
        document.forms[0].submit();
    }
    function returnList() {
        self.location.href = "resource_list.d";
    }
</script>
</body>
</html>

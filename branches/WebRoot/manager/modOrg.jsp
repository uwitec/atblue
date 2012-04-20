<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <link rel="StyleSheet" href="css/css.css" type="text/css" />
    <link href="<%=request.getContextPath()%>/images/css.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet" type="text/css">
    <title>修改组织机构基本信息</title>
</head>
<body>
<form name="orgnization_save" action="orgnization_save.d"  method="post">
    <input  name="orgId" type="hidden" value="${orgId}" />
    <input  name="action" type="hidden" value="save" />
    <input  name="orgnization.orgnaId" type="hidden" value="${orgnization.orgnaId}" />
    <table width="100%" border="0" cellpadding="0" cellspacing="0" >
        <tr>
            <td>

                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tablett" style="BORDER-COLLAPSE: collapse">
                    <tr>
                        <td class="head_left">父节点名称：</td>
                        <td class="head_right"><input name="parName" type="text" id="parName" value="${parentOrgnization.orgnaName}" disabled />
                            <input name="orgnization.parentId" type="hidden" id="parentId" value="${orgnization.parentId}"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="head_left">组织机构名称：</td>
                        <td class="head_right"><input name="orgnization.orgnaName" type="text" id="orgnaName"  value="${orgnization.orgnaName}"/></td>
                    </tr>
                    <tr>
                        <td class="head_left">顺序：</td>
                        <td class="head_right"><input name="orgnization.orgnaOrder" type="text" id="orgnaOrder" value="${orgnization.orgnaOrder}"/></td>
                    </tr>
                    <tr>
                        <td class="head_left">描述：</td>
                        <td class="head_right">
                            <textarea rows="4" cols="40" name="orgnization.orgnaMemo">${orgnization.orgnaMemo}</textarea>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" border="0" class="bgdh">
                    <tr>
                        <td width="11%">&nbsp;</td>
                        <td width="9%"><input class="button" name="saveOrg" type="button"
                                              id="saveOrg" value="提交信息" onClick="checkBlank();" /></td>
                        <td width="1%">&nbsp;</td>
                        <td width="27%"><input class="button" name="returnHome" type="button"
                                               id="returnHome" value="返回列表" onClick="returnList()"/></td>
                        <td width="52%">&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
<script>

    function checkBlank(){
        if(document.all["orgnization.orgnaName"].value == ''){
            alert("组织结构名称不能为空，请重新输入！");
            document.all["orgnization.orgnaName"].focus();
            return false;
        }
        document.forms[0].submit();
    }
    function returnList(){
        self.location.href="orgnization_index.d";
    }
</script>
</body>
</html>

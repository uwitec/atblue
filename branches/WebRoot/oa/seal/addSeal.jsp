<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>电子签章添加</title>
    <link href="<%=request.getContextPath()%>/images/css.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/date/WdatePicker.js" defer="defer"></script>
    <script type="text/javascript">
        String.prototype.trim = function () {
            return this.rtrim().ltrim();
        };
        String.prototype.rtrim = function () {
            return this.replace(/\s*$/, "");
        };
        String.prototype.ltrim = function () {
            return this.replace(/^\s*/, "");
        };
    </script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form action="seal_save.d" method="post" enctype="multipart/form-data">
    <input type="hidden" name="action" value="add"/>
    <table width="98%" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <fieldset>
                    <legend><font style="font-size: 12px">基本信息</font></legend>
                    <table width="100%" cellpadding="0" cellspacing="0" class="record">
                        <tr>
                            <td class="head_left" nowrap="nowrap" width="10%">用户</td>
                            <td class="head_right" colspan="3">
                                <select name="bean.userId">
                                    <s:iterator value="dataList">
                                        <option value="${USER_ID}">${REAL_NAME}</option>
                                    </s:iterator>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="head_left" nowrap="nowrap" width="10%">印章文件</td>
                            <td class="head_right" colspan="3">
                                <input type="file" name="upload" value="浏览" class="text">
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <th style="text-align: center">
                <input type="button" name="saveBtn" class="button" style="width:50px" value="保存" onClick="doSave()">&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" class="button" style="width:50px" value="返回" onClick="doBack();">
            </th>
        </tr>
    </table>
</form>
</body>
<script type="text/javascript">
    function doSave() {
        if (document.all["bean.userId"].value.trim() == '') {
            alert("用户名为必填字段！");
            document.all["bean.userId"].focus();
            return false;
        }
        var sel = document.forms[0].upload.value;
        if (sel == '' || sel.indexOf('.sel') < 0) {
            alert("请选择正确的<印章文件>");
            return;
        }
        document.forms[0].submit();
    }
    function doBack() {
        window.location="seal_list.d";;
    }
</script>
</html>

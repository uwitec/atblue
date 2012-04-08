<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<html>
<head>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <link href="<%=request.getContextPath() %>/css/css.css" type="text/css" rel="stylesheet"/>
    <link href="<%=request.getContextPath() %>/manager/css.css" type="text/css" rel="stylesheet"/>
    <script>
        //选中的行变量
        var selectedId = null;
        var selectedBackground = null;
        var selectedTr = null;

        //设置某个表的某一行被选中
        function setSelected(tr, tab_id, tr_head, selectedId_, rowClass, curClass) {
            if (tr != null) {
                if (selectedTr != null) {
                    selectedTr.style.background = selectedBackground;
                }
                selectedBackground = tr.style.background;
                tr.style.background = "#fff4a8";
            }
            selectedId = selectedId_;
            selectedTr = tr;
        }

        function getSelected() {
            if (null == selectedId) {
                alert("请首先选择您要操作的行！");
                return false;
            } else {
                return true;
            }
        }
    </script>
    <title>用户列表</title>
</head>
<body>
<form name="person_list" method="post" action="person_list.d" onsubmit="formTrim();">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="">
        <tr>
            <td>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="bgdh">
                    <tr>
                        <td width=""><input class="button" style="width:40px" name="popUpAdd" type="button"
                                            onclick="popUpAdd1();"
                                            id="popUpAdd" value="新增"/>
                            <input class="button" style="width:40px" name="popUpMod" type="button"
                                   onclick="popUpMod1();"
                                   id="popUpMod" value="修改"/>
                            <input class="button" style="width:40px" name="popUpDel" type="button"
                                   onclick="processDel();"
                                   id="popUpDel" value="删除"/>
                            <input class="button" style="width:80px" name="popRole" type="button" onclick="popUpRole()"
                                   id="popRole" value="所属角色"/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="form_th">
                    <tr>
                        <td class="tdadd">用户姓名：</td>
                        <td class="tdadd"><input name="userName" type="text" id="userName" value=""/></td>
                        <td class="tdadd">所属机构述：</td>
                        <td class="tdadd">
                            <select name="orgId" id="orgId" style="width:160px;" value="">
                                <option value="">请选择</option>
                                <s:iterator value="orgTreeList">
                                    <option value="${ORGNA_ID}">${ORGNA_NAME}</option>
                                </s:iterator>
                            </select>
                        </td>
                        <td align="right"><input class="button" style="width:40px" name="query" type="button" value="查询"
                                                 onclick="queryPagination()">&nbsp;&nbsp;</td>

                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" id="tab_id" name="tab_id" class="mtabtab"
                       style="BORDER-COLLAPSE: collapse">
                    <tr name="form_th" id="tr_head">
                        <th class="head">
                            <div align="center"><strong>序号</strong></div>
                        </th>
                        <th class="head">
                            <div align="center"><strong>帐号</strong></div>
                        </th>
                        <th class="head">
                            <div align="center"><strong>姓名</strong></div>
                        </th>
                        <th class="head">
                            <div align="center"><strong>所属机构</strong></div>
                        </th>

                        <th class="head">
                            <div align="center"><strong>用户描述</strong></div>
                        </th>
                    </tr>
                    <s:iterator value="dataList" status="stat">
                        <tr onclick="setSelected(this,'tab_id','tr_head','${USER_ID}')">
                            <td class="form_th" nowrap style="text-align: center; width: 50px;"><s:property
                                    value="#stat.index+1"/></td>
                            <td class="form_th" nowrap style="text-align: left">&nbsp;${USER_NAME}</td>
                            <td class="form_th" nowrap style="text-align: left">&nbsp;${REAL_NAME}</td>
                            <td class="form_th" nowrap style="text-align: left">&nbsp;${ORGNA_NAME}</td>
                            <td class="form_th" nowrap style="text-align: left" width="150px;">&nbsp;${USER_DESC}</td>
                        </tr>
                    </s:iterator>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center">
                <tags:pagination/>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
    <script>

        function queryPagination() {
            document.forms[0].pages.value = 1;
            document.forms[0].submit();
        }
        function popUpAdd1() {
            self.location.href = "person_add.d";
        }

        function popUpMod1() {
            if (getSelected()) {
                self.location.href = "person_mod.d?userId=" + selectedId;
            }
        }

        function processDel() {
            if (getSelected()) {
                if (confirm("确定要删除吗？")) {
                    window.location.href = "person_del.d?userId=" + selectedId;
                }
            }
        }

        function popUpRole() {
            if (getSelected()) {
                window.location.href = "person_role.d?userId=" + selectedId;
            }
        }

        function formTrim() {
            document.forms[0].userName.value = trim(document.forms[0].userName.value);
        }
        function trim(str1) {
            var strSource, strDest = "";
            var i = 0, iLength = 0;
            strSource = str1.toString();
            strDest = strSource;
            iLength = strSource.length;
            for (i = 0; i <= iLength - 1 && strSource.substr(i, 1) == " "; i++) {
                strDest = strSource.substr(i);
            }
            if (strDest.substr(0, 1) == " ") strDest = strDest.substr(1);
            strSource = strDest;
            iLength = strSource.length;
            for (i = iLength - 1; i >= 0 && strSource.substr(i, 1) == " "; i--) {
                strDest = strSource.substr(0, i);
            }
            return(strDest);
        }
    </script>
</form>
</body>
</html>

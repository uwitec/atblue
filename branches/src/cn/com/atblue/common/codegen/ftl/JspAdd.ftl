<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ include file="../../../import.jsp"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
CUser cUser = (CUser)session.getAttribute("cUser");
cUser = cUser == null?new CUser():cUser;
String orgId = cUser.getOrgnaId();
Map paramMap = new HashMap();
paramMap.put("orgnaId",orgId);
COrgnization cOrgnization = orgnizationDAO.queryForBean(paramMap);
cOrgnization = cOrgnization == null?new COrgnization():cOrgnization;
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <link href="<%=request.getContextPath()%>/images/css.css" rel="stylesheet"  type="text/css">
    <link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet"  type="text/css">
    <script type="text/javascript" charset="GB2312"
            src="<%=request.getContextPath()%>/js/date/WdatePicker.js" defer="true"></script>

    <script type="text/javascript">
        function _resizeNoPage() {
            document.getElementById("scrollDiv").style.width = document.body.clientWidth - 18;
            document.getElementById("scrollDiv").style.height = document.body.clientHeight - 50;
        }

        function CheckDateTime(object){
            var rr=/^(?:19|20)[0-9][0-9]-(?:(?:0[1-9])|(?:1[0-2]))-(?:(?:[0-2][1-9])|(?:[1-3][0-1])) (?:(?:[0-2][0-3])|(?:[0-1][0-9])):[0-5][0-9]$/
            if(!rr.test(object.value)){
                object.focus();
                return false;
            }
            return true;
        }
        function CheckDate(object){
            var rr=/^(?:19|20)[0-9][0-9]-(?:(?:0[1-9])|(?:1[0-2]))-(?:(?:[0-2][1-9])|(?:[1-3][0-1]))$/
            if(!rr.test(object.value)){
                object.focus();
                return false;
            }
            return true;
        }

        function checkForm(){
            var has = false;
            for (var i = 0; i < document.form1.ubox.length; i++) {
                if (document.form1.ubox[i].checked) {
                    has = true;
                    break;
                }
            }
            if (!has) {
                alert("请选择签收用户.");
                return;
            }
            if(document.all["bean.mailZt"].value==""){
                document.all["bean.mailZt"].focus();
                alert("请输入邮件主题");
                return;
            }
            document.form1.submit();
        }
    </script>
</head>
<body onload="_resizeNoPage();">
<form action="${className}_save.d" name="form1" method="post">
    <input type="hidden" name="action" value="add"/>
    <table width="100%" height="25" border="0" cellpadding="0"
           cellspacing="0"
           background="<%=request.getContextPath()%>/images/mhead.jpg">
        <tr>
            <td width="3%" align="center">
                <img src="<%=request.getContextPath()%>/images/mlogo.jpg" width="11"
                     height="11">
            </td>
            <td width="15%" class="mhead">
                新建${classComments}
            </td>
            <td width="74%" align="left" class="mhead">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tbody>
                    <tr>
                        <td align="left">
                            <input type="submit" class="button" id="button"
                                   value="保存">
                            &nbsp;
                            <input type="button" class="button" id="button1"
                                   onclick="history.back()" value="返回">
                            &nbsp;
                        </td>
                    </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <%--固定表头DIV--%>
                <div id="scrollDiv"
                     style="width: 1000px; overflow: auto; cursor: default; display: inline; position: absolute; height: 200px;">
                    <table width="100%" border="0" align="center" cellpadding="0"
                           cellspacing="0" class="mtabtab" id="mtabtab">
                    <#list columnList as v>
                        <tr>
                            <td nowrap="nowrap" width="20%" class="head_left">
                                ${v.comments}
                            </td>
                            <td class="head_right" align="left" style="text-align: left" width="30%" >
                                <#if v.type == 'Date'>
                                    <input type="text" name="bean.${v.name}" value="" class="Wdate" onClick="WdatePicker()"/>
                                <#else>
                                    <input type="text" name="bean.${v.name}" value=""/>
                                </#if>

                            </td>
                        </tr>
                    </#list>
                    </table>
                </div>
            </td>
        </tr>

    </table>
</form>
</body>
</html>

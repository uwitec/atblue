<%@ page import="cn.com.atblue.common.util.StringUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<%
    String id = StringUtil.parseNull(request.getParameter("id"),"");
    String name = StringUtil.parseNull(request.getParameter("name"),"");
    String path = StringUtil.parseNull(request.getParameter("path"),"");
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="images/css.css" rel="stylesheet" type="text/css">
    <title>菜单</title>
</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td width="3"></td>
        <td width="180" valign="top"><table width="180" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td><img src="images/index_20.jpg" width="180" height="29" alt=""></td>
            </tr>
            <tr>
                <td  class="tab_main">
                 <%--<div id="tree-div" style="overflow:auto; height:100%;width:100%;"></div>--%>
                    <iframe src="left2.jsp?id=<%=id%>&name=<%=name%>&path=<%=path%>" height="100%"/>
                    &nbsp;</td>
            </tr>
        </table></td>
    </tr>
    </table>
</body>
</html>
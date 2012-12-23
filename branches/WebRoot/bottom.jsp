<%@ page import="cn.com.atblue.manager.bean.CUser" %>
<%@ page import="cn.com.atblue.common.util.StringUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>『黄河钻井三公司OA系统』</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <link href="images2/css.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">

        function open_pop(path) {
            window.open("<%=request.getContextPath()%>" + path, "", "width=200,height=500,top=" + (screen.availHeight - 240) / 2 + ",left=" + (screen.availWidth - 400) / 2);
        }
        function open_notice(path) {
            window.open("<%=request.getContextPath()%>" + path, "", "width=600,height=200,top=" + (screen.availHeight - 240) / 2 + ",left=" + (screen.availWidth - 400) / 2);
        }
        function showDbsx() {
            var obj = parent.window.document.getElementById("contentFrame").src = "<%=request.getContextPath()%>/yyxt/index/dbsxInfoAdmin.vs";
//       	if (obj)obj.onclick();	
        }
        function messageAlerts() {
            self.top.newsWindow();
        }
    </script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<%
    CUser cUser = (CUser)session.getAttribute("cUser");
    cUser = cUser == null?new CUser():cUser;
    String orgnaName = StringUtil.parseNull(session.getAttribute("orgnaName"),"");
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0" background="images2/index_59.gif">
    <tr>
        <td height="34" class="txt2" style="text-align: left">&nbsp;&nbsp;&nbsp;&nbsp;当前用户：<%=orgnaName%>&nbsp;&nbsp;<%=cUser.getRealName()%>&nbsp;&nbsp;</font></td>
        <td class="txt2" style="text-align: center">Copyright © 2012 &nbsp;&nbsp;&nbsp;胜&nbsp;利&nbsp;油&nbsp;田&nbsp;黄&nbsp;河&nbsp;钻&nbsp;井&nbsp;三&nbsp;公&nbsp;司&nbsp;版&nbsp;权&nbsp;所&nbsp;有</td>
        <td class="txt2">&nbsp;</td>
    </tr>
</table>
</body>
</html>
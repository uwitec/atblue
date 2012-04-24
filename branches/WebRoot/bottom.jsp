<%@ page import="cn.com.atblue.manager.bean.CUser" %>
<%@ page import="cn.com.atblue.common.util.StringUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>『黄河钻井三公司OA系统』</title>
    <link href="css/fooder.css" rel="stylesheet" type="text/css"/>
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
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td background="images/index/fooder_bg.gif">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <%
                        CUser cUser = (CUser)session.getAttribute("cUser");
                        cUser = cUser == null?new CUser():cUser;
                        String orgnaName = StringUtil.parseNull(session.getAttribute("orgnaName"),"");
                    %>
                    <td>&nbsp;&nbsp;当前用户：<%=orgnaName%>&nbsp;&nbsp;<%=cUser.getRealName()%>&nbsp;&nbsp;</td>
                    <td></td>
                    <td><img src="images/index/fooder_line.gif" width="2" height="24"/></td>
                    <td align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        黄河钻井三公司办公自动化系统
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                    <td><img src="images/index/fooder_line.gif" width="2" height="24"/></td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>
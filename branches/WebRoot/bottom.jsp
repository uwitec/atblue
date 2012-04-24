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
        <!--
        function MM_swapImgRestore() { //v3.0
            var i, x, a = document.MM_sr;
            for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++) x.src = x.oSrc;
        }
        function MM_preloadImages() { //v3.0
            var d = document;
            if (d.images) {
                if (!d.MM_p) d.MM_p = new Array();
                var i, j = d.MM_p.length, a = MM_preloadImages.arguments;
                for (i = 0; i < a.length; i++)
                    if (a[i].indexOf("#") != 0) {
                        d.MM_p[j] = new Image;
                        d.MM_p[j++].src = a[i];
                    }
            }
        }

        function MM_findObj(n, d) { //v4.01
            var p, i, x;
            if (!d) d = document;
            if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
                d = parent.frames[n.substring(p + 1)].document;
                n = n.substring(0, p);
            }
            if (!(x = d[n]) && d.all) x = d.all[n];
            for (i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
            for (i = 0; !x && d.layers && i < d.layers.length; i++) x = MM_findObj(n, d.layers[i].document);
            if (!x && d.getElementById) x = d.getElementById(n);
            return x;
        }

        function MM_swapImage() { //v3.0
            var i, j = 0, x, a = MM_swapImage.arguments;
            document.MM_sr = new Array;
            for (i = 0; i < (a.length - 2); i += 3)
                if ((x = MM_findObj(a[i])) != null) {
                    document.MM_sr[j++] = x;
                    if (!x.oSrc) x.oSrc = x.src;
                    x.src = a[i + 2];
                }
        }
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
                    <td>当前用户：<%=orgnaName%>&nbsp;&nbsp;<%=cUser.getRealName()%>&nbsp;&nbsp;</td>
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
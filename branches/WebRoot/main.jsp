<%@ page import="cn.com.atblue.common.util.StringUtil" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="images/css.css" rel="stylesheet" type="text/css">
    <%
        String p = StringUtil.parseNull(request.getParameter("p"),"");
        String text = StringUtil.parseNull(request.getParameter("text"),"");
        text = URLDecoder.decode(text,"UTF-8");
    %>
    <script type="text/javascript">
        function resize() {
            document.getElementById("realframe").height = document.documentElement.clientHeight-31;
        }
    </script>
</head>
<body onload=" resize() ;">
<table width="100%" border="0" cellspacing="0" cellpadding="0" >
    <tr>
        <td>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tab_main2">
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="33"><img src="images/index_22.jpg" width="33" height="29" alt=""></td>
                                <td background="images/index_24.jpg" class="txt_main">当前位置：<%=StringUtil.parseNull(text,"")%></td>
                                <td width="11"><img src="images/index_27.jpg" width="11" height="29" alt=""></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td height="311" valign="top">
                        <iframe src="<%=p%>" id="realframe" name="realframe" frameborder="0" scrolling="auto" width="100%" height="100%"/>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=gb2312"
         pageEncoding="gb2312" %>
<%
    request.getSession().invalidate();
    Cookie[] cookies = request.getCookies();
    if (cookies != null && cookies.length > 0) {
        Cookie cookie = request.getCookies()[0];
        cookie.setMaxAge(0);
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>����¼�ƺ��꾮����˾OAϵͳ��</title>
    <link href="images/css.css" rel="stylesheet" type="text/css">
</head>
<body>
<form action="<%=request.getContextPath()%>/login.d" name="form1" method="post">
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <table width="618" height="307" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top" background="images/login.jpg"><table width="618" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td height="128">&nbsp;</td>
                </tr>
                <tr>
                    <td><table width="618" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="412">&nbsp;</td>
                            <td><table width="182" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td><table width="182" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="40" class="txt_main">�û���</td>
                                            <td><input name="userName" id="userName" value=""
                                                       onkeydown="keyNext(event)" tabindex="100"></td>
                                        </tr>
                                    </table></td>
                                </tr>
                                <tr>
                                    <td height="5"></td>
                                </tr>
                                <tr>
                                    <td><table width="182" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="40" class="txt_main">���룺</td>
                                            <td><input type="password" name="password" id="password" value=""
                                                       onkeydown="keyDown(event)" tabindex="101"></td>
                                        </tr>
                                    </table></td>
                                </tr>
                                <tr>
                                    <td height="12"></td>
                                </tr>
                                <tr>
                                    <td align="center"><table width="120" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="55"><img src="images/dl.jpg" width="55" height="21"  style="cursor:pointer"
                                                                onClick="doLogin();" tabindex="103"></td>
                                            <td>&nbsp;</td>
                                            <td width="55"><img src="images/qx.jpg" width="55" height="21" style="cursor:pointer"
                                                                onClick="doClear();" tabindex="104"></td>
                                        </tr>
                                    </table></td>
                                </tr>
                            </table></td>
                        </tr>
                    </table></td>
                </tr>
            </table></td>
        </tr>
    </table>
</form>
<script type="text/javascript">
    document.form1.userName.focus();
    function doLogin() {
        if (document.form1.userName.value == "") {
            alert("�������û���");
            document.form1.userName.focus();
            return false;
        }
        if (document.form1.password.value == "") {
            alert("���������");
            document.form1.password.focus();
            return false;
        }
        document.form1.submit();
    }
    function keyDown(eventTag) {
        var event = eventTag || window.event;
        var currentKey = event.charCode || event.keyCode;
        if (currentKey == 13) {
            doLogin();
        }
    }
    function keyNext(eventTag) {
        var event = eventTag || window.event;
        var currentKey = event.charCode || event.keyCode;
        if (currentKey == 13) {
            document.getElementById("password").focus();
        }
    }
    function doClear() {
        document.form1.userName.value = "";
        document.form1.password.value = ""
    }

    function getXMLHttpRequest() {
        var xmlHttpRequest;
        if (window.XMLHttpRequest) //For general cases.
        {
            xmlHttpRequest = new XMLHttpRequest();
        }
        else //For IE.
        {
            if (window.ActiveXObject) {
                xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
            }
        }
        return xmlHttpRequest;
    }
</script>
</body>
</html>
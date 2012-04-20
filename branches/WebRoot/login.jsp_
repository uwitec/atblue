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
    <title>『登录黄河钻井三公司OA系统』</title>
    <link href="css/login.css" rel="stylesheet" type="text/css">
</head>
<body>
<form action="<%=request.getContextPath()%>/login.d" name="form1" method="post">
    <table width="680" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td height="400" valign="bottom" background="images/login33.jpg">
                <table width="32%" border="0" align="right" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="33%"><input type="text" name="userName" id="userName" value=""
                                                           onkeydown="keyNext(event)" tabindex="100"/></td>
                                    <td width="67%" rowspan="3">
                                        <table width="55" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td><img src="images/trans.gif" width="53" height="45" border="0"
                                                         usemap="#Map3"/></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="12"></td>
                                </tr>
                                <tr>
                                    <td><input type="password" name="password" id="password" value=""
                                               onkeydown="keyDown(event)" tabindex="101"/></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td height="45">
                            <img src="images/login1.jpg" width="55" height="20" style="cursor:pointer"
                                 onClick="doLogin();" tabindex="103">
                            <img src="images/login2.jpg" width="55" height="20" style="cursor:pointer"
                                 onClick="doClear();" tabindex="104">
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="20%"><img src="images/trans.gif" width="85" height="25" border="0"
                                                         usemap="#Map"/></td>
                                    <td width="46%"><img src="images/trans.gif" width="85" height="25" border="0"
                                                         usemap="#Map2"/></td>
                                    <td width="34%">&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td height="90">&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <map name="Map3" id="Map3">
        <area shape="rect" coords="2,2,54,41" href="#"/>
    </map>

</form>
<script type="text/javascript">
    document.form1.userName.focus();
    function doLogin() {
        if (document.form1.userName.value == "") {
            alert("请输入用户名");
            document.form1.userName.focus();
            return false;
        }
        if (document.form1.password.value == "") {
            alert("请输入口令");
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

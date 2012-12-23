<%@ page import="cn.com.atblue.common.util.StringUtil" %>
<%@ page language="java" contentType="text/html; charset=gb2312"
         pageEncoding="gb2312" %>
<%
    request.getSession().invalidate();
    Cookie[] cookies = request.getCookies();
    String userName = "";
    String userPassword = "";
    if (cookies != null && cookies.length > 0) {
        for(int i=0;i<cookies.length;i++){
            Cookie cookie = request.getCookies()[i];
            if(cookie.getName().equals("userName")){
                userName = cookie.getValue();
            }
            if(cookie.getName().equals("userPassword")){
                userPassword = cookie.getValue();
            }
        }
    }
%>

<html>
<head>
    <title>『登录黄河钻井三公司OA系统』</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <link href="images/css.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        <!--
        body {
            background-color: #eaf7ff;
        }
        -->
    </style></head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<form action="<%=request.getContextPath()%>/login.d" name="form1" method="post">
<input type="hidden" name="jzmm" value="0"/>
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
                                        <td width="40" class="txt_main">用户：</td>
                                        <%
                                            if(!StringUtil.isBlankOrEmpty(userName) && !StringUtil.isBlankOrEmpty(userPassword)){ %>
                                        <td><input name="userName" type="text" class="tab_login" onkeydown="keyNext(event)" tabindex="100" value="<%=userName%>"></td>
                                        <%  }else{ %>
                                        <td><input name="userName" type="text" class="tab_login" onkeydown="keyNext(event)" tabindex="100"></td>
                                        <%     }
                                        %>
                                    </tr>
                                </table></td>
                            </tr>
                            <tr>
                                <td height="5"></td>
                            </tr>
                            <tr>
                                <td><table width="182" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="40" class="txt_main">密码：</td>
                                        <%
                                            if(!StringUtil.isBlankOrEmpty(userName) && !StringUtil.isBlankOrEmpty(userPassword)){ %>
                                        <td><input name="password" type="password" class="tab_login"  onkeydown="keyDown(event)" tabindex="101" value="<%=userPassword%>"></td>
                                        <%  }else{ %>
                                        <td><input name="password" type="password" class="tab_login"  onkeydown="keyDown(event)" tabindex="101"></td>
                                        <%     }
                                        %>
                                    </tr>
                                </table></td>
                            </tr>
                            <tr>
                                <td height="12"></td>
                            </tr>
                            <tr>
                                <td align="right"><table width="140" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="55"><img src="images/dl.jpg" width="55" height="21" style="cursor:pointer"
                                                            onClick="doLogin();" tabindex="103"></td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <input type="checkbox" name="jz" value=""/> 记住密码
                                            </td>
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
            alert("请输入用户名");
            document.form1.userName.focus();
            return false;
        }
        if (document.form1.password.value == "") {
            alert("请输入口令");
            document.form1.password.focus();
            return false;
        }

        if(document.all.jz.checked){
            document.all.jzmm.value = "1";
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

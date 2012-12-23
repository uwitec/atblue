<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="images/css.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td width="794"><img src="images/index_01.jpg" width="794" height="63" alt=""></td>
        <td align="right" valign="top" background="images/index_02.jpg"><table width="162" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td height="7"></td>
            </tr>
            <tr>
                <td><table width="162" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="63"><img src="images/index_04.jpg" width="63" height="54" alt="" style="cursor: hand" onclick="goIndex();"></td>
                        <td>&nbsp;</td>
                        <td width="63"><img src="images/index_06.jpg" width="63" height="54" alt="" onclick="logout();" style="cursor: hand"></td>
                        <td width="26"></td>
                    </tr>
                </table></td>
            </tr>
        </table></td>
    </tr>
    <tr>
        <td height="3" colspan="2"></td>
    </tr>
</table>
</body>
<script type="text/javascript">
	function logout() {
	    if (window.parent != null) {//如果页面在框架页面内，
	        window.parent.name = "";
	        window.parent.location.href = "<%=request.getContextPath()%>/login.jsp";
	    } else {
	        window.location.href = "<%=request.getContextPath()%>/login.jsp";
	    }
	}
    function goIndex(){
        window.open("index.jsp","contentFrame");
    }
</script>
</html>
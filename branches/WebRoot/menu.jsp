<%@ page import="cn.com.atblue.common.util.MenuUtil" %>
<%@ page import="cn.com.atblue.manager.bean.CUser" %>
<%@ page import="cn.com.atblue.common.util.StringUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link href="images/css.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
        function changeMenu(t, url) {
            changeStatus(t, "txt_choose", "txt_unchoose");
            var cframe = parent.document.getElementById("contentFrame");
            if (url.indexOf("http:") != -1 || url.indexOf("Http:") != -1) {
                cframe.src = url;
            } else {
                cframe.src = url;
            }
        }
        function changeStatus(t, focusClass, unFocusClass) {
            if (t.className == focusClass) {
                t.className = unFocusClass;
            }
            if (t.className == unFocusClass) {
                t.className = focusClass;
            }
            var ctr = t.parentNode;
            var cells = ctr.cells;
            for (var i = 0; i < cells.length; i++) {
                var ccell = cells[i];
                if (ccell.className == focusClass || ccell.className == unFocusClass) {
                    if (cells[i] != t) {
                        cells[i].className = unFocusClass;
                    }
                }
            }
        }
        window.onload = function () {
            //加载完成，触发首菜单
            var obj = document.getElementById("fw0");
        	if (obj)obj.onclick();
        }
    </script>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<%
CUser cUser = (CUser)session.getAttribute("cUser");
cUser = cUser == null?new CUser():cUser;
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#eaf7ff">
    <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td width="18"><img src="images/index_10.jpg" width="18" height="31" alt="" ></td>
                <td align="left" background="images/index_11.jpg"><table border="0" cellspacing="0" cellpadding="0">
                    <tr align="left">
                        <%=MenuUtil.getPageMenus2(cUser.getUserId(),"0",request.getContextPath())%>
                    </tr>
                </table></td>
                <td width="26"><img src="images/index_15.jpg" width="26" height="31" alt=""></td>
            </tr>
</table>
 </td></tr>
</table>
</body>
</html>

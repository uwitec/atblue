<%@ page import="cn.com.atblue.common.util.StringUtil" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script type="text/javascript">
        function resize() {
            document.getElementById("leftFrame").height = document.documentElement.clientHeight;
        }
    </script>
    <link href="css/center.css" rel="stylesheet" type="text/css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>『黄河钻井三公司OA系统』</title>
</head>
<%
    String id = StringUtil.parseNull(request.getParameter("id"), "");
    String name = StringUtil.parseNull(request.getParameter("name"),"");
    String path = StringUtil.parseNull(request.getParameter("path"),"");
%>
<frameset rows="*" cols="180,5,*" id="center" name="center" frameborder="no" border="0" framespacing="0">
    <frame src="left.jsp?id=<%=id%>&name=<%=name%>&path=<%=path%>" name="leftFrame" id="leftFrame"
           title="leftFrame" frameborder="0" scrolling="auto"/>
    <frame src="middle.html" name="middleFrame" scrolling="No" noresize="noresize" id="middleFrame"
           title="middleFrame"/>
    <frame src="<%//=url %>" name="mainFrame" id="mainFrame" title="mainFrame" scrolling="auto"/>
</frameset>
<noframes>
    <body>
    </body>
</noframes>
</html>

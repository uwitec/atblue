<%@ page import="cn.com.atblue.common.util.StringUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setContentType("text/xml");
    response.setHeader("Cache-Control", "no-cache");
    response.getWriter().write(StringUtil.parseNull(request.getAttribute("xml"),""));
    response.getWriter().flush();
%>

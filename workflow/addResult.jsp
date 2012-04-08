<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setContentType("text/xml");
    response.setHeader("Cache-Control", "no-cache");
    StringBuffer s = new StringBuffer();
    s.append("<WorkflowProcess>")
            .append("<Response status=\"0\" name=\"${name}\"/>")
            .append("</WorkflowProcess>");
    response.getWriter().write(s.toString());
    response.getWriter().flush();
%>

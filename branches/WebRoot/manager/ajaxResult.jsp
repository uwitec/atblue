<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
%>
<s:property value="json" escape="false"/>

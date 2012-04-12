<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../import.jsp"%>
<%
	String selUserId = request.getParameter("selUserId");
    if(!StringUtil.isBlankOrEmpty(selUserId)){
        //
    }
    response.sendRedirect("index.jsp");
%>
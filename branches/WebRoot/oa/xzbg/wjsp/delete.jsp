<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../import.jsp"%>
<%
	String documentid = request.getParameter("documentid");
    if(!StringUtil.isBlankOrEmpty(documentid)){
        Map map = new HashMap();
        map.put("documentid",documentid);
        officeWjspDAO.delOfficeWjsp(map);
    }
    response.sendRedirect("list.jsp");
%>
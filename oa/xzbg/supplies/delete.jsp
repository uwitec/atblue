<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../import.jsp"%>
<%
	String sqid = request.getParameter("sqid");
	String curRole = request.getParameter("curRole");
    if(!StringUtil.isBlankOrEmpty(sqid)){
        Map map = new HashMap();
        map.put("sqid",sqid);
        officeSuppliesDAO.delOfficeSupplies(map);
    }
    response.sendRedirect("index.jsp?curRole="+curRole);
%>
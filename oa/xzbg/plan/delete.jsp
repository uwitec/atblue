<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../import.jsp"%>
<%
	String pkid = request.getParameter("pkid");
	String flag = request.getParameter("flag");
	String propkid= request.getParameter("propkid");
	 Map map = new HashMap();
	 map.put("pkid",pkid);
	if("1".equals(flag)){
		officePlanDAO.delOfficePlan(map);
		response.sendRedirect("edit.jsp?pkid="+propkid);
	}else{
	    if(!StringUtil.isBlankOrEmpty(pkid)){
	        officePlanDAO.delOfficePlanByFkid(map);
	        officePlanProcessDAO.delOfficePlanProcess(map);
	    }
	    response.sendRedirect("index.jsp");
    }
    
%>
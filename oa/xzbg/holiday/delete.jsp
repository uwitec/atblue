<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../import.jsp"%>
<%
	String holidayid = request.getParameter("holidayid");
    if(!StringUtil.isBlankOrEmpty(holidayid)){
        Map map = new HashMap();
        map.put("holidayid",holidayid);
        officeHolidayDAO.delOfficeHoliday(map);
    }
    response.sendRedirect("list.jsp");
%>
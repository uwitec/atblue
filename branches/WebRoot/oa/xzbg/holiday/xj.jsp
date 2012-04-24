<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../import.jsp"%>
<%
	String holidayid = request.getParameter("holidayid");
	String curRole = request.getParameter("curRole");
    if(!StringUtil.isBlankOrEmpty(holidayid)){
        Map map = new HashMap();
        map.put("holidayid",holidayid);
        OfficeHoliday officeHoliday = officeHolidayDAO.queryForBean(map);
        if(officeHoliday != null){
            officeHoliday.setXjdj("1");
            officeHoliday.setSqzt("已销假");
            officeHoliday.setXjsj(new java.util.Date());
            officeHolidayDAO.modOfficeHoliday(officeHoliday);
        }
    }
    response.sendRedirect("index.jsp?curRole="+curRole);
%>
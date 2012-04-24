<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../../../import.jsp"%>
<%
    OfficeCirculationDAO officeCirculationDAO = (OfficeCirculationDAO)SpringFactory.instance.getBean("officeCirculationDAO");
    OfficeCirculationCheckDAO officeCirculationCheckDAO = (OfficeCirculationCheckDAO)SpringFactory.instance.getBean("officeCirculationCheckDAO");
    String pkid  = request.getParameter("pkid");
    OfficeCirculation document = officeCirculationDAO.selectByPrimaryKey(pkid);
    if(document != null){
        document.setZt("正在传阅中");
        officeCirculationDAO.updateByPrimaryKey(document);
    }
    out.print("<script>");
    out.print("window.location='index.jsp';");
    out.print("</script>");
%>
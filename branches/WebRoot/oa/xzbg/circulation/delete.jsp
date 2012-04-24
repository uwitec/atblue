<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../import.jsp"%>
<%
    OfficeCirculationDAO officeCirculationDAO = (OfficeCirculationDAO)SpringFactory.instance.getBean("officeCirculationDAO");
    OfficeCirculationCheckDAO officeCirculationCheckDAO = (OfficeCirculationCheckDAO)SpringFactory.instance.getBean("officeCirculationCheckDAO");
	String pkid  = request.getParameter("pkid");
	officeCirculationDAO.deleteByPrimaryKey(pkid);
	List fileList = officeFileDAO.getByFk(pkid);
	for(int i=0; i<fileList.size(); i++){
		OfficeFile of = (OfficeFile)fileList.get(i);
		File file = new File(of.getWjlj());
		file.delete();
		officeFileDAO.deleteByPrimaryKey(of.getPkid());
	}
	out.print("<script>");
	out.print("window.location='index.jsp';");
	out.print("</script>");
%>
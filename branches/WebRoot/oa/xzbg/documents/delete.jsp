<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../import.jsp"%>
<%
	OfficeDocumentsDAO officeDocumentsDAO = (OfficeDocumentsDAO)SpringFactory.instance.getBean("officeDocumentsDAO");
	OfficeDocumentsCheckDAO officeDocumentsCheckDAO = (OfficeDocumentsCheckDAO)SpringFactory.instance.getBean("officeDocumentsCheckDAO");
	String pkid = request.getParameter("pkid");
	List fileList = officeFileDAO.getByFk(pkid);
	for(int i=0; i<fileList.size(); i++){
		OfficeFile of = (OfficeFile)fileList.get(i);
		File file = new File(of.getWjlj());
		file.delete();
		officeFileDAO.deleteByPrimaryKey(of.getPkid());
	}
	
	PageBean pb = new PageBean(Integer.MAX_VALUE, Integer.MAX_VALUE,1);
	String sql = " where documentid='" + pkid + "'";
	List checkUser = officeDocumentsCheckDAO.getByFreeSql(sql,pb);
	for(int i=0; i<checkUser.size(); i++){ 
		OfficeDocumentsCheck odc = (OfficeDocumentsCheck)checkUser.get(i);
		officeDocumentsCheckDAO.deleteByPrimaryKey(odc.getChekid());
	}
	officeDocumentsDAO.deleteByPrimaryKey(pkid);
	out.print("<script>");
	out.print("window.location='manager.jsp';");
	out.print("</script>");
%>
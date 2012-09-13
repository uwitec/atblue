<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../import.jsp"%>
<%
	String noticeid = request.getParameter("noticeid");
	List fileList = officeFileDAO.getByFk(noticeid);
	for(int i=0; i<fileList.size(); i++){
		OfficeFile of = (OfficeFile)fileList.get(i);
        File file = new File(of.getWjlj());
        file.delete();
        officeFileDAO.deleteByPrimaryKey(of.getPkid());
	}
    officeNoticeCheckDAO.deleteByNoticeid(noticeid);
    officeNoticeDAO.deleteByPrimaryKey(noticeid);
    response.sendRedirect("index.jsp");
%>
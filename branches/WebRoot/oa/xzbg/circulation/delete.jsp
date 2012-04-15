<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../import.jsp"%>
<%
	OfficeCirculationDAO officeCirculationDAO = (OfficeCirculationDAO)SpringFactory.instance.getBean("officeCirculation");
	OfficeCirculationCheckDAO officeCirculationCheckDAO = (OfficeCirculationCheckDAO)SpringFactory.instance.getBean("officeCirculationCheckDAO");
	String pkid  = request.getParameter("pkid");
	officeCirculationDAO.deleteByPrimaryKey(pkid);
	
	String sql = "select instanceid from flw_instdata where key='pkid' and value='" +  pkid + "'";
	List list = officeCirculationDAO.getMapByFreeSql(sql);
	if(list!=null && list.size()>0){
		Map map = (Map)list.get(0);
		String pid = (String)map.get("INSTANCEID");
		//workFlow.deleteProcessInstance(pid);
	}
	List fileList = officeFileDAO.getByFk(pkid);
	for(int i=0; i<fileList.size(); i++){
		OfficeFile of = (OfficeFile)fileList.get(i);
		File file = new File(of.getWjlj());
		file.delete();
		officeFileDAO.deleteByPrimaryKey(of.getPkid());
	}
	out.print("<script>");
	out.print("window.location='list.jsp';");
	out.print("</script>");
%>
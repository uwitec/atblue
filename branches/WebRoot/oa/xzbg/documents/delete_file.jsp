<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../import.jsp"%>
<%
	StringBuilder sb = new StringBuilder("&nbsp;&nbsp;");
	String fkid = request.getParameter("fkid");
	String pkid = request.getParameter("pkid");
	officeFileDAO.deleteByPrimaryKey(pkid);
	List fileList = officeFileDAO.getByFk(fkid);
	if(fileList!=null && fileList.size()>0){
		for(int k=0; k<fileList.size(); k++){
			OfficeFile file = (OfficeFile)fileList.get(k);
			sb.append("<a href=\""+contentPath+"/officeFileDownload?pkid=" + file.getPkid() + "\">");
			sb.append("<img src=\""+contentPath+"/fileIco/" + file.getWjlx() + ".png\" onerror=\"this.src='"+contentPath+"/fileIco/other.png'\" style=\"cursor: pointer;\" border=\"0\"");
			sb.append("alt=\"" + file.getWjm() + "(" + file.getWjcc() + "字节)\">");
			sb.append(file.getWjm());
			sb.append("</a>&nbsp;&nbsp;&nbsp;");
			sb.append("<a href=\"javascript:delFile('" + file.getPkid() + "','" + fkid + "');\">[删除]</a></br>&nbsp;&nbsp;");
		}
	}else{
		sb.append("无电子版");
	}
	out.clear();
	out.flush();
	out.print(sb.toString());
	out.flush();
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ include file="../../../import.jsp"%>
<%

    CUser cUser = (CUser)session.getAttribute("cUser");
    cUser = cUser == null?new CUser():cUser;
    String orgId = cUser.getOrgnaId();
    Map paramMap = new HashMap();
    paramMap.put("orgnaId",orgId);
    COrgnization cOrgnization = orgnizationDAO.queryForBean(paramMap);
    String sqid = StringUtil.parseNull(request.getParameter("sqid"),"");
    Map map = new HashMap();
    map.put("sqid",sqid);
    OfficeSupplies officeSupplies = officeSuppliesDAO.queryForBean(map);
    officeSupplies = officeSupplies == null?new OfficeSupplies():officeSupplies;
     List userList  = dao.getAllUser();
    String connectId = StringUtil.parseNull(officeSupplies.getConnectId(),"");
    String processId = StringUtil.parseNull(officeSupplies.getProcessId(),"");
    List hasFileList = officeFileDAO.getByFk(sqid);
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
		<link href="<%=request.getContextPath()%>/images/css.css" rel="stylesheet"	type="text/css">
		<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet"	type="text/css">
	</head>
	<body onload="_resizeNoPage();">
		<form action="add.jsp" name="form1" method="post">
            <input type="hidden" name="flag" value=""/>
			<table width="100%" height="25" border="0" cellpadding="0"
				cellspacing="0"
				background="<%=request.getContextPath()%>/images/mhead.jpg">
				<tr>
					<td width="3%" align="center">
						<img src="<%=request.getContextPath()%>/images/mlogo.jpg" width="11"
							height="11">
					</td>
					<td width="15%" class="mhead">
						查看其他申请信息
					</td>
					<td width="74%" align="left" class="mhead">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="left">
										<input type="button" class="button" id="button1"
											onclick="history.back()" value="返回">
										&nbsp;
									</td>
									<td align="left">
									    <input type="checkbox" name="checked" id="checked" value="" <%if(!"0".equals(officeSupplies.getDxtx())){ %>checked<%}%>>短信提醒
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td>
						<%--固定表头DIV--%>
						<div id="scrollDiv"
							style="width: 1000px; overflow: auto; cursor: default; display: inline; position: absolute; height: 200px;">
							<table width="100%" border="0" align="center" cellpadding="0"
								cellspacing="0" class="mtabtab" id="mtabtab">
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										申请名称
									</td>
									<td class="head_right" style="text-align: left">
									<%=StringUtil.parseNull(officeSupplies.getMc(),"")%>

									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										申请单位
									</td>
									<td class="head_right" style="text-align: left">
										<%=StringUtil.parseNull(officeSupplies.getSqdw(),"")%>&nbsp;
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										申请日期
									</td>
									<td class="head_right" style="text-align: left">
										<%=DateUtil.format(officeSupplies.getSqsj(),"yyyy-MM-dd")%> &nbsp;
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										事由
									</td>
									<td class="head_right" style="text-align: left">
                                       <%=StringUtil.parseNull(officeSupplies.getSy(),"")%> &nbsp;
                                    </td>
								</tr>
								<%if(hasFileList!=null && hasFileList.size()>0){ %>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										已有附件
									</td>
									<td class="head_right" align="left" id="hasFile" style="text-align: left">
										<%
											for(int i=0; i<hasFileList.size(); i++){
												OfficeFile beanFile = (OfficeFile)hasFileList.get(i);%>
											<a href="<%=request.getContextPath()%>/officeFileDownload?pkid=<%=beanFile.getPkid() %>" >
												<img src="<%=request.getContextPath()%>/fileIco/<%=beanFile.getWjlx() %>.png" onerror="this.src='<%=request.getContextPath()%>/fileIco/other.png'" style="cursor: pointer;" border="0" alt="<%=beanFile.getWjm() %>(<%=StringUtil.getFileSize(beanFile.getWjcc().doubleValue()) %>)"><%=beanFile.getWjm() %>
											</a>&nbsp;&nbsp;&nbsp;
									     <%}%>
									</td>
								</tr>
								<%} %>
							</table>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../import.jsp"%>
<jsp:useBean id="pageBean" class="cn.com.atblue.common.bean.PageBean"
	scope="page">
	<jsp:setProperty name="pageBean" property="*" />
</jsp:useBean>
<%
	OfficeDocumentsDAO officeDocumentsDAO = (OfficeDocumentsDAO)SpringFactory.instance.getBean("officeDocumentsDAO");
	OfficeDocumentsCheckDAO officeDocumentsCheckDAO = (OfficeDocumentsCheckDAO)SpringFactory.instance.getBean("officeDocumentsCheckDAO");
	//判断权限
	boolean isRole =dao.isRole(_user.getUserId(), officeRole);

	Map paramMap = new HashMap();
	pageBean.setPageSize(pageSize);
	StringBuilder sb = new StringBuilder();
	sb.append(" where documentid in(select documentid from office_documents_check where checkman='");
	sb.append(_user.getUserId()).append("') and status='1'");
	int totalRow = officeDocumentsDAO.getByFreeSqlCount(sb.toString());
	pageBean.setTotalRows(totalRow);
	sb.append(" order by cjrq desc");
	List list = officeDocumentsDAO.getByFreeSql(sb.toString(),pageBean);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	<script src="<%=contentPath%>/js/common.js"
			type="text/javascript" defer="defer"></script>
        <link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet"	type="text/css">
        <link href="<%=request.getContextPath()%>/images/css.css" rel="stylesheet"	type="text/css">
		
	</head>
	<body>
		<table width="100%" align="center" height="25" border="0"
			cellpadding="0" cellspacing="0"
			background="<%=contentPath%>/images/mhead.jpg">
			<tr>
				<td width="3%" align="center">
					<img src="<%=contentPath%>/images/mlogo.jpg" width="11"
						height="11" alt="">
				</td>
				<td width="15%" class="mhead">
					公文接收
				</td>
				<td align="left" class="mhead">
					&nbsp;
				</td>
			</tr>
		</table>
		<table width="100%" align="center" height="25" border="0"
			cellpadding="0" cellspacing="0">
			<tr>
				<td>
					
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="0" class="mtabtab" id="mtabtab">
						<tr>
							<th nowrap="nowrap"  width="40">
								序号
							</th>
							<th nowrap="nowrap"  width="220">
								文件编号
							</th>
							
							<th >
								标题
							</th>
							<th  width="120">
								发文类型
							</th>
							<th  width="120">
								签发日期
							</th>
							<th  width="120">
								状态
							</th>
						</tr>
						<%
							for (int i = 0; i < list.size(); i++) {
								OfficeDocuments document = (OfficeDocuments) list.get(i);
								OfficeDocumentsCheck odc = officeDocumentsCheckDAO.selectByDocumentidCheckMan(document.getDocumentid(), _user.getUserId());
						%>
						<tr>
							<td  align="center">
								<%=pageBean.getPageSize()
						* (pageBean.getCurrentPage() - 1) + i + 1%>
							</td>
							<td  align="center" style="text-align: left">
								<a href="view.jsp?pkid=<%=document.getDocumentid() %>"><%=document.getWjbh()%></a>
							</td>
							
							<td  align="center" style="text-align: left">
								<%=document.getBt()%>&nbsp;
							</td>
							<td  align="center">
								<%=document.getLb()%>&nbsp;
							</td>
							<td  align="center">
								<%=DateUtil.format(document.getQfrq(),"yyyy-MM-dd")%>&nbsp;
							</td>
							<td  align="center">
								<%if(odc==null || odc.getCheckflag().equals("0")){ %>
									<span style="color: red"><a href="signView.jsp?pkid=<%=document.getDocumentid() %>" style="color: red">未签收</a></span>
								<%}else{ %>
									<span style="color: blue">已签收</span>
								<%} %>
							</td>
						</tr>
						<%
							}
						%>

					</table>
				</td>
			</tr>
			<tr align="center">
				<td align="center">
					<%=pageBean.getHtml(paramMap)%>
				</td>
			</tr>
		</table>

	</body>
	
</html>
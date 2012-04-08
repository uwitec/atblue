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
	boolean isRole =dao
			.isRole(_user.getUserId(), officeRole);

	Map paramMap = new HashMap();
	pageBean.setPageSize(pageSize);
	StringBuilder sb = new StringBuilder();
	sb.append(" where documentid in(select documentid from office_documents_check where checkman='");
	sb.append(_user.getUserId()).append("' and checkflag='1') and status='1'");
	int totalRow = officeDocumentsDAO.getByFreeSqlCount(sb.toString());
	pageBean.setTotalRows(totalRow);
	sb.append(" order by cjrq desc");
	List list =officeDocumentsDAO
			.getByFreeSql(sb.toString(),pageBean);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
			<script src="<%=contentPath%>/js/common.js"
			type="text/javascript" defer="defer"></script>
		<link href="<%=request.getContextPath()%>/css/xzbg-css.css" rel="stylesheet"
			type="text/css">
		<link href="<%=request.getContextPath()%>/css/ext-all.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" charset="GB2312"
			src="<%=request.getContextPath()%>/js/date/WdatePicker.js" defer="defer"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/ckeditor/ckeditor.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/ext/ext-all.js"></script>
		
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
					公文查阅
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
							<td nowrap="nowrap" class="NormalColumnTitle" width="40">
								序号
							</td>
							<td nowrap="nowrap" class="NormalColumnTitle" width="220">
								文件编号
							</td>
							
							<td class="NormalColumnTitle">
								标题
							</td>
							<td class="NormalColumnTitle" width="120">
								发文类型
							</td>
							<td class="NormalColumnTitle" width="120">
								签发日期
							</td>
						</tr>
						<%
							for (int i = 0; i < list.size(); i++) {
								OfficeDocuments document = (OfficeDocuments) list.get(i);
								OfficeDocumentsCheck odc = officeDocumentsCheckDAO.selectByDocumentidCheckMan(document.getDocumentid(), _user.getUserId());
						%>
						<tr>
							<td class="NormalDataColumn" align="center">
								<%=pageBean.getPageSize()
						* (pageBean.getCurrentPage() - 1) + i + 1%>
							</td>
							<td class="NormalDataColumn" align="center">
								<a href="view.jsp?pkid=<%=document.getDocumentid() %>"><%=document.getWjbh()%></a>
							</td>
							
							<td class="NormalDataColumn" align="center">
								<%=document.getBt()%>&nbsp;
							</td>
							<td class="NormalDataColumn" align="center">
								<%=document.getLb()%>&nbsp;
							</td>
							<td class="NormalDataColumn" align="center">
								<%=DateUtil.format(document.getQfrq(),"yyyy-MM-dd")%>&nbsp;
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
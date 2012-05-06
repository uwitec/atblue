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
	boolean isRole = dao
			.isRole(_user.getUserId(), officeRole);

	Map paramMap = new HashMap();
	pageBean.setPageSize(pageSize);
	StringBuilder sb = new StringBuilder();
//	sb.append(" where cjr='"+_user.getUserId()+"' order by cjrq desc");
	int totalRow = officeDocumentsDAO.getByFreeSqlCount(sb.toString());
	pageBean.setTotalRows(totalRow);

	List list = officeDocumentsDAO.getByFreeSql(sb.toString(),pageBean);
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="<%=contentPath%>/js/common.js"
			type="text/javascript" defer="defer"></script>
		<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet"	type="text/css">
		<link href="<%=request.getContextPath()%>/images/css.css" rel="stylesheet"	type="text/css">
		<script type="text/javascript">
		function onDelete(url){
			if(window.confirm("确认删除该公文?")){
				window.location=url;
			}
			return;
		}
		</script>
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
					公文下发
				</td>
				<td align="left" class="mhead">
					&nbsp;
                    <input type="button" value="发文登记" class="button" onclick="window.location = 'add.jsp';"/>
                    &nbsp;
                    <%--<input type="button" value="签收统计" class="button" onclick="window.location = 'count.jsp';"/>--%>
				</td>
			</tr>
		</table>
		<table width="100%" align="center" height="25" border="0"
			cellpadding="0" cellspacing="0">
			<tr>
				<td>
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="0" class="mtabtab" id="tab_id">
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
							<th nowrap="nowrap"  width="120">
								操作
							</th>
						</tr>
						<%
							for (int i = 0; i < list.size(); i++) {
								OfficeDocuments document = (OfficeDocuments) list.get(i);
						%>
						<tr onclick="setSelected(this,'tab_id','tr_head','<%=document.getDocumentid()%>')">
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
								<%if(document.getStatus()==null || document.getStatus().intValue()==0){ %>
									<span style="color: red">草稿</span>
								<%}else{ %>
									<span style="color: blue">已发放</span>
								<%} %>
							</td>
							<td  align="center">
								<%if(document.getStatus()!=null && document.getStatus().intValue()==1){ %>
									<a href="javascript:alert('该文件已发放，不能进行修改。');">[编辑]</a>&nbsp;
								<%}else{ %>
									<a href="./edit.jsp?pkid=<%=document.getDocumentid() %>">[编辑]</a>&nbsp;
								<%} %>
								<a href="javascript:onDelete('./delete.jsp?pkid=<%=document.getDocumentid()%>');">[删除]</a>&nbsp;
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
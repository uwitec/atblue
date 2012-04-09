<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../import.jsp"%>
<jsp:useBean id="pageBean" class="cn.com.atblue.common.bean.PageBean"
	scope="page">
	<jsp:setProperty name="pageBean" property="*" />
</jsp:useBean>
<%
	OfficeCirculationDAO officeCirculationDAO = (OfficeCirculationDAO)SpringFactory.instance.getBean("officeCirculationDAO");
	OfficeCirculationCheckDAO officeCirculationCheckDAO = (OfficeCirculationCheckDAO)SpringFactory.instance.getBean("officeCirculationCheckDAO");
	//判断权限
	boolean isRole = dao
			.isRole(_user.getUserId(), officeRole);

	Map paramMap = new HashMap();
	pageBean.setPageSize(pageSize);
	StringBuilder sb = new StringBuilder();
	sb.append("  order by lrsj desc");
	int totalRow = officeCirculationDAO.getByFreeSqlCount(sb.toString());
	pageBean.setTotalRows(totalRow);

	List list = officeCirculationDAO.getByFreeSql("",pageBean);
%>
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
		<script type="text/javascript">
			function onDelete(url){
				if(window.confirm("确认删除该文件?")){
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
					来文管理
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
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tbody>
							<tr>
								<td align="left">
									<div id="toolbar" style="width: 100%;"></div>
								</td>
							</tr>
						</tbody>
					</table>
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
								文件名称
							</td>
							<td class="NormalColumnTitle" width="120">
								来文时间
							</td>
							<td class="NormalColumnTitle" width="120">
								来文单位
							</td>
							<td class="NormalColumnTitle" width="120">
								状态
							</td>
							<td class="NormalColumnTitle" width="120">
								操作
							</td>
						</tr>
						<%
							for (int i = 0; i < list.size(); i++) {
								OfficeCirculation document = (OfficeCirculation) list.get(i);
//								WInstance history = workFlow.getHistory(document.getZt());
//								if(history==null) continue;
//								String instanceid = history.getInstanceId();
						%>
						<tr>
							<td class="NormalDataColumn" align="center">
								<%=pageBean.getPageSize()
						* (pageBean.getCurrentPage() - 1) + i + 1%>
							</td>
							<td class="NormalDataColumn" align="center">
								<a href="view.jsp?pkid=<%=document.getCyid() %>"><%=document.getWjbh()%></a>
							</td>
							
							<td class="NormalDataColumn" align="center">
								<%=document.getWjmc()%>&nbsp;
							</td>
							<td class="NormalDataColumn" align="center">
								<%=DateUtil.format(document.getLwsj(),"yyyy-MM-dd")%>&nbsp;
							</td>
							<td class="NormalDataColumn" align="center">
								<%=StringUtil.parseNull(document.getLwdw(),"")%>&nbsp;
							</td>
							<td class="NormalDataColumn" align="center">
								<%--<%if(document.getZt().equals("save")){ %>--%>
									<%--<span style="color: red">未传阅</span>--%>
								<%--<%}else if(history.getActivityId().equals("f48aace8-0f9d-47de-a636-53d8c132c7fb")){ %>--%>
									<%--<span style="color: green">结束</span>--%>
								<%--<%}else{ %>--%>
									<%--<span style="color: blue">传阅中</span>--%>
								<%--<%} %>--%>
							</td>
							<td class="NormalDataColumn" align="center">
								<%if(document.getZt()==null || document.getZt().equals("save")){ %>
									<a href="./edit.jsp?pkid=<%=document.getCyid() %>">[编辑]</a>&nbsp;
								<%} %>
								<a href="javascript:onDelete('./delete.jsp?pkid=<%=document.getCyid() %>&pid=');">[删除]</a>&nbsp;
								<a href="./print.jsp?pkid=<%=document.getCyid() %>">[打印]</a>&nbsp;
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
	<script type="text/javascript">
		Ext.onReady(function(){
		
		    Ext.form.Field.prototype.msgTarget = 'under';
		
		    var tb = new Ext.Toolbar('toolbar');
		    tb.render('toolbar');
		    tb.addButton({text: '来文登记',icon: '<%=request.getContextPath()%>/images/add.gif',cls: 'x-btn-text-icon',handler:function(){
		        window.location = 'add.jsp';
		    }});
			tb.doLayout();
		});
	</script>
</html>
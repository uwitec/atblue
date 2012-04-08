<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../import.jsp"%>
<jsp:useBean id="pageBean" class="cn.com.atblue.common.bean.PageBean"
	scope="page">
	<jsp:setProperty name="pageBean" property="*" />
</jsp:useBean>
<%
	OfficeCirculationDAO officeCirculationDAO = (OfficeCirculationDAO)SpringFactory.instance.getBean("officeCirculation");
	OfficeCirculationCheckDAO officeCirculationCheckDAO = (OfficeCirculationCheckDAO)SpringFactory.instance.getBean("officeCirculationCheckDAO");
	//判断权限
	Map paramMap = new HashMap(); 
	pageBean.setPageSize(pageSize); 
	int totalRow = workFlow.getTaskListByUserCount(cyFlow,_user.getUserId());
	pageBean.setTotalRows(totalRow);

	List list = workFlow.getTaskListByVersiongroup(cyFlow,_user.getUserId(),pageBean); 
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
		<script>
		function workflow(id){
        	window.open("workflow.jsp?instanceid="+id,"newWindow","height=700,width=1000,top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no, status=no");
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
					来文传阅
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
								WTask task = (WTask)list.get(i);
								String instanceid = task.getInstanceId();
								OfficeCirculation document = officeCirculationDAO.selectByPrimaryKey(instanceid);
								
						%>
						<tr>
							<td class="NormalDataColumn" align="center">
								<%=pageBean.getPageSize()
						* (pageBean.getCurrentPage() - 1) + i + 1%>
							</td>
							<td class="NormalDataColumn" align="center">
								<a href="view.jsp?pkid=<%=document.getCyid() %>&instanceid=<%=instanceid%>"><%=document.getWjbh()%></a>
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
								<%if(document.getZt().equals("save")){ %>
									<span style="color: red">未传阅</span>
								<%}else if(document.getZt().equals("9")){ %>
									<span style="color: green">结束</span>
								<%}else{ %>
									<span style="color: blue">传阅中</span>
								<%} %>
							</td>
							<td class="NormalDataColumn" align="center">
								<%if(document.getZt()!=null && !document.getZt().equals("9")){ %>
									<a href="./sp.jsp?pkid=<%=document.getCyid() %>&taskid=<%=instanceid %>">[处理]</a>&nbsp;
								<%} %>
								<a href="#" onclick="workflow('<%=instanceid%>')">[查看流程]</a>&nbsp;
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

</html>
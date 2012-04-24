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
	
	Map paramMap = new HashMap();
	pageBean.setPageSize(pageSize);
	int totalRow = officeCirculationDAO.getBeanByNbrCount(_user.getUserId());
	pageBean.setTotalRows(totalRow);

	List list = officeCirculationDAO.getBeanByNbr(_user.getUserId(),pageBean);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="<%=contentPath%>/js/common.js"
			type="text/javascript" defer="defer"></script>
        <link href="<%=contentPath%>/css/css.css" rel="stylesheet" type="text/css">
        <link href="<%=contentPath%>/images/css.css" rel="stylesheet" type="text/css">
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
						cellspacing="0" class="mtabtab" id="tab_id">
						<tr>
							<th nowrap="nowrap"  width="40">
								序号
							</th>
							<th nowrap="nowrap"  width="220">
								文件编号
							</th>

							<th >
								文件名称
							</th>
							<th  width="120">
								来文时间
							</th>
							<th  width="120">
								来文单位
							</th>
							<th  width="5%" nowrap="nowrap">
								状态
							</th>

							<th  width="5%" nowrap="nowrap">
								操作
							</th>
						</tr>
						<%
							for (int i = 0; i < list.size(); i++) {
								OfficeCirculation document = (OfficeCirculation)list.get(i);
								
						%>
						<tr onclick="setSelected(this,'tab_id','tr_head','<%=StringUtil.parseNull(document.getCyid(),"") %>')">
							<td  align="center">
								<%=pageBean.getPageSize()
						* (pageBean.getCurrentPage() - 1) + i + 1%>
							</td>
							<td  align="center" style="text-align: left">
								<a href="view.jsp?pkid=<%=document.getCyid() %>"><%=document.getWjbh()%></a>
							</td>
							
							<td  align="center" style="text-align: left">
								<%=document.getWjmc()%>&nbsp;
							</td>
							<td  align="center">
								<%=DateUtil.format(document.getLwsj(),"yyyy-MM-dd")%>&nbsp;
							</td>
							<td  align="center">
								<%=StringUtil.parseNull(document.getLwdw(),"")%>&nbsp;
							</td>
							<td  align="center" nowrap="nowrap">
								<%if(document.getZt().equals("save")){ %>
									<span style="color: red">未传阅</span>
								<%}else if(document.getZt().equals("9")){ %>
									<span style="color: green">结束</span>
								<%}else{ %>
									<span style="color: blue">传阅中</span>
								<%} %>
							</td>
							<td  align="center" nowrap="nowrap">
								<%if(document.getZt()!=null && !document.getZt().equals("9")){ %>
									<a href="./sign.jsp?pkid=<%=document.getCyid() %>">[处理]</a>&nbsp;
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
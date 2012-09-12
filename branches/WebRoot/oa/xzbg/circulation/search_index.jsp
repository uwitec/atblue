<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="cn.com.victorysoft.oadd.workflow.runtime.WorkFlow"%>
<%@ include file="../../../import.jsp"%>
<jsp:useBean id="pageBean" class="cn.com.atblue.common.bean.PageBean"
	scope="page">
	<jsp:setProperty name="pageBean" property="*" />
</jsp:useBean>
<%
	OfficeCirculationDAO officeCirculationDAO = (OfficeCirculationDAO)SpringFactory.instance.getBean("officeCirculation");
	OfficeCirculationCheckDAO officeCirculationCheckDAO = (OfficeCirculationCheckDAO)SpringFactory.instance.getBean("officeCirculationCheckDAO");
	//判断权限
	String sid = request.getParameter("sid");
	sid=sid==null?"":StringUtil.parseISOtoUTF(sid);
	
	
	String sql = "select * from office_circulation where office_circulation.cyid in(select distinct(value) from office_circulation,flw_instdata,flw_history " + 
				 "where office_circulation.cyid=flw_instdata.value and flw_instdata.key='pkid' " +
				 "and flw_instdata.instanceid=flw_history.instanceid and replace(flw_history.finishman,'|','')='" + _user.getUserId() + "' and flw_history.status='9') ";
	if(!sid.equals("")){
		sql += " and (office_circulation.wjmc like '%" + sid + "%' or office_circulation.wjbh like '%" + sid + "%' or office_circulation.lwdw like '%" + sid + "%')";
	}
	sql += "order by office_circulation.lrsj desc";
	
	//System.out.println(sql);
	String countSql = "select count(*) from office_circulation where office_circulation.cyid in(select distinct(value) from office_circulation,flw_instdata,flw_history " + 
	 "where office_circulation.cyid=flw_instdata.value and flw_instdata.key='pkid' " +
	 "and flw_instdata.instanceid=flw_history.instanceid and replace(flw_history.finishman,'|','')='" + _user.getUserId() + "' and flw_history.status='9') ";
	if(!sid.equals("")){
		countSql += " and (office_circulation.wjmc like '%" + sid + "%' or office_circulation.wjbh like '%" + sid + "%' or office_circulation.lwdw like '%" + sid + "%')";
	}
	
	Map paramMap = new HashMap();
	pageBean.setPageSize(pageSize);
	
	int totalRow = officeCirculationDAO.getBySqlCount(countSql);
	pageBean.setTotalRows(totalRow);

	List list = officeCirculationDAO.getBySql(sql,pageBean);
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
		<link href="<%=request.getContextPath()%>/js/ext/resources/css/ext-all.css" rel="stylesheet" type="text/css">
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
					来文查阅
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
								<td align="right">
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
						</tr>
						<%
							for (int i = 0; i < list.size(); i++) {
								OfficeCirculation document = (OfficeCirculation) list.get(i);
								WInstance history = workFlow.getHistory(document.getZt());
								if(history==null) continue;
								String instanceid = history.getInstanceId();
						%>
						<tr>
							<td class="NormalDataColumn" align="center">
								<%=pageBean.getPageSize()
						* (pageBean.getCurrentPage() - 1) + i + 1%>
							</td>
							<td class="NormalDataColumn" align="center">
								<a href="view.jsp?pkid=<%=document.getCyid()%>&instanceid=<%=instanceid%>"><%=document.getWjbh()%></a>
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
								<a href="#" onclick="workflow('<%=instanceid%>')">[查看流程]</a>&nbsp;
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
			function workflow(id){
        	window.open("workflow.jsp?instanceid="+id,"newWindow","height=700,width=1000,top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no, status=no");
        }
		Ext.onReady(function(){
		
		    Ext.form.Field.prototype.msgTarget = 'under';
		
		    var tb = new Ext.Toolbar('toolbar');
		    tb.render('toolbar');
		    tb.addSeparator();
		    tb.addSpacer();
		    
		    tb.add('&nbsp;&nbsp;&nbsp;<input type="text" name="find" value="<%=sid%>" class="inputStyle" style="width: 150px;">&nbsp;&nbsp;');
		    tb.addButton({text: '查询',icon: '<%=contentPath%>/images/page_find.gif',cls: 'x-btn-text-icon',handler:function(){
		        window.location = 'search_index.jsp?sid=' + document.all["find"].value;
		    }});
			tb.doLayout();
		});
	</script>
</html>
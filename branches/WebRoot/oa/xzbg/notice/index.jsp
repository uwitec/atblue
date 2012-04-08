<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../import.jsp"%>
<jsp:useBean id="pageBean" class="cn.com.atblue.common.bean.PageBean"
	scope="page">
	<jsp:setProperty name="pageBean" property="*" />
</jsp:useBean>
<%
	//判断权限
    boolean isRole =dao.isRole(_user.getUserId(), officeRole);

	//查询字符串
	String queryString = request.getParameter("queryString");
	queryString = StringUtil.parseNull(queryString, "");
	queryString = StringUtil.parseISOtoUTF(queryString);

	Map paramMap = new HashMap();
	if (queryString != null && !queryString.equals("")) {
		paramMap.put("queryString", queryString);
	}
	paramMap.put("department", _user.getOrgnaId()==null?"":_user.getOrgnaId());
	pageBean.setPageSize(pageSize);

	int totalRow =officeNoticeDAO
			.selectAllByDepartment(paramMap);
	pageBean.setTotalRows(totalRow);

	List list = officeNoticeDAO
			.selectAllByDepartment(pageBean, paramMap);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
        <script src="<%=request.getContextPath()%>/js/common.js"
                type="text/javascript" defer="defer"></script>
        <link href="<%=request.getContextPath()%>/css/xzbg-css.css" rel="stylesheet"
              type="text/css">
        <link href="<%=contentPath%>/css/office.css" rel="stylesheet" type="text/css">
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
			if(window.confirm("确认删除该通知?")){
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
					通知公告
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
					<div id="header">
						<ul>
							<li id="selected">
								<a href="#">通知管理</a>
							</li>
							<li>
								<a href="currentNotice.jsp">当前通知</a>
							</li>
							<li>
								<a href="expiredNotice.jsp">过期通知</a>
							</li>
						</ul>

					</div>
					
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
							<td nowrap="nowrap" class="NormalColumnTitle">
								通知标题
							</td>
							
							<td class="NormalColumnTitle" width="120">
								签发人
							</td>
							<td class="NormalColumnTitle" width="120">
								开始时间
							</td>
							<td class="NormalColumnTitle" width="120">
								结束时间
							</td>
							<td class="NormalColumnTitle" width="120">
								过期时间
							</td>
							<td nowrap="nowrap" class="NormalColumnTitle" width="80">
								类别
							</td>
							<td nowrap="nowrap" class="NormalColumnTitle" width="80">
								状态
							</td>
							<td nowrap="nowrap" class="NormalColumnTitle" width="120">
								操作
							</td>
						</tr>
						<%
							for (int i = 0; i < list.size(); i++) {
								OfficeNotice notice = (OfficeNotice) list.get(i);
						%>
						<tr>
							<td class="NormalDataColumn" align="center">
								<%=pageBean.getPageSize()
						* (pageBean.getCurrentPage() - 1) + i + 1%>
							</td>
							<td class="NormalDataColumn" align="left">
								<a href="view.jsp?noticeid=<%=notice.getNoticeid() %>"><%=notice.getNotititle()%></a>
							</td>
							
							<td class="NormalDataColumn" align="center">
								<%=StringUtil.parseNull(notice.getSubscriber(),"")%>&nbsp;
							</td>
							<td class="NormalDataColumn" align="center">
								<%=DateUtil.format(notice.getStartime(),"yyyy-MM-dd HH:mm")%>&nbsp;
							</td>
							<td class="NormalDataColumn" align="center">
								<%=DateUtil.format(notice.getEndtime(),"yyyy-MM-dd HH:mm")%>&nbsp;
							</td>
							<td class="NormalDataColumn" align="center">
								<%=DateUtil.format(notice.getEnddate(),"yyyy-MM-dd")%>&nbsp;
							</td>
							<td class="NormalDataColumn" align="center">
								<%=notice.getIspublic().equals("0") ? "公告" : "通知"%>
							</td>
							<td class="NormalDataColumn" align="center">
								<%=notice.getStatus().equals("0") ? "草稿" : "已发布"%>
							</td>
							<td class="NormalDataColumn" align="center">
								<a href="./edit.jsp?noticeid=<%=notice.getNoticeid() %>">[编辑]</a>&nbsp;
								<a href="javascript:onDelete('./delete.jsp?noticeid=<%=notice.getNoticeid() %>');">[删除]</a>&nbsp;
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
    tb.addButton({text: '新建',icon: '<%=contentPath%>/images/add.gif',cls: 'x-btn-text-icon',handler:function(){
        window.location = 'add.jsp';
    }});

	tb.doLayout();
});

</script>
</html>
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
	String notititle = StringUtil.parseNull(request.getParameter("notititle"),"");
	Map paramMap = new HashMap();
	if (!StringUtil.isBlankOrEmpty(notititle)) {
		paramMap.put("notititle", notititle);
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
		<title>通知公告管理</title>
        <script src="<%=request.getContextPath()%>/js/common.js"
                type="text/javascript" defer="true"></script>
        <link href="<%=contentPath%>/css/css.css" rel="stylesheet" type="text/css">
        <link href="<%=contentPath%>/css/web.css" rel="stylesheet" type="text/css">
        <link href="<%=contentPath%>/images/css.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" charset="GB2312"
                src="<%=request.getContextPath()%>/js/date/WdatePicker.js" defer="true"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
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
    <form action="index.jsp" method="post">
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
                    <font style="font-size: 12px">标题：</font>
                    <input name="notititle"  type="text" value="<%=notititle%>" />&nbsp;&nbsp;
                    <input type="submit" class="button"  style="width:40px" value='查询'> &nbsp;&nbsp;
                    <input type="button" class="button" value="新增" onclick="window.location = 'add.jsp';"/>
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
							<th nowrap="nowrap" >
								通知标题
							</th>
							
							<th  width="120">
								签发人
							</th>
							<th  width="120">
								开始时间
							</th>
							<th  width="120">
								结束时间
							</th>
							<th  width="120">
								过期时间
							</th>
							<th nowrap="nowrap"  width="80">
								类别
							</th>
							<th nowrap="nowrap"  width="80">
								状态
							</th>
							<th nowrap="nowrap"  width="120">
								操作
							</th>
						</tr>
						<%
							for (int i = 0; i < list.size(); i++) {
								OfficeNotice notice = (OfficeNotice) list.get(i);
						%>
						<tr onclick="setSelected(this,'tab_id','tr_head','<%=notice.getNoticeid()%>')">
							<td  align="center" class="form_th">
								<%=pageBean.getPageSize()
						* (pageBean.getCurrentPage() - 1) + i + 1%>
							</td>
							<td  align="left" style="text-align: left" class="form_th">
								<a href="view.jsp?noticeid=<%=notice.getNoticeid() %>"><%=notice.getNotititle()%></a>
							</td>
							
							<td  align="center" class="form_th">
								<%=StringUtil.parseNull(notice.getSubscriber(),"")%>&nbsp;
							</td>
							<td  align="center" class="form_th">
								<%=DateUtil.format(notice.getStartime(),"yyyy-MM-dd HH:mm")%>&nbsp;
							</td>
							<td  align="center" class="form_th">
								<%=DateUtil.format(notice.getEndtime(),"yyyy-MM-dd HH:mm")%>&nbsp;
							</td>
							<td  align="center" class="form_th">
								<%=DateUtil.format(notice.getEnddate(),"yyyy-MM-dd")%>&nbsp;
							</td>
							<td  align="center" class="form_th">
								<%=notice.getIspublic().equals("0") ? "公告" : "通知"%>
							</td>
							<td  align="center" class="form_th">
								<%=notice.getStatus().equals("0") ? "草稿" : "已发布"%>
							</td>
							<td  align="center" class="form_th">
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
    </form>
	</body>
</html>
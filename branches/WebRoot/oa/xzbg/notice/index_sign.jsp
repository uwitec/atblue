
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


	Map paramMap = new HashMap();
	pageBean.setPageSize(pageSize);

	int totalRow = officeNoticeDAO
			.getNowNoticeCount(_user.getUserId());
	pageBean.setTotalRows(totalRow);

	List list = officeNoticeDAO
			.getNowNotice(_user.getUserId(),pageBean);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
        <script src="<%=request.getContextPath()%>/js/common.js"
                type="text/javascript" defer="defer"></script>
        <link href="<%=contentPath%>/css/css.css" rel="stylesheet" type="text/css">
        <link href="<%=contentPath%>/images/css.css" rel="stylesheet" type="text/css">
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
						</tr>
						<%
							for (int i = 0; i < list.size(); i++) {
								OfficeNotice notice = (OfficeNotice) list.get(i);
								OfficeNoticeCheck onc = officeNoticeCheckDAO.getCheckByNoticeidUserid(_user.getUserId(), notice.getNoticeid());
						%>
						<tr onclick="setSelected(this,'tab_id','tr_head','<%=notice.getNoticeid()%>')">
							<td  align="center">
								<%=pageBean.getPageSize()
						* (pageBean.getCurrentPage() - 1) + i + 1%>
							</td>
							<td  align="left" style="text-align: left">
								<a href="view.jsp?noticeid=<%=notice.getNoticeid() %>"><%=notice.getNotititle()%></a>
							</td>
							
							<td  align="center">
								<%=StringUtil.parseNull(notice.getSubscriber(),"")%>&nbsp;
							</td>
							<td  align="center">
								<%=DateUtil.format(notice.getStartime(),"yyyy-MM-dd HH:mm")%>&nbsp;
							</td>
							<td  align="center">
								<%=DateUtil.format(notice.getEndtime(),"yyyy-MM-dd HH:mm")%>&nbsp;
							</td>
							<td  align="center">
								<%=DateUtil.format(notice.getEnddate(),"yyyy-MM-dd")%>&nbsp;
							</td>
							<td  align="center">
								<%=notice.getIspublic().equals("0") ? "公告" : "通知"%>
							</td>
							<td  align="center">
								<%
								if(onc!=null && onc.getCheckflag().equals("1")){
								%>
									<a href="sign.jsp?noticeid=<%=notice.getNoticeid() %>"><img src="<%=contentPath%>/images/ok.gif" alt="已签收"  border="0" ></a>
								<%}else if(onc!=null && onc.getCheckflag().equals("0")){ %>
									请点击签收<a href="sign.jsp?noticeid=<%=notice.getNoticeid() %>"><img src="<%=contentPath%>/images/delete.gif" border="0" alt="未签收"></a>
								<%}else{ %>
									<a href="view.jsp?noticeid=<%=notice.getNoticeid() %>"><img src="<%=contentPath%>/images/ok.gif" alt="不需要签收"  border="0" ></a>
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
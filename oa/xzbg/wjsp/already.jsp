<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../import.jsp"%>
<jsp:useBean id="pageBean" class="cn.com.atblue.common.bean.PageBean"
	scope="page">
	<jsp:setProperty name="pageBean" property="*" />
</jsp:useBean>
<%
    CUser cUser = (CUser)session.getAttribute("cUser");
    cUser = cUser == null?new CUser():cUser;
    String orgId = cUser.getOrgnaId();
    String bt = StringUtil.parseNull(request.getParameter("bt"),"");
    Map paramMap = new HashMap();
    if(!StringUtil.isBlankOrEmpty(bt))
        paramMap.put("bt",bt);
    paramMap.put("userId",cUser.getUserId());
    pageBean.setPageSize(pageSize);

    int totalRow =officeWjspDAO.getAlreadyPagedCount(paramMap);
    pageBean.setTotalRows(totalRow);
    List list = officeWjspDAO.getAlreadyPagedList(pageBean,paramMap);
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
			if(window.confirm("确认删除该会议申请?")){
				window.location=url;
			}
			return;
		}
		</script>
	</head>
	<body>
    <form name="form1" action=""  style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px">
        <table width="100%" align="center" height="25" border="0"
           cellpadding="0" cellspacing="0"
           background="<%=contentPath%>/images/mhead.jpg">
        <tr>
            <td width="3%" align="center">
                <img src="<%=contentPath%>/images/mlogo.jpg" width="11" height="11"
                     alt="">
            </td>
            <td width="15%" class="mhead">
                 文件申请已审批
            </td>
            <td align="left" class="mhead">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tbody>
                    <tr>
                        <td align="left">
                            文件标题：
                            <input name="bt" size="10" type="text" value="<%=bt%>" />&nbsp;
                            <input type="submit" class="button"  style="width:40px" value='查询'> &nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </table>
        </form>
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
							<td nowrap="nowrap" class="NormalColumnTitle">
								文件标题
							</td>
							<td class="NormalColumnTitle" width="120">
								发文类别
							</td>
							<td class="NormalColumnTitle" width="120">
								文件编号
							</td>
							<td class="NormalColumnTitle" width="120">
								密级
							</td>
							<td class="NormalColumnTitle" width="120">
								缓急时限
							</td>
							<td class="NormalColumnTitle" width="120">
								签发日期
							</td>
							<td class="NormalColumnTitle" width="120">
								拟稿部门
							</td>
							<td nowrap="nowrap" class="NormalColumnTitle" width="200">
								备注
							</td>
							<td nowrap="nowrap" class="NormalColumnTitle">
								操作
							</td>
						</tr>
						<%
							for (int i = 0; i < list.size(); i++) {
								Map map = (Map) list.get(i);

						%>
						<tr>
							<td class="NormalDataColumn" align="center">
								<%=pageBean.getPageSize()
						* (pageBean.getCurrentPage() - 1) + i + 1%>
							</td>
							<td class="NormalDataColumn" align="left">
								<a href="view.jsp?documentid=<%=StringUtil.parseNull(map.get("DOCUMENTID"),"") %>"><%=StringUtil.parseNull(map.get("BT"),"") %></a>
							</td>
							<td class="NormalDataColumn" align="center">
								<%=StringUtil.parseNull(map.get("LB"),"")%>&nbsp;
							</td>
							<td class="NormalDataColumn" align="center">
								<%=StringUtil.parseNull(map.get("WJBH"),"")%>&nbsp;
							</td>
							<td class="NormalDataColumn" align="center">
                                <%=StringUtil.parseNull(map.get("MMCD"),"")%>&nbsp;
							</td>
							<td class="NormalDataColumn" align="left">
								<%=StringUtil.parseNull(map.get("HJSX"),"")%>&nbsp;
							</td>
							<td class="NormalDataColumn" align="left">
								<%=StringUtil.parseNull(map.get("QFRQ"),"")%>&nbsp;
							</td>
							<td class="NormalDataColumn" align="left">
								<%=StringUtil.parseNull(map.get("NGBM"),"")%>&nbsp;
							</td>
							<td class="NormalDataColumn" align="left">
								<%=StringUtil.parseNull(map.get("BZ"),"")%>&nbsp;
							</td>
							<td class="NormalDataColumn" align="center" nowrap="nowrap">
                                <a href="./flow.jsp?processId=<%=StringUtil.parseNull(map.get("PROCESS_ID"),"")%>">[查看流程]</a>
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
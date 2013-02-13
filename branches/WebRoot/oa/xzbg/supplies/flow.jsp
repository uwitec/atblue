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
    String processId = StringUtil.parseNull(request.getParameter("processId"),"");
    Map paramMap = new HashMap();
    if(!StringUtil.isBlankOrEmpty(processId))
        paramMap.put("processId",processId);

	List list = oDao.getFlowList(processId);
    list = list == null?new ArrayList():list;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
        <script src="<%=request.getContextPath()%>/js/common.js"
                type="text/javascript" defer="true"></script>

        <link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet"  type="text/css">
        <link href="<%=request.getContextPath()%>/css/web.css" rel="stylesheet"  type="text/css">
        <link href="<%=request.getContextPath()%>/images/css.css" rel="stylesheet"  type="text/css">
	</head>
	<body>
    <table width="80%" align="center" height="25" border="0"
           cellpadding="0" cellspacing="0"
           background="<%=contentPath%>/images/mhead.jpg">
        <tr>
            <td width="3%" align="center">
                <img src="<%=contentPath%>/images/mlogo.jpg" width="11" height="11"
                     alt="">
            </td>
            <td width="15%" class="mhead">
                流程处理状态
            </td>
            <td align="left" class="mhead">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tbody>
                    <tr>
                        <td align="left">
                            <input type="button" class="button" onclick="window.history.go(-1);" style="width:40px"  value='返回'>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </table>
		<table width="80%" align="center" height="25" border="0"
			cellpadding="0" cellspacing="0">
			<tr>
				<td>
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="0" id="mtabtab" class="mtabtab">
						<tr>
							<th nowrap="nowrap"  width="2%">
								序号
							</th>
							<th nowrap="nowrap" >
								审批节点
							</th>
							<th >
								待处理人
							</th>
							<th >
								实际处理人
							</th>
						</tr>
						<%
							for (int i = 0; i < list.size(); i++) {
								Map map = (Map) list.get(i);
						%>
						<tr>
							<td class="form"  style="text-align: center;border-left: 1px solid #01a0fe;" class="form_th">
								<%=pageBean.getPageSize()
						* (pageBean.getCurrentPage() - 1) + i + 1%>
							</td>
							<td class="form" align="left" class="form_th">
								<%=StringUtil.parseNull(map.get("ACTIVITY_NAME"),"") %>&nbsp;
							</td>
							
							<td class="form" align="left" class="form_th">
								<%=StringUtil.parseNull(map.get("REAL_NAME"),"")%>&nbsp;
							</td>
							<td class="form" align="left" class="form_th">
                                <%=StringUtil.parseNull(map.get("REAL_NAME2"),"")%>
                                    &nbsp;
							</td>
						</tr>
						<%
							}
						%>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../import.jsp"%>
<jsp:useBean id="pageBean" class="cn.com.atblue.common.bean.PageBean"
	scope="page">
	<jsp:setProperty name="pageBean" property="*" />
</jsp:useBean>
<%
    CUser cUser = (CUser)session.getAttribute("cUser");
    cUser = cUser == null?new CUser():cUser;
    String orgId = cUser.getOrgnaId();
    String fzbm = StringUtil.parseNull(request.getParameter("fzbm"),"");
    String fymc = StringUtil.parseNull(request.getParameter("fymc"),"");
    String fyxm = StringUtil.parseNull(request.getParameter("fyxm"),"");
    String flag = StringUtil.parseNull(request.getParameter("flag"),"");
    Map paramMap = new HashMap();
    paramMap.put("userId",cUser.getUserId());
    if(!StringUtil.isBlankOrEmpty(fzbm))
        paramMap.put("fzbm",fzbm);
    if(!StringUtil.isBlankOrEmpty(fymc))
        paramMap.put("fymc",fymc);
    if(!StringUtil.isBlankOrEmpty(fyxm))
        paramMap.put("fyxm",fyxm);
	pageBean.setPageSize(pageSize);

	int totalRow =oDao.getWaitPagedYjhfyCount(paramMap);
	pageBean.setTotalRows(totalRow);
	List list = oDao.getWaitPagedYjhfyList(pageBean,paramMap);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
        <script src="<%=request.getContextPath()%>/js/common.js"
                type="text/javascript" defer="defer"></script>
        <link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet"  type="text/css">
        <link href="<%=request.getContextPath()%>/images/css.css" rel="stylesheet"  type="text/css">
        <script type="text/javascript" charset="GB2312"
                src="<%=request.getContextPath()%>/js/date/WdatePicker.js" defer="defer"></script>
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
                 预计划费用待审批
            </td>
            <td align="left" class="mhead">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tbody>
                    <tr>
                        <td align="left">
                            <font style="font-size: 14px">负责部门：</font>
                            <input name="fzbm"  type="text" value="<%=fzbm%>" />&nbsp;
                            <font style="font-size: 14px">费用名称：</font>
                            <input name="fymc"  type="text" value="<%=fymc%>" />&nbsp;
                            <font style="font-size: 14px">费用项目：</font>
                            <input name="fyxm"  type="text" value="<%=fyxm%>" />&nbsp;
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
						cellspacing="0" class="mtabtab" id="tab_id">
						<tr class="form_th">
							<th nowrap="nowrap"  width="40">
								序号
							</th>
                            <th nowrap="nowrap" >
                                负责部门
                            </th>
                            <th  nowrap="nowrap">
                                季度
                            </th>
                            <th  nowrap="nowrap">
                                费用名称
                            </th>
                            <th nowrap="nowrap">
                                费用项目
                            </th>
                            <th  nowrap="nowrap">
                                项目明细
                            </th>
                            <th nowrap="nowrap">
                                型号规格
                            </th>

                            <th  nowrap="nowrap">
                                预计费用（万元）
                            </th>
							<th nowrap="nowrap" >
								流程状态
							</th>
							<th nowrap="nowrap" >
								操作
							</th>
						</tr>
						<%
							for (int i = 0; i < list.size(); i++) {
								Map map = (Map) list.get(i);
						%>
						<tr onclick="setSelected(this,'tab_id','tr_head','<%=StringUtil.parseNull(map.get("SQID"),"") %>')">
							<td  style="text-align: center" nowrap="nowrap">
								<%=pageBean.getPageSize()
						* (pageBean.getCurrentPage() - 1) + i + 1%>
							</td>
                            <td  nowrap="nowrap" style="text-align: left">
                                <a href="view.jsp?sqid=<%=StringUtil.parseNull(map.get("SQID"),"") %>"><%=StringUtil.parseNull(map.get("FZBM"),"") %></a>
                            </td>
                            <td  style="text-align: left">
                                <%=StringUtil.parseNull(map.get("JD"),"")%>&nbsp;
                            </td>
                            <td  style="text-align: left">
                                <%=StringUtil.parseNull(map.get("FYMC"),"")%>&nbsp;
                            </td>
                            <td  align="center">
                                <%=StringUtil.parseNull(map.get("FYXM"),"")%>&nbsp;
                            </td>
                            <td  style="text-align: left">
                                <%=StringUtil.parseNull(map.get("XMMX"),"")%>&nbsp;
                            </td>
                            <td  style="text-align: left">
                                <%=StringUtil.parseNull(map.get("XHGZ"),"")%>&nbsp;
                            </td>
                            <td  style="text-align: left">
                                <%=StringUtil.parseNull(map.get("YJFY"),"")%>&nbsp;
                            </td>

							<td  style="text-align: center" nowrap="nowrap">
                                <a href="./flow.jsp?processId=<%=StringUtil.parseNull(map.get("PROCESS_ID"),"")%>">[查看流程]</a>
							</td>
							<td  style="text-align: center" nowrap="nowrap">
                                <input type="button" class="button" name="" style="width:60px"  value="审批" onclick="window.location='sp.jsp?sqid=<%=StringUtil.parseNull(map.get("SQID"),"") %>';"/>
                                &nbsp;
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
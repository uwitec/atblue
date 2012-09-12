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
    String hymc = StringUtil.parseNull(request.getParameter("hymc"),"");
    Map paramMap = new HashMap();
    if(!StringUtil.isBlankOrEmpty(hymc))
        paramMap.put("hymc",hymc);
    paramMap.put("userId",cUser.getUserId());
    pageBean.setPageSize(pageSize);

    int totalRow =oDao.getAlreadyPagedHysqCount(paramMap);
    pageBean.setTotalRows(totalRow);
    List list = oDao.getAlreadyPagedHysqList(pageBean,paramMap);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
        <script src="<%=request.getContextPath()%>/js/common.js"
                type="text/javascript" defer="true"></script>
        <link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/images/css.css" rel="stylesheet" type="text/css">
        <link href="<%=contentPath%>/css/office.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" charset="GB2312"
                src="<%=request.getContextPath()%>/js/date/WdatePicker.js" defer="true"></script>
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
                 会议申请已审批
            </td>
            <td align="left" class="mhead">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tbody>
                    <tr>
                        <td align="left">
                            <font style="font-size: 14px">会议名称：</font>
                            <input name="hymc" size="10" type="text" value="<%=hymc%>" />&nbsp;
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
							<th nowrap="nowrap"  width="4%">
								序号
							</th>
							<th nowrap="nowrap" >
								会议名称
							</th>
							
							<th >
								申请部门
							</th>
							<th >
								申请时间
							</th>
							<th >
								申请开始时间
							</th>
							<th >
								申请结束时间
							</th>
							<%--<th nowrap="nowrap" >--%>
								<%--会议内容--%>
							<%--</th>--%>
							<th nowrap="nowrap" >
								操作
							</th>
						</tr>
						<%
							for (int i = 0; i < list.size(); i++) {
								Map map = (Map) list.get(i);
                                oracle.sql.TIMESTAMP sTime = (oracle.sql.TIMESTAMP)map.get("SQKSSJ");
                                oracle.sql.TIMESTAMP eTime = (oracle.sql.TIMESTAMP)map.get("SQJSSJ");
						%>
						<tr onclick="setSelected(this,'tab_id','tr_head','<%=StringUtil.parseNull(map.get("SQID"),"") %>')">
							<td  align="center" nowrap="nowrap">
								<%=pageBean.getPageSize()
						* (pageBean.getCurrentPage() - 1) + i + 1%>
							</td>
							<td  align="left" style="text-align: left">
								<a href="view.jsp?sqid=<%=StringUtil.parseNull(map.get("SQID"),"") %>"><%=StringUtil.parseNull(map.get("HYMC"),"") %></a>
							</td>
							
							<td  align="left" style="text-align: left">
								<%=StringUtil.parseNull(map.get("ORGNA_NAME"),"")%>&nbsp;
							</td>
							<td  align="center">
								<%=StringUtil.parseNull(map.get("SQSJ"),"")%>&nbsp;
							</td>
							<td  align="center">
								<%if(sTime != null){ %>
                                <%=DateUtil.format(sTime.timestampValue(),"yyyy-MM-dd HH:mm")%>
                                <% }%>
                                    &nbsp;
							</td>
							<td  align="center">
                                <%if(eTime != null){ %>
                                <%=DateUtil.format(eTime.timestampValue(), "yyyy-MM-dd HH:mm")%>
                                <% }%>
							</td>
							<%--<td  align="left">--%>
								<%--<%=StringUtil.cutString(StringUtil.parseNull(map.get("HYNR"),""),25)%>--%>
							<%--</td>--%>
							<td  align="center" nowrap="nowrap">
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
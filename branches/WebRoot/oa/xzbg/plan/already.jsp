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
    String mc = StringUtil.parseNull(request.getParameter("mc"),"");
    Map paramMap = new HashMap();
    if(!StringUtil.isBlankOrEmpty(mc))
        paramMap.put("mc",mc);
    paramMap.put("userId",cUser.getUserId());
    pageBean.setPageSize(pageSize);

    int totalRow =officePlanDAO.getAlreadyPagedCount(paramMap);
    pageBean.setTotalRows(totalRow);
    List list = officePlanDAO.getAlreadyPagedList(pageBean,paramMap);
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
                 预计划费用支出已审批
            </td>
            <td align="left" class="mhead">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tbody>
                    <tr>
                        <td align="left">
                            费用名称：
                            <input name="mc" size="10" type="text" value="<%=mc%>" />&nbsp;
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
							<th nowrap="nowrap" >
								序号
							</th>
							<th nowrap="nowrap" >
								负责部门
							</th>
							<th  nowrap="nowrap">
								预计划费用标题
							</th>
							<th nowrap="nowrap">
								费用名称
							</th>
							<th  nowrap="nowrap">
								平均单价
							</th>
							<th  nowrap="nowrap">
								费用合计
							</th>
							<th nowrap="nowrap" >
								操作
							</th>
						</tr>
						<%
							for (int i = 0; i < list.size(); i++) {
								Map map = (Map) list.get(i);
								Map paramMap1 = new HashMap();
							    paramMap1.put("orgnaId",map.get("BM"));
							    COrgnization cOrgnization = orgnizationDAO.queryForBean(paramMap1);
							    cOrgnization = cOrgnization == null?new COrgnization():cOrgnization;
						%>
						<tr onclick="setSelected(this,'tab_id','tr_head','<%=StringUtil.parseNull(map.get("PKID"),"") %>')">
							<td  style="text-align: center;border-left: 1px solid #01a0fe;" >
								<%=pageBean.getPageSize()
						* (pageBean.getCurrentPage() - 1) + i + 1%>
							</td>
							<td  nowrap="nowrap" style="text-align: left">
								<%=StringUtil.parseNull(cOrgnization.getOrgnaName(),"&nbsp;") %>
							</td>
							
							<td  style="text-align: left">
								<a href="view.jsp?pkid=<%=StringUtil.parseNull(map.get("PKID"),"") %>&fkid=<%=StringUtil.parseNull(map.get("FKID"),"") %>"><%=StringUtil.parseNull(map.get("BT"),"&nbsp;")%></a>
							</td>
							<td  align="center">
								<%=StringUtil.parseNull(map.get("MC"),"&nbsp;")%>&nbsp;
							</td>
							<td  align="center">
                                <%=StringUtil.parseNull(map.get("DJ"),"&nbsp;")%>
                                    &nbsp;
							</td>
							<td  align="center">
                                <%=StringUtil.parseNull(map.get("FY"),"&nbsp;")%>
							</td>
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
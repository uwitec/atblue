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
    String yymc = StringUtil.parseNull(request.getParameter("yymc"),"");
    Map paramMap = new HashMap();
    if(!StringUtil.isBlankOrEmpty(yymc))
        paramMap.put("yymc",yymc);
    paramMap.put("userId",cUser.getUserId());
    pageBean.setPageSize(pageSize);

    int totalRow =oDao.getAlreadyPagedYysqCount(paramMap);
    pageBean.setTotalRows(totalRow);
    List list = oDao.getAlreadyPagedYysqList(pageBean,paramMap);
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
                 用印申请已审批
            </td>
            <td align="left" class="mhead">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tbody>
                    <tr>
                        <td align="left">
                            用印名称：
                            <input name="yymc" size="10" type="text" value="<%=yymc%>" />&nbsp;
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
						<tr class="form_th">
							<td nowrap="nowrap"  width="40">
								序号
							</td>
                            <td nowrap="nowrap" >
                                用印名称
                            </td>
                            <td  width="120">
                                用印部门
                            </td>
                            <td  width="120">
                                申请时间
                            </td>
                            <td  width="120">
                                用印开始时间
                            </td>
                            <td  width="120">
                                用印结束时间
                            </td>
                            <td nowrap="nowrap"  width="200">
                                用印事由
                            </td>
							<td nowrap="nowrap" >
								操作
							</td>
						</tr>
						<%
							for (int i = 0; i < list.size(); i++) {
								Map map = (Map) list.get(i);
						%>
						<tr>
							<td  align="center">
								<%=pageBean.getPageSize()
						* (pageBean.getCurrentPage() - 1) + i + 1%>
							</td>
                            <td  align="left">
                                <a href="view.jsp?sqid=<%=StringUtil.parseNull(map.get("SQID"),"") %>"><%=StringUtil.parseNull(map.get("YYMC"),"") %></a>
                            </td>

                            <td  align="left">
                                <%=StringUtil.parseNull(map.get("ORGNA_NAME"),"")%>&nbsp;
                            </td>
                            <td  align="center">
                                <%=StringUtil.parseNull(map.get("SQSJ"),"")%>&nbsp;
                            </td>
                            <td  align="center">
                                <%=StringUtil.parseNull(map.get("YYKSSJ"),"")%>
                                &nbsp;
                            </td>
                            <td  align="center">
                                <%=StringUtil.parseNull(map.get("YYJSSJ"),"")%>
                            </td>
                            <td  align="left">
                                <%=StringUtil.cutString(StringUtil.parseNull(map.get("YYSY"),""),25)%>
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
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

	int totalRow =officeWjspDAO.getWaitPagedCount(paramMap);
	pageBean.setTotalRows(totalRow);
	List list = officeWjspDAO.getWaitPagedList(pageBean,paramMap);
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
        <script type="text/javascript" charset="GB2312"
                src="<%=request.getContextPath()%>/js/date/WdatePicker.js" defer="defer"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
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
                 文件待审批
            </td>
            <td align="left" class="mhead">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tbody>
                    <tr>
                        <td align="left">
                            <font style="font-size: 14px">文件标题： </font>
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
						cellspacing="0" class="mtabtab" id="tab_id">
						<tr>
							<th nowrap="nowrap"  width="40">
								序号
							</th>
							<th nowrap="nowrap" >
								文件标题
							</th>
							<th  width="120">
								发文类别
							</th>
							<th  width="120">
								文件编号
							</th>
							<th  width="120">
								密级
							</th>
							<th  width="120">
								缓急时限
							</th>
							<th  width="120">
								签发日期
							</th>
							<th  width="120">
								拟稿部门
							</th>
							<th nowrap="nowrap"  width="200">
								备注
							</th>
							<th nowrap="nowrap"  width="80">
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
						<tr onclick="setSelected(this,'tab_id','tr_head','<%=StringUtil.parseNull(map.get("DOCUMENTID"),"") %>')">
							<td  align="center">
								<%=pageBean.getPageSize()
						* (pageBean.getCurrentPage() - 1) + i + 1%>
							</td>
							<td  align="left" style="text-align: left" nowrap="nowrap">
								<a href="view.jsp?documentid=<%=StringUtil.parseNull(map.get("DOCUMENTID"),"") %>"><%=StringUtil.parseNull(map.get("BT"),"") %></a>
							</td>
							<td  align="center">
								<%=StringUtil.parseNull(map.get("LB"),"")%>&nbsp;
							</td>
							<td  align="center" style="text-align: left">
								<%=StringUtil.parseNull(map.get("WJBH"),"")%>&nbsp;
							</td>
							<td  align="center">
                                <%=StringUtil.parseNull(map.get("MMCD"),"")%>&nbsp;
							</td>
							<td  align="left">
								<%=StringUtil.parseNull(map.get("HJSX"),"")%>&nbsp;
							</td>
							<td  align="left">
								<%=StringUtil.parseNull(map.get("QFRQ"),"")%>&nbsp;
							</td>
							<td  align="left">
								<%=StringUtil.parseNull(map.get("NGBM"),"")%>&nbsp;
							</td>
							<td  align="left" style="text-align: left">
								<%=StringUtil.parseNull(map.get("BZ"),"")%>&nbsp;
							</td>
							<td  align="center" nowrap="nowrap">
                                <a href="./flow.jsp?processId=<%=StringUtil.parseNull(map.get("PROCESS_ID"),"")%>">[查看流程]</a>
							</td>
							<td  nowrap="nowrap" style="text-align: center">
                                <input type="button" class="button" name=""  value="审批" onclick="window.location='sp.jsp?documentid=<%=StringUtil.parseNull(map.get("DOCUMENTID"),"") %>';"/>
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
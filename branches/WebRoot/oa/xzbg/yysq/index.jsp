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
	paramMap.put("orgnaId", _user.getOrgnaId()==null?"":_user.getOrgnaId());
	pageBean.setPageSize(pageSize);

	int totalRow =oDao.getPagedYysqCount(paramMap);
	pageBean.setTotalRows(totalRow);
	List list = oDao.getPagedYysqList(pageBean,paramMap);
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
        <script src="<%=request.getContextPath()%>/js/common.js"
                type="text/javascript" defer="defer"></script>
        <link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet" type="text/css">
        <link href="<%=contentPath%>/images/css.css" rel="stylesheet" type="text/css">
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
			if(window.confirm("确认删除该用印申请?")){
				window.location=url;
			}
			return;
		}
        function tj(sid,pid,cid,id){
            var selUserId = document.all[id+"nextUserId"].value;
            if(selUserId == null || selUserId == ''){
                alert("请先选择进行审批的用户！");
                document.all[id+"nextUserId"].focus();
                return ;
            }
            window.location = "tj.jsp?selUserId="+selUserId+"&connectId="+cid+"&sqId="+sid+"&processId="+pid;
        }
		</script>
	</head>
	<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
    <form name="form1" action=""  style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px">
    <table width="100%" align="center" height="25" border="0"
           cellpadding="0" cellspacing="0">
        <tr>
            <td align="left" class="mhead">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tbody>
                    <tr>
                        <td class="head_left">
                            用印名称：
                        </td>
                        <td class="head_right">
                            <input name="yymc"  type="text" value="<%=yymc%>" />
                            &nbsp;
                            <input type="submit" class="button"  style="width:40px" value='查询'> &nbsp;&nbsp;&nbsp;
                            <input type="button" class="button" onclick="window.location = 'add.jsp';" style="width:40px"  value='新增'>
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
						cellspacing="0" id="mtabtab">
						<tr>
							<td nowrap="nowrap" class="head" width="2%">
								序号
							</td>
							<td nowrap="nowrap" class="head" width="120">
								用印名称
							</td>
							
							<td class="head" width="120">
								用印部门
							</td>
							<td class="head" width="120">
								申请时间
							</td>
							<td class="head" width="120">
								用印开始时间
							</td>
							<td class="head" width="120">
								用印结束时间
							</td>
							<td nowrap="nowrap" class="head" width="200">
								用印事由
							</td>
							<td nowrap="nowrap" class="head" width="80">
								申请状态
							</td>
							<td nowrap="nowrap" class="head">
								操作
							</td>
						</tr>
						<%
							for (int i = 0; i < list.size(); i++) {
								Map map = (Map) list.get(i);
						%>
						<tr>
							<td class="form" style="text-align: center;border-left: 1px solid #01a0fe;" >
								<%=pageBean.getPageSize()
						* (pageBean.getCurrentPage() - 1) + i + 1%>
							</td>
							<td class="form" nowrap="nowrap" style="text-align: left">
								<a href="view.jsp?sqid=<%=StringUtil.parseNull(map.get("SQID"),"") %>"><%=StringUtil.parseNull(map.get("YYMC"),"") %></a>
							</td>
							
							<td class="form" style="text-align: left">
								<%=StringUtil.parseNull(map.get("ORGNA_NAME"),"")%>&nbsp;
							</td>
							<td class="form" align="center">
								<%=StringUtil.parseNull(map.get("SQSJ"),"")%>&nbsp;
							</td>
							<td class="form" align="center">
                                <%=StringUtil.parseNull(map.get("YYKSSJ"),"")%>
                                    &nbsp;
							</td>
							<td class="form" align="center">
                                <%=StringUtil.parseNull(map.get("YYJSSJ"),"")%>
							</td>
							<td class="form" style="text-align: left">
								<%=StringUtil.cutString(StringUtil.parseNull(map.get("YYSY"),""),25)%>
							</td>
							<td class="form" align="center">
								<%String sqzt = StringUtil.parseNull(map.get("SQZT"),"");
                                     if("已完成".equals(sqzt)){ %>
                                        <font color="green"><%=sqzt%></font>
                                <%}else if("正在审批".equals(sqzt)) { %>
                                        <font color="red"><%=sqzt%></font>
                                <%}else{  %>
                                        <%=sqzt%>
                                <% }
                                %>&nbsp;
							</td>
							<td class="form" align="center" nowrap="nowrap">
                                <%
                                    if("已申请".equals(StringUtil.parseNull(map.get("SQZT"),""))){
                                    String processId = StringUtil.parseNull(map.get("PROCESS_ID"),"");
                                    String connectId = StringUtil.parseNull(map.get("CONNECT_ID"),"");
                                     String nextRole = workFlow.getNextRoleName(connectId,"1");
                                     String options = workFlow.getNextUserSelectOptions(nextRole,orgId);
                                %>
                                     发送给&nbsp;<%=nextRole%>
                                <select name="<%=StringUtil.parseNull(map.get("SQID"),"")%>nextUserId">
                                <%=StringUtil.parseNull(options,"")%>
                                </select>审批<input type="button" class="button"  style="width:40px" value="提交" onclick="tj('<%=StringUtil.parseNull(map.get("SQID"),"")%>','<%=processId%>','<%=connectId%>','<%=StringUtil.parseNull(map.get("SQID"),"")%>');"/>
                                <% }else if("已保存".equals(StringUtil.parseNull(map.get("SQZT"),""))){%>
                                <a href="./edit.jsp?sqid=<%=StringUtil.parseNull(map.get("SQID"),"")%>">[编辑]</a>&nbsp;
                                <a href="javascript:onDelete('./delete.jsp?sqid=<%=StringUtil.parseNull(map.get("SQID"),"")%>');">[删除]</a>&nbsp;
                                <%   }else{ %>
                                <a href="./flow.jsp?processId=<%=StringUtil.parseNull(map.get("PROCESS_ID"),"")%>">[查看流程]</a>
                                <%  }
                                %>

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
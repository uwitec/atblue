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
	pageBean.setPageSize(pageSize);

	int totalRow =officeWjspDAO.getPagedCount(paramMap); 
	pageBean.setTotalRows(totalRow); 
	List list = officeWjspDAO.getPagedList(pageBean,paramMap);
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
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
			if(window.confirm("确认删除该会议申请?")){
				window.location=url;
			}
			return;
		}
        function tj(sid,pid,cid,id){
            var selUserId = document.getElementsByName(id+"nextUserId")[0].value;
            if(selUserId == null || selUserId == ''){
                alert("请先选择进行审批的用户！");
                document.all[id+"nextUserId"].focus();
                return ;
            }
            window.location = "tj.jsp?selUserId="+selUserId+"&connectId="+cid+"&documentid="+sid+"&processId="+pid;
        }
        function qz(processId,connectId){
            window
                    .open(
                    "<%=request.getContextPath()%>/oa/qpd/view.jsp?formId=20b9a84e-51ab-4af8-9a59-e11316bfc5c9&connectId="+connectId+"&processId="+processId,
                    "mywindow",
                    "height="
                            + 800
                            + ",width="
                            + 700
                            + ",status=0,toolbar=no,menubar=no,location=no,scrollbars=yes,top="
                            + 0
                            + ",left="
                            + 0
                            + ",resizable=yes,modal=yes,dependent=yes,dialog=yes,minimizable=no");
        }
		</script>
	</head>
	<body>
    <form name="form1" action=""  style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px">
  <input type="hidden" name="qzgz" id="qzgz">
    <table width="100%" align="center" height="25" border="0"
           cellpadding="0" cellspacing="0"
           background="<%=contentPath%>/images/mhead.jpg">
        <tr>
            <td width="3%" align="center">
                <img src="<%=contentPath%>/images/mlogo.jpg" width="11" height="11"
                     alt="">
            </td>
            <td width="15%" class="mhead">
                 文件审批
            </td>
            <td align="left" class="mhead">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tbody>
                    <tr>
                        <td align="left">
                            <font style="font-size: 12px">文件标题：</font>
                            <input name="bt" size="10" type="text" value="<%=bt%>" />&nbsp;
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
			cellpadding="0" cellspacing="0" >
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
							<th  nowrap="nowrap">
								发文类别
							</th>
							<th  nowrap="nowrap">
								文件编号
							</th>
							<th  nowrap="nowrap">
								密级
							</th>
							<th  nowrap="nowrap">
								缓急时限
							</th>
							<th  nowrap="nowrap">
								签发日期
							</th>
							<th  nowrap="nowrap">
								拟稿部门
							</th>
							<th nowrap="nowrap">
								申请状态
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
							<td class="form_th" align="center">
								<%=pageBean.getPageSize()
						* (pageBean.getCurrentPage() - 1) + i + 1%>
							</td>
							<td class="form_th" style="text-align: left"  nowrap="nowrap">
								<a href="view.jsp?documentid=<%=StringUtil.parseNull(map.get("DOCUMENTID"),"") %>"><%=StringUtil.parseNull(map.get("BT"),"") %></a>
							</td>
							<td class="form_th" align="center">
								<%=StringUtil.parseNull(map.get("LB"),"")%>&nbsp;
							</td>
							<td class="form_th" style="text-align: left">
								<%=StringUtil.parseNull(map.get("WJBH"),"")%>&nbsp;
							</td>
							<td class="form_th" align="center">
                                <%=StringUtil.parseNull(map.get("MMCD"),"")%>&nbsp;
							</td>
							<td class="form_th" align="left">
								<%=StringUtil.parseNull(map.get("HJSX"),"")%>&nbsp;
							</td>
							<td class="form_th" align="left">
								<%=StringUtil.parseNull(map.get("QFRQ"),"")%>&nbsp;
							</td>
							<td class="form_th" align="left">
								<%=StringUtil.parseNull(map.get("ORGNA_NAME"),"")%>&nbsp;
							</td>
							<td class="form_th" style="text-align: center">
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
							<td class="form_th" align="center" nowrap="nowrap">
                                 <%
                                    String processId = StringUtil.parseNull(map.get("PROCESS_ID"),"");
                                    String connectId = StringUtil.parseNull(map.get("CONNECT_ID"),"");
                                    if("已申请".equals(StringUtil.parseNull(map.get("SQZT"),""))){
                                     String nextRole = workFlow.getNextRoleName(connectId,"1");
                                     String options = workFlow.getNextUserSelectOptions(nextRole,orgId);
                                %>
                                     发送给&nbsp;<%=nextRole%>
                                <select name="<%=StringUtil.parseNull(map.get("DOCUMENTID"),"")%>nextUserId">
                                <%=StringUtil.parseNull(options,"")%>
                                </select>审批<input type="button" class="button"  style="width:40px" value="提交" onclick="tj('<%=StringUtil.parseNull(map.get("DOCUMENTID"),"")%>','<%=processId%>','<%=connectId%>','<%=StringUtil.parseNull(map.get("DOCUMENTID"),"")%>');"/>
                                <a href="javascript:onDelete('./delete.jsp?sqid=<%=StringUtil.parseNull(map.get("SQID"),"")%>');">[删除]</a>&nbsp;
                                <% }else if("已保存".equals(StringUtil.parseNull(map.get("SQZT"),""))){%>
                                <a href="./edit.jsp?documentid=<%=StringUtil.parseNull(map.get("DOCUMENTID"),"")%>">[编辑]</a>&nbsp;
                                <a href="javascript:onDelete('./delete.jsp?documentid=<%=StringUtil.parseNull(map.get("DOCUMENTID"),"")%>');">[删除]</a>&nbsp;
                                <%   }else{ %>
                                <a href="javascript:onDelete('./delete.jsp?documentid=<%=StringUtil.parseNull(map.get("DOCUMENTID"),"")%>');">[删除]</a>&nbsp;
                                <a href="./flow.jsp?processId=<%=StringUtil.parseNull(map.get("PROCESS_ID"),"")%>">[查看流程]</a>&nbsp;
                                <a href="#" onclick="qz('<%=processId%>','<%=connectId%>');">[查看签字]</a>
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
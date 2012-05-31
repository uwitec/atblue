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
    String flag = StringUtil.parseNull(request.getParameter("flag"),"");
    Map paramMap = new HashMap();
    if(!StringUtil.isBlankOrEmpty(hymc))
        paramMap.put("hymc",hymc);
	pageBean.setPageSize(pageSize);

	int totalRow =oDao.getPagedHysqCount(paramMap);
	pageBean.setTotalRows(totalRow);
	List list = oDao.getPagedHysqList(pageBean,paramMap);
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
        <script src="<%=request.getContextPath()%>/js/common.js"
                type="text/javascript" defer="defer"></script>
        <link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/images/css.css" rel="stylesheet" type="text/css">
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
        function tj(sid,pid,cid,id){
            var selUserId = document.getElementsByName(id+"nextUserId")[0].value;
            if(selUserId == null || selUserId == ''){
                alert("请先选择进行审批的用户！");
                document.all[id+"nextUserId"].focus();
                return ;
            }
            window.location = "tj.jsp?selUserId="+selUserId+"&connectId="+cid+"&sqId="+sid+"&processId="+pid;
        }
        function qz(processId,connectId,sqid){
            window
                    .open(
                    "./hysqqpd.jsp?formId=9d4d71dc-3497-4c97-bf3a-92cbb31b493a&connectId="+connectId+"&processId="+processId+"&sqid="+sqid,
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
        function yj(sqid){
            window
                    .open(
                    "./yj.jsp?sqid="+sqid,
                    "mywindow",
                    "height="
                            + 500
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
    <table width="100%" align="center" height="25" border="0"
           cellpadding="0" cellspacing="0"
           background="<%=contentPath%>/images/mhead.jpg">
        <tr>
            <td width="3%" align="center">
                <img src="<%=contentPath%>/images/mlogo.jpg" width="11" height="11"
                     alt="">
            </td>
            <td width="15%" class="mhead">
                 会议申请
            </td>
            <td align="left" class="mhead">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tbody>
                    <tr>
                        <td align="left">
                            <font style="font-size: 14px">会议名称：</font>
                            <input name="hymc" size="10" type="text" value="<%=hymc%>" />&nbsp;
                            <input type="submit" class="button"  style="width:40px" value='查询'> &nbsp;&nbsp;&nbsp;
                            <input type="hidden" class="button" onclick="window.location = 'add.jsp';" style="width:40px"  value='新增'>
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
						cellspacing="0" id="tab_id" class="mtabtab">
						<tr class="form_th">
							<th nowrap="nowrap" width="40">
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
							<th nowrap="nowrap">
								党办意见
							</th>
							<th nowrap="nowrap" >
								申请状态
							</th>
							<th nowrap="nowrap" width="3%">
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
							<td  style="text-align: center;border-left: 1px solid #01a0fe;" nowrap="nowrap">
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
							<%--<td  align="left" title="<%=StringUtil.parseNull(map.get("HYNR"),"")%>"  style="text-align: left">--%>
								<%--&lt;%&ndash;<%=StringUtil.cutString(StringUtil.parseNull(map.get("HYNR"),""),25)%>&ndash;%&gt;--%>
							<%--</td>--%>
							<td  align="center" nowrap="nowrap">
                             <a href="#" onclick="yj('<%=StringUtil.parseNull(map.get("SQID"),"")%>');">[党办意见]</a>
							</td>
							<td  align="center"> &nbsp;
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
							<td  align="center" nowrap="nowrap">
                                <%
                                    String processId = StringUtil.parseNull(map.get("PROCESS_ID"),"");
                                    String connectId = StringUtil.parseNull(map.get("CONNECT_ID"),"");
                                %>
                                <a href="./flow.jsp?processId=<%=StringUtil.parseNull(map.get("PROCESS_ID"),"")%>">[查看流程]</a>&nbsp;
                                <a href="#" onclick="qz('<%=processId%>','<%=connectId%>','<%=StringUtil.parseNull(map.get("SQID"),"")%>');">[打印]</a>
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
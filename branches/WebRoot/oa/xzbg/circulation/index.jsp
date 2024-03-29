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
	OfficeCirculationDAO officeCirculationDAO = (OfficeCirculationDAO)SpringFactory.instance.getBean("officeCirculationDAO");
	OfficeCirculationCheckDAO officeCirculationCheckDAO = (OfficeCirculationCheckDAO)SpringFactory.instance.getBean("officeCirculationCheckDAO");
	//判断权限
	boolean isRole = dao
			.isRole(_user.getUserId(), officeRole);
    String wjmc = StringUtil.parseNull(request.getParameter("wjmc"),"");
	Map paramMap = new HashMap();
	pageBean.setPageSize(pageSize);
	StringBuilder sb = new StringBuilder();
    sb.append(" where 1=1 ");
    if(!StringUtil.isBlankOrEmpty(wjmc)){
        sb.append(" and WJMC like '%"+wjmc+"%'");
    }
	sb.append("  order by lrsj desc");
	int totalRow = officeCirculationDAO.getByFreeSqlCount(sb.toString());
	pageBean.setTotalRows(totalRow);

	List list = officeCirculationDAO.getByFreeSql(sb.toString(),pageBean);
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>来文登记</title>
        <script src="<%=request.getContextPath()%>/js/common.js"
                type="text/javascript" defer="true"></script>
        <link href="<%=contentPath%>/css/css.css" rel="stylesheet" type="text/css">
        <link href="<%=contentPath%>/images/css.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">
			function onDelete(url){
				if(window.confirm("确认删除该文件?")){
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
                window.location = "tj.jsp?selUserId="+selUserId+"&connectId="+cid+"&pkId="+sid+"&processId="+pid;
            }
            function qz(processId,connectId){
                window
                        .open(
                        "<%=request.getContextPath()%>/oa/qpd/view.jsp?formId=5d97f266-6a7b-4deb-9aae-b7f056b280a4&connectId="+connectId+"&processId="+processId,
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

            function cyd(pkid,processId,formItemId){
                window
                        .open(
                        "wjcyd.jsp?pkid="+pkid+"&processId="+processId+"&formItemId="+formItemId,
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
            function cy(id){
                window.location = "chuanyue2.jsp?pkid="+id;

            }
		</script>
		
	</head>
	<body>
    <form action="" method="post">
		<table width="100%" align="center" height="25" border="0"
			cellpadding="0" cellspacing="0"
			background="<%=contentPath%>/images/mhead.jpg">
			<tr>
				<td width="3%" align="center">
					<img src="<%=contentPath%>/images/mlogo.jpg" width="11"
						height="11" alt="">
				</td>
				<td width="15%" class="mhead">
					来文登记
				</td>
				<td align="left" class="mhead">
                    <font style="font-size: 12px">文件名称：</font>
                    <input name="wjmc"  type="text" value="<%=wjmc%>" />&nbsp;
                    <input type="submit" class="button"  style="width:40px" value='查询'> &nbsp;&nbsp;
					&nbsp;
                    <input type="button" value="来文登记" onclick="window.location = 'add.jsp';" class="button"/>
				</td>
			</tr>
		</table>
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
                                文件名称
                            </th>
							<th nowrap="nowrap">
								文件编号
							</th>
							

							<th  nowrap="nowrap">
								来文时间
							</th>
							<th  nowrap="nowrap">
								来文单位
							</th>
							<th  nowrap="nowrap">
								状态
							</th>
							<th  width="3%">
								操作
							</th>
						</tr>
						<%
							for (int i = 0; i < list.size(); i++) {
								OfficeCirculation document = (OfficeCirculation) list.get(i);
//								WInstance history = workFlow.getHistory(document.getZt());
//								if(history==null) continue;
//								String instanceid = history.getInstanceId();
						%>
						<tr onclick="setSelected(this,'tab_id','tr_head','<%=StringUtil.parseNull(document.getCyid(),"") %>')">
							<td  align="center" class="form_th">
								<%=pageBean.getPageSize()
						* (pageBean.getCurrentPage() - 1) + i + 1%>
							</td>
                            <td  align="center" style="text-align: left" style="text-align: left;width: 600px"  class="form_th" >
                                <a href="view.jsp?pkid=<%=document.getCyid() %>"><%=document.getWjmc()%></a>&nbsp;
                            </td>
							<td  align="center" style="text-align: left" class="form_th" nowrap="nowrap">
								<%=document.getWjbh()%> &nbsp;
							</td>
							<td  align="center" nowrap="nowrap" class="form_th">
								<%=DateUtil.format(document.getLwsj(),"yyyy-MM-dd")%>&nbsp;
							</td>
							<td  align="center" style="text-align: left" nowrap="nowrap" class="form_th">
								<%=StringUtil.parseNull(document.getLwdw(),"")%>&nbsp;
							</td>
							<td  align="center" nowrap="nowrap" class="form_th">
                                <%String sqzt = StringUtil.parseNull(document.getZt(),"");
                                    if("已完成".equals(sqzt)){ %>
                                <font color="green"><%=sqzt%></font>
                                <%}else if("正在审批".equals(sqzt)) { %>
                                <font color="red"><%=sqzt%></font>
                                <%}else{  %>
                                <%=sqzt%>
                                <% }
                                %>&nbsp;
							</td>
							<td  align="center" nowrap="nowrap" class="form_th">
                                <%
                                    if("已申请".equals(StringUtil.parseNull(document.getZt(),""))){
                                        String processId = StringUtil.parseNull(document.getProcessId(),"");
                                        String connectId = StringUtil.parseNull(document.getConnectId(),"");
                                        String nextRole = workFlow.getNextRoleName(connectId,"1");
                                        String options = workFlow.getNextUserSelectOptions(nextRole,orgId);
                                %>
                                发送给&nbsp;<%=nextRole%>
                                <select name="<%=StringUtil.parseNull(document.getCyid(),"")%>nextUserId">
                                    <%=StringUtil.parseNull(options,"")%>
                                </select>审批<input type="button" class="button"  style="width:40px" value="提交" onclick="tj('<%=StringUtil.parseNull(document.getCyid(),"")%>','<%=processId%>','<%=connectId%>','<%=StringUtil.parseNull(document.getCyid(),"")%>');"/>
                                <a href="javascript:onDelete('./delete.jsp?pkid=<%=StringUtil.parseNull(document.getCyid(),"")%>');">[删除]</a>&nbsp;
                                <% }else if("已保存".equals(StringUtil.parseNull(document.getZt(),""))){%>
                                <a href="./edit.jsp?pkid=<%=StringUtil.parseNull(document.getCyid(),"")%>">[编辑]</a>&nbsp;
                                <a href="javascript:onDelete('./delete.jsp?pkid=<%=StringUtil.parseNull(document.getCyid(),"")%>');">[删除]</a>&nbsp;
                                <%   }else{ %>
                                <a href="javascript:onDelete('./delete.jsp?pkid=<%=StringUtil.parseNull(document.getCyid(),"")%>');">[删除]</a>&nbsp;
                                <a href="./flow.jsp?processId=<%=StringUtil.parseNull(document.getProcessId(),"")%>">[查看流程]</a>
                                <a href="#" onclick="qz('<%=document.getProcessId()%>','<%=document.getConnectId()%>');">[查看签字]</a>
                                <a href="#" onclick="cyd('<%=StringUtil.parseNull(document.getCyid(),"")%>','<%=document.getProcessId()%>','a69bdce8-143c-43ba-8ba1-94ad25a8dbe6');">[文件传阅单]</a>
                                <%  }
                                %>
                                <%sqzt = StringUtil.parseNull(document.getZt(),"");
                                    if("已完成".equals(sqzt) && !"正在传阅中".equals(sqzt)){ %>
                                <a href="#" onclick="cy('<%=StringUtil.parseNull(document.getCyid(),"")%>');">[确定传阅人]</a>
                                <%}%>&nbsp;
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
					<%=pageBean.getHtml2(paramMap)%>
				</td>
			</tr>
		</table>
    </form>
	</body>
</html>
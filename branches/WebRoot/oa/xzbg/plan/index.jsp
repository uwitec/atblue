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
    String ny1= StringUtil.parseNull(request.getParameter("ny1"),"");
    String ny2= StringUtil.parseNull(request.getParameter("ny2"),"");
    String flag = StringUtil.parseNull(request.getParameter("flag"),"");
    Map paramMap = new HashMap();
    if(!StringUtil.isBlankOrEmpty(mc)){
        paramMap.put("bt",mc);
     }
	paramMap.put("bm", _user.getOrgnaId()==null?"":_user.getOrgnaId());
	pageBean.setPageSize(pageSize);
	int totalRow =officePlanDAO.getPagedCount(paramMap);
	pageBean.setTotalRows(totalRow);
	List list = officePlanDAO.getPagedList(pageBean,paramMap); 
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
        <script src="<%=request.getContextPath()%>/js/common.js"
                type="text/javascript" defer="true"></script>
        <link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet" type="text/css">
        <link href="<%=contentPath%>/images/css.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" charset="GB2312"
                src="<%=request.getContextPath()%>/js/date/WdatePicker.js" defer="true"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
		<script type="text/javascript">
		function onDelete(url){
			if(window.confirm("确认删除该用印申请?")){
				window.location=url;
			}
			return;
		}
        function tj(sid,pid,cid){
            var selUserId = document.getElementsByName(sid+"nextUserId")[0].value;
            if(selUserId == null || selUserId == ''){
                alert("请先选择进行审批的用户！");
                document.all[sid+"nextUserId"].focus();
                return ;
            }
            window.location = "tj.jsp?selUserId="+selUserId+"&connectId="+cid+"&pkid="+sid+"&processId="+pid;
        }
        function qz(processId,connectId,sqid){
            window
                    .open(
                    "<%=request.getContextPath()%>/oa/qpd/qpd.jsp?formId=855a093f-7777-43bb-9512-a05cfb03bf03&connectId="+connectId+"&processId="+processId+"&sqid="+sqid,
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
         function qz1(processId,connectId,sqid){
            window
                    .open(
                    "<%=request.getContextPath()%>/oa/qpd/view.jsp?formId=855a093f-7777-43bb-9512-a05cfb03bf03&connectId="+connectId+"&processId="+processId+"&sqid="+sqid,
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
           function importExcel(){
           	 window.location="import_excel.jsp";
            }

		</script>
	</head>
	<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
    <form name="formtj" method="post" action="index.jsp" style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px">
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
                    预计划费用支出
                </td>
                <td align="left" class="mhead">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tbody>
                        <tr>
                            <td align="left">
                                <font style="font-size: 12px">预计划费用标题：</font>
                                <input name="mc"  type="text" value="<%=mc%>" />&nbsp;
                                <input type="submit" class="button"  style="width:40px" value='查询'>
                                &nbsp;
                                <input type="button" class="button" onclick="window.location = 'add.jsp';" style="width:40px"  value='新增'>
                                &nbsp;
                                <a href="../../../soft/template.xls">预计划费用模板</a>
                                &nbsp;
								<input type="button" class="button" id="button"	onclick="importExcel();" value="导入">
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
							<th nowrap="nowrap"  width="2%">
								序号
							</th>
							<th nowrap="nowrap" >
								负责部门
							</th>
							<th  nowrap="nowrap">
								预计划费用标题
							</th>
							<%--<th  nowrap="nowrap">--%>
								<%--平均单价--%>
							<%--</th>--%>
							<th  nowrap="nowrap">
								费用合计（万元）
							</th>
							<th nowrap="nowrap"  width="80">
								状态
							</th>
							<th nowrap="nowrap" >
								操作
							</th>
						</tr>
						<%
						String pkidSplit="";
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
							<%--<td  align="center">--%>
                                <%--<%=StringUtil.parseNull(map.get("DJ"),"&nbsp;")%>--%>
                                    <%--&nbsp;--%>
							<%--</td>--%>
							<td  align="center">
                                <%=StringUtil.parseNull(map.get("FY"),"&nbsp;")%>
							</td>
							 <td  align="center" nowrap="nowrap">
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
                                    if("已申请".equals(StringUtil.parseNull(map.get("SQZT"),""))){
                                     String nextRole = workFlow.getNextRoleName(connectId,"1");
                                     String options = workFlow.getNextUserSelectOptions(nextRole,orgId);
                                %>
                                 <%--<a href="#" onclick="qz('<%=processId%>','<%=connectId%>','<%=StringUtil.parseNull(map.get("PKID"),"")%>');">[签字]</a>--%>
                                     发送给&nbsp;<%=nextRole%>
                                <select name="<%=StringUtil.parseNull(map.get("PKID"),"")%>nextUserId">
                                <%=StringUtil.parseNull(options,"")%>
                                </select>审批<input type="button" class="button"  style="width:40px" value="提交" onclick="tj('<%=StringUtil.parseNull(map.get("PKID"),"")%>','<%=processId%>','<%=connectId%>');"/>
                                <a href="javascript:onDelete('./delete.jsp?pkid=<%=StringUtil.parseNull(map.get("PKID"),"")%>');">[删除]</a>&nbsp;
                                <% }else if("已保存".equals(StringUtil.parseNull(map.get("SQZT"),""))){%>
                                <a href="./edit.jsp?pkid=<%=StringUtil.parseNull(map.get("PKID"),"")%>">[编辑]</a>&nbsp;
                                <a href="javascript:onDelete('./delete.jsp?pkid=<%=StringUtil.parseNull(map.get("PKID"),"")%>');">[删除]</a>&nbsp;
                                <%   }else if("已完成".equals(StringUtil.parseNull(map.get("SQZT"),""))){ %>
                                <a href="javascript:onDelete('./delete.jsp?pkid=<%=StringUtil.parseNull(map.get("PKID"),"")%>');">[删除]</a>&nbsp;
                                <a href="./flow.jsp?processId=<%=StringUtil.parseNull(map.get("PROCESS_ID"),"")%>">[查看流程]</a>&nbsp;
                                <a href="#" onclick="qz1('<%=processId%>','<%=connectId%>','<%=StringUtil.parseNull(map.get("PKID"),"")%>');">[签批单]</a>
                                <%    }else{ %>
                                <a href="javascript:onDelete('./delete.jsp?pkid=<%=StringUtil.parseNull(map.get("PKID"),"")%>');">[删除]</a>&nbsp;
                                <a href="./flow.jsp?processId=<%=StringUtil.parseNull(map.get("PROCESS_ID"),"")%>">[查看流程]</a>&nbsp;
                                <a href="#" onclick="qz1('<%=processId%>','<%=connectId%>','<%=StringUtil.parseNull(map.get("PKID"),"")%>');">[签批单]</a>
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
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
    String curRole = request.getParameter("curRole");
    cUser = cUser == null?new CUser():cUser;
    String orgId = cUser.getOrgnaId();
    String mc = StringUtil.parseNull(request.getParameter("mc"),"");
    Map paramMap = new HashMap();
    if(!StringUtil.isBlankOrEmpty(mc))
    paramMap.put("mc",mc);
    paramMap.put("roleflag",curRole);
    paramMap.put("sqr",cUser.getUserId());
	pageBean.setPageSize(pageSize);

	int totalRow =officeSuppliesDAO.getPagedCount(paramMap); 
	pageBean.setTotalRows(totalRow); 
	List list = officeSuppliesDAO.getPagedList(pageBean,paramMap);
	
	String formId="";
	if("1".equals(curRole)){
        formId="859106e7-46b6-49f7-a334-ccad832ffcd9";
	}else if("2".equals(curRole)){
        formId="83389b53-80e4-441c-8463-f4d39176bd23";
	}else if("3".equals(curRole)){
        formId="11a99f76-9309-452c-be1b-4c1a932462fd";
    }
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
        <script src="<%=request.getContextPath()%>/js/common.js"
                type="text/javascript" defer="true"></script>
        <link href="<%=contentPath%>/css/css.css" rel="stylesheet" type="text/css">
        <link href="<%=contentPath%>/images/css.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
		<script type="text/javascript">
		function onDelete(url){
			if(window.confirm("确认删除该会议申请?")){
				window.location=url;
			}
			return;
		}
        function tj(pid,cid,id){
            var selUserId = document.all[id+"nextUserId"];
//             if(document.form1.qzgz.value !="isSign"){
//				 	alert("本次需要审核的文档中没有您的签名印章，请签名后重新提交。");
//				    return false;
//		     }
            if(selUserId == null || selUserId.value == ''){
                alert("请先选择进行审批的用户！");
                document.all[id+"nextUserId"].focus();
                return ;
            }
            window.location = "tj.jsp?selUserId="+selUserId.value+"&connectId="+cid+"&processId="+pid+"&sqid="+id+"&varValue=1&curRole=<%=curRole%>";
        }
        function qz(processId,connectId){
            window
                    .open(
                    "<%=request.getContextPath()%>/oa/qpd/view.jsp?formId=<%=formId%>&curRole=<%=curRole%>&connectId="+connectId+"&processId="+processId,
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
        function qz2(processId,connectId,sqid){
            window
                    .open(
                    "<%=request.getContextPath()%>/oa/qpd/qpd.jsp?formId=<%=formId%>&curRole=<%=curRole%>&connectId="+connectId+"&processId="+processId+"&sqid="+sqid,
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
         function print(processId,connectId,sqid){
            var formId= "";
            window.open(
                    "./qtqpd.jsp?formId=<%=formId%>"+"&connectId="+connectId+"&processId="+processId+"&sqid="+sqid,
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
     <input type="hidden" name="curRole" value="<%=curRole%>">
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
                 请示报告
            </td>
            <td align="left" class="mhead">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tbody>
                    <tr>
                        <td align="left">
                            名称：
                            <input name="mc" size="10" type="text" value="<%=mc%>" />&nbsp;
                            <input type="submit" class="button"  style="width:40px" value='查询'> &nbsp;&nbsp;&nbsp;
                            <input type="button" class="button" onclick="window.location = 'add.jsp?curRole=<%=curRole%>';" style="width:40px"  value='新增'>
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
								名称
							</th>
							<th  nowrap="nowrap" >
								申请单位
							</th>
							<th  nowrap="nowrap" >
								申请时间
							</th>
							<th nowrap="nowrap" >
								申请状态
							</th>
							<th nowrap="nowrap"  width="10%">
								操作
							</th>
						</tr>
						<%
							for (int i = 0; i < list.size(); i++) {
								Map map = (Map) list.get(i);

						%>
						<tr onclick="setSelected(this,'tab_id','tr_head','<%=StringUtil.parseNull(map.get("SQID"),"") %>')">
							<td  align="center">
								<%=pageBean.getPageSize()
						* (pageBean.getCurrentPage() - 1) + i + 1%>
							</td>
							<td  align="left" style="text-align: left">
								<a href="view.jsp?sqid=<%=StringUtil.parseNull(map.get("SQID"),"") %>"><%=StringUtil.parseNull(map.get("MC"),"") %></a>
							</td>
							<td  style="text-align: left">
								<%=StringUtil.parseNull(map.get("ORGNA_NAME"),"")%>&nbsp;
							</td>
							<td  align="center" style="text-align: center">
								<%=StringUtil.parseNull(map.get("SQSJ"),"")%>&nbsp;
							</td>
							<td   style="text-align: center">
                                <%=StringUtil.parseNull(map.get("SQZT"),"")%>&nbsp;
							</td>
							<td class="NormalDataColumn" align="center" nowrap="nowrap">
                                 <%
                                    String processId = StringUtil.parseNull(map.get("PROCESS_ID"),"");
                                    String connectId = StringUtil.parseNull(map.get("CONNECT_ID"),"");
                                    if("已申请".equals(StringUtil.parseNull(map.get("SQZT"),""))){
                                     String nextRole = workFlow.getNextRoleName(connectId,"1");
                                     String options = workFlow.getNextUserSelectOptions(nextRole,orgId);
                                %>
                                <%--<input type="button" class="button"  style="width:40px" value="签字" onclick="qz2('<%=processId%>','<%=connectId%>','<%=StringUtil.parseNull(map.get("SQID"),"") %>');"/>--%>
                                &nbsp;发送给&nbsp;<%=nextRole%>
                                <select name="<%=StringUtil.parseNull(map.get("SQID"),"")%>nextUserId">
                                <%=StringUtil.parseNull(options,"")%>
                                </select>审批
                                <input type="button" class="button"  style="width:40px" value="提交" onclick="tj('<%=processId%>','<%=connectId%>','<%=StringUtil.parseNull(map.get("SQID"),"")%>');"/>
                                <a href="javascript:onDelete('./delete.jsp?sqid=<%=StringUtil.parseNull(map.get("SQID"),"")%>&curRole=<%=curRole%>');">[删除]</a>&nbsp;
                                <% }else if("已保存".equals(StringUtil.parseNull(map.get("SQZT"),""))){%>
                                <a href="./edit.jsp?sqid=<%=StringUtil.parseNull(map.get("SQID"),"")%>&curRole=<%=curRole%>">[编辑]</a>&nbsp;
                                <a href="javascript:onDelete('./delete.jsp?sqid=<%=StringUtil.parseNull(map.get("SQID"),"")%>&curRole=<%=curRole%>');">[删除]</a>&nbsp;
                                <%   }else{ %>
                                <a href="javascript:onDelete('./delete.jsp?sqid=<%=StringUtil.parseNull(map.get("SQID"),"")%>&curRole=<%=curRole%>');">[删除]</a>&nbsp;
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
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
    Map paramMap = new HashMap();
    paramMap.put("userId",cUser.getUserId());
    pageBean.setPageSize(pageSize);

    int totalRow =officeHolidayDAO.getAlreadyPagedCount(paramMap);
    pageBean.setTotalRows(totalRow);
    List list = officeHolidayDAO.getAlreadyPagedList(pageBean,paramMap);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
        <script src="<%=request.getContextPath()%>/js/common.js"
                type="text/javascript" defer="true"></script>
        <link href="<%=contentPath%>/css/css.css" rel="stylesheet" type="text/css">
        <link href="<%=contentPath%>/css/web.css" rel="stylesheet" type="text/css">
        <link href="<%=contentPath%>/images/css.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">
		function onDelete(url){
			if(window.confirm("确认删除该会议申请?")){
				window.location=url;
			}
			return;
		}
        function qz(processId,connectId,holidayid,roleFlag,sfbr){
            var formId= "";
            if("1" == roleFlag&&"1"==sfbr){
                formId="95cd282c-0a52-443f-82f8-9939d954af54";
            }else if("1" == roleFlag&&"0"==sfbr){
                formId="7e7220a8-1423-4db5-b4ee-90ef33b0c0ab";
            }else if("2" == roleFlag&&"1"==sfbr){
                formId="78c3cf78-a89a-4103-8d88-59578ce0fea7";
            }else if("2" == roleFlag&&"0"==sfbr){
                formId="e39db318-02c6-474e-a4cb-21f8914cb900";
            }
            window.open(
                    "./ybgbqpd.jsp?formId="+formId+"&curRole="+roleFlag+"&connectId="+connectId+"&processId="+processId+"&holidayid="+holidayid,
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
                 请销假审批
            </td>
            <td align="left" class="mhead">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tbody>
                    <tr>
                        <td align="left">
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
							<th nowrap="nowrap"  width="120">
								姓名
							</th>
							<th  width="120">
								单位
							</th>
							<th  width="200">
								外出时间
							</th>
							<th  width="120">
								外出地点
							</th>
							<th  width="200">
								外出事由
							</th>
							<th nowrap="nowrap"  width="8%">
								流程状态
							</th>
						</tr>
						<%
							for (int i = 0; i < list.size(); i++) {
								Map map = (Map) list.get(i);
                                String processId = StringUtil.parseNull(map.get("PROCESS_ID"),"");
                                String connectId = StringUtil.parseNull(map.get("CONNECT_ID"),"");
                                String roleFlag = StringUtil.parseNull(map.get("ROLEFLAG"),"");
                                String sfbr = StringUtil.parseNull(map.get("SFBR"),"");
						%>
						<tr onclick="setSelected(this,'tab_id','tr_head','<%=StringUtil.parseNull(map.get("HOLIDAYID"),"") %>')">
							<td  align="center" class="form_th">
								<%=pageBean.getPageSize()
						* (pageBean.getCurrentPage() - 1) + i + 1%>
							</td>
							<td  align="center" style="text-align: left" class="form_th">
								<a href="view.jsp?holidayid=<%=StringUtil.parseNull(map.get("HOLIDAYID"),"") %>"><%=StringUtil.parseNull(map.get("XM"),"") %></a>
							</td>
							<td  align="center" class="form_th">
								<%=StringUtil.parseNull(map.get("DW"),"")%>&nbsp;
							</td>
							<td  align="center" class="form_th">
								<%=map.get("KSSJ")+"至"+map.get("JSSJ")%>&nbsp;
							</td>
							<td  align="left" style="text-align: left" class="form_th">
                                <%=StringUtil.parseNull(map.get("WCDD"),"")%>&nbsp;
							</td>
							<td  align="left" style="text-align: left" class="form_th">
								<%=StringUtil.parseNull(map.get("WCSY"),"")%>&nbsp;
							</td>
							<td  align="center" nowrap="nowrap" class="form_th">
                                <a href="./flow.jsp?processId=<%=StringUtil.parseNull(map.get("PROCESS_ID"),"")%>">[查看流程]</a>
                                <a href="#" onclick="qz('<%=processId%>','<%=connectId%>','<%=StringUtil.parseNull(map.get("HOLIDAYID"),"")%>','<%=roleFlag%>','<%=sfbr%>');">[查看签批单]</a>
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
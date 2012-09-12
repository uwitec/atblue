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
    String wjmc = StringUtil.parseNull(request.getParameter("wjmc"),"");
    Map paramMap = new HashMap();
    if(!StringUtil.isBlankOrEmpty(wjmc))
        paramMap.put("wjmc",wjmc);
    paramMap.put("userId",cUser.getUserId());
    pageBean.setPageSize(pageSize);

    int totalRow =oDao.getAlreadyPagedOfficeCirculationCount(paramMap);
    pageBean.setTotalRows(totalRow);
    List list = oDao.getAlreadyPagedOfficeCirculationList(pageBean,paramMap);
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
    <link href="<%=request.getContextPath()%>/js/ext/resources/css/ext-all.css" rel="stylesheet" type="text/css">
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
                来文传阅审批
            </td>
            <td align="left" class="mhead">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tbody>
                    <tr>
                        <td align="left">
                            <font style="font-size: 14px">文件名称： </font>
                            <input name="wjmc" size="10" type="text" value="<%=wjmc%>" />&nbsp;
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
                    <th nowrap="nowrap"  width="40">
                        序号
                    </th>
                    <th nowrap="nowrap"  width="220">
                        文件编号
                    </th>

                    <th >
                        文件名称
                    </th>
                    <th  width="120">
                        来文时间
                    </th>
                    <th  width="120">
                        来文单位
                    </th>
                    <th width="5%" nowrap="nowrap">
                        流程状态
                    </th>
                </tr>
                <%
                    for (int i = 0; i < list.size(); i++) {
                        Map map = (Map) list.get(i);
                %>
                <tr onclick="setSelected(this,'tab_id','tr_head','<%=StringUtil.parseNull(map.get("CYID"),"") %>')">
                    <td  style="text-align: center" nowrap="nowrap">
                        <%=pageBean.getPageSize()
                                * (pageBean.getCurrentPage() - 1) + i + 1%>
                    </td>
                    <td  style="text-align: left" nowrap="nowrap">
                        <a href="view.jsp?pkid=<%=StringUtil.parseNull(map.get("CYID"),"") %>"><%=StringUtil.parseNull(map.get("WJBH"),"") %></a>
                    </td>

                    <td  style="text-align: left" nowrap="nowrap">
                        <%=StringUtil.parseNull(map.get("WJMC"),"")%>&nbsp;
                    </td>
                    <td  style="text-align: center" nowrap="nowrap">
                        <%=StringUtil.parseNull(map.get("LWSJ"),"")%>&nbsp;
                    </td>
                    <td  style="text-align: center" nowrap="nowrap">
                        <%=StringUtil.parseNull(map.get("LWDW"),"")%>
                        &nbsp;
                    </td>
                    <td  style="text-align: center" nowrap="nowrap">
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
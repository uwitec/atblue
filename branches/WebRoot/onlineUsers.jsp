<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="cn.com.atblue.manager.bean.CUser" %>
<%@ page import="java.util.Vector" %>
<%@ page import="cn.com.atblue.common.util.StringUtil" %>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    CUser cUser = (CUser)session.getAttribute("cUser");
    cUser = cUser == null?new CUser():cUser;
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>在线用户列表</title>
    <script src="<%=request.getContextPath()%>/js/common.js"
            type="text/javascript" defer="true"></script>
    <link href="<%=request.getContextPath()%>/images/css.css" rel="stylesheet"
          type="text/css">
</head>
<body>
<form name="form1" action=""  style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px">
    <table width="100%" align="center" height="25" border="0"
           cellpadding="0" cellspacing="0"
           background="<%=request.getContextPath()%>/images/mhead.jpg">
        <tr>
            <td width="3%" align="center">
                <img src="<%=request.getContextPath()%>/images/mlogo.jpg" width="11" height="11"
                     alt="">
            </td>
            <td width="15%" class="mhead">
                在线用户列表
            </td>
        </tr>
    </table>
</form>
<table width="100%" align="center" height="25" border="0"
       cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <table width="100%" border="0" align="center" cellpadding="0"  id="tab_id" name="tab_id"
                   cellspacing="0" class="mtabtab" id="mtabtab">
                <tr>
                    <td nowrap="nowrap" class="head" width="40">
                        序号
                    </td>
                    <td nowrap="nowrap" class="head">
                        登录名
                    </td>
                    <td class="head" width="30%">
                        姓名
                    </td>
                    <td class="head" width="120">
                        部门
                    </td>
                    <td class="head" width="120">
                        登录时间
                    </td>
                </tr>
                  <%
                        Vector vector = (Vector)application.getAttribute("activeSessions");
                      vector = vector == null?new Vector():vector;
                      for(int i=0;i<vector.size();i++){
                          HttpSession httpSession = (HttpSession)vector.get(i);
                          CUser cUser1 = (CUser)httpSession.getAttribute("cUser");
//                          Date loginTime =  (Date)httpSession.getAttribute("loginTime");
                          cUser1 = cUser1  ==null?new CUser():cUser1;   %>
                <tr onclick="setSelected(this,'tab_id','tr_head','<%=i%>')">
                    <td class="form" style="text-align: center" nowrap>
                        <%=i+1%>
                    </td>
                    <td class="form" style="text-align: left" nowrap>
                        <%=cUser1.getUserName()%>
                        &nbsp;</td>
                    <td class="form" style="text-align: center" nowrap>
                        <%=cUser1.getRealName()%>
                        &nbsp;</td>
                    <td class="form" style="text-align: left" nowrap>
                        <%=cUser1.getOrgnaId()%>
                        &nbsp;</td>
                    <td class="form" style="text-align: left" nowrap>
                        <%=httpSession.getCreationTime()%>&nbsp;
                    </td>
                </tr>
                <%     }
                  %>

            </table>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
</table>
</body>
</html>
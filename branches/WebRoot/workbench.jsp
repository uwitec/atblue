<%@ page import="cn.com.atblue.manager.bean.CUser" %>
<%@ page import="cn.com.atblue.common.util.StringUtil" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String jzmm = StringUtil.parseNull(session.getAttribute("jzmm"),"");
    String passwd = StringUtil.parseNull(session.getAttribute("passwd"),"");
    CUser cUser = (CUser)session.getAttribute("cUser");
    cUser = cUser == null?new CUser():cUser;
    if("1".equals(jzmm)){
        Cookie userNameCookie = new Cookie("userName",cUser.getUserName());
        userNameCookie.setMaxAge(30*24*60*60);
        response.addCookie(userNameCookie);
        Cookie passwordCookie = new Cookie("userPassword",passwd);
        passwordCookie.setMaxAge(30*24*60*60);
        response.addCookie(passwordCookie);
    }
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>『黄河钻井三公司OA系统』</title>

</head>
<%--<frameset cols="*,1100,*"  framespacing="0" frameborder="no" border="0">--%>
<%--<frame src="blank.jsp"  ></frame>--%>
<frameset rows="123,*,50" cols="1024" framespacing="0" frameborder="no" border="0" id="conFrame" name="conFrame">
    <frame src="top.jsp?url=" name="menuFrame" scrolling="No" noresize="noresize" id="menuFrame" />
    <frame src="index.jsp" name="contentFrame" id="contentFrame" height="100%" width="100%"/>
    <frame src="bottom.jsp" name="bottomFrame" scrolling="No" noresize="noresize" id="bottomFrame"  />
</frameset>
<%--<frame src="blank.jsp"></frame>--%>
<%--</frameset>--%>
<noframes>
</noframes>
</html>

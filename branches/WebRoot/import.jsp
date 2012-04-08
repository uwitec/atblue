<%@ page import="cn.com.atblue.manager.bean.CUser" %>
<%@ page import="cn.com.atblue.oa.dao.OfficeNoticeDAO" %>
<%@ page import="cn.com.atblue.oa.dao.OfficeFileDAO" %>
<%@ page import="cn.com.atblue.common.SpringFactory" %>
<%@ page import="cn.com.atblue.oa.dao.OfficeNoticeCheckDAO" %>
<%@ page import="cn.com.atblue.manager.dao.Dao" %>
<%@ page import="cn.com.atblue.oa.bean.*" %>
<%@ page import="cn.com.atblue.common.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.File" %>
<%@ page import="java.math.BigDecimal" %>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Date"%>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 12-4-4
  Time: 上午12:02
  To change this template use File | Settings | File Templates.
--%>
<%
    String officeRole = "12562";
    int pageSize = 15;
    CUser _user = (CUser)session.getAttribute("cUser");
    Dao dao = (Dao)SpringFactory.instance.getBean("dao");
    OfficeNoticeDAO officeNoticeDAO = (OfficeNoticeDAO)SpringFactory.instance.getBean("officeNoticeDAO");
    OfficeFileDAO officeFileDAO = (OfficeFileDAO) SpringFactory.instance.getBean("officeFileDAO");
    OfficeNoticeCheckDAO officeNoticeCheckDAO = (OfficeNoticeCheckDAO)SpringFactory.instance.getBean("officeNoticeCheckDAO");
    String contentPath = request.getContextPath();
%>
<%@ page import="cn.com.atblue.manager.bean.CUser" %>
<%@ page import="cn.com.atblue.common.SpringFactory" %>
<%@ page import="cn.com.atblue.oa.dao.*" %>
<%@ page import="cn.com.atblue.manager.dao.Dao" %>
<%@ page import="cn.com.atblue.oa.bean.*" %>
<%@ page import="cn.com.atblue.common.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.File" %>
<%@ page import="java.math.BigDecimal" %>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Date"%>
<%@ page import="cn.com.atblue.common.SysConfig" %>
<%@ page import="cn.com.atblue.manager.dao.*" %>
<%@ page import="cn.com.atblue.manager.bean.*" %>
<%@ page import="cn.com.atblue.workflow.bean.*" %>
<%@ page import="cn.com.atblue.common.bean.PageBean" %>
<%@ page import="cn.com.atblue.workflow.runtime.*" %>
<%@ page import="cn.com.atblue.workflow.dao.WConnectDAO" %>
<%@ page import="cn.com.atblue.workflow.dao.WProcessDAO" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 12-4-4
  Time: 上午12:02
  To change this template use File | Settings | File Templates.
--%>
<%
    int pageSize = 15;
     SysConfig sysConfig =(SysConfig)SpringFactory.instance.getBean("propertyConfig"); 
    CUser _user = (CUser)session.getAttribute("cUser");
    Dao dao = (Dao)SpringFactory.instance.getBean("dao");
    ODao oDao = (ODao)SpringFactory.instance.getBean("oDao");
    Workflow workflow = (Workflow)SpringFactory.instance.getBean("workflow");
    WProcessDAO wProcessDAO = (WProcessDAO)SpringFactory.instance.getBean("wProcessDAO");
    WConnectDAO wConnectDAO = (WConnectDAO)SpringFactory.instance.getBean("wConnectDAO");
    COrgnizationDAO orgnizationDAO = (COrgnizationDAO)SpringFactory.instance.getBean("orgnizationDAO");
    OfficeNoticeDAO officeNoticeDAO = (OfficeNoticeDAO)SpringFactory.instance.getBean("officeNoticeDAO");
    OfficeFileDAO officeFileDAO = (OfficeFileDAO) SpringFactory.instance.getBean("officeFileDAO");
    UMessageDAO uMessageDAO = (UMessageDAO) SpringFactory.instance.getBean("uMessageDAO");
    OfficeNoticeCheckDAO officeNoticeCheckDAO = (OfficeNoticeCheckDAO)SpringFactory.instance.getBean("officeNoticeCheckDAO");
    OfficeHysqDAO officeHysqDAO = (OfficeHysqDAO)SpringFactory.instance.getBean("officeHysqDAO");
    OfficeYysqDAO officeYysqDAO = (OfficeYysqDAO)SpringFactory.instance.getBean("officeYysqDAO");
    OfficeQpdFormDAO officeQpdFormDAO = (OfficeQpdFormDAO)SpringFactory.instance.getBean("officeQpdFormDAO");
    OfficeQpdDAO officeQpdDAO = (OfficeQpdDAO)SpringFactory.instance.getBean("officeQpdDAO");
    OfficeQpdyjDAO officeQpdyjDAO = (OfficeQpdyjDAO)SpringFactory.instance.getBean("officeQpdyjDAO");
    OfficeCjhyryDAO officeCjhyryDAO = (OfficeCjhyryDAO)SpringFactory.instance.getBean("officeCjhyryDAO");
    CUserDAO userDAO = (CUserDAO)SpringFactory.instance.getBean("userDAO");
    String contentPath = request.getContextPath();
    //获取流程
    Workflow workFlow = (Workflow)SpringFactory.instance.getBean("workflow");
    //传阅ID:
   	String cyFlow =""; 
    //指定上传路径
    String filePath = sysConfig.getProperty("system.filePath");
    //传阅中主要审批角色
    String officeRole = "12562";
    String bmjlRole ="";
    String zyldRole ="";
    
    String bgsldRole="";
%>
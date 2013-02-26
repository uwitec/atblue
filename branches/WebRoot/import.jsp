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
<%@page import="cn.com.atblue.workflow.dao.WDao"%>
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
    WDao wDao = (WDao)SpringFactory.instance.getBean("wDao"); 
    WConnectDAO wConnectDAO = (WConnectDAO)SpringFactory.instance.getBean("wConnectDAO");
    COrgnizationDAO orgnizationDAO = (COrgnizationDAO)SpringFactory.instance.getBean("orgnizationDAO");
    OfficeNoticeDAO officeNoticeDAO = (OfficeNoticeDAO)SpringFactory.instance.getBean("officeNoticeDAO");
    OfficeSmsPersonDAO officeSmsPersonDAO = (OfficeSmsPersonDAO)SpringFactory.instance.getBean("officeSmsPersonDAO");
    OfficeFileDAO officeFileDAO = (OfficeFileDAO) SpringFactory.instance.getBean("officeFileDAO");
    UMessageDAO uMessageDAO = (UMessageDAO) SpringFactory.instance.getBean("uMessageDAO");
    OfficeNoticeCheckDAO officeNoticeCheckDAO = (OfficeNoticeCheckDAO)SpringFactory.instance.getBean("officeNoticeCheckDAO");
    OfficeHysqDAO officeHysqDAO = (OfficeHysqDAO)SpringFactory.instance.getBean("officeHysqDAO");
    OfficeWjspDAO officeWjspDAO = (OfficeWjspDAO)SpringFactory.instance.getBean("officeWjspDAO");
    OfficeHolidayDAO officeHolidayDAO = (OfficeHolidayDAO)SpringFactory.instance.getBean("officeHolidayDAO");
    OfficeYysqDAO officeYysqDAO = (OfficeYysqDAO)SpringFactory.instance.getBean("officeYysqDAO");
    OfficeQpdFormDAO officeQpdFormDAO = (OfficeQpdFormDAO)SpringFactory.instance.getBean("officeQpdFormDAO");
    OfficeQpdDAO officeQpdDAO = (OfficeQpdDAO)SpringFactory.instance.getBean("officeQpdDAO");
    OfficeQpdyjDAO officeQpdyjDAO = (OfficeQpdyjDAO)SpringFactory.instance.getBean("officeQpdyjDAO");
    OfficeCjhyryDAO officeCjhyryDAO = (OfficeCjhyryDAO)SpringFactory.instance.getBean("officeCjhyryDAO");
    OfficeSuppliesDAO officeSuppliesDAO = (OfficeSuppliesDAO)SpringFactory.instance.getBean("officeSuppliesDAO");
    JyglDjfyjsDAO jyglDjfyjsDAO = (JyglDjfyjsDAO)SpringFactory.instance.getBean("jyglDjfyjsDAO");
    JyglYjhfyDAO jyglYjhfyDAO = (JyglYjhfyDAO)SpringFactory.instance.getBean("jyglYjhfyDAO");
    CUserDAO userDAO = (CUserDAO)SpringFactory.instance.getBean("userDAO");
    String contentPath = request.getContextPath();
    OfficePlanDAO officePlanDAO = (OfficePlanDAO)SpringFactory.instance.getBean("officePlanDAO");
    OfficeSuppliesDepartDAO officeSuppliesDepartDAO = (OfficeSuppliesDepartDAO)SpringFactory.instance.getBean("officeSuppliesDepartDAO");
    OfficePlanProcessDAO officePlanProcessDAO = (OfficePlanProcessDAO)SpringFactory.instance.getBean("officePlanProcessDAO");
    FlglQzgznrDAO flglQzgznrDAO = (FlglQzgznrDAO)SpringFactory.instance.getBean("flglQzgznrDAO");
    FlglYlzDAO flglYlzDAO = (FlglYlzDAO)SpringFactory.instance.getBean("flglYlzDAO");

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
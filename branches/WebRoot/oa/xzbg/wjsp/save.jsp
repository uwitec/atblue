<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ include file="../../../import.jsp"%>
<%
    CUser cUser = (CUser)session.getAttribute("cUser");
    cUser = cUser == null?new CUser():cUser;
    String documentid = StringUtil.parseNull(request.getParameter("documentid"),"");
    String bgshg = StringUtil.parseNull(request.getParameter("bgshg"),"");
    String gyfs = StringUtil.parseNull(request.getParameter("gyfs"),"");
    String fa = StringUtil.parseNull(request.getParameter("fa"),"");
    Map map1 = new HashMap();
    map1.put("documentid",documentid);
    OfficeWjsp wjsp = officeWjspDAO.queryForBean(map1);
    wjsp.setBgshg(bgshg);
    wjsp.setFa(fa);
    if(!StringUtil.isBlankOrEmpty(gyfs)){
        wjsp.setGyfs(Integer.valueOf(gyfs));
    }
    officeWjspDAO.modOfficeWjsp(wjsp);
%>
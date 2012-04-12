<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../import.jsp"%>
<%
	String selUserId = request.getParameter("selUserId");
	String connectId = request.getParameter("connectId");
	String sqId = request.getParameter("sqId");
    if(!StringUtil.isBlankOrEmpty(selUserId)){
        Map map = new HashMap();
        map.put("connectId",connectId);
        WConnect wConnect = wConnectDAO.queryForBean(map);
        if(wConnect != null){
            wConnect.setPendingPerson(selUserId);
            wConnectDAO.modWConnect(wConnect);
        }
        //修改会议申请的状态
       map.put("sqid",sqId);
       OfficeHysq officeHysq = officeHysqDAO.queryForBean(map);
       if(officeHysq != null){
           officeHysq.setSqzt("正在审批");
           officeHysqDAO.modOfficeHysq(officeHysq);
       }
    }
    response.sendRedirect("index.jsp");
%>
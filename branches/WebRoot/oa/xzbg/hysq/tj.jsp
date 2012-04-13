<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../import.jsp"%>
<%
	String selUserId = StringUtil.parseNull(request.getParameter("selUserId"),"");
	String connectId = StringUtil.parseNull(request.getParameter("connectId"),"");
	String processId = StringUtil.parseNull(request.getParameter("processId"),"");
	String sqId = StringUtil.parseNull(request.getParameter("sqId"),"");
    CUser cUser = (CUser)session.getAttribute("cUser");
    cUser = cUser == null?new CUser():cUser;
    if(!StringUtil.isBlankOrEmpty(selUserId)){
        Map map = new HashMap();
        map.put("connectId",connectId);
        //修改会议申请的状态
       map.put("sqid",sqId);
       OfficeHysq officeHysq = officeHysqDAO.queryForBean(map);
        connectId = workFlow.claimMission(processId,connectId,cUser.getUserId());
        if(!StringUtil.isBlankOrEmpty(connectId)){
            connectId = workFlow.completeMission(processId,connectId,cUser.getUserId(),new String[]{selUserId},"1");
        }
        if(officeHysq != null){
            officeHysq.setSqzt("正在审批");
            officeHysq.setConnectId(connectId);
            officeHysqDAO.modOfficeHysq(officeHysq);
        }
    }
    response.sendRedirect("index.jsp");
%>
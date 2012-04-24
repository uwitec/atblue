<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../../../import.jsp" %>
<%
    String selUserId = StringUtil.parseNull(request.getParameter("selUserId"), "");
    String connectId = StringUtil.parseNull(request.getParameter("connectId"), "");
    String processId = StringUtil.parseNull(request.getParameter("processId"), "");
    String pkId = StringUtil.parseNull(request.getParameter("pkId"), "");
    String type = StringUtil.parseNull(request.getParameter("type"), "");
    String varValue = StringUtil.parseNull(request.getParameter("varValue"), "1");
    CUser cUser = (CUser) session.getAttribute("cUser");
    cUser = cUser == null ? new CUser() : cUser;
    Map map = new HashMap();
    map.put("connectId", connectId);
    //修改会议申请的状态
    map.put("pkId", pkId);
    OfficeCirculationDAO officeCirculationDAO = (OfficeCirculationDAO)SpringFactory.instance.getBean("officeCirculationDAO");
    OfficeCirculation document = officeCirculationDAO.selectByPrimaryKey(pkId);

    connectId = workFlow.claimMission(processId, connectId, cUser.getUserId());
    if (!StringUtil.isBlankOrEmpty(connectId)) {
        connectId = workFlow.completeMission(processId, connectId, cUser.getUserId(), new String[]{selUserId}, varValue);
    }
    if (document != null) {
        document.setConnectId(connectId);
        map.put("processId", processId);
        WProcess wProcess = wProcessDAO.queryForBean(map);
        if (wProcess != null && "9".equals(wProcess.getProcessStatus())) {
            document.setZt("已完成");
        } else {
            document.setZt("正在审批");
        }
        officeCirculationDAO.updateByPrimaryKey(document);
    }
    if("1".equals(type)){
        response.sendRedirect("wait.jsp");
    }else{
        response.sendRedirect("index.jsp");
    }
%>
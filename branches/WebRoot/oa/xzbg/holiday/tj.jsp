<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../../../import.jsp" %>
<%
    String selUserId = StringUtil.parseNull(request.getParameter("selUserId"), "");
    String connectId = StringUtil.parseNull(request.getParameter("connectId"), "");
    String processId = StringUtil.parseNull(request.getParameter("processId"), "");
    String holidayid = StringUtil.parseNull(request.getParameter("holidayid"), "");
    String type = StringUtil.parseNull(request.getParameter("type"), "");
    String varValue = StringUtil.parseNull(request.getParameter("varValue"), "1");
    CUser cUser = (CUser) session.getAttribute("cUser");
    cUser = cUser == null ? new CUser() : cUser;
    Map map = new HashMap();
    map.put("connectId", connectId);
    //修改会议申请的状态
    map.put("holidayid", holidayid);
    OfficeHoliday officeHoliday = officeHolidayDAO.queryForBean(map);
    int wcts = DateUtil.differenceOfDay(officeHoliday.getJssj(),officeHoliday.getKssj())+1;
    String nextRole1 = workFlow.getNextRoleName(StringUtil.parseNull(officeHoliday.getConnectId(),""),"2");
     if(wcts==1&&"结束".equals(nextRole1)){ //休假天数为1天时，分管领导审批通过即可，无需销假登记
          varValue="2";
     }
    String nextRole = workFlow.getNextRoleName(connectId,varValue);
    connectId = workFlow.claimMission(processId, connectId, cUser.getUserId());
    if (!StringUtil.isBlankOrEmpty(connectId)) {
        connectId = workFlow.completeMission(processId, connectId, cUser.getUserId(), new String[]{selUserId}, varValue);
    }
    if (officeHoliday != null) {
        officeHoliday.setConnectId(connectId);
        officeHoliday.setProcessId(processId);
        map.put("processId", processId);
        WProcess wProcess = wProcessDAO.queryForBean(map);
        if (wProcess != null && "9".equals(wProcess.getProcessStatus())) {
	            officeHoliday.setSqzt("已完成");
	        } else {
	            officeHoliday.setSqzt("正在审批");
	        }
	        officeHolidayDAO.modOfficeHoliday(officeHoliday);
    }
    if("1".equals(type)){
        response.sendRedirect("wait.jsp");
    }else{
        response.sendRedirect("index.jsp?curRole="+varValue);
    }

%>
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
    //int wcts = DateUtil.differenceOfDay(officeHoliday.getJssj(),officeHoliday.getKssj())+1;
    String nextRole1 = workFlow.getNextRoleName(StringUtil.parseNull(officeHoliday.getConnectId(),""),varValue);
     //if(wcts==1&&"结束".equals(nextRole1)){ //休假天数为1天时，分管领导审批通过即可，无需销假登记
     //     varValue="2";
     //}
	System.out.println(nextRole1+"++++++++++++++++++++++++"+varValue+"-----------------------");
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
            if("1".equals(officeHoliday.getDxtx())){
                //是否发送短信

                map.put("userId", selUserId);
                CUser u = userDAO.queryForBean(map);
                StringBuffer message = new StringBuffer("");
//                message.append("尊敬的"+u.getRealName()+"您好，OA系统：")
//                        .append(StringUtil.cutString(officeHoliday.getXm()+"请假时间"+StringUtil.parseNull(officeHoliday.getKssj(),"")+
//                                "到"+StringUtil.parseNull(officeHoliday.getJssj(),""),25))
//                        .append("，等待您的审批！");
//                CUser u1 = dao.findUserById(officeHysq.getSqr());
                message.append("尊敬的"+u.getRealName()+"，您好！OA系统提醒您，"+officeHoliday.getXm()+"的请假申请等待您的审批");
                OfficeSmsPerson officeSmsPerson = new OfficeSmsPerson();
                officeSmsPerson.setPkId(StringUtil.getUUID());
//                officeSmsPerson.setTzid(bean.getTzid());
                officeSmsPerson.setCreateTime(new java.util.Date());
//                officeSmsPerson.setPhone(u.getPhone());
                String testPhone = sysConfig.getProperty("testPhone");
                if(!StringUtil.isBlankOrEmpty(testPhone)){
                    officeSmsPerson.setPhone(testPhone);
                }else{
                    officeSmsPerson.setPhone(u.getMobile());
                }
                officeSmsPerson.setUserId(selUserId);
                officeSmsPerson.setUserName(u.getRealName());
                officeSmsPerson.setSfqs("0"); //是否签收
                officeSmsPerson.setSffs("0"); //是否发送
                officeSmsPerson.setDxnr(message.toString());
                officeSmsPerson.setTzlb("B");
                officeSmsPerson.setSqId(officeHoliday.getHolidayid());
                officeSmsPersonDAO.addOfficeSmsPerson(officeSmsPerson);
            }
	        }
	        officeHolidayDAO.modOfficeHoliday(officeHoliday);
    }
    if("1".equals(type)){
        response.sendRedirect("tabs.jsp");
    }else{
        response.sendRedirect("index.jsp?curRole="+officeHoliday.getRoleflag());
    }

%>
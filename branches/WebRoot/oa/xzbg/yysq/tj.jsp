<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../../../import.jsp" %>
<%
    String selUserId = StringUtil.parseNull(request.getParameter("selUserId"), "");
    String connectId = StringUtil.parseNull(request.getParameter("connectId"), "");
    String processId = StringUtil.parseNull(request.getParameter("processId"), "");
    String sqId = StringUtil.parseNull(request.getParameter("sqId"), "");
    String type = StringUtil.parseNull(request.getParameter("type"), "");
    String varValue = StringUtil.parseNull(request.getParameter("varValue"), "1");
    CUser cUser = (CUser) session.getAttribute("cUser");
    cUser = cUser == null ? new CUser() : cUser;
    Map map = new HashMap();
    map.put("connectId", connectId);
    //修改会议申请的状态
    map.put("sqid", sqId);
    OfficeYysq officeYysq = officeYysqDAO.queryForBean(map);
    connectId = workFlow.claimMission(processId, connectId, cUser.getUserId());
    if (!StringUtil.isBlankOrEmpty(connectId)) {
        connectId = workFlow.completeMission(processId, connectId, cUser.getUserId(), new String[]{selUserId}, varValue);
    }
    if (officeYysq != null) {
        officeYysq.setConnectId(connectId);
        map.put("processId", processId);
        WProcess wProcess = wProcessDAO.queryForBean(map);
        if (wProcess != null && "9".equals(wProcess.getProcessStatus())) {
            officeYysq.setSqzt("已完成");
        } else {
            officeYysq.setSqzt("正在审批");
            if("1".equals(officeYysq.getDxtx())){
                //是否发送短信

                map.put("userId", selUserId);
                CUser u = userDAO.queryForBean(map);
                StringBuffer message = new StringBuffer("");

                String yyr = officeYysq.getYyr();
                CUser u1 = dao.findUserById(yyr);
                String smsNotice = StringUtil.parseNull(sysConfig.getProperty("smsNotice"),"");
                smsNotice = StringUtil.replace(smsNotice,"$0",u.getRealName());
                smsNotice = StringUtil.replace(smsNotice,"$4",u1.getRealName());
                smsNotice = StringUtil.replace(smsNotice,"$5",officeYysq.getYymc());
                message.append(smsNotice);
                OfficeSmsPerson officeSmsPerson = new OfficeSmsPerson();
                officeSmsPerson.setPkId(StringUtil.getUUID());
//                officeSmsPerson.setTzid(bean.getTzid());
                officeSmsPerson.setCreateTime(new java.util.Date());
//                officeSmsPerson.setPhone(u.getMobile());
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
                officeSmsPerson.setTzlb("E");
                officeSmsPerson.setSqId(officeYysq.getSqid());
                officeSmsPersonDAO.addOfficeSmsPerson(officeSmsPerson);
            }
        }
        officeYysqDAO.modOfficeYysq(officeYysq);
    }
    if("1".equals(type)){
        response.sendRedirect("tabs.jsp");
    }else{
        response.sendRedirect("index.jsp");
    }
%>
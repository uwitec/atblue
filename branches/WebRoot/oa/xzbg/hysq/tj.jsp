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
    OfficeHysq officeHysq = officeHysqDAO.queryForBean(map);
    connectId = workFlow.claimMission(processId, connectId, cUser.getUserId());
    if (!StringUtil.isBlankOrEmpty(connectId)) {
        connectId = workFlow.completeMission(processId, connectId, cUser.getUserId(), new String[]{selUserId}, varValue);
    }
    if (officeHysq != null) {
        officeHysq.setConnectId(connectId);
        map.put("processId", processId);
        WProcess wProcess = wProcessDAO.queryForBean(map);
        if (wProcess != null && "9".equals(wProcess.getProcessStatus())) {
            officeHysq.setSqzt("已完成");
        } else {
            officeHysq.setSqzt("正在审批");
            if("1".equals(officeHysq.getDxtx())){
                //是否发送短信

                map.put("userId", selUserId);
                CUser u = userDAO.queryForBean(map);
                StringBuffer message = new StringBuffer("");
                CUser u1 = dao.findUserById(officeHysq.getSqr());
                String smsNotice = StringUtil.parseNull(sysConfig.getProperty("smsNotice"),"");
                smsNotice = StringUtil.replace(smsNotice,"$0",u.getRealName());
                smsNotice = StringUtil.replace(smsNotice,"$4",u1.getRealName());
                smsNotice = StringUtil.replace(smsNotice,"$5",officeHysq.getHymc());
                message.append(smsNotice);
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
                officeSmsPerson.setTzlb("A");
                officeSmsPerson.setSqId(officeHysq.getSqid());
                officeSmsPersonDAO.addOfficeSmsPerson(officeSmsPerson);
            }
        }
        officeHysqDAO.modOfficeHysq(officeHysq);
    }
    if("1".equals(type)){
        response.sendRedirect("tabs.jsp");
    }else{
        response.sendRedirect("index.jsp");
    }

%>
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
            if("1".equals(document.getDxtx())){
                //是否发送短信

                map.put("userId", selUserId);
                CUser u = userDAO.queryForBean(map);
                StringBuffer message = new StringBuffer("");
//                message.append("尊敬的"+u.getRealName()+"您好，OA系统：")
//                        .append(StringUtil.cutString(document.getWjmc(),25))
//                        .append("，等待您的审批！");
                CUser u1 = dao.findUserById(document.getLrr());
                String smsNotice = StringUtil.parseNull(sysConfig.getProperty("smsNotice"),"");
                smsNotice = StringUtil.replace(smsNotice,"$0",u.getRealName());
                smsNotice = StringUtil.replace(smsNotice,"$4",u1.getRealName());
                smsNotice = StringUtil.replace(smsNotice,"$5",document.getWjmc());
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
                officeSmsPerson.setTzlb("F");
                officeSmsPerson.setSqId(document.getCyid());
                officeSmsPersonDAO.addOfficeSmsPerson(officeSmsPerson);
            }
        }
        officeCirculationDAO.updateByPrimaryKey(document);
    }
    if("1".equals(type)){
        response.sendRedirect("tabs.jsp");
    }else{
        response.sendRedirect("index.jsp");
    }
%>
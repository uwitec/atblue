<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../../../import.jsp" %>
<%
    String selUserId = StringUtil.parseNull(request.getParameter("selUserId"), "");
    String connectId = StringUtil.parseNull(request.getParameter("connectId"), "");
    String processId = StringUtil.parseNull(request.getParameter("processId"), "");
    String sqid = StringUtil.parseNull(request.getParameter("sqid"), "");
    String type = StringUtil.parseNull(request.getParameter("type"), "");
    String curRole = StringUtil.parseNull(request.getParameter("curRole"), "1");
    String varValue = StringUtil.parseNull(request.getParameter("varValue"), "1");
//    String curRole = varValue;
    CUser cUser = (CUser) session.getAttribute("cUser");
    cUser = cUser == null ? new CUser() : cUser;
    Map map = new HashMap();
    map.put("connectId", connectId);
    //修改会议申请的状态
    map.put("sqid", sqid);
    OfficeSupplies officeSupplies = officeSuppliesDAO.queryForBean(map);
    connectId = workFlow.claimMission(processId, connectId, cUser.getUserId());
    if (!StringUtil.isBlankOrEmpty(connectId)) {
//    	if(!"-1".equals(varValue)){
//    		varValue="1";
//    	}
        connectId = workFlow.completeMission(processId, connectId, cUser.getUserId(), new String[]{selUserId}, varValue);
    }
    if (officeSupplies != null) {
        officeSupplies.setConnectId(connectId);
        officeSupplies.setProcessId(processId);
        map.put("processId", processId);
        WProcess wProcess = wProcessDAO.queryForBean(map);
        if (wProcess != null && "9".equals(wProcess.getProcessStatus())) {
	            officeSupplies.setSqzt("已完成");
	        } else {
	            officeSupplies.setSqzt("正在审批");
            if("1".equals(officeSupplies.getDxtx())){
                //是否发送短信

                map.put("userId", selUserId);
                CUser u = userDAO.queryForBean(map);
                StringBuffer message = new StringBuffer("");
                CUser u1 = dao.findUserById(officeSupplies.getSqr());
                String smsNotice = StringUtil.parseNull(sysConfig.getProperty("smsNotice"),"");
                smsNotice = StringUtil.replace(smsNotice,"$0",u.getRealName());
                smsNotice = StringUtil.replace(smsNotice,"$4",u1.getRealName());
                smsNotice = StringUtil.replace(smsNotice,"$5",officeSupplies.getMc());
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
                officeSmsPerson.setTzlb("C");
                officeSmsPerson.setSqId(officeSupplies.getSqid());
                officeSmsPersonDAO.addOfficeSmsPerson(officeSmsPerson);
            }
	        }
	        officeSuppliesDAO.modOfficeSupplies(officeSupplies);
    }
    if("1".equals(type)){
        response.sendRedirect("tabs.jsp");
    }else{
         response.sendRedirect("index.jsp?curRole="+curRole); 
    }

%>
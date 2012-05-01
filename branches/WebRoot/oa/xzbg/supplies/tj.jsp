<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../../../import.jsp" %>
<%
    String selUserId = StringUtil.parseNull(request.getParameter("selUserId"), "");
    String connectId = StringUtil.parseNull(request.getParameter("connectId"), "");
    String processId = StringUtil.parseNull(request.getParameter("processId"), "");
    String sqid = StringUtil.parseNull(request.getParameter("sqid"), "");
    String type = StringUtil.parseNull(request.getParameter("type"), "");
    String varValue = StringUtil.parseNull(request.getParameter("varValue"), "1");
    String curRole = varValue;
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
                message.append("尊敬的"+u.getRealName()+"您好：")
                        .append(StringUtil.cutString(officeSupplies.getMc(),25))
                        .append("，等待您的审批！");
                OfficeSmsPerson officeSmsPerson = new OfficeSmsPerson();
                officeSmsPerson.setPkId(StringUtil.getUUID());
//                officeSmsPerson.setTzid(bean.getTzid());
                officeSmsPerson.setCreateTime(new java.util.Date());
//                officeSmsPerson.setPhone(u.getPhone());
                officeSmsPerson.setPhone("13805468530");
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
        response.sendRedirect("wait.jsp");
    }else{
         response.sendRedirect("index.jsp?curRole="+curRole); 
    }

%>
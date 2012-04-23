<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../../../import.jsp" %>
<%
    String selUserId = StringUtil.parseNull(request.getParameter("selUserId"), "");
    String connectId = StringUtil.parseNull(request.getParameter("connectId"), "");
    String processId = StringUtil.parseNull(request.getParameter("processId"), "");
    String documentid = StringUtil.parseNull(request.getParameter("documentid"), "");
    String type = StringUtil.parseNull(request.getParameter("type"), "");
    String varValue = StringUtil.parseNull(request.getParameter("varValue"), "1");
    CUser cUser = (CUser) session.getAttribute("cUser");
    cUser = cUser == null ? new CUser() : cUser;
    Map map = new HashMap();
    map.put("connectId", connectId);
    //修改会议申请的状态
    map.put("documentid", documentid);
    OfficeWjsp officeWjsp = officeWjspDAO.queryForBean(map);
    connectId = workFlow.claimMission(processId, connectId, cUser.getUserId());
    if (!StringUtil.isBlankOrEmpty(connectId)) {
        connectId = workFlow.completeMission(processId, connectId, cUser.getUserId(), new String[]{selUserId}, varValue);
    }
    if (officeWjsp != null) {
        officeWjsp.setConnectId(connectId);
        officeWjsp.setProcessId(processId);
        map.put("processId", processId);
        WProcess wProcess = wProcessDAO.queryForBean(map);
        if (wProcess != null && "9".equals(wProcess.getProcessStatus())) {
	            officeWjsp.setSqzt("已完成");
	            //公文发放，当流程结束时，将审批完成的公文，记录到公文发放表中
	            OfficeDocumentsDAO officeDocumentsDAO = (OfficeDocumentsDAO)SpringFactory.instance.getBean("officeDocumentsDAO");
	            OfficeDocuments document = new OfficeDocuments();
	            document.setDocumentid(documentid);
				document.setLb(officeWjsp.getLb());
				document.setWjbh(officeWjsp.getWjbh());
				document.setBt(officeWjsp.getBt());
				document.setMmcd(officeWjsp.getMmcd());
				try{
					document.setQfrq(officeWjsp.getQfrq());
				}catch(Exception e){}
				document.setNgbm(officeWjsp.getNgbm());
				document.setHjsx(officeWjsp.getHjsx());
				document.setBz(officeWjsp.getBz());
				document.setCjr(officeWjsp.getSqr());
				document.setCjrq(DateUtil.getDateTime());
				document.setStatus(0);//0是未发放，1、是已发放
				officeDocumentsDAO.insert(document);
	        } else {
	            officeWjsp.setSqzt("正在审批");
	        }
	        officeWjspDAO.modOfficeWjsp(officeWjsp);
    }
    if("1".equals(type)){
        response.sendRedirect("wait.jsp");
    }else{
        response.sendRedirect("index.jsp");
    }

%>
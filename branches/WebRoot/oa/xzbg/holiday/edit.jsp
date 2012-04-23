<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ include file="../../../import.jsp"%>
<%

    CUser cUser = (CUser)session.getAttribute("cUser");
    cUser = cUser == null?new CUser():cUser;
    String orgId = cUser.getOrgnaId();
    Map paramMap = new HashMap();
    paramMap.put("orgnaId",orgId);
     String curRole = request.getParameter("curRole");
    COrgnization cOrgnization = orgnizationDAO.queryForBean(paramMap);
    String holidayid = StringUtil.parseNull(request.getParameter("holidayid"),"");
    Map map1 = new HashMap();
    map1.put("holidayid",holidayid);
    OfficeHoliday holiday = officeHolidayDAO.queryForBean(map1);
    holiday = holiday == null?new OfficeHoliday():holiday;
	if (request.getMethod().equals("POST")) {
        FileUploadUtil fileUpload = new FileUploadUtil(request);
        holidayid = StringUtil.parseNull(fileUpload.getParameter("holidayid"),"");
      	String xm = StringUtil.parseNull(fileUpload.getParameter("xm"),"");
        String dw = StringUtil.parseNull(fileUpload.getParameter("dw"),"");
        String flag = StringUtil.parseNull(fileUpload.getParameter("flag"),"");
         curRole = StringUtil.parseNull(fileUpload.getParameter("curRole"),"");
        String kssj = StringUtil.parseNull(fileUpload.getParameter("kssj"),"");
        String jssj = StringUtil.parseNull(fileUpload.getParameter("jssj"),"");
        String wcdd = StringUtil.parseNull(fileUpload.getParameter("wcdd"),"");
        String wcsy = StringUtil.parseNull(fileUpload.getParameter("wcsy"),"");
        String dxtx = StringUtil.parseNull(fileUpload.getParameter("dxtx"),"");
         String bz = StringUtil.parseNull(fileUpload.getParameter("bz"),"");
        holiday.setHolidayid(holidayid);
      	holiday.setXm(xm);
      	holiday.setDw(dw);
      	holiday.setWcdd(wcdd);
      	holiday.setWcsy(wcsy);
      	holiday.setKssj(DateUtil.parse(kssj,"yyyy-MM-dd"));
      	holiday.setJssj(DateUtil.parse(jssj,"yyyy-MM-dd"));
        holiday.setSqzt("已保存");//保存状态
        holiday.setSqr(cUser.getUserId());
        holiday.setDxtx(dxtx);
        holiday.setBz(bz);
        holiday.setRoleflag(curRole);
        if("startup".equals(flag)){
            holiday.setSqzt("已申请");
            //创建流程代码在这里
            Status status = workflow.startWorkflow("0139c66e-a3cc-4f2c-ae4c-5287304a7b8c",cUser.getUserId());
            holiday.setProcessId(status.getProcessId());
            holiday.setConnectId(status.getConnectId());
        }
        try{
        	officeHolidayDAO.modOfficeHoliday(holiday);
        }catch(Exception e){
        	e.printStackTrace();
        }
%>
		<script>
		   window.location='index.jsp?curRole=<%=curRole%>';
		</script>
<%	}
     List userList  = dao.getAllUser();
     List departmentList = orgnizationDAO.queryForList(null);
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
		<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet" type="text/css">
		<link href="<%=request.getContextPath()%>/images/css.css" rel="stylesheet" type="text/css">
		<link href="<%=request.getContextPath()%>/css/ext-all.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" charset="GB2312"
			src="<%=request.getContextPath()%>/js/date/WdatePicker.js" defer="defer"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/ckeditor/ckeditor.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/ext/ext-all.js"></script>
		<script type="text/javascript">
            function _resizeNoPage() {
                document.getElementById("scrollDiv").style.width = document.body.clientWidth - 18;
                document.getElementById("scrollDiv").style.height = document.body.clientHeight - 50;
            }

			function CheckDateTime(object){
			   var rr=/^(?:19|20)[0-9][0-9]-(?:(?:0[1-9])|(?:1[0-2]))-(?:(?:[0-2][1-9])|(?:[1-3][0-1])) (?:(?:[0-2][0-3])|(?:[0-1][0-9])):[0-5][0-9]$/
			   if(!rr.test(object.value)){
			    	object.focus();
			 		return false;
			   }
			   return true;
			}
			function CheckDate(object){
			   var rr=/^(?:19|20)[0-9][0-9]-(?:(?:0[1-9])|(?:1[0-2]))-(?:(?:[0-2][1-9])|(?:[1-3][0-1]))$/
			   if(!rr.test(object.value)){
			    	object.focus();
			 		return false;
			  }
			  return true;
			}		

			function checkForm(){
                 if(document.form1.xm.value==""){
                    document.form1.xm.focus();
                    alert("请输入文件标题！");
                    return;
                }
                if(document.getElementById("checked").checked){
                	 document.all.dxtx.value="1";
                }else if(!document.getElementById("checked").checked){
                	document.all.dxtx.value="0";
                }
                document.form1.submit();
			}
            function startup(){
               if(document.form1.xm.value==""){
                    document.form1.xm.focus();
                    alert("请输入文件标题！");
                    return;
                }
                if(document.getElementById("checked").checked){
                	 document.all.dxtx.value="1";
                }else if(!document.getElementById("checked").checked){
                	document.all.dxtx.value="0";
                }
                document.all.flag.value="startup";
                document.form1.submit();
            }
		</script>
	</head>
	<body onload="_resizeNoPage();">
		<form action="edit.jsp" name="form1" method="post" enctype="multipart/form-data">
            <input type="hidden" name="flag" value=""/>
            <input type="hidden" name="dxtx" value=""/>
             <input type="hidden" name="curRole" value="<%=curRole%>"/>
            <input type="hidden" name="holidayid" value="<%=holidayid%>"/>
			<table width="100%" height="25" border="0" cellpadding="0"
				cellspacing="0"
				background="<%=request.getContextPath()%>/images/mhead.jpg">
				<tr>
					<td width="3%" align="center">
						<img src="<%=request.getContextPath()%>/images/mlogo.jpg" width="11"
							height="11">
					</td>
					<td width="15%" class="mhead">
						修改
					</td>
					<td width="74%" align="left" class="mhead">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="left">
										<input type="button" class="button" id="button"
											onclick="checkForm();" value="保存">
										&nbsp;
                                        <input type="button" class="button"
											onclick="startup();" value="创建流程并启动">
										&nbsp;
										<input type="button" class="button" id="button1"
											onclick="history.back()" value="返回">
										&nbsp;
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td>
						<%--固定表头DIV--%>
						<div id="scrollDiv"
							style="width: 1000px; overflow: auto; cursor: default; display: inline; position: absolute; height: 200px;">
							<table width="100%" border="0" align="center" cellpadding="0"
								cellspacing="0" class="mtabtab" id="mtabtab">
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										姓名<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<input type="text" name="xm" class="inputStyle"
											style="width: 200px;" value="<%=holiday.getXm() %>" maxlength="20">
											<input type="checkbox" name="checked" id="checked" value="1" checked>短信提醒
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										部门
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<input type="text" name="dw" class="inputStyle"
											style="width: 200px;" value="<%=holiday.getDw() %>" maxlength="20">
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										外出时间
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<input type="text" name="kssj" class="Wdate" onClick="WdatePicker()" value="<%=DateUtil.format(holiday.getKssj(),"yyyy-MM-dd") %>">
										至
										<input type="text" name="jssj" class="Wdate" onClick="WdatePicker()" value="<%=DateUtil.format(holiday.getJssj(),"yyyy-MM-dd") %>">
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										外出地点<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" align="left" style="text-align: left">
                                        <textarea rows="4" cols="40" name="wcdd"><%=holiday.getWcdd() %></textarea>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										外出事由
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<textarea rows="4" cols="40" name="wcsy"><%=holiday.getWcsy() %></textarea>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										备注
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<textarea rows="4" cols="40" name="bz"><%=holiday.getBz() %></textarea>
									</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>

			</table>
		</form>
	</body>
</html>
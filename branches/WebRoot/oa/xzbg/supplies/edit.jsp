<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ include file="../../../import.jsp"%>
<%

    CUser cUser = (CUser)session.getAttribute("cUser");
    String curRole = request.getParameter("curRole");
    cUser = cUser == null?new CUser():cUser;
    String orgId = cUser.getOrgnaId();
    Map paramMap = new HashMap();
    paramMap.put("orgnaId",orgId);
    COrgnization cOrgnization = orgnizationDAO.queryForBean(paramMap);
    String sqid = StringUtil.parseNull(request.getParameter("sqid"),"");
    Map map1 = new HashMap();
    map1.put("sqid",sqid);
    OfficeSupplies officeSupplies = officeSuppliesDAO.queryForBean(map1);
    officeSupplies = officeSupplies == null?new OfficeSupplies():officeSupplies;
	if (request.getMethod().equals("POST")) {
        String mc = StringUtil.parseNull(request.getParameter("mc"),"");
        sqid = StringUtil.parseNull(request.getParameter("sqid"),"");
        String sl = StringUtil.parseNull(request.getParameter("sl"),"");
        String sqdw = StringUtil.parseNull(request.getParameter("sqdw"),"");
        String sy = StringUtil.parseNull(request.getParameter("sy"),"");
        curRole = StringUtil.parseNull(request.getParameter("curRole"),"");
        String sqsj = StringUtil.parseNull(request.getParameter("sqsj"),"");
        String flag = StringUtil.parseNull(request.getParameter("flag"),"");
        String dxtx = StringUtil.parseNull(request.getParameter("dxtx"),"");
        officeSupplies.setSqid(sqid);
        officeSupplies.setMc(mc);
        officeSupplies.setSl(sl);
        officeSupplies.setSqzt("已保存");//保存状态
        officeSupplies.setDxtx(dxtx);
        officeSupplies.setSy(sy);
        officeSupplies.setRoleflag(curRole);
        officeSupplies.setSqdw(sqdw);
        officeSupplies.setSqsj(DateUtil.parse(sqsj,"yyyy-MM-dd"));
        if(cUser != null)
            officeSupplies.setSqr(cUser.getUserId());
        if("startup".equals(flag)){
            officeSupplies.setSqzt("已申请");
            //创建流程代码在这里
            Status status =null;
            if("1".equals(curRole)){//井队启动
            	status = workflow.startWorkflow("98e97c39-77a7-402e-b2b8-a4cd90d27d38",cUser.getUserId());
            }else if("2".equals(curRole)){//科室长启动
            	status = workflow.startWorkflow("4822f1b3-7579-42e4-800d-7a32602016c9",cUser.getUserId());
            }
            officeSupplies.setProcessId(status.getProcessId());
            officeSupplies.setConnectId(status.getConnectId());
        }
        try{
        	officeSuppliesDAO.modOfficeSupplies(officeSupplies);
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
                 if(document.form1.mc.value==""){
                    document.form1.mc.focus();
                    alert("请输入名称！");
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
               if(document.form1.mc.value==""){
                    document.form1.mc.focus();
                    alert("请输入名称！");
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
		<form action="edit.jsp" name="form1" method="post">
            <input type="hidden" name="flag" value=""/>
            <input type="hidden" name="dxtx" value=""/>
            <input type="hidden" name="sqid" value="<%=sqid%>"/>
            <input type="hidden" name="curRole" value="<%=curRole%>"/>
			<table width="100%" height="25" border="0" cellpadding="0"
				cellspacing="0"
				background="<%=request.getContextPath()%>/images/mhead.jpg">
				<tr>
					<td width="3%" align="center">
						<img src="<%=request.getContextPath()%>/images/mlogo.jpg" width="11"
							height="11">
					</td>
					<td width="15%" class="mhead">
						修改耗材、配产
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
										名称<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" style="text-align: left">
										<input type="text" name="mc" class="inputStyle" value="<%=StringUtil.parseNull(officeSupplies.getMc(),"")%>"
											style="width: 200px;" maxlength="20">
											<input type="checkbox" name="checked" id="checked" value="" <%if(!"0".equals(officeSupplies.getDxtx())){ %>checked<%}%>>短信提醒
									</td>
								</tr>
									
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										数量<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" style="text-align: left">
										<input type="text" name="sl" class="inputStyle" value="<%=StringUtil.parseNull(officeSupplies.getSl(),"")%>"
											style="width: 300px;">
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										申请单位<span style="color: red">&nbsp;*</span>
									</td>
								<td class="head_right" style="text-align: left">
                                        <input type="hidden" name="sqdw" value="<%=StringUtil.parseNull(officeSupplies.getSqdw(),"")%>"/><%=StringUtil.parseNull(officeSupplies.getSqdw(),"")%>
									</td>
								</tr> 
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										申请日期
									</td>
									<td class="head_right" style="text-align: left">
										<input type="text" name="sqsj" class="Wdate" onClick="WdatePicker()" value="<%=DateUtil.format(officeSupplies.getSqsj(),"yyyy-MM-dd")%>">
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										事由
									</td>
									<td class="head_right" style="text-align: left">
                                        <textarea rows="4" cols="40" name="sy"><%=StringUtil.parseNull(officeSupplies.getSy(),"yyyy-MM-dd")%></textarea>
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
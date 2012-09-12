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
    COrgnization cOrgnization = orgnizationDAO.queryForBean(paramMap);
    String holidayid = StringUtil.parseNull(request.getParameter("holidayid"),"");
     String curRole = request.getParameter("curRole");
    Map map = new HashMap();
    map.put("holidayid",holidayid);
 	String flag = request.getParameter("flag");
    OfficeHoliday holiday = officeHolidayDAO.queryForBean(map);
     holiday = holiday == null?new OfficeHoliday():holiday;
     if ("update".equals(flag)) {
    	String xjdj = request.getParameter("xjdj");
    	String xjsj = request.getParameter("xjsj");
    	holiday.setXjdj(xjdj);
    	holiday.setXjsj(DateUtil.parse(xjsj));
    	officeHolidayDAO.modOfficeHoliday(holiday);
  %>
		<script>
		     window.location='index.jsp?curRole=<%=curRole%>';
		</script>
<%	}
   
     List userList  = dao.getAllUser();
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
        <link href="<%=contentPath%>/css/css.css" rel="stylesheet" type="text/css">
        <link href="<%=contentPath%>/images/css.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" charset="GB2312"
			src="<%=request.getContextPath()%>/js/date/WdatePicker.js" defer="true"></script>

		
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
            	document.all.flag.value='update';
                document.form1.submit();
			}

		</script>
	</head>
	<body onload="_resizeNoPage();">
		<form action="view.jsp" name="form1" method="post">
            <input type="hidden" name="flag" value=""/>
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
						查看文件审批
					</td>
					<td width="74%" align="left" class="mhead">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="left">
									<%if("已完成".equals(holiday.getSqzt())){ %>
									<input type="button" class="button" id="button"
											onclick="checkForm();" value="保存">
									<%} %>
										<input type="button" class="button" id="button1"
											onclick="history.back()" value="返回">
										&nbsp;
									</td>
									<td>
									<input type="checkbox" name="checked" id="checked" value="" <%if(!"0".equals(holiday.getDxtx())){ %>checked<%}%>>短信提醒
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
										姓名
									</td>
									<td class="head_right" align="left" style="text-align: left">

										<%=holiday.getXm() %>  &nbsp;&nbsp;
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										部门
									</td>
									<td class="head_right" align="left" style="text-align: left">

										<%=holiday.getDw() %> &nbsp;&nbsp;
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										外出时间
									</td>
									<td class="head_right" align="left" style="text-align: left">

										<%=DateUtil.format(holiday.getKssj(),"yyyy年MM月dd日") %>
										至
										<%=DateUtil.format(holiday.getJssj(),"yyyy年MM月dd日") %>&nbsp;&nbsp;
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										外出地点
									</td>
									<td class="head_right" align="left" style="text-align: left">

										<%=StringUtil.parseNull(holiday.getWcdd(),"")  %>&nbsp;&nbsp;
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										外出事由
									</td>
									<td class="head_right" align="left" style="text-align: left">

										<%=StringUtil.parseNull(holiday.getWcsy(),"") %>&nbsp;&nbsp;
									</td>
								</tr>
								<%
								//当申请已通过，
								if("已完成".equals(holiday.getSqzt())){ %>
									<tr>
										<td nowrap="nowrap" width="120" class="head_left">
											销假时间
										</td>
										<td class="head_right" align="left" style="text-align: left">

											<%if(holiday.getXjsj()==null) {%>
											<input type="text" name="xjsj" class="Wdate" onClick="WdatePicker()" value="<%=DateUtil.format(DateUtil.getDate(),"yyyy-MM-dd") %>">
											<%}else{ %>
											<%=DateUtil.format(holiday.getXjsj(),"yyyy-MM-dd")%>
											<%} %> &nbsp;&nbsp;
										</td>
									</tr>
									<tr>
										<td nowrap="nowrap" width="120" class="head_left">
											销假登记
										</td>
										<td class="head_right" align="left" style="text-align: left">

											<%if(holiday.getXjdj()==null) {%>
												<textarea rows="4" cols="30" name="xjdj"></textarea>
											<%}else{ %>
												<%=holiday.getXjdj() %>
											<%} %>&nbsp;&nbsp;
										</td>
									</tr>
								<%} %>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										备注
									</td>
									<td class="head_right" align="left" style="text-align: left">

										<%=StringUtil.parseNull(holiday.getBz(),"")%> &nbsp;&nbsp;
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
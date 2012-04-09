<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Date"%> 
<%@ include file="../../../import.jsp"%>
<%
	OfficeDocumentsDAO officeDocumentsDAO = (OfficeDocumentsDAO)SpringFactory.instance.getBean("officeDocumentsDAO");
	OfficeDocumentsCheckDAO officeDocumentsCheckDAO = (OfficeDocumentsCheckDAO)SpringFactory.instance.getBean("officeDocumentsCheckDAO");
	String pkid = request.getParameter("pkid");
	OfficeDocuments document = officeDocumentsDAO.selectByPrimaryKey(pkid);
	
	PageBean pb = new PageBean(Integer.MAX_VALUE,Integer.MAX_VALUE,1);
	StringBuilder sb = new StringBuilder();
	sb.append(" where documentid='").append(pkid).append("'");
	
	List checkList = officeDocumentsCheckDAO.getByFreeSql(sb.toString(),pb);
	
	List hasFileList = officeFileDAO.getByFk(pkid);
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
			<script src="<%=contentPath%>/js/common.js" type="text/javascript" defer="defer"></script>
		<link href="<%=request.getContextPath()%>/css/xzbg-css.css" rel="stylesheet"
			type="text/css">
		<link href="<%=request.getContextPath()%>/css/ext-all.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" charset="GB2312"
			src="<%=request.getContextPath()%>/js/date/WdatePicker.js" defer="defer"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/ckeditor/ckeditor.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/ext/ext-all.js"></script>


	</head>
	<body onload="_resizeNoPage();">
		<form action="add.jsp" name="form1" method="post"
			enctype="multipart/form-data">
			
			<table width="100%" height="25" border="0" cellpadding="0"
				cellspacing="0"
				background="<%=contentPath%>/images/mhead.jpg">
				<tr>
					<td width="3%" align="center">
						<img src="<%=contentPath%>/images/mlogo.jpg" width="11"
							height="11">
					</td>
					<td width="15%" class="mhead">
						查看文件
					</td>
					<td width="74%" align="left" class="mhead">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="left">
										<input type="button" class="button" id="button"
											onclick="window.location='manager.jsp'" value="返回">
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
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										发文类型
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<%=document.getLb() %>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										文件编号
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<%=document.getWjbh() %>
									</td>
								</tr>

								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										文件标题
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<%=document.getBt() %>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										密级
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<%=StringUtil.parseNull(document.getMmcd(),"") %>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										签发人
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<%=StringUtil.parseNull(document.getQfr(),"") %>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										签发日期
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<%=StringUtil.parseNull(document.getQfrq(),"") %>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										拟稿部门
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<%=StringUtil.parseNull(document.getNgbm(),"") %>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										缓急时限
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<%=StringUtil.parseNull(document.getHjsx(),"") %>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										共印份数
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<%=StringUtil.parseNull(document.getGyfs(),"") %>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										主题词
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<%=StringUtil.parseNull(document.getZtc(),"") %>
									</td>
								</tr>
								
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										主送
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<%=StringUtil.parseNull(document.getZs(),"") %>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										抄送
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<%=StringUtil.parseNull(document.getCs(),"") %>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										抄报
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<%=StringUtil.parseNull(document.getCb(),"") %>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										是否加急
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<%=StringUtil.parseNull(document.getFwjb(),"") %>
									</td>
								</tr>

								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										备注
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<%=StringUtil.parseNull(document.getBz(),"") %>
									</td>
								</tr>
								<%if(hasFileList!=null && hasFileList.size()>0){ %>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										附件
									</td>
									<td class="NormalDataColumn" align="left" id="hasFile">
										&nbsp;&nbsp;
										<%
											for(int i=0; i<hasFileList.size(); i++){
												OfficeFile beanFile = (OfficeFile)hasFileList.get(i);%>
											<a href="<%=contentPath %>/officeFileDownload?pkid=<%=beanFile.getPkid() %>" >
												<img src="<%=contentPath %>/fileIco/<%=beanFile.getWjlx() %>.png" onerror="this.src='<%=contentPath %>/fileIco/other.png'" style="cursor: pointer;" border="0" alt="<%=beanFile.getWjm() %>(<%=StringUtil.getFileSize(beanFile.getWjcc().doubleValue()) %>)"><%=beanFile.getWjm() %>
											</a>&nbsp;&nbsp;&nbsp;
									     <%}%>
									</td>
								</tr>
								<%} %>
								<%if(document.getStatus()==null || document.getStatus().intValue()==0){ %>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										签收情况
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<span style="color: red">该文件还未发放</span>
									</td>
								</tr>
								<%}else{ %>
									<tr>
										<td nowrap="nowrap" width="120" class="NormalColumnTitle">
											签收情况<span style='color: red'>[未签收]</span>
										</td>
										<td class="NormalDataColumn" align="left">
											&nbsp;&nbsp;
											<%
											out.println(checkList.size()+"------------");
												for(int i=0; i<checkList.size(); i++){
													OfficeDocumentsCheck odc = (OfficeDocumentsCheck)checkList.get(i);
													String _tempUser = "";
													try{
														_tempUser = dao.findUserById(odc.getCheckman()).getRealName();
														System.out.println(_tempUser+"------------");
													}catch(Exception e){
														e.printStackTrace();
													}
													if(odc.getCheckflag()==null || odc.getCheckflag().equals("0")){
														out.print("<span style='color: red'>[" + _tempUser + "]</span>&nbsp;&nbsp;");
													}
												}%>
										</td>
									</tr>
									<tr>
										<td nowrap="nowrap" width="120" class="NormalColumnTitle">
											签收情况<span style='color: blue'>[已签收]</span>
										</td>
										<td class="NormalDataColumn" align="left">
											&nbsp;&nbsp;
											<%for(int i=0; i<checkList.size(); i++){
													OfficeDocumentsCheck odc = (OfficeDocumentsCheck)checkList.get(i);
													String _tempUser = "";
													try{
														_tempUser = dao.findUserById(odc.getCheckman()).getRealName();
													}catch(Exception e){}
													if(odc.getCheckflag()!=null && odc.getCheckflag().equals("1")){
														out.print("<span style='color: blue'>[" + _tempUser + "&nbsp;" + DateUtil.format(odc.getChecktime(),"yyyy-MM-dd HH:mm") + "]</span>&nbsp;&nbsp;");
													}
											}%>
										</td>
									</tr>
								<%} %>
							</table>
						</div>
					</td>
				</tr>

			</table>
		</form>
	</body>
</html>
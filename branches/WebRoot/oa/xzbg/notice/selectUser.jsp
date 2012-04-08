<%--
chivasju
Feb 3, 2010 10:44:45 AM
victorysoft
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Date"%>
<%@ include file="../../../import.jsp"%>
<%
	String noticeid = request.getParameter("noticeid");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type"
			content="text/html; charset=UTF-8">
		<title>
		</title>
        <script src="<%=request.getContextPath()%>/js/common.js"
                type="text/javascript" defer="defer"></script>
        <link href="<%=request.getContextPath()%>/css/xzbg-css.css" rel="stylesheet"
              type="text/css">
        <link href="<%=request.getContextPath()%>/js/ext/ /css/ext-all.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" charset="GB2312"
                src="<%=request.getContextPath()%>/js/date/WdatePicker.js" defer="defer"></script>
        <script type="text/javascript"
                src="<%=request.getContextPath()%>/js/ckeditor/ckeditor.js"></script>
        <script type="text/javascript"
                src="<%=request.getContextPath()%>/js/ext/adapter/ext/ext-base.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/ext/ext-all.js"></script>
		
	</head>
	<body onload="_resizeNoPage();">
	<form action="add.jsp" name="form1" method="post" enctype="multipart/form-data">
		<table width="100%" height="25" border="0" cellpadding="0"
			cellspacing="0" background="<%=contentPath %>/resource/images/mhead.jpg">
			<tr>
				<td width="3%" align="center">
					<img src="<%=contentPath %>/resource/images/mlogo.jpg" width="11" height="11">
				</td>
				<td width="15%" class="mhead">
					新建通知 
				</td>
				<td width="74%" align="left" class="mhead">
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tbody>
							<tr>
								<td align="left">
									<input type="button" class="button" id="button1"
										onclick="checkForm();"
										value="保存">
									&nbsp;
									<input type="button" class="button" id="button"
										onclick="history.back()"
										value="返回">
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
									通知/公告
								</td>
								<td class="NormalDataColumn" align="left">
									&nbsp;&nbsp;
									<input type="radio" name="isPublic" value="1" checked="checked" onclick="publicSelect(this);">通知&nbsp;
									<input type="radio" name="isPublic" value="0" onclick="publicSelect(this);">公告
								</td>
							</tr>
							<tr>
								<td nowrap="nowrap" width="120" class="NormalColumnTitle">
									通知状态
								</td>
								<td class="NormalDataColumn" align="left">
									&nbsp;&nbsp;
									<input type="radio" name="status" value="1" checked="checked">发布&nbsp;
									<input type="radio" name="status" value="0">草稿
								</td>
							</tr>
							<tr>
								<td nowrap="nowrap" width="120" class="NormalColumnTitle">
									是否需要签收
								</td>
								<td class="NormalDataColumn" align="left">
									&nbsp;&nbsp;
									<input type="radio" name="mustSign" value="1" checked="checked">需签收&nbsp;
									<input type="radio" name="mustSign" value="0">不需签收
								</td>
							</tr>
							<tr>
								<td nowrap="nowrap" width="120" class="NormalColumnTitle">
									通知标题
								</td>
								<td class="NormalDataColumn" align="left">
									&nbsp;&nbsp;
									<input type="text" name="notititle" class="inputStyle" style="width: 400px;">
								</td>
							</tr>

							<tr>
								<td nowrap="nowrap" width="120" class="NormalColumnTitle">
									开始时间
								</td>
								<td class="NormalDataColumn" align="left">
									&nbsp;&nbsp;
									<input type="text"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" name="starttime" class="inputStyle" style="width: 200px;">
								</td>
							</tr>
							<tr>
								<td nowrap="nowrap" width="120" class="NormalColumnTitle">
									结束时间
								</td>
								<td class="NormalDataColumn" align="left">
									&nbsp;&nbsp;
									<input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" name="endtime" class="inputStyle" style="width: 200px;">
								</td>
							</tr>
							<tr>
								<td nowrap="nowrap" width="120" class="NormalColumnTitle">
									过期时间
								</td>
								<td class="NormalDataColumn" align="left">
									&nbsp;&nbsp;
									<input type="text" name="enddate" value="<%=DateUtil.format(DateUtil.getDate(),"yyyy-MM-dd") %>" class="Wdate" onClick="WdatePicker()">
								</td>
							</tr>
							<tr>
								<td nowrap="nowrap" width="120" class="NormalColumnTitle">
									正文
								</td>
								<td class="NormalDataColumn" align="left">
									<textarea cols="80" id="editor" name="editor" rows="10"></textarea>
								</td>
							</tr>
							<tr>
								<td nowrap="nowrap" width="120" class="NormalColumnTitle">
									签发人
								</td>
								<td class="NormalDataColumn" align="left">
									&nbsp;&nbsp;
									<input type="text" name="subscriber" class="inputStyle" style="width: 100px;">
								</td> 
							</tr>
							
							<tr>
								<td nowrap="nowrap" width="120" class="NormalColumnTitle">
									备注
								</td>
								<td class="NormalDataColumn" align="left">
									&nbsp;&nbsp;
									<input type="text" name="bz" class="inputStyle" style="width: 200px;">
								</td>
							</tr>
							<tr>
								<td nowrap="nowrap" width="120" class="NormalColumnTitle">
									附件&nbsp;<img src="<%=contentPath %>/resource/images/add.gif" style="cursor: pointer;" alt="增加电子版" onclick="addFile();">
								</td>
								<td class="NormalDataColumn" align="left" id="fileTd">
									1.&nbsp;&nbsp;
									<input type="file" name="file_1" style="width: 400px;">
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
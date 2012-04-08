<!--
Author:chivasju
DateTime:2009-12-22 09:42:36
Company:Victorysofttttt
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../import.jsp"%>

<%
	OfficeDocumentsDAO officeDocumentsDAO = (OfficeDocumentsDAO)SpringFactory.instance.getBean("officeDocumentsDAO");
	OfficeDocumentsCheckDAO officeDocumentsCheckDAO = (OfficeDocumentsCheckDAO)SpringFactory.instance.getBean("officeDocumentsCheckDAO");
	List departmentList = orgnizationDAO.queryForList(null);
	String ksrq = request.getParameter("ksrq");
	if(ksrq==null){
		ksrq = DateUtil.format( DateUtil.parse(DateUtil.getYear(DateUtil.getDate())+"-01-01"),"yyyy-MM-dd");
	}
	String jsrq = request.getParameter("jsrq");
	if(jsrq==null){
		jsrq = DateUtil.format( DateUtil.parse(DateUtil.getYear(DateUtil.getDate())+"-12-31"),"yyyy-MM-dd");
	}
	String fast = request.getParameter("fast");
	if(fast==null){
		fast = "0";
	}
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
			<script src="<%=contentPath%>/js/common.js"
			type="text/javascript" defer="defer"></script>
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
		<script type="text/javascript">
			function goYear(){
				document.form1.ksrq.value="<%=DateUtil.format( DateUtil.parse(DateUtil.getYear(DateUtil.getDate())+"-01-01"),"yyyy-MM-dd") %>";
				document.form1.jsrq.value="<%=DateUtil.format( DateUtil.parse(DateUtil.getYear(DateUtil.getDate())+"-12-31"),"yyyy-MM-dd") %>";
			}
			
			function goMonth(){
				document.form1.ksrq.value="<%=DateUtil.format( DateUtil.parse(DateUtil.format(DateUtil.getDate(),"yyyy-MM")+"-01"),"yyyy-MM-dd") %>";
				document.form1.jsrq.value="<%=DateUtil.format( DateUtil.parse(DateUtil.format(DateUtil.getDate(),"yyyy-MM")+"-" + DateUtil.getLastDayOfMonth(DateUtil.getDate()) ),"yyyy-MM-dd") %>";
			}
			
			function goFind(){
				document.form1.submit();
			}
		</script>
	</head>
	<body>
	<form action="" method="post" name="form1">
		<table width="100%" align="center" height="25" border="0"
			cellpadding="0" cellspacing="0"
			background="<%=contentPath%>/images/mhead.jpg">
			<tr>
				<td width="3%" align="center">
					<img src="<%=contentPath%>/images/mlogo.jpg" width="11"
						height="11" alt="">
				</td>
				<td width="15%" class="mhead">
					签收统计
				</td>
				<td align="left" class="mhead">
					&nbsp;
				</td>
			</tr>
		</table>
		
		<table width="100%" align="center" height="25" border="0"
			cellpadding="0" cellspacing="0">
			
			<tr>
				<td>
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tbody>
							<tr>
								<td align="left">
									<div id="toolbar" style="width: 100%;"></div>
								</td>
							</tr>
						</tbody>
					</table>
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="0" class="mtabtab" id="mtabtab">
						<tr>
							<td nowrap="nowrap" class="NormalColumnTitle" width="40">
								序号
							</td>
							<td nowrap="nowrap" class="NormalColumnTitle">
								部门
							</td>
							<td nowrap="nowrap" class="NormalColumnTitle" width="120">
								部门人数
							</td>
							<td class="NormalColumnTitle" width="120">
								应签公文
							</td>
							<td class="NormalColumnTitle" width="120">
								已签公文
							</td>
							<td class="NormalColumnTitle" width="120">
								未签公文
							</td>
							<td class="NormalColumnTitle" width="120">
								签收率
							</td>
						</tr>
						<%
							for (int i = 0; i < departmentList.size(); i++) {
								COrgnization department = (COrgnization) departmentList.get(i);
								//应签文件
								String sql = "select *  from office_documents_check,u_orgnization,u_user,office_documents " + 
											 "where u_orgnization.orgna_id=u_user.orgna_id and  u_user.user_id=office_documents_check.checkman " + 
								      		 "and office_documents_check.documentid = office_documents.documentid and u_orgnization.orgna_id=" + department.getOrgnaId() + 
								      		 " and trunc(office_documents.cjrq)>=to_date('" + ksrq + "','yyyy-MM-dd') and trunc(office_documents.cjrq)<=to_date('" + jsrq + "','yyyy-MM-dd')";
								//System.out.println(sql);
								int all = officeDocumentsDAO.getMapByFreeSqlCount(sql);
								
								//部门人数
								sql = "select * from u_user where u_user.orgna_id=" + department.getOrgnaId();
								int personCount = officeDocumentsDAO.getMapByFreeSqlCount(sql);  
								
								//已签公文数
								sql = "select *  from office_documents_check,u_orgnization,u_user,office_documents " + 
											 "where u_orgnization.orgna_id=u_user.orgna_id and  u_user.user_id=office_documents_check.checkman " + 
								      		 "and office_documents_check.documentid = office_documents.documentid and u_orgnization.orgna_id=" + department.getOrgnaId() + 
								      		 " and trunc(office_documents.cjrq)>=to_date('" + ksrq + "','yyyy-MM-dd') and trunc(office_documents.cjrq)<=to_date('" + jsrq + "','yyyy-MM-dd') and office_documents_check.checkflag=1";
								int okCount = officeDocumentsDAO.getMapByFreeSqlCount(sql);    		 
								//未签公文数
								int noCount = all - okCount;
								
								//签收率
								String rag = "-";
								try{
									rag = NumberUtil.format((okCount*100/all*1.0),2);
								}catch(Exception e){}
						%>
						<tr>
							<td class="NormalDataColumn" align="center">
								<%=i + 1%>
							</td>
							<td class="NormalDataColumn" align="center">
								<%=department.getOrgnaName()%>
							</td>
							<td class="NormalDataColumn" align="center">
								<%=personCount%>
							</td>
							<td class="NormalDataColumn" align="center">
								<%=all%>
							</td>
							<td class="NormalDataColumn" align="center">
								<%=okCount%>
							</td>
							<td class="NormalDataColumn" align="center">
								<%=noCount%>
							</td>
							<td class="NormalDataColumn" align="center">
								<%=rag%>%
							</td>
						</tr>
						<%
							}
						%>

					</table>
				</td>
			</tr>
		</table>
		<script type="text/javascript">
		Ext.onReady(function(){
		
		    Ext.form.Field.prototype.msgTarget = 'under';
		
		    var tb = new Ext.Toolbar('toolbar');
		    tb.render('toolbar');
		    tb.add('&nbsp;&nbsp;开始日期：<input type="text" name="ksrq" class="Wdate" onClick="WdatePicker()" value="<%=ksrq %>">');
		    tb.add('&nbsp;&nbsp;');
		    tb.add('结束日期：<input type="text" name="jsrq" class="Wdate" onClick="WdatePicker()" value="<%=jsrq %>">');
		    tb.add('&nbsp;&nbsp;');
		    tb.add('<input type="radio" value="0" name="fast" <%if(fast.equals("0")){%> checked<%}%> onclick="goYear();">当年');
		    tb.add('&nbsp;&nbsp;');
		    tb.add('<input type="radio" value="1" name="fast" <%if(fast.equals("1")){%> checked<%}%> onclick="goMonth();">当月');
		    tb.add('&nbsp;&nbsp;');
		    tb.add('<input type="button" class="button" id="button"	onclick="goFind()" value="查询">');
		    tb.add('&nbsp;&nbsp;');
		    tb.add('<input type="button" class="button" id="button"	onclick="window.location=\'manager.jsp\'" value="返回">');
			tb.doLayout();
		});
	</script>
	</form>
	</body>
	
</html>
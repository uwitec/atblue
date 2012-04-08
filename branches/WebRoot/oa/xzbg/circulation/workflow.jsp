
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<html>
<%
	String fadm = request.getParameter("fadm");
	String jh=request.getParameter("jh");
%>
<head>
	<title>流程监控</title>
</head>
<link href="../../resource/css/css.css" rel="stylesheet" type="text/css" />

<body>

		<%
		    try{
		    String processId=request.getParameter("instanceid");
		%>
		<table id="filtertable" cellspacing="1" cellpadding="0" align="center" class="mtabtab">
			<tr>		
				<td width="563" align="center"><label class="tabletitle">审批流程</label></td>
			</tr>
			<tr>
				<td>
				<table width="100%" cellPadding="0"  cellSpacing="1"  class="mtabtab" id="mtabtab">
				<tr>
					<th width="15%" class="FixedTitleColumn">节点名称</th>
					<th width="20%" class="FixedTitleColumn">到达时间</th>
					<th width="20%" class="FixedTitleColumn">完成时间</th>
					<th width="15%" class="FixedTitleColumn">待处理人</th>
					<th width="15%" class="FixedTitleColumn">最终处理人</th>
					<th width="15%" class="FixedTitleColumn">签批单</th>
				</tr>
				<%
					UserService us=SpringFactory.getInstance().getUserService();
					List list = FLWFactory.getInstance().getFlwHistoryDAO().getHistoryTaskList(processId);
					for(int i=0;i<list.size();i++){
						FlwHistory flw = (FlwHistory) list.get(i);
						String jdmc = FLWFactory.getInstance().getFlwDefinitionDAO().getBean(flw.getDefinitionid()).getNodename();
						String bgcolor = "";
						if (i % 2 == 1) {
							bgcolor = "even";
						} else {
							bgcolor = "odd";
						}    
						String userdesc=flw.getFinishman().toString().replace("|","");  
				%>
				<tr>
					<td align="center" class="NormalDataColumn"><%=jdmc%></td>
			        <td align="center" class="NormalDataColumn"><%=DateUtil.format(flw.getCreatetime(),"yyyy-MM-dd HH:mm:ss")%></td>
			        <td align="center" class="NormalDataColumn"><%if(flw.getFinishtime()!=null){%><%=DateUtil.format(flw.getFinishtime(),"yyyy-MM-dd HH:mm:ss")%><%}else{%>&nbsp;<%}%></td>
			        <td align="center" class="NormalDataColumn"><%if(flw.getFinishman()!=null){String dclr=StringUtil.parseNull(us.findUserById(userdesc).getChsName(),us.findUserByName(userdesc).getChsName(),"&nbsp;");
			        out.print(dclr);}else{%><%="&nbsp;"%><%}%></td>
			        <td align="center" class="NormalDataColumn"><%if(flw.getRealman()!=null){
			        String zzclr=StringUtil.parseNull(us.findUserById(flw.getRealman().toString()).getChsName(),us.findUserById(flw.getRealman().toString()).getChsName(),"&nbsp;");
			        out.print(zzclr);
			       }else{%><%="&nbsp;"%><%}%></td>
				<%
			        DAOFactory factory = DAOFactory.getInstance();
			       	Sjsp_yw_qpd qpd = new Sjsp_yw_qpd();
				    try {	
				        qpd = factory.getSjsp_yw_qpdDAO().getBeanByTaskid(flw.getHistoryid());
				        
				    } catch (Exception e) {
				        e.printStackTrace();
				    } 

				    if(qpd==null){
			        %>
			       <td align="center" class="NormalDataColumn">&nbsp;</td>
			       <%}else{ %>
			        <td align="center" class="NormalDataColumn">
			        <input type="button" value="查看" class="button"  onClick="javascript:openWindow('&zt=<%=qpd.getZt()%>&taskid=<%=qpd.getTaskid()%>');">
			        </td>
			       <% }%>
				
				</tr>  
				
				<%} %>
			</table>
		</td>
	</tr>
</table>
<%}catch (Exception e){ 
}%>
</body>
<script type="text/javascript">
function openWindow(taskid){
window.open("./qpd/qpd_cgsq_view.jsp?fadm=<%=jh%>"+taskid,"签批单","height=600px,width=700px,resizable=no,status=no,titlebar=no,scrollbars=yes,toolbar=no,directories=no");
}
</script>
</html>
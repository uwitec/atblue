<%@ tag pageEncoding="gbk" %>
<%@ attribute name="style" required="false" rtexprvalue="true"%>
<%@ attribute name="styleClass" required="false" rtexprvalue="true"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<script type="text/javascript">
<!--
function toPage(page, pageSize) {
	reg = /^\d+$/;
	if(!reg.exec(page)) {
		alert("ҳ����������֣�������"+page+"��");
		return;
	}
	if(!reg.exec(pageSize)) {
		alert("ÿҳ��ʾ����Ŀ����Ϊ���֣�������"+pageSize+"��");
		return;
	}
	document.forms[0]['pagination.page'].value = page;
	document.forms[0]['pagination.pageSize'].value = pageSize;
	document.forms[0].submit();
}
//-->
</script>
<TABLE id=datapilotEmployee class=DataPilot cellSpacing=1 cellPadding=0>
<TBODY></TBODY>
<TBODY>
<TR>
<TD><BUTTON  style="PADDING-LEFT: 2px; PADDING-RIGHT: 2px" class=Button title=��һ����¼  onclick="toPage(1,${pagination.pageSize })">
<TABLE>
<TBODY>
<TR>
<TD><IMG src="<%=request.getContextPath()%>/images/move_first.gif"></TD></TR></TBODY></TABLE></BUTTON></TD>
<TD><BUTTON  style="PADDING-LEFT: 2px; PADDING-RIGHT: 2px" class=Button title=��һҳ  <s:if test="pagination.page<=1">disabled</s:if> onclick="toPage(${pagination.page-1 },${pagination.pageSize })">
<TABLE>
<TBODY>
<TR>
<TD><IMG <s:if test="pagination.page<=1">src="<%=request.getContextPath()%>/images/prev_page_disabled.gif"</s:if><s:else>src="<%=request.getContextPath()%>/images/prev_page.gif"</s:else>></TD></TR></TBODY></TABLE></BUTTON></TD>
<TD><BUTTON  style="PADDING-LEFT: 2px; PADDING-RIGHT: 2px" class=Button title=��һҳ  <s:if test="pagination.page>=pagination.totalPage">disabled</s:if> onclick="toPage(${pagination.page+1 }, ${pagination.pageSize })">
<TABLE>
<TBODY>
<TR>
<TD><IMG <s:if test="pagination.page>=pagination.totalPage">src="<%=request.getContextPath()%>/images/next_page_disabled.gif"</s:if><s:else>src="<%=request.getContextPath()%>/images/next_page.gif"</s:else>></TD></TR></TBODY></TABLE></BUTTON></TD>
<TD><BUTTON hideFocus style="PADDING-LEFT: 2px; PADDING-RIGHT: 2px"  class=Button title=���һ����¼  onclick="toPage(${pagination.totalPage },${pagination.pageSize })">
<TABLE>
<TBODY>
<TR>
<TD><IMG src="<%=request.getContextPath()%>/images/move_last.gif"></TD></TR></TBODY></TABLE></BUTTON></TD>
<TD style="WHITE-SPACE: nowrap" align=right>��${pagination.page }ҳ/��${pagination.totalPage }ҳ</TD>
<TD>&nbsp;&nbsp;<input type=text style="WIDTH: 30px" name="pagination.pageSize" class=TextEditor  value="${pagination.pageSize }">��/ҳ</TD>
<TD style="WIDTH: 1px"><INPUT style="WIDTH: 30px" name="pagination.page" class=TextEditor value="${pagination.page}"></TD>
<TD style="WIDTH: 1px"><BUTTON hideFocus class=Button  onclick="toPage(document.all['pagination.page'].value, document.all['pagination.pageSize'].value)">ת��</BUTTON></TD>
</TR></TBODY></TABLE>
<%@ tag pageEncoding="gbk" %>
<%@ attribute name="style" required="false" rtexprvalue="true"%>
<%@ attribute name="styleClass" required="false" rtexprvalue="true"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<script type="text/javascript">
<!--
function toPage(page, pageSize) {
	reg = /^\d+$/;
	if(!reg.exec(page)) {
		alert("页码必须是数字！现在是"+page+"。");
		return;
	}
	if(!reg.exec(pageSize)) {
		alert("每页显示的条目必须为数字！现在是"+pageSize+"。");
		return;
	}
	document.forms[0]['pagination.page'].value = page;
	document.forms[0]['pagination.pageSize'].value = pageSize;
	document.forms[0].submit();
}
//-->
</script>
<TABLE id=pilotEmployee class=PagePilot cellSpacing=1 cellPadding=0 >
<TBODY></TBODY>
<TBODY>
<TR>
<TD noWrap><LABEL class=CurrentPageLink >1</LABEL><LABEL class=PageLink >2</LABEL><LABEL class=PageLink >3</LABEL><LABEL class=PageLink>4</LABEL><LABEL class=PageLink>5</LABEL><LABEL class=PageLink >6</LABEL></TD>
<TD style="WIDTH: 8px"></TD>
<TD style="WHITE-SPACE: nowrap" align=right>第1页/共6页(共58条记录)</TD>
<TD style="WIDTH: 8px"></TD>
<TD style="WIDTH: 1px"><INPUT style="WIDTH: 30px" id=__control_10020 class=TextEditor value=1></TD>
<TD style="WIDTH: 1px"><BUTTON hideFocus id=__control_10021 class=Button >转到</BUTTON></TD></TR></TBODY></TABLE>
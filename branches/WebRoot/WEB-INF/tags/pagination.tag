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
<span style="font-size:12px;">
<input type="hidden" name="pagination.page" value="${pagination.page}">
<input type="hidden" name="pagination.pageSize" value="${pagination.pageSize}">
第${pagination.page }页/共${pagination.totalPage }页
<s:if test="pagination.page<=1">
首页
</s:if>
<s:else>
<a href="javascript:toPage(1,${pagination.pageSize })">首页</a>
</s:else>
<s:if test="pagination.page<=1">
上一页
</s:if>
<s:else>
<a href="javascript:toPage(${pagination.page-1 },${pagination.pageSize })">上一页</a>
</s:else>
<s:if test="pagination.page>=pagination.totalPage">
下一页
</s:if>
<s:else>
<a href="javascript:toPage(${pagination.page+1 }, ${pagination.pageSize })">下一页</a>
</s:else>
<s:if test="pagination.page>=pagination.totalPage">
尾页
</s:if>
<s:else>
<a href="javascript:toPage(${pagination.totalPage },${pagination.pageSize })">尾页</a>
</s:else>
到<input type=text name="page" style="width:20px;height: 18px" value="${pagination.page }">页
<input type=text name="pageSize" style="width:20px;height: 18px" value="${pagination.pageSize }">条/页
<input type=button value=GO class="Button" onclick="toPage(document.forms[0].page.value, document.forms[0].pageSize.value)">
</span>
<s:if test="pagination.message!=null">
<script>alert('${pagination.message}');</script>
</s:if>
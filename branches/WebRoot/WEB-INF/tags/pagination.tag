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
<span style="font-size:12px;">
<input type="hidden" name="pagination.page" value="${pagination.page}">
<input type="hidden" name="pagination.pageSize" value="${pagination.pageSize}">
��${pagination.page }ҳ/��${pagination.totalPage }ҳ
<s:if test="pagination.page<=1">
��ҳ
</s:if>
<s:else>
<a href="javascript:toPage(1,${pagination.pageSize })">��ҳ</a>
</s:else>
<s:if test="pagination.page<=1">
��һҳ
</s:if>
<s:else>
<a href="javascript:toPage(${pagination.page-1 },${pagination.pageSize })">��һҳ</a>
</s:else>
<s:if test="pagination.page>=pagination.totalPage">
��һҳ
</s:if>
<s:else>
<a href="javascript:toPage(${pagination.page+1 }, ${pagination.pageSize })">��һҳ</a>
</s:else>
<s:if test="pagination.page>=pagination.totalPage">
βҳ
</s:if>
<s:else>
<a href="javascript:toPage(${pagination.totalPage },${pagination.pageSize })">βҳ</a>
</s:else>
��<input type=text name="page" style="width:20px;height: 18px" value="${pagination.page }">ҳ
<input type=text name="pageSize" style="width:20px;height: 18px" value="${pagination.pageSize }">��/ҳ
<input type=button value=GO class="Button" onclick="toPage(document.forms[0].page.value, document.forms[0].pageSize.value)">
</span>
<s:if test="pagination.message!=null">
<script>alert('${pagination.message}');</script>
</s:if>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.opensymphony.xwork2.ActionContext;"%>
<%@ page import="com.opensymphony.xwork2.ActionContext" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib prefix="csd" uri="/WEB-INF/csd.tld" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>测试类型</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/main.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jcd/csd.js" defer="defer"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jcd/rowdef.js" defer="defer"></script>
	
	<script type="text/javascript">
		function update() {
    		form = document.cslxForm;
    		for(i=0;i<form.elements.length;i++){
    		 	pn1 = /lxxh/;
    		 	if(pn1.exec(form.elements[i].name)){
    		 		if(form.elements[i].value==null||form.elements[i].value.length==0) {
    		 			alert("编号不能为空！");
    		 			form.elements[i].select();
    		 			return;
    		 		}else{
    		 			if(form.elements[i].value.length>4) {
    		 				alert("编号长度不能超过4个字符！");
    		 				form.elements[i].select();
    		 				return;
    		 			}
    		 			for(j=i+1;j<form.elements.length;j++){
    		 				if(pn1.exec(form.elements[j].name)){
    		 					if(form.elements[i].value==form.elements[j].value){
    		 						alert("编号不能相同！");
    		 						form.elements[j].select();
    		 						return;
    		 					}
    		 				}
    		 			}
    		 		}
    		 	}
    		}
    		if(confirm("保存修改后，删除的数据不能恢复，确定保存？")) {
    			form.method = "post";
    			form.action = "/jcd/csd/fl/updateCslx.vs";
    		 	form.submit(); 
    		} 
    	 } 
	</script>
  </head>
  
  <body>
    <form name="cslxForm">
    <table width=100%>
    <caption><strong>测试类型</strong></caption>
    <tr><td>
    <table id="cslx" class="content" width=100%>
    <tr id="header" style="text-align:center;background-color:C0C0C0;height:35px">
    	<th>序号</th>
    	<th>编号</th>
    	<th>所属分类</th>
    	<th>名称</th>
    	<th>描述</th>
    	<th>操作</th>
    </tr>
    
     <s:iterator value="entityList" status="status">
    	<tr id="row<s:property value="#status.index+1"/>">
    		<td align="center"><s:property value="#status.index+1"/></td>
    		<td><input type="text" name="cslxs[<s:property value="#status.index"/>].lxxh" value="${lxxh}"/></td>
    		<td>
    		<%String name = "cslxs["+ ActionContext.getContext().getValueStack().findValue("#status.index")+"].ssfl" ;%>
    		<csd:select defaultValue="${ssfl }" name="<%=name %>" valueProperty="ssfl" textProperty="ssfl" queryId="FL_CSLX.queryDistinctSsfl"/>
    		</td>
    		<td><input type="text" name="cslxs[<s:property value="#status.index"/>].lxmc" value="${lxmc }"/></td>
    		<td><input type="text" name="cslxs[<s:property value="#status.index"/>].lxms" value="${lxms }"/></td>
    		<td align="center"><a href="javascript:deleteRowFromTable('cslx','row<s:property value="#status.index+1"/>')">删除</a></td>
    	</tr>
    </s:iterator>
    
    <tr id="footer">
   		<td>&nbsp;</td>
    	<td>&nbsp;</td>
   	    <td>&nbsp;</td>
     	<td>&nbsp;</td>
    	<td style="height:28" align=right><a href="javascript:insertCslxRow('cslx')">>>添加</a></td>
    <td><a href="javascript:update()">保存</a></td>
    </tr>
    </table>
    </td></tr>	
    </table>
    </form>
    <div style="display:none">
    <select id="s">
    	<option value="试井">试井</option>
    	<option value="水井测试">水井测试</option>
    	<option value="测井">测井</option>
    </select>
    </div>
  </body>
</html>

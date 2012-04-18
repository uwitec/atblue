<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="java.util.StringTokenizer" %>
<%@ page import="java.util.List" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="<%=request.getContextPath() %>/manager/css.css" type="text/css" rel="stylesheet"/>
<link href="<%=request.getContextPath() %>/css/css.css" rel="stylesheet" type="text/css">
<style type="text/CSS">
body {font:normal 12px Verdana}
a#tip {position:relative;left:30px; font-weight:bold;}
a#tip:link,a#tip:hover {text-decoration:none;color:#000;display:block}
a#tip span {display:none;text-decoration:none;}
a#tip:visited {color:#000;text-decoration:underline;}
a#tip:hover #tip_info {display:block;border:1px solid #F96;background:#FFEFEF;padding:10px 20px;position:absolute;top:0px;left:90px;color:#009933}
</style>
<title>新增用户</title>
</head>  
<body>
<form name="person_save" method="post" action="person_save.d">
<input type="hidden" name="userIp" value="" />
<input type="hidden" name="action" value="add" />
<table width="100%" border="0" cellpadding="0" cellspacing="0" >
  <tr>
    <td>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tablett" style="BORDER-COLLAPSE: collapse">
      <tr>
        <td class="tdadd" width="20%">登录帐户：</td>
        <td class="tdadd" colspan="2"><input name="user.userName" type="text" id="userName" /><span style="color: red;">*</span></td>
        </tr>  
      <tr>
        <td class="tdadd">登录密码：</td>
        <td class="tdadd" colspan="2"><input name="user.password" type="password" id="password" /><span style="color: red;">*</span></td>
        </tr>
      <tr>
        <td class="tdadd">人员名称：</td>
        <td class="tdadd" colspan="2"><input name="user.realName" type="text" id="realName" /><span style="color: red;">*</span></td>
        </tr>
      <tr>
        <td class="tdadd">所属部门：</td>
        <td class="tdadd" colspan="2">
        	<select name="user.orgnaId" style="width: 200px;">
                <option value="">请选择</option>
                <s:iterator value="orgTreeList">
                    <option value="${ORGNA_ID}">${ORGNA_NAME}</option>
                </s:iterator>
        	</select><span style="color: red;">*</span>
        </td>
      </tr>
      <tr>
        <td class="tdadd">人员描述：</td>
        <td class="tdadd" colspan="2"><textarea name="user.userDesc" cols="50" rows="3" id="userDesc"></textarea></td>
        </tr>
      <tr>
        <td class="tdadd">性别：</td>
        <td  class="tdadd"colspan="2"><select name="user.sex"><option value="1">男</option><option value="2">女</option></select></td>
        </tr>
        <tr>
        <td class="tdadd">手机：</td>
        <td  class="tdadd"colspan="2"><input name="user.mobile" type="text" id="mobile" value=""/></td>
        </tr>
        <tr>
        <td class="tdadd">办公室电话：</td>
        <td  class="tdadd"colspan="2"><input name="user.phone" type="text" id="mobile" value=""/></td>
        </tr>
        <tr>
        <td class="tdadd">住宅电话：</td>
        <td  class="tdadd"colspan="2"><input name="user.homePhone" type="text" id="mobile" value=""/></td>
        </tr>
        <tr>
        <td class="tdadd">邮箱：</td>
        <td  class="tdadd"colspan="2"><input name="user.email" type="text" id="email" value=""/></td>
        </tr>
        <tr>
        <td class="tdadd">排列序号：</td>
        <td  class="tdadd"colspan="2"><input name="user.userOrder" type="text" id="userOrder" value=""/></td>
        </tr>
    </table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bgdh">
  <tr>
    <td width="16%">&nbsp;</td>
    <td width="7%"><input class="button" name="saveUser" type="button" id="saveUser" value="提交" onClick="validate()"/></td>
    <td width="77%"><input class="button" name="retrunList" type="button" id="retrunList" value="返回" onClick="returnList()"/></td>
  </tr>
</table>
	</td>
  </tr>
</table>
</form>
<script>
function returnList(){
	self.location.href="person_list.d";
}
function validate(){
	var userName = document.all["user.userName"].value;
	var userRealName = document.all["user.realName"].value;
	var password = document.all["user.password"].value;
	if(userName==null || userName==''){
		alert('帐户不能为空！');
		document.all["user.userName"].focus();
		return;
	}
	if(password==null || password==''){
		alert('密码不能为空！');
		document.all["user.password"].focus();
		return;
	}
	if(userRealName==null || userRealName==''){
		alert('人员名称不能为空！');
        document.all["user.realName"].focus();
		return;
	}
  	document.forms[0].submit();
}
</script>
</body>
</html>
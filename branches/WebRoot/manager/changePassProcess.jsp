<%@page import="javax.naming.directory.DirContext"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="org.springframework.ldap.core.LdapTemplate" %>
<%@ include file="../import.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="StyleSheet" href="css/css.css" type="text/css" />

<script type="text/javascript">
function fanhui(){
   document.location = "changePassword.jsp";
}
</script>
<title>修改用户密码逻辑处理</title>
</head>

<body>
<script>
function return1(){
	window.location.href="changePassword2.jsp";
}
</script>
<% 

//设置提交参数
boolean flag = false;
//读取参数
String oldPass = null == request.getParameter("oldPass")?"":request.getParameter("oldPass");
String repeatPass = null == request.getParameter("repeatPass")?"":request.getParameter("repeatPass");
String newPass = null == request.getParameter("newPass")?"":request.getParameter("newPass");

//校验
if("".equals(oldPass)){
	%>
	<table width="100%" border="0" class="bgdh">
			  <tr>
			    <td width="100%">请输入用户密码：</td>
			  </tr>
	</table>
	<%
	return ;
}

if("".equals(newPass)){
	%>
	<table width="100%" border="0" class="bgdh">
			  <tr>
			    <td width="100%">新密码不允许为空！</td>
			  </tr>
	</table>
	<%
	return;
	
}

if(!newPass.equals(repeatPass)){
	%>
	<table width="100%" border="0" class="bgdh">
			  <tr>
			    <td width="100%">两次输入的密码不一致！请重新输入！</td>
			  </tr>
	</table>
	<%
	return;
}

//当前用户如果为管理员帐户
	String pass = _user.getPassword();
	String pass_md5 = StringUtil.MD5Encode(oldPass);
	if(! pass_md5.equals(pass) && !pass.equals(oldPass)){
		%>
		<table width="100%" border="0" class="bgdh">
			  <tr>
			    <td width="100%">用户密码输入不正确！请<span onclick="fanhui();" style="cursor:hand"><font color="#0000ff">返回</font></span>重新输入！</td>
			  </tr>
		</table>
		<%
		return;
	}

	try{
        dao.updateUserPassword(_user.getUserId(), StringUtil.MD5Encode(newPass));
		%>
		<table width="100%" border="0" class="bgdh">
			  <tr>
			    <td width="100%">密码修改完成！</td>
			  </tr>
		</table>
		<%
	}catch(Exception e){
		%>
		<table width="100%" border="0" class="bgdh">
			  <tr>
			    <td width="100%">&nbsp;</td>
			  </tr>
		</table>
		<%
		return;
	}
%>
</body>
</html>
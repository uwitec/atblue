<html>
<head>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
   %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
    <link href="<%=request.getContextPath() %>/css/css.css" type="text/css" rel="stylesheet"/>
    <link href="<%=request.getContextPath() %>/images/css.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript">
    String.prototype.trim = function () {
        return this.rtrim().ltrim();
    };
    String.prototype.rtrim = function () {
        return this.replace(/\s*$/, "");
    };
    String.prototype.ltrim = function () {
        return this.replace(/^\s*/, "");
    };
</script>
<title>修改密码界面</title>
</head>
<body>
<form method="post" name="changePass" action="changePassProcess.jsp" >
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="mtabtab" style="BORDER-COLLAPSE: collapse">
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tablett" style="BORDER-COLLAPSE: collapse">
      <tr>
        <td class="head_left" width="30%">请输入用户密码：</td>
        <td class="head_right" width="" style="text-align: left">
        <input name="oldPass" type="password" id="oldPass" value="" size="30"></td>
      </tr>
      
      <tr>
        <td class="head_left">请输入您的新密码：</td>
        <td class="head_right" style="text-align: left"><input name="newPass" type="password" id="newPass" size="30"/></td>
      </tr>
      <tr>
        <td  class="head_left">请确认您的新密码：</td>
        <td class="head_right" style="text-align: left"><input name="repeatPass" type="password" id="repeatPass" size="30"/></td>
      </tr>
    </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="bgdh">
          <tr>
            <td align="center"><input class="button" name="save" type="button" onclick="tj();"
					id="save" value="提交" />&nbsp;&nbsp;&nbsp;
			</td>
          </tr>
      </table></td>
  </tr>
</table>
</form>
<script type="text/javascript">
  function tj(){
      var oldpass = document.all.oldPass.value.trim();
      var newpass = document.all.newPass.value.trim();
      var repeatpass = document.all.repeatPass.value.trim();
      if(oldpass == ""){
          alert("原密码不能为空");
          return false;
      }
      if(newpass == ""){
          alert("新密码不能为空");
          return false;
      }
      if(newpass != repeatpass){
          alert("两次输入的密码不一致！请重新输入！");
          return false;
      }
      document.forms[0].submit();
  }
</script>
</body>
</html>
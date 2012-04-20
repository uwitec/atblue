<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" import="java.sql.*" errorPage="" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="StyleSheet" href="css/css.css" type="text/css" />
<link rel="StyleSheet" href="style/dtree.css" type="text/css" />
<link href="<%=request.getContextPath() %>/css/css.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/images/css.css" rel="stylesheet" type="text/css">
    <script>
        //选中的行变量
        var selectedId = null;
        var selectedBackground= null;
        var selectedTr = null;

        //设置某个表的某一行被选中
        function setSelected(tr,tab_id,tr_head,selectedId_,rowClass,curClass){
            if (tr != null) {
                if (selectedTr != null) {
                    selectedTr.style.background = selectedBackground;
                }
                selectedBackground = tr.style.background;
                tr.style.background = "#fff4a8";
            }
            selectedId = selectedId_;
            selectedTr = tr;
        }

        function getSelected(){
            if(null == selectedId){
                alert("请首先选择您要操作的行！");
                return false;
            }else{
                return true;
            }
        }
        //显示下拉列表框的值
        function getSelectionValue(obj,value){
            var options = document.getElementById(obj).options;
            if(options.length>0){
                for(var i=0;i<options.length;i++){
                    var option = options[i];
                    if(option.value == value){
                        option.selected = "selected";
                    }
                }
            }
        }
    </script>
<title>角色列表</title>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="">
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="bgdh">
      <tr>
        <td width="">
          <div align="left">
            <input class="button" name="popUpAdd" type="button" id="popUpAdd" value="新增角色" onclick="popUpAdd();" style="width:100px;"/>
            <input class="button" name="popUpMod" type="button" id="popUpMod" value="修改角色" onclick="popUpMod();" style="width:100px;"/>
            <input class="button" name="popUpDel" type="button" id="popUpDel" value="删除角色" onclick="processDel();" style="width:100px;"/>
            <input class="button" name="popUpUrl" type="button" id="popUpUrl" value="URL访问权限" onclick="popUpUrl();" style="width:100px;"/>
	    <%--<input class="button" name="popUpUser" type="button" id="popUpUser" value="所属人员" onclick="popUpUser();" style="width:100px;"/>--%>
            </div></td>
        <td width="">
          <div align="left">
            
            </div></td>
        <td width="">
          <div align="left">
            
            </div></td>
        <td width=""></td>
        <td width=""><div align="left"></div></td>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td>
    <table width="100%" border="0" cellpadding="0" id="tab_id" cellpadding="0" cellspacing="0" class="mtabtab" style="BORDER-COLLAPSE: collapse">
      <tr id="tr_head">
        <th class="head">序号</th>
        <th class="head">角色名称</th>
        <th class="head">角色描述</th>
        <th class="head">角色标识</th>
      </tr>
      <s:iterator value="dataList" status="stat">
      <tr onclick="setSelected(this,'tab_id','tr_head','${ROLE_ID}')" >
        <td class="form"  style="text-align: center; width: 50px;">&nbsp;<s:property value="#stat.index+1"/></td>
        <td class="form"  style="text-align: left;">&nbsp;${ROLE_NAME}</td>
        <td class="form"  style="text-align: left;">&nbsp;${ROLE_DESC}</td>
        <td class="form"  style="text-align: right;">&nbsp;${ROLE_ORDER}</td>
      </tr>
      </s:iterator>
    </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<script>
function popUpAdd(){
	self.location.href="role_add.d";
}

function popUpMod(){
	if(getSelected()){
		self.location.href="role_mod.d?roleId="+selectedId;
	}
}

function popUpUrl(){
	if(getSelected()){
		self.location.href="role_url.d?roleId="+selectedId;
	}
}

function popUpPanel(){
	if(getSelected()){
		self.location.href="modRoleByPanel.jsp?roleId="+selectedId;
	}
}

function processDel(){
	if(getSelected()){
		if(confirm("确定要删除吗？")){
			window.location.href = "role_del.d?roleId="+selectedId;
		}
		
	}
}
function popUpUser(){
	if(getSelected()){
		self.location.href="selectUserByRole.jsp?roleId="+selectedId;
	}
}
</script>
</body>
</html>

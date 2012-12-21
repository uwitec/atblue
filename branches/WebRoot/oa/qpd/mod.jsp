<%@ page import="cn.com.atblue.common.util.StringUtil" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String flag = StringUtil.parseNull(request.getParameter("flag"), "");
    if("add".equals(flag)){ %>
<script type="text/javascript">
    alert("签批表单添加成功!");
    window.location = "qpd_list.d";
</script>
<%    }
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="<%=request.getContextPath() %>/images/css.css" type="text/css" rel="stylesheet"/>
    <link href="<%=request.getContextPath() %>/css/css.css" type="text/css" rel="stylesheet"/>
    <title>修改签批表单</title>
</head>
<body>
<form method="post" action="qpd_save.d">
    <input type="hidden" name="action" value="save"/>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" >
        <tr>
            <td>
                <FIELDSET style="HEIGHT: 0px; OVERFLOW: visible" class=GroupBox>
                    <LEGEND class=GroupBoxTitle>
                        <TABLE>
                            <TBODY>
                            <TR>
                                <TD><LABEL style="WIDTH: 100%; WHITE-SPACE: nowrap; HEIGHT: 100%">签批表单信息</LABEL></TD>
                                <TD><IMG class=GroupBoxExpandButton src="<%=request.getContextPath()%>/images/groupbox_expand.gif"></TD>
                            </TR>
                            </TBODY>
                        </TABLE>
                    </LEGEND>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="mtabtab" style="BORDER-COLLAPSE: collapse">
                        <tr>
                            <td class="head_left" width="20%">表单名称：</td>
                            <td class="head_right" colspan="2" style="text-align: left">
                                <input type="hidden" name="formId" value="${bean.formId}"/>
                                <input type="hidden" name="bean.formId" value="${bean.formId}"/>
                                <input name="bean.formName" type="text" class="textinput" style="width: 200px" value="${bean.formName}"/><span style="color: red;">*</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="head_left">表单标题：</td>
                            <td class="head_right" colspan="2" style="text-align: left"><input name="bean.formTitle" style="width: 200px" type="text" class="textinput"  value="${bean.formTitle}"/><span style="color: red;">*</span></td>
                        </tr>
                    </table>
                </FIELDSET>
            </td>
        </tr>
        <tr>
            <td>
                <FIELDSET style="HEIGHT: 0px; OVERFLOW: visible" class=GroupBox>
                    <LEGEND class=GroupBoxTitle>
                        <TABLE>
                            <TBODY>
                            <TR>
                                <TD><LABEL style="WIDTH: 100%; WHITE-SPACE: nowrap; HEIGHT: 100%">表单项列表</LABEL></TD>
                                <TD><IMG class=GroupBoxExpandButton src="<%=request.getContextPath()%>/images/groupbox_expand.gif"></TD>
                            </TR>
                            </TBODY>
                        </TABLE>
                    </LEGEND>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="bgdh">
                        <tr>
                            <td colspan="3" style="text-align: left"><input class="button" type="button" value="添加" style="width:50px;" onClick="insertRowToTable();"/></td>
                        </tr>
                    </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" id="tab_id" class="mtabtab" style="BORDER-COLLAPSE: collapse">
                        <tr id="tr_head">
                            <th class="head">表单项名称</th>
                            <th class="head">表单项标题</th>
                            <th class="head" width="8%">排序</th>
                            <th class="head" width="5%" nowrap="">操作</th>
                        </tr>
                        <s:iterator  value="dataList">
                              <tr>
                                  <td class="form">
                                      <input name='formItemIds' type='hidden'  value='${FORM_ITEM_ID}'/><input name='formItemNames' type='text' id='formItemNames' value="${FORM_ITEM_NAME}" class='textinput' style='width:100%'/>
                                  </td>
                                  <td class="form">
                                      <input name='formItemTitles' type='text' id='formItemTitles' value="${FORM_ITEM_TITLE}" class='textinput' style='width:100%'/>
                                  </td>
                                  <td class="form">
                                      <input name='pxs' type='text' id='px' value="${PX}" class='textinput' style='width:100%'/>
                                  </td>
                                  <td class="form">
                                      <input class='button' name='del' type='button' id='del' value='删除' onClick='deleteRowToTable(this)'/>
                                  </td>
                              </tr>
                        </s:iterator>
                    </table>
                </FIELDSET>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="bgdh">
                    <tr>
                        <td width="16%">&nbsp;</td>
                        <td width="7%"><input class="button" type="Button"  value="提交" style="width:50px;" onClick="doSubmit()"/></td>
                        <td width="77%"><input class="button" type="Button" value="返回" style="width:50px;" onClick="returnList()"/></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
<script>
    function returnList(){
        window.history.go(-1);
    }
    function doSubmit(){
        var formName = document.all["bean.formName"].value;
        var formTitle = document.all["bean.formTitle"].value;
        if(formName==null || formName==''){
            alert('表单名称不能为空！');
            document.all["bean.formName"].focus();
            return;
        }
        if(formTitle==null || formTitle==''){
            alert('表单标题不能为空！');
            document.all["bean.formTitle"].focus();
            return;
        }
        document.forms[0].submit();
    }

    function insertRowToTable() {
        var tab=document.getElementById("tab_id");
        var trs=tab.getElementsByTagName("tr");
        var ln =0;
        ln = trs.length;
        var trRow=tab.insertRow(ln);
        trRow.className = "form";
        trRow.id=ln;
        var cell1=trRow.insertCell(0);
        cell1.className = "form";
        cell1.style.textAlign="center";
        cell1.innerHTML="<input name='formItemIds' type='hidden'  value=''/><input name='formItemNames' type='text' id='formItemNames' class='textinput' style='width:100%'/>";
        var cell2=trRow.insertCell(1);
        cell2.className = "form";
        cell2.style.textAlign="center";
        cell2.innerHTML="<input name='formItemTitles' type='text' id='formItemTitles' style='width:100%' class='textinput'/>";
        var cell3=trRow.insertCell(2);
        cell3.className = "form";
        cell3.style.textAlign="center";
        cell3.innerHTML="<input name='pxs' type='text' style='width:100%' class='textinput'/>";
        var cell4=trRow.insertCell(3);
        cell4.style.textAlign="center";
        cell4.className = "form";
        cell4.innerHTML="<input class='button' name='del' type='button' id='del' value='删除' onClick='deleteRowToTable(this)'/>";
    }

    function deleteRowToTable(t){
        var tab=document.getElementById("tab_id");
        var ctr = t.parentElement.parentElement;
        tab.deleteRow(ctr.rowIndex);
    }
</script>
</body>
</html>

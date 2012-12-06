<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ include file="../../../import.jsp"%>
<%
    CUser cUser = (CUser)session.getAttribute("cUser");
    cUser = cUser == null?new CUser():cUser;
    String orgId = cUser.getOrgnaId();
    Map paramMap = new HashMap();
    paramMap.put("orgnaId",orgId);
    COrgnization cOrgnization = orgnizationDAO.queryForBean(paramMap);
    cOrgnization = cOrgnization == null?new COrgnization():cOrgnization;
    List userList  = dao.getGsldAllUser();
    List userList1  = dao.getJgksAllUser();
    List userList2  = dao.getJcdwAllUser();
    userList = userList == null?new ArrayList():userList;
    userList1 = userList1 == null?new ArrayList():userList1;
    userList2 = userList2 == null?new ArrayList():userList2;
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link href="<%=request.getContextPath()%>/images/css.css" rel="stylesheet"
      type="text/css">
<link href="<%=request.getContextPath()%>/js/ext/resources/css/ext-all.css" rel="stylesheet" type="text/css">
<script type="text/javascript" charset="GB2312"
        src="<%=request.getContextPath()%>/js/date/WdatePicker.js" defer="true"></script>
<script type="text/javascript"
        src="<%=request.getContextPath()%>/js/ckeditor/ckeditor.js"></script>
<script type="text/javascript"
        src="<%=request.getContextPath()%>/js/ext/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ext/ext-all.js"></script>

<script type="text/javascript">
    function _resizeNoPage() {
        document.getElementById("scrollDiv").style.width = document.body.clientWidth - 18;
        document.getElementById("scrollDiv").style.height = document.body.clientHeight - 50;
    }

    function CheckDateTime(object){
        var rr=/^(?:19|20)[0-9][0-9]-(?:(?:0[1-9])|(?:1[0-2]))-(?:(?:[0-2][1-9])|(?:[1-3][0-1])) (?:(?:[0-2][0-3])|(?:[0-1][0-9])):[0-5][0-9]$/
        if(!rr.test(object.value)){
            object.focus();
            return false;
        }
        return true;
    }
    function CheckDate(object){
        var rr=/^(?:19|20)[0-9][0-9]-(?:(?:0[1-9])|(?:1[0-2]))-(?:(?:[0-2][1-9])|(?:[1-3][0-1]))$/
        if(!rr.test(object.value)){
            object.focus();
            return false;
        }
        return true;
    }

    function checkForm(){
        var has = false;
        for (var i = 0; i < document.form1.ubox.length; i++) {
            if (document.form1.ubox[i].checked) {
                has = true;
                break;
            }
        }
        if (!has) {
            alert("请选择签收用户.");
            return;
        }
        if(document.all["bean.mailZt"].value==""){
            document.all["bean.mailZt"].focus();
            alert("请输入邮件主题");
            return;
        }
        document.form1.submit();
    }
</script>
</head>
<body onload="_resizeNoPage();">
<form action="fwdw_save.d" name="form1" method="post">
    <input type="hidden" name="action" value="add"/>
    <table width="100%" height="25" border="0" cellpadding="0"
           cellspacing="0"
           background="<%=request.getContextPath()%>/images/mhead.jpg">
        <tr>
            <td width="3%" align="center">
                <img src="<%=request.getContextPath()%>/images/mlogo.jpg" width="11"
                     height="11">
            </td>
            <td width="15%" class="mhead">
                新建服务单位信息
            </td>
            <td width="74%" align="left" class="mhead">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tbody>
                    <tr>
                        <td align="left">
                            <input type="submit" class="button" id="button"
                                    value="保存">
                            &nbsp;
                            <input type="button" class="button" id="button1"
                                   onclick="history.back()" value="返回">
                            &nbsp;
                        </td>
                    </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <%--固定表头DIV--%>
                <div id="scrollDiv"
                     style="width: 1000px; overflow: auto; cursor: default; display: inline; position: absolute; height: 200px;">
                    <table width="100%" border="0" align="center" cellpadding="0"
                           cellspacing="0" class="mtabtab" id="mtabtab">
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                服务单位名称<span style="color: red">&nbsp;*</span>
                            </td>
                            <td class="head_right" align="left">
                                <input type="text" name="bean.mc" value=""  style="width:500px"/>
                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                简称<span style="color: red">&nbsp;*</span>
                            </td>
                            <td class="head_right" align="left">
                                <input type="text" name="bean.jc" value=""/>
                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                联系人
                            </td>
                            <td class="head_right" align="left">
                                <input type="text" name="bean.lxr" value=""  style="width:500px"/>
                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                电话
                            </td>
                            <td class="head_right" align="left">
                                <input type="text" name="bean.dh" value=""/>
                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                地址
                            </td>
                            <td class="head_right" align="left">
                                <textarea cols="80" id="dz" name="bean.dz" rows="10"></textarea>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>

    </table>
</form>
</body>
</html>
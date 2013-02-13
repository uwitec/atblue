<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ include file="../../../import.jsp"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
<link href="<%=request.getContextPath()%>/images/css.css" rel="stylesheet"  type="text/css">
<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet"  type="text/css">
<script type="text/javascript" charset="GB2312"
        src="<%=request.getContextPath()%>/js/date/WdatePicker.js" defer="true"></script>

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
<form action="qzyf_save.d" name="form1" method="post">
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
                新建迁装运费信息
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
                                完成日期<span style="color: red">&nbsp;*</span>
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                <input type="text" name="bean.wcrq" value="" class="Wdate" onClick="WdatePicker()"/>
                            </td>
                            <td nowrap="nowrap" width="120" class="head_left">
                                队号<span style="color: red">&nbsp;*</span>
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                <select name="bean.dh"  style="width:200px;">
                                    <option value="">请选择</option>
                                    <s:iterator value="orgTreeList">
                                        <option value="${ORGNA_ID}">${ORGNA_NAME}</option>
                                    </s:iterator>
                                </select>
                            </td>
                        </tr>
                        <tr>
                        <td nowrap="nowrap" class="head_left">
                            新井号
                        </td>
                        <td class="head_right" align="left" style="text-align: left">
                            <input type="text" name="bean.xjh" value="" style="width: 100%"/>
                        </td>
                        <td nowrap="nowrap" class="head_left">
                            老井号
                        </td>
                        <td class="head_right" align="left" style="text-align: left">
                            <input type="text" name="bean.ljh" value="" style="width: 100%"/>
                        </td>
                    </tr>
                        <tr>
                            <td nowrap="nowrap" class="head_left">
                                工作内容
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                <input type="text" name="bean.nrbm" value=""/>
                            </td>
                            <td nowrap="nowrap" class="head_left">
                                距离
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                <input type="text" name="bean.jl" value=""/>
                            </td>
                        </tr>
                        <tr>
                        <td nowrap="nowrap" class="head_left">
                            车型数量
                        </td>
                        <td class="head_right" align="left" style="text-align: left">
                            <input type="text" name="bean.cxsl" value=""/>
                        </td>
                        <td nowrap="nowrap" class="head_left">
                            编码
                        </td>
                        <td class="head_right" align="left" style="text-align: left">
                            <input type="text" name="bean.bm" value=""/>
                        </td>
                    </tr>
                        <tr>
                            <td nowrap="nowrap" class="head_left">
                                迁装费
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                <input type="text" name="bean.qzf" value="" onkeyup="this.value=this.value.replace(/[^\d\.]+?/g,'')"/>元
                            </td>
                            <td nowrap="nowrap" class="head_left">
                                路桥费
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                <input type="text" name="bean.lqf" value="" onkeyup="this.value=this.value.replace(/[^\d\.]+?/g,'')"/>元
                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" class="head_left">
                                预算费用
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                <input type="text" name="bean.ysfy" value="" onkeyup="this.value=this.value.replace(/[^\d\.]+?/g,'')"/>元
                            </td>
                            <td nowrap="nowrap" class="head_left">
                                录入人
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                               <%=cUser.getRealName()%>&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" class="head_left">
                                备注
                            </td>
                            <td class="head_right" align="left" style="text-align: left" colspan="3">
                                <textarea cols="80" id="dz" name="bean.bz" rows="10" style="width: 100%"></textarea>
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
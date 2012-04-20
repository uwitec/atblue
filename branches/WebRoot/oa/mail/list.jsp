<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="cn.com.atblue.manager.bean.CUser" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<%@ include file="../../import.jsp"%>
<jsp:useBean id="pageBean" class="cn.com.atblue.common.bean.PageBean"
             scope="page">
    <jsp:setProperty name="pageBean" property="*" />
</jsp:useBean>
<%
    CUser cUser = (CUser)session.getAttribute("cUser");
    cUser = cUser == null?new CUser():cUser;
    String orgId = cUser.getOrgnaId();
    String hymc = StringUtil.parseNull(request.getParameter("hymc"),"");
    Map paramMap = new HashMap();
    if(!StringUtil.isBlankOrEmpty(hymc))
        paramMap.put("hymc",hymc);
    paramMap.put("orgnaId", _user.getOrgnaId()==null?"":_user.getOrgnaId());
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>邮件列表</title>
    <script src="<%=request.getContextPath()%>/js/common.js"
            type="text/javascript" defer="defer"></script>
    <link href="<%=request.getContextPath()%>/images/css.css" rel="stylesheet"
          type="text/css">
    <link href="<%=request.getContextPath()%>/css/ext-all.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" charset="GB2312"
            src="<%=request.getContextPath()%>/js/date/WdatePicker.js" defer="defer"></script>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/js/ckeditor/ckeditor.js"></script>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/js/ext/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/ext/ext-all.js"></script>
    <script type="text/javascript">
        function onDelete(url){
            if(window.confirm("确认删除该邮件?")){
                window.location=url;
            }
            return;
        }
        function onSend(url){
            if(window.confirm("确认发送该邮件?\n发送操作可能耗时较长，请耐心等待！")){
                window.location=url;
            }
            return;
        }
        //选中的行变量
        var selectedId = null;

        //设置某个表的某一行被选中
        function setSelected(tr,tab_id,tr_head,selectedId_,rowClass,curClass){

            //循环表格中所有的行
            var tab = document.getElementById(tab_id);
            if(tab){
                for(var i=0;i<tab.rows.length;i++){
                    var row = tab.rows[i];
                    //除去表头
                    if(row.id != tr_head){
                        if(rowClass){
                            row.style.background = rowClass;
                        }else{
                            row.style.background = "white";
                        }
                    }
                }
            }
            if (curClass) {
                tr.style.background = curClass;
            } else {
                tr.style.background = "#fff4a8";
            }
            selectedId = selectedId_;
        }

        function getSelected(){
            if(null == selectedId){
                alert("请选择您要操作的项目！");
                return false;
            }else{
                return true;
            }
        }
    </script>
</head>
<body>
<form name="form1" action=""  style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px">
    <table width="100%" align="center" height="25" border="0"
           cellpadding="0" cellspacing="0"
           background="<%=contentPath%>/images/mhead.jpg">
        <tr>
            <td width="3%" align="center">
                <img src="<%=contentPath%>/images/mlogo.jpg" width="11" height="11"
                     alt="">
            </td>
            <td width="15%" class="mhead">
                邮件列表
            </td>
            <td align="left" class="mhead">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tbody>
                    <tr>
                        <td align="left">
                            主题：
                            <input name="mailZt" size="10" type="text" value="${mailZt}" />&nbsp;
                            <input type="submit" class="button"  style="width:40px" value='查询'> &nbsp;&nbsp;&nbsp;
                            <input type="button" class="button" onclick="window.location = 'mail_add.d';" style="width:40px"  value='新增'>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </table>
</form>
<table width="100%" align="center" height="25" border="0"
       cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <table width="100%" border="0" align="center" cellpadding="0"  id="tab_id" name="tab_id"
                   cellspacing="0" class="mtabtab" id="mtabtab">
                <tr>
                    <td nowrap="nowrap" class="head" width="40">
                        序号
                    </td>
                    <td nowrap="nowrap" class="head">
                        邮件主题
                    </td>
                    <td class="head" width="30%">
                        接收人
                    </td>
                    <td class="head" width="120">
                        发送人
                    </td>
                    <td class="head" width="120">
                        发送时间
                    </td>
                    <td nowrap="nowrap" class="head" width="8%">
                        状态
                    </td>
                    <td nowrap="nowrap" class="head" width="8%">
                        已签收/未签收
                    </td>
                    <td nowrap="nowrap" class="head" width="8%">
                        操作
                    </td>
                </tr>
                <s:iterator value="dataList" status="status">
                    <tr onclick="setSelected(this,'tab_id','tr_head','${MAIL_ID}')">
                        <td class="form" style="text-align: center" nowrap>
                            <s:property value="#status.index+1"/>
                        </td>
                        <td class="form" style="text-align: left" nowrap>${MAIL_ZT}&nbsp;</td>
                        <td class="form" style="text-align: left" nowrap TITLE="${JSR}">
                            <%
                            String jsr = StringUtil.parseNull(request.getAttribute("JSR"),"");
                            String[] persons = StringUtil.split(jsr,"、");
                            %>
                            <%=StringUtil.cutString(jsr,25)%>
                            &nbsp;</td>
                        <td class="form" style="text-align: left" nowrap>${REAL_NAME}&nbsp;</td>
                        <td class="form" style="text-align: left" nowrap>
                                ${SEND_TIME}&nbsp;
                        </td>
                        <td class="form" style="text-align: center" nowrap>
                                ${MAIL_STATUS}&nbsp;
                        </td>
                        <td class="form" style="text-align: center" nowrap>
                            <a href="#" title="${CGR}">${CGS}</a>/<a href="#" title="${SBR}">${SBS}</a>&nbsp;
                        </td>
                        <td class="form" style="text-align: center" nowrap>
                            <%
                                String  MAIL_STATUS = StringUtil.parseNull(request.getAttribute("MAIL_STATUS"),"");
                                if(!"已发送".equals(MAIL_STATUS)){%>
                            <a href="./mail_mod.d?mailId=${MAIL_ID}">[编辑]</a>&nbsp;
                            <a href="javascript:onDelete('./mail_del.d?mailId=${MAIL_ID}');">[删除]</a>&nbsp;
                            <a href="javascript:onSend('./mail_send.d?mailId=${MAIL_ID}');">[发送]</a>&nbsp;
                            <% }else{  %>
                            <a href="javascript:onSend('./mail_send.d?mailId=${MAIL_ID}');">[再次发送]</a>&nbsp;
                            <%   }
                            %>
                        </td>
                    </tr>
                </s:iterator>
            </table>
        </td>
    </tr>
    <tr><td colspan="11" align="center">
        <tags:pagination />
    </td></tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
</table>
</body>
</html>
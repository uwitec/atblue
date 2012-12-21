<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="cn.com.atblue.manager.bean.CUser" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<%@ include file="../../import.jsp"%>
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
            type="text/javascript" defer="true"></script>
    <link href="<%=request.getContextPath()%>/images/css.css" rel="stylesheet"
          type="text/css">
    <script type="text/javascript" charset="GB2312"
            src="<%=request.getContextPath()%>/js/date/WdatePicker.js" defer="true"></script>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/js/ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
        function onDelete(url){
            if(window.confirm("确认删除该短信通知?")){
                window.location=url;
            }
            return;
        }
        function onSend(url){
            if(window.confirm("确认发送该短信通知?\n系统会在1分钟内发送该短息！")){
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
                短信通知列表
            </td>
            <td align="left" class="mhead">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="left">
                            <font style="font-size: 12px">通知：</font>
                            <input name="dxnr" size="10" type="text" value="${dxnr}" />&nbsp;
                            <input type="submit" class="button"  style="width:40px" value='查询'> &nbsp;&nbsp;&nbsp;
                            <input type="button" class="button" onclick="window.location = 'sms_add.d';" style="width:40px"  value='新增'>
                        </td>
                    </tr>
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
                        短信内容
                    </td>
                    <td class="head" width="30%">
                        发送部门
                    </td>
                    <td class="head" width="120">
                        发送人
                    </td>
                    <td class="head" width="120">
                        创建时间
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
                    <tr onclick="setSelected(this,'tab_id','tr_head','${TZID}')">
                        <td class="form" style="text-align: center" nowrap>
                            <s:property value="#status.index+1"/>
                        </td>
                        <td class="form" style="text-align: left" nowrap title="<%=StringUtil.parseNull(request.getAttribute("DXNR"),"")%>">
                        <%
                            String dxnr = StringUtil.parseNull(request.getAttribute("DXNR"),"");
                        %>
                        <%=StringUtil.cutString(dxnr,35)%>&nbsp;</td>
                        <td class="form" style="text-align: center" nowrap>
                            ${ORGNA_NAME}
                            &nbsp;</td>
                        <td class="form" style="text-align: left" nowrap>${REAL_NAME}&nbsp;</td>
                        <td class="form" style="text-align: left" nowrap>
                                ${CJSJ}&nbsp;
                        </td>
                        <td class="form" style="text-align: center" nowrap>
                                ${ZT}&nbsp;
                        </td>
                        <td class="form" style="text-align: center" nowrap>
                                <a href="#" title="${YQSRY}">${YQS}</a>/<a href="#" title="${WQSRY}">${WQS}</a>&nbsp;
                        </td>
                        <td class="form" style="text-align: center" nowrap>
                            <%
                                String  ZT = StringUtil.parseNull(request.getAttribute("ZT"),"");
                                if(!"已发送".equals(ZT)){%>
                            <a href="./sms_mod.d?tzid=${TZID}">[编辑]</a>&nbsp;
                            <a href="javascript:onDelete('./sms_del.d?tzid=${TZID}');">[删除]</a>&nbsp;
                            <%--<a href="javascript:onSend('./sms_send.d?tzid=${TZID}');">[发送]</a>&nbsp;--%>
                            <% }else{  %>
                            <a href="javascript:onSend('./sms_send.d?tzid=${TZID}');">[重新发送]</a>&nbsp;
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
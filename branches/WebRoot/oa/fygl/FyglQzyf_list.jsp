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
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>迁装运费管理</title>
    <script src="<%=request.getContextPath()%>/js/common.js"
            type="text/javascript" defer="true"></script>
    <link href="<%=request.getContextPath()%>/images/css.css" rel="stylesheet"
          type="text/css">
    <link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet"
          type="text/css">
    <link href="<%=request.getContextPath()%>/css/web.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
        function onDelete(url){
            if(window.confirm("确认删除该迁装费用信息?")){
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
<form name="form1" action=""  style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px" method="post">
    <table width="100%" align="center" height="25" border="0"
           cellpadding="0" cellspacing="0"
           background="<%=contentPath%>/images/mhead.jpg">
        <tr>
            <td width="3%" align="center">
                <img src="<%=contentPath%>/images/mlogo.jpg" width="11" height="11"
                     alt="">
            </td>
            <td width="15%" class="mhead">
                迁装运费管理
            </td>
            <td align="left" class="mhead">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tbody>
                    <tr>
                        <td align="left">
                            名称：
                            <input name="mc" type="text" value="" />&nbsp;
                            <input type="submit" class="button"  style="width:40px" value='查询'> &nbsp;&nbsp;&nbsp;
                            <input type="button" class="button" onclick="window.location = 'FyglQzyf_add.d';" style="width:40px"  value='新增'>
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
                    <th nowrap="nowrap"  width="40">
                        序号
                    </th>

                        <th nowrap="nowrap" >
                        完成日期
                        </th>
                        <th nowrap="nowrap" >
                        队号
                        </th>
                        <th nowrap="nowrap" >
                        新井号
                        </th>
                        <th nowrap="nowrap" >
                        老井号
                        </th>
                        <th nowrap="nowrap" >
                        内容编码
                        </th>
                        <th nowrap="nowrap" >
                        距离
                        </th>
                        <th nowrap="nowrap" >
                        车型数量
                        </th>
                        <th nowrap="nowrap" >
                        编码
                        </th>
                        <th nowrap="nowrap" >
                        迁装费
                        </th>
                        <th nowrap="nowrap" >
                        路桥费
                        </th>
                        <th nowrap="nowrap" >
                        预算费用
                        </th>

                    <th nowrap="nowrap">
                        操作
                    </th>
                </tr>
                <s:iterator value="dataList" status="status">
                    <tr onclick="setSelected(this,'tab_id','tr_head','<s:property value="QZBM"/>')">
                        <td class="form_th" style="text-align: center" nowrap>
                            <s:property value="#status.index+1"/>
                        </td>
                        <td class="form_th" style="text-align: left" nowrap><s:property value="WCRQ"/>&nbsp;</td>
                        <td class="form_th" style="text-align: left" nowrap><s:property value="DH"/>&nbsp;</td>
                        <td class="form_th" style="text-align: left" nowrap><s:property value="XJH"/>&nbsp;</td>
                        <td class="form_th" style="text-align: left" nowrap><s:property value="LJH"/>&nbsp;</td>
                        <td class="form_th" style="text-align: left" nowrap><s:property value="NRBM"/>&nbsp;</td>
                        <td class="form_th" style="text-align: left" nowrap><s:property value="JL"/>&nbsp;</td>
                        <td class="form_th" style="text-align: left" nowrap><s:property value="CXSL"/>&nbsp;</td>
                        <td class="form_th" style="text-align: left" nowrap><s:property value="BM"/>&nbsp;</td>
                        <td class="form_th" style="text-align: left" nowrap><s:property value="QZF"/>&nbsp;</td>
                        <td class="form_th" style="text-align: left" nowrap><s:property value="LQF"/>&nbsp;</td>
                        <td class="form_th" style="text-align: left" nowrap><s:property value="YSFY"/>&nbsp;</td>
                        <td class="form_th" style="text-align: center" nowrap>
                            <a href="./FyglQzyf_mod.d?bm=<s:property value="QZBM"/>">[编辑]</a>&nbsp;
                            <a href="javascript:onDelete('./FyglQzyf_del.d?bm=<s:property value="QZBM"/>');">[删除]</a>&nbsp;
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
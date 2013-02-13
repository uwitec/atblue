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
    <title>单井收入及成本支出管理</title>
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
                单井收入及成本支出管理
            </td>
            <td align="left" class="mhead">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tbody>
                    <tr>
                        <td align="left">
                            名称：
                            <input name="mc" type="text" value="" />&nbsp;
                            <input type="submit" class="button"  style="width:40px" value='查询'> &nbsp;&nbsp;&nbsp;
                            <input type="button" class="button" onclick="window.location = 'FyglDjsrjzc_add.d';" style="width:40px"  value='新增'>
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
                        类别
                        </th>
                        <th nowrap="nowrap" >
                        井号
                        </th>
                        <th nowrap="nowrap" >
                        队号
                        </th>
                        <th nowrap="nowrap" >
                        交井日期
                        </th>
                        <th nowrap="nowrap" >
                        结算日期
                        </th>
                        <th nowrap="nowrap" >
                        实际周期
                        </th>
                        <%--<th nowrap="nowrap" >--%>
                        <%--迁装费收入--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--迁装费支出--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--工农费收入--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--工农费支出--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--井架费收入--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--井架费支出--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--土方费收入--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--土方费支出--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--钻前工农费收入--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--钻前工农费支出--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--拉工业用水收入--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--拉工业用水支出--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--钻后治理收入--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--钻后治理支出--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--机械费用收入--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--机械费用支出--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--管具井控收入--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--管具井控支出--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--管具钻具收入--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--管具钻具支出--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--套管收入--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--套管支出--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--套管头收入--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--套管头支出--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--管具材料收入--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--管具材料支出--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--固井材料收入--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--固井材料支出--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--固井劳务收入--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--固井劳务支出--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--石粉收入--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--石粉支出--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--定向费收入--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--定向费支出--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--泥浆服务费收入--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--泥浆服务费支出--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--其他技术服务收入--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--其他技术服务支出--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--钻头收入--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--钻头支出--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--化工材料收入--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--化工材料支出--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--一般材料收入--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--一般材料支出--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--柴油收入--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--柴油支出--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--原油收入--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--原油支出--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--油料运费及劳务收入--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--油料运费及劳务支出--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--网电及劳务收入--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--网电及劳务支出--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--润滑油收入--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--润滑油支出--%>
                        <%--</th>--%>
                        <%--<th nowrap="nowrap" >--%>
                        <%--追加费用--%>
                        <%--</th>--%>
                        <th nowrap="nowrap" >
                        其他收入
                        </th>
                        <th nowrap="nowrap" >
                        非正常开支
                        </th>
                        <th nowrap="nowrap" >
                        单井收入
                        </th>
                        <th nowrap="nowrap" >
                        单井支出
                        </th>

                    <th nowrap="nowrap">
                        操作
                    </th>
                </tr>
                <s:iterator value="dataList" status="status">
                    <tr onclick="setSelected(this,'tab_id','tr_head','<s:property value="SRZCBM"/>')">
                        <td class="form_th" style="text-align: center" nowrap>
                            <s:property value="#status.index+1"/>
                        </td>
                        <td class="form_th" style="text-align: left" nowrap><s:property value="YD"/>&nbsp;</td>
                        <td class="form_th" style="text-align: left" nowrap><s:property value="DFDW"/>&nbsp;</td>
                        <td class="form_th" style="text-align: left" nowrap><s:property value="JDFWFY"/>&nbsp;</td>
                        <td class="form_th" style="text-align: left" nowrap><s:property value="FWZLPJ"/>&nbsp;</td>
                        <td class="form_th" style="text-align: left" nowrap><s:property value="KK"/>&nbsp;</td>
                        <td class="form_th" style="text-align: left" nowrap><s:property value="SJFY"/>&nbsp;</td>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="QZFSR"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="QZFZC"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="GNFSR"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="GNFZC"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="JJFSR"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="JJFZC"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="TFFSR"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="TFFZC"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="ZQGNSR"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="ZQGNZC"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="GYYSSR"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="GYYSZC"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="ZHZLSR"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="ZHZLZC"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="JXFYSR"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="JXFYZC"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="GJJKSR"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="GJJKZC"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="GJZJSR"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="GJZJZC"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="TGSR"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="TGZC"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="TGTSR"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="TGTZC"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="GJCLSR1"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="GJCLZC1"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="GJCLSR"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="GJCLZC"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="GJLWSR"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="GJLWZC"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="SFSR"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="SFZC"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="DXFSR"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="DXFZC"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="NJFWSR"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="NJFWZC"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="QTJSSR"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="QTJSZC"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="ZTSR"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="ZTZC"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="HGCLSR"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="HGCLZC"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="YBCLSR"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="YBCLZC"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="CYSR"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="CYZC"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="YYSR"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="YYZC"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="YLJLWSR"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="YLJLWZC"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="WDJLWSR"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="WDJLWZC"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="RHYSR"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="RHYZC"/>&nbsp;</td>--%>
                        <%--<td class="form_th" style="text-align: left" nowrap><s:property value="ZJFY"/>&nbsp;</td>--%>
                        <td class="form_th" style="text-align: left" nowrap><s:property value="QTSR"/>&nbsp;</td>
                        <td class="form_th" style="text-align: left" nowrap><s:property value="FZCKZ"/>&nbsp;</td>
                        <td class="form_th" style="text-align: left" nowrap><s:property value="DJSR"/>&nbsp;</td>
                        <td class="form_th" style="text-align: left" nowrap><s:property value="DJZC"/>&nbsp;</td>
                        <td class="form_th" style="text-align: center" nowrap>
                            <a href="./FyglDjsrjzc_mod.d?bm=<s:property value="SRZCBM"/>">[编辑]</a>&nbsp;
                            <a href="javascript:onDelete('./FyglDjsrjzc_del.d?bm=<s:property value="SRZCBM"/>');">[删除]</a>&nbsp;
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
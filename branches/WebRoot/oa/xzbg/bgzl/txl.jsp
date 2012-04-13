<%@ page import="cn.com.atblue.common.util.StringUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="/WEB-INF/runqianReport4.tld" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link href="<%=request.getContextPath()%>/css/xzbg-css.css" rel="stylesheet"
      type="text/css">
<link href="<%=request.getContextPath()%>/css/ext-all.css" rel="stylesheet" type="text/css">
<script type="text/javascript" charset="GB2312"
        src="<%=request.getContextPath()%>/js/date/WdatePicker.js" defer="defer"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/runqian.js" charset="gbk"></script>
    <%
        String ksname = StringUtil.parseNull(request.getParameter("ksname"),"");
        String uname = StringUtil.parseNull(request.getParameter("uname"),"");
        String params = "";
        if(!StringUtil.isBlankOrEmpty(ksname)){
            params = params +"ksname= and ORGNA_NAME like '%"+ksname+"%';";
        }
        if(!StringUtil.isBlankOrEmpty(uname)){
            params = params +"uname= and REAL_NAME like '%"+uname+"%';";
        }
        System.out.println(params);
    %>
</head>
<body onresize="_resize(90)" onload="_resize(90)">
<form name="form1" action=""  method="post" style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px">
    <table width="100%" height="25" border="0" cellpadding="0"
           cellspacing="0"
           background="<%=request.getContextPath()%>/images/mhead.jpg">
        <tr>
            <td width="10%" align="left">
                <img src="<%=request.getContextPath()%>/images/mlogo.jpg" width="11"
                     height="11">
                &nbsp;&nbsp;  &nbsp;
                通讯录
            </td>
            <td align="left" class="mhead">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tbody>
                    <tr>
                        <td align="left">
                            科室：
                            <input type="text" name="ksname" value="" size="10"/>
                            &nbsp;
                            用户姓名：
                            <input type="text" name="uname" value="" size="10"/>
                            &nbsp;
                            <input type="submit" class="button" value="查询" >
                            &nbsp;
                        </td>
                    </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </table>
</form>
<table>
        <tr>
            <td>
                <r:html name="rpt"
                        needPageMark="no"
                        needPrint="yes"
                        needScroll = "yes"
                        printLabel="打印"
                        excelLabel="导出"
                        needSaveAsExcel="yes"
                        params="<%=params %>"
                        reportFileName="txl.raq">
                </r:html>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
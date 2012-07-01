<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.net.InetAddress" %>
<%@ page import="cn.com.atblue.manager.bean.CUser" %>
<%@ include file="../../import.jsp"%>
<%
    CUser cUser = (CUser)session.getAttribute("cUser");
    cUser = cUser == null?new CUser():cUser;
    String orgId = cUser.getOrgnaId();
    Map paramMap = new HashMap();
    paramMap.put("orgnaId",orgId);
    COrgnization cOrgnization = orgnizationDAO.queryForBean(paramMap);
    String pkid = StringUtil.parseNull(request.getParameter("pkid"),"");
    String flag = StringUtil.parseNull(request.getParameter("flag"),"");
    String sftj = StringUtil.parseNull(request.getParameter("sftj"),"");
    Map map = new HashMap();
    map.put("pkid",pkid);
    JyglDjfyjs bean = jyglDjfyjsDAO.queryForBean(map);
    bean = bean == null?new JyglDjfyjs():bean;
    String connectId = StringUtil.parseNull(bean.getConnectId(), "");
    String processId = StringUtil.parseNull(bean.getProcessId(), "");
    String signdata =   oDao.getSignDataByProcessId(processId);
%>
<html xmlns:o="urn:schemas-microsoft-com:office:office"
      xmlns:x="urn:schemas-microsoft-com:office:excel"
      xmlns="http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 14">
<link rel=File-List href="2012年单井有关费用结算表.files/filelist.xml">
<style id="2012年单井有关费用结算表_22393_Styles">
<!--table
{mso-displayed-decimal-separator:"\.";
    mso-displayed-thousand-separator:"\,";}
.font522393
{color:windowtext;
    font-size:9.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;}
.font622393
{color:windowtext;
    font-size:10.0pt;
    font-weight:700;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;}
.xl6322393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:.5pt solid windowtext;
    border-right:.5pt solid windowtext;
    border-bottom:.5pt solid windowtext;
    border-left:1.0pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl6422393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl6522393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:.5pt solid windowtext;
    border-right:1.0pt solid windowtext;
    border-bottom:.5pt solid windowtext;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl6622393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:.5pt solid windowtext;
    border-right:.5pt solid windowtext;
    border-bottom:1.0pt solid windowtext;
    border-left:1.0pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl6722393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:.5pt solid windowtext;
    border-right:none;
    border-bottom:.5pt solid windowtext;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl6822393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:.5pt solid windowtext;
    border-right:.5pt solid windowtext;
    border-bottom:.5pt solid windowtext;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl6922393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:.5pt solid windowtext;
    border-right:.5pt solid windowtext;
    border-bottom:none;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl7022393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:700;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl7122393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:700;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:.5pt solid windowtext;
    border-right:.5pt solid windowtext;
    border-bottom:1.0pt solid windowtext;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl7222393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:700;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:.5pt solid windowtext;
    border-right:.5pt solid windowtext;
    border-bottom:none;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl7322393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:.5pt solid windowtext;
    border-right:.5pt solid windowtext;
    border-bottom:none;
    border-left:1.0pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl7422393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:700;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:.5pt solid windowtext;
    border-right:none;
    border-bottom:none;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl7522393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:700;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:.5pt solid windowtext;
    border-right:none;
    border-bottom:.5pt solid windowtext;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl7622393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:.5pt solid windowtext;
    border-right:none;
    border-bottom:none;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl7722393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:general;
    vertical-align:middle;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl7822393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl7922393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:none;
    border-right:.5pt solid windowtext;
    border-bottom:1.0pt solid windowtext;
    border-left:1.0pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl8022393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:general;
    vertical-align:middle;
    border-top:none;
    border-right:1.0pt solid windowtext;
    border-bottom:1.0pt solid windowtext;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl8122393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:none;
    border-right:.5pt solid windowtext;
    border-bottom:none;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl8222393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:normal;}
.xl8322393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:.5pt solid windowtext;
    border-right:.5pt solid windowtext;
    border-bottom:none;
    border-left:1.0pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:normal;}
.xl8422393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:red;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:.5pt solid windowtext;
    border-right:1.0pt solid windowtext;
    border-bottom:.5pt solid windowtext;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl8522393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:red;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:.5pt solid windowtext;
    border-right:1.0pt solid windowtext;
    border-bottom:none;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl8622393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    /*color:red;*/
    font-size:10.0pt;
    /*font-weight:700;*/
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl8722393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:red;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:.5pt solid windowtext;
    border-right:.5pt solid windowtext;
    border-bottom:none;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl8822393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:red;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:none;
    border-right:.5pt solid windowtext;
    border-bottom:none;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl8922393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:red;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:none;
    border-right:.5pt solid windowtext;
    border-bottom:.5pt solid windowtext;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl9022393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:700;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:none;
    border-right:.5pt solid windowtext;
    border-bottom:.5pt solid windowtext;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl9122393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:red;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:none;
    border-right:1.0pt solid windowtext;
    border-bottom:.5pt solid windowtext;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl9222393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:red;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:none;
    border-right:1.0pt solid windowtext;
    border-bottom:none;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl9322393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:700;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:none;
    border-right:.5pt solid windowtext;
    border-bottom:none;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl9422393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:.5pt solid windowtext;
    border-right:.5pt solid windowtext;
    border-bottom:1.0pt solid windowtext;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl9522393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:.5pt solid windowtext;
    border-right:none;
    border-bottom:.5pt solid windowtext;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl9622393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:700;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:.5pt solid windowtext;
    border-right:.5pt solid windowtext;
    border-bottom:none;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:normal;}
.xl9722393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:700;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:none;
    border-right:.5pt solid windowtext;
    border-bottom:1.0pt solid windowtext;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl9822393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:.5pt solid windowtext;
    border-right:1.0pt solid windowtext;
    border-bottom:.5pt solid windowtext;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl9922393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:.5pt solid windowtext;
    border-right:none;
    border-bottom:1.0pt solid windowtext;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl10022393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:.5pt solid windowtext;
    border-right:none;
    border-bottom:1.0pt solid windowtext;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl10122393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:.5pt solid windowtext;
    border-right:.5pt solid windowtext;
    border-bottom:1.0pt solid windowtext;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl10222393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:700;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:1.0pt solid windowtext;
    border-right:none;
    border-bottom:.5pt solid windowtext;
    border-left:1.0pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl10322393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:700;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:1.0pt solid windowtext;
    border-right:none;
    border-bottom:.5pt solid windowtext;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl10422393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:700;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:1.0pt solid windowtext;
    border-right:1.0pt solid windowtext;
    border-bottom:.5pt solid windowtext;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl10522393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:.5pt solid windowtext;
    border-right:1.0pt solid windowtext;
    border-bottom:none;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl10622393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:none;
    border-right:1.0pt solid windowtext;
    border-bottom:none;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl10722393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:.5pt solid windowtext;
    border-right:none;
    border-bottom:none;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl10822393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:none;
    border-right:.5pt solid windowtext;
    border-bottom:.5pt solid windowtext;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl10922393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:16.0pt;
    font-weight:700;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl11022393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:left;
    vertical-align:middle;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl11122393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:none;
    border-right:none;
    border-bottom:1.0pt solid windowtext;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl11222393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:none;
    border-right:none;
    border-bottom:1.0pt solid windowtext;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl11322393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:none;
    border-right:.5pt solid windowtext;
    border-bottom:1.0pt solid windowtext;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl11422393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:.5pt solid windowtext;
    border-right:1.0pt solid windowtext;
    border-bottom:none;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl11522393
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:仿宋_GB2312, monospace;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:none;
    border-right:1.0pt solid windowtext;
    border-bottom:1.0pt solid windowtext;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
ruby
{ruby-align:left;}
rt
{color:windowtext;
    font-size:9.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-char-type:none;}
-->
</style>
<style media=print>
    .Noprint{display:none;}
</style>
<script type="text/javascript">
    function SetStore() {
        var str;
        var separator = "::";  // 分隔符
        str="";
        document.all.DWebSignSeal.SetSignData("-");
        document.all.DWebSignSeal.SetSignData("+DATA:" + str);
    }
    function LoadSignData() {
        var separator = "::";  // 分隔符
        var str="";
        DWebSignSeal.SetStoreData('<%=signdata%>');
        DWebSignSeal.ShowWebSeals();
        var strObjectName ;
        strObjectName = DWebSignSeal.FindSeal("",0);
        while(strObjectName  != ""){
            DWebSignSeal.SetSealSignData(strObjectName,str);
            strObjectName = DWebSignSeal.FindSeal(strObjectName,0);
        }
    }
    var qz = 0;
    function addSealB(){
        qz = 1;
        SetStore();
        var shr = 'shr<%=orgId%>';
        document.all.DWebSignSeal.SetPosition(-10,-20,shr);
        var sealURL='<%="http://"+sysConfig.getProperty("sealServer")+":"+request.getLocalPort()+request.getContextPath()+"/servlet/sealDown?userId="+cUser.getUserId()%>';
        document.all.DWebSignSeal.AddSeal(sealURL, "");
    }
</script>
</head>

<body onload="LoadSignData()">
<object id="factory" viewastext style="display:none"
        classid="clsid:1663ed61-23eb-11d2-b92f-008048fdd814" codebase="<%="http://"+sysConfig.getProperty("sealServer")+":"+request.getLocalPort()+request.getContextPath()%>/soft/smsx.cab#Version=7,0,0,8">
</object>
<script defer>
    //打印组件通用设置
    factory.printing.header = "";//页眉
    factory.printing.footer = "";//页脚
    factory.printing.leftMargin = 7;//左边距
    factory.printing.topMargin = 7;//上边距
    factory.printing.rightMargin = 7;//右边距
    factory.printing.bottomMargin = 7;//下边距
</script>
<!--[if !excel]>　　<![endif]-->
<!--下列信息由 Microsoft Excel 的发布为网页向导生成。-->
<!--如果同一条目从 Excel 中重新发布，则所有位于 DIV 标记之间的信息均将被替换。-->
<!----------------------------->
<!--“从 EXCEL 发布网页”向导开始-->
<!----------------------------->

<div id="2012年单井有关费用结算表_22393" align=center x:publishsource="Excel">
<table align="center">
    <tr>
        <td class="Noprint">
            <input name="button" type="button" class="button" value="打印预览" onClick="factory.printing.Preview();"/>
            <input name="submit" type="submit" class="button" value="返回" onClick="window.history.go(-1);">
            <!-- SignData隐藏域，用于将所有加密的数据提交到表单保存页面 -->
            <input type="hidden" id="signdata" name="signdata"/>
        </td>
    </tr>
</table>
<table border=0 cellpadding=0 cellspacing=0 width=914 class=xl7722393
       style='border-collapse:collapse;table-layout:fixed;width:687pt'>
<col class=xl7822393 width=85 style='mso-width-source:userset;mso-width-alt:
 2720;width:64pt'>
<col class=xl7822393 width=127 style='mso-width-source:userset;mso-width-alt:
 4064;width:95pt'>
<col class=xl7822393 width=119 style='mso-width-source:userset;mso-width-alt:
 3808;width:89pt'>
<col class=xl7822393 width=125 style='mso-width-source:userset;mso-width-alt:
 4000;width:94pt'>
<col class=xl7822393 width=105 span=2 style='mso-width-source:userset;
 mso-width-alt:3360;width:79pt'>
<col class=xl7822393 width=98 style='mso-width-source:userset;mso-width-alt:
 3136;width:74pt'>
<col class=xl7822393 width=150 style='mso-width-source:userset;mso-width-alt:
 4800;width:113pt'>
<tr height=35 style='mso-height-source:userset;height:26.25pt'>
    <td colspan=8 height=35 class=xl10922393 width=914 style='height:26.25pt;
  width:687pt'>单 井 有 关 费 用 结 算 表</td>
</tr>
<tr height=20 style='mso-height-source:userset;height:15.0pt'>
    <td colspan=8 height=20 class=xl11022393 style='height:15.0pt'>钻三公司经营办-09</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td colspan=8 height=31 class=xl10222393 style='border-right:1.0pt solid black;
  height:23.45pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>计<span
            style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>划<span style='mso-spacerun:yes'>&nbsp;</span></td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6322393 style='height:23.45pt;border-top:none'>队<span
            style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>号</td>
    <td class=xl8622393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getDh(),"")%>　</td>
    <td class=xl6322393 style='border-top:none'>井<span
            style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>号</td>
    <td class=xl8622393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getJh(),"")%>　</td>
    <td class=xl6422393 style='border-top:none;border-left:none'>建设单位</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getJsdw(),"")%>　</td>
    <td class=xl6422393 style='border-top:none;border-left:none'>分地区</td>
    <td class=xl6522393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getFdq(),"")%>　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6322393 style='height:23.45pt;border-top:none'>井<span
            style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>别</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getJb(),"")%>　</td>
    <td class=xl6422393 style='border-top:none;border-left:none'>井<span
            style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>深</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getJs(),"")%>　</td>
    <td class=xl6822393 style='border-top:none'>井<span
            style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>径</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getJj(),"")%>　</td>
    <td class=xl6422393 style='border-top:none;border-left:none'>定额周期</td>
    <td class=xl6522393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getDezq(),"")%>　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6322393 style='height:23.45pt;border-top:none'>泥浆密度</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getNjmd(),"")%>　</td>
    <td class=xl6422393 style='border-top:none;border-left:none'>技套下深</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getJtxs(),"")%>　</td>
    <td class=xl6422393 style='border-top:none;border-left:none'>取<span
            style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>芯</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getQx(),"")%>　</td>
    <td class=xl6422393 style='border-top:none;border-left:none'>定额钻机月</td>
    <td class=xl6522393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getDezjy(),"")%>　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6322393 style='height:23.45pt;border-top:none'>加深米数</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getJsms(),"")%>　</td>
    <td class=xl6422393 style='border-top:none;border-left:none'>井 斜 角</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getJxj(),"")%>　</td>
    <td class=xl6422393 style='border-top:none;border-left:none'>野营房维修</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getYyfwx(),"")%>　</td>
    <td rowspan=2 class=xl7222393 style='border-bottom:1.0pt solid black;
  border-top:none'>计划签字</td>
    <td rowspan=2 class=xl11422393 style='border-bottom:1.0pt solid black;
  border-top:none;text-align: left'  id="shr04b02beb-3532-40c9-8e28-e3b25a76f826">&nbsp;　</td>
</tr>
<tr height=64 style='mso-height-source:userset;height:48.0pt'>
    <td height=64 class=xl7922393 style='height:48.0pt'>备注</td>
    <td colspan=5 class=xl11122393 style='border-right:.5pt solid black;
  border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getBz(),"")%>　</td>
</tr>
<tr height=26 style='mso-height-source:userset;height:19.5pt'>
    <td colspan=8 height=26 class=xl10222393 style='border-right:1.0pt solid black;
  height:19.5pt'><span style='mso-spacerun:yes'>&nbsp;</span>生<span
            style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>产<span style='mso-spacerun:yes'>&nbsp;</span></td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6322393 style='height:23.45pt;border-top:none'>搬迁时间</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getBqsj(),"")%>　</td>
    <td class=xl6422393 style='border-top:none;border-left:none'>实际建井周期</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getSjjjzq(),"")%>　</td>
    <td class=xl6422393 style='border-top:none;border-left:none'>实际钻机月</td>
    <td class=xl6722393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getSjzjy(),"")%>　</td>
    <td class=xl6422393 style='border-top:none'>安装费用</td>
    <td class=xl6522393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getAzfy(),"")%>　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6322393 style='height:23.45pt;border-top:none'>开钻时间</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getKzsj(),"")%>　</td>
    <td class=xl6422393 style='border-top:none;border-left:none'>实际钻井周期</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getSjzjzq(),"")%>　</td>
    <td class=xl6922393 style='border-top:none;border-left:none'>实际井深</td>
    <td class=xl6722393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getSjjs(),"")%>　</td>
    <td class=xl6422393 style='border-top:none'>整拖费</td>
    <td class=xl6522393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getZtf(),"")%>　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6322393 style='height:23.45pt;border-top:none'>完井时间</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getWjsj(),"")%>　</td>
    <td class=xl6422393 style='border-top:none;border-left:none'>是否整拖</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getSfzt(),"")%>　</td>
    <td class=xl6422393 style='border-left:none'>搬迁费</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getBqf(),"")%>　</td>
    <td class=xl6422393 style='border-top:none;border-left:none'>日常运费</td>
    <td class=xl6522393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getRcyf(),"")%>　</td>
</tr>
<tr height=82 style='mso-height-source:userset;height:61.5pt'>
    <td height=82 class=xl7922393 style='height:61.5pt'>备注</td>
    <td colspan=5 class=xl9922393 style='border-right:.5pt solid black;
  border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getBzsc(),"")%>　</td>
    <td class=xl7122393 style='border-top:none;border-left:none'>生产办签字</td>
    <td class=xl8022393 style='border-left:none;text-align: left' id="shr33c165b3-b6a7-4144-b8a2-aaebe111845e">&nbsp;　</td>
</tr>
<tr height=24 style='mso-height-source:userset;height:18.0pt'>
    <td colspan=8 height=24 class=xl10222393 style='border-right:1.0pt solid black;
  height:18.0pt'>经<span
            style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>管<font
            class="font622393"><span style='mso-spacerun:yes'>&nbsp;</span></font></td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6322393 style='height:23.45pt;border-top:none'>钻前劳务</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getZqlw(),"")%>　</td>
    <td class=xl6422393 style='border-top:none;border-left:none'>套<span
            style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>管</td>
    <td class=xl6722393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getTg(),"")%>　</td>
    <td class=xl6422393 style='border-top:none'>钻具租赁费</td>
    <td class=xl6722393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getZqzlf(),"")%>　</td>
    <td class=xl6422393 style='border-top:none'>石粉材料</td>
    <td class=xl6522393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getSfcl(),"")%>　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6322393 style='height:23.45pt;border-top:none'>管具劳务</td>
    <td class=xl6722393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getGjlw(),"")%>　</td>
    <td class=xl6422393 style='border-top:none'>套管附件</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getTgfj(),"")%>　</td>
    <td class=xl6422393 style='border-top:none;border-left:none'>刚性扶正器</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getGxfzq(),"")%>　</td>
    <td class=xl6422393 style='border-top:none;border-left:none'>石粉劳务</td>
    <td class=xl6522393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getSflw(),"")%>　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6322393 style='height:23.45pt;border-top:none'>固井劳务</td>
    <td class=xl6722393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getGjlw2(),"")%>　</td>
    <td class=xl6422393 style='border-top:none'>添加剂</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getTjj(),"")%>　</td>
    <td class=xl6422393 style='border-top:none;border-left:none'>井控固控摊销</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getJkgktx(),"")%>　</td>
    <td class=xl6422393 style='border-top:none;border-left:none'>井控配件</td>
    <td class=xl6522393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getJkpj(),"")%>　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6322393 style='height:23.45pt;border-top:none'>固井水泥</td>
    <td class=xl6722393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getGjsn(),"")%>　</td>
    <td class=xl6422393 style='border-top:none'>隔离液</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getKly(),"")%>　</td>
    <td class=xl6822393 style='border-top:none'>技术服务费</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getJsfwf(),"")%>　　</td>
    <td class=xl6422393 style='border-top:none;border-left:none'>外委劳务</td>
    <td class=xl6522393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getWwlw(),"")%>　　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6322393 style='height:23.45pt;border-top:none'>质量扣款</td>
    <td colspan=7 class=xl6722393 style='border-right:1.0pt solid black;
  border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getZlkk(),"")%>　　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td rowspan=2 height=102 class=xl6322393 style='height:76.7pt;border-top:
  none'>非正常开支</td>
    <td colspan=5 rowspan=2 class=xl10722393 style="text-align: left"><%=StringUtil.parseNull(bean.getFzckz(),"")%>　　</td>
    <td rowspan=2 class=xl7022393 style='border-top:none'>经管签字</td>
    <td rowspan=2 class=xl10522393 style='border-top:none;text-align: left' id="shrb23121d4-db76-4d2d-b59d-eefd2873e0ab">&nbsp;　</td>
</tr>
<tr height=71 style='mso-height-source:userset;height:53.25pt'>
</tr>
<tr height=25 style='mso-height-source:userset;height:18.75pt'>
    <td colspan=8 height=25 class=xl10222393 style='border-right:1.0pt solid black;
  height:18.75pt'>其<span
            style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>它<span
            style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>部<span
            style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>门</td>
</tr>
<tr height=47 style='mso-height-source:userset;height:35.25pt'>
    <td height=47 class=xl6322393 style='height:35.25pt;border-top:none'>柴油</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getCy(),"")%>　</td>
    <td class=xl6822393 style='border-top:none'>柴油运费</td>
    <td class=xl6722393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getCyyf(),"")%>　</td>
    <td class=xl6422393 style='border-top:none'>柴油劳务费</td>
    <td class=xl6722393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getCylwf(),"")%>　</td>
    <td rowspan=2 class=xl7222393 style='border-bottom:.5pt solid black;
  border-top:none'>能源办签字</td>
    <td rowspan=2 class=xl8522393 style='border-bottom:.5pt solid black;
  border-top:none;text-align: left' id="shr55fc5e6f-6a0c-4976-b0dd-03d72ebd3448">&nbsp;　</td>
</tr>
<tr height=61 style='mso-height-source:userset;height:45.75pt'>
    <td height=61 class=xl6322393 style='height:45.75pt;border-top:none'>网电费</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getWdf(),"")%>　</td>
    <td class=xl7822393>原油</td>
    <td class=xl6922393 style='border-top:none;text-align: left'><%=StringUtil.parseNull(bean.getYy(),"")%>　</td>
    <td class=xl7822393>其他</td>
    <td class=xl7422393 style='border-top:none;text-align: left'><%=StringUtil.parseNull(bean.getQtnyb(),"")%>　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl7322393 style='height:23.45pt;border-top:none'>实际井深</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getSjjs(),"")%>　</td>
    <td class=xl6922393 style='border-left:none'>取芯进尺</td>
    <td class=xl6422393 style='border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getQxjc(),"")%>　</td>
    <td class=xl6422393 style='border-left:none'>弹性扶正器</td>
    <td class=xl7622393 style='border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getTxfzq(),"")%>　</td>
    <td rowspan=3 class=xl7222393 style='border-bottom:.5pt solid black;
  border-top:none'>技术签字</td>
    <td rowspan=3 class=xl8522393 style='border-bottom:.5pt solid black;
  border-top:none;text-align: left' id="shr8a49607b-d8da-4f7f-a594-9946f6d7d7c9">&nbsp;　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6322393 style='height:23.45pt'>有效返工进尺</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getYxfgjc(),"")%>　</td>
    <td class=xl6422393 style='border-left:none'>筛管下深</td>
    <td class=xl6722393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getSgxs(),"")%>　</td>
    <td rowspan=2 class=xl6922393 style='border-bottom:.5pt solid black;
  border-top:none'>其他</td>
    <td rowspan=2 class=xl6922393 style='border-bottom:.5pt solid black;text-align: left'><%=StringUtil.parseNull(bean.getQtjs(),"")%>　</td>
</tr>
<tr height=45 style='mso-height-source:userset;height:33.75pt'>
    <td height=45 class=xl6322393 style='height:33.75pt;border-top:none'>泥浆服务方</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getNjfwf(),"")%>　</td>
    <td class=xl6422393 style='border-top:none;border-left:none'>定向服务方</td>
    <td class=xl6722393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getDxfwf(),"")%>　</td>
</tr>
<tr height=104 style='mso-height-source:userset;height:78.0pt'>
    <td height=104 class=xl6322393 style='height:78.0pt;border-top:none'>设备修理费</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getSbxlf(),"")%>　</td>
    <td class=xl6422393 style='border-top:none;border-left:none'>上井劳务费</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getSjlwf(),"")%>　</td>
    <td class=xl6422393 style='border-top:none;border-left:none'>其他</td>
    <td class=xl7522393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getQtjdk(),"")%>　</td>
    <td class=xl7022393 style='border-top:none'>机动科签字</td>
    <td class=xl8422393 style='border-top:none;border-left:none;text-align: left' id="shr27021cde-c852-4c4a-8809-dbcb155825d2">&nbsp;　</td>
</tr>
<tr height=107 style='mso-height-source:userset;height:80.25pt'>
    <td height=107 class=xl6322393 style='height:80.25pt;border-top:none'>安全设施费</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getAqssf(),"")%>　</td>
    <td class=xl6422393 style='border-top:none;border-left:none'>上井劳务费</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getSjlwf(),"")%>　</td>
    <td class=xl6422393 style='border-top:none;border-left:none'>其他</td>
    <td class=xl7422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getQtaqk(),"")%>　</td>
    <td class=xl7222393 style='border-top:none'>安全科签字</td>
    <td class=xl8522393 style='border-top:none;border-left:none;text-align: left' id="shr254db449-d2de-4335-a130-6f1603cb741f">&nbsp;　</td>
</tr>
<tr height=104 style='mso-height-source:userset;height:78.0pt'>
    <td height=104 class=xl6322393 style='height:78.0pt;border-top:none'>工农费</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getGnf(),"")%>　</td>
    <td class=xl6422393 style='border-top:none;border-left:none'>非正常开支</td>
    <td colspan=3 class=xl6422393 style='border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getFzckz(),"")%>　</td>
    <td class=xl7022393 style='border-left:none'>工农科签字</td>
    <td class=xl8522393 style='border-left:none;text-align: left' id="shr61314660-7176-4f17-b19c-ba9840acd849">&nbsp;　</td>
</tr>
<tr height=104 style='mso-height-source:userset;height:78.0pt'>
    <td height=104 class=xl6322393 style='height:78.0pt;border-top:none'>井队用料</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getJdyl(),"")%>　</td>
    <td class=xl6422393 style='border-top:none;border-left:none'>其<span
            style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>他</td>
    <td colspan=3 class=xl6722393 style='border-right:.5pt solid black;
  border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getQtzhd(),"")%>　</td>
    <td class=xl7022393 style='border-top:none;border-left:none'>综合队</td>
    <td class=xl8522393 style='border-left:none;text-align: left' id="shr895ba579-95d8-4e88-b615-3c2b2443aa0e">&nbsp;　</td>
</tr>
<tr height=129 style='mso-height-source:userset;height:96.75pt'>
    <td height=129 class=xl6322393 style='height:96.75pt;border-top:none'>井队用料</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getJdylwxd(),"")%>　</td>
    <td class=xl6422393 style='border-top:none;border-left:none'>其<span
            style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>他</td>
    <td colspan=3 class=xl6722393 style='border-right:.5pt solid black;
  border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getQtwxd(),"")%>　</td>
    <td class=xl7022393 style='border-top:none;border-left:none'>外修队</td>
    <td class=xl8522393 style='border-left:none;text-align: left' id="shr3b6f38fb-fd8c-4a50-9587-431b841b2c7a">&nbsp;　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6322393 style='height:23.45pt;border-top:none'>钻头</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getZt(),"")%>　</td>
    <td class=xl8122393 style='border-left:none'>机油</td>
    <td class=xl6422393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getJy(),"")%>　</td>
    <td class=xl6422393 style='border-top:none;border-left:none'>材料供井运费</td>
    <td class=xl6722393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getClgjfy(),"")%>　</td>
    <td rowspan=6 class=xl9622393 width=98 style='border-bottom:1.0pt solid black;
  border-top:none;width:74pt'>供应签字<br>
    </td>
    <td rowspan=6 class=xl8722393 style='border-bottom:.5pt solid black;text-align: left' id="shr6f531ccb-7cbe-4614-9a1b-3683992ffa89">&nbsp;　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6322393 style='height:23.45pt;border-top:none'>泥浆村料</td>
    <td class=xl6922393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getNjcl(),"")%>　</td>
    <td class=xl8222393 width=119 style='border-left:none;width:89pt'>非渗透油层保护材料</td>
    <td class=xl6922393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getFstycbhcl(),"")%>　</td>
    <td class=xl6422393 style='border-top:none;border-left:none'>MEG泥浆材料</td>
    <td class=xl7622393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getMegnjcl(),"")%>　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl8322393 width=85 style='height:23.45pt;border-top:none;
  width:64pt'>胺基聚醇油层保护材料</td>
    <td class=xl6922393 style='border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getAjjcycbhcl(),"")%>　</td>
    <td class=xl6922393 style='border-top:none;border-left:none'>其他油层保护材料</td>
    <td colspan=3 class=xl6722393 style='border-right:.5pt solid black;
  border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getQtycbhcl(),"")%>　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl7322393 style='height:23.45pt'>一般材料</td>
    <td class=xl6922393 style='border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getYbcl(),"")%>　</td>
    <td class=xl6922393 style='border-left:none'>奥凯龙材料</td>
    <td class=xl6922393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getAklcl(),"")%>　</td>
    <td class=xl8122393 style='border-left:none'>扶正器</td>
    <td class=xl7622393 style='border-top:none;border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getFzq(),"")%>　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl7322393 style='height:23.45pt'>　</td>
    <td class=xl6922393 style='border-left:none'>　</td>
    <td class=xl6922393 style='border-left:none'>　</td>
    <td class=xl6922393 style='border-left:none'>　</td>
    <td class=xl6422393 style='border-left:none'>　</td>
    <td class=xl7622393 style='border-left:none'>　</td>
</tr>
<tr height=50 style='mso-height-source:userset;height:37.5pt'>
    <td height=50 class=xl6622393 style='height:37.5pt'>备注</td>
    <td colspan=5 class=xl9422393 style='border-left:none;text-align: left'><%=StringUtil.parseNull(bean.getBzgy(),"")%>　</td>
</tr>
<![if supportMisalignedColumns]>
<tr height=0 style='display:none'>
    <td width=85 style='width:64pt'></td>
    <td width=127 style='width:95pt'></td>
    <td width=119 style='width:89pt'></td>
    <td width=125 style='width:94pt'></td>
    <td width=105 style='width:79pt'></td>
    <td width=105 style='width:79pt'></td>
    <td width=98 style='width:74pt'></td>
    <td width=150 style='width:113pt'></td>
</tr>
<![endif]>
</table>

</div>

<!----------------------------->
<!--“从 EXCEL 发布网页”向导结束-->
<!----------------------------->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/Loadwebsign.js"></script>
<script type="text/javascript">
    document.all.DWebSignSeal.SetCurrUser("");
</script>
<!-- ---------结束装载---------------->
<!----------------------------->
<!--“从 EXCEL 发布网页”向导结束-->
<!----------------------------->
</body>

</html>

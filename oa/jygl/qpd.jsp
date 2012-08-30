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
<link rel=File-List href="file8104.files/filelist.xml">
<style id="2012年单井有关费用结算表_16_Styles">
<!--table
{mso-displayed-decimal-separator:"\.";
    mso-displayed-thousand-separator:"\,";}
.font516
{color:windowtext;
    font-size:9.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;}
.xl6316
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
.xl6416
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
.xl6516
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
.xl6616
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
.xl6716
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
.xl6816
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
.xl6916
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
.xl7016
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
.xl7116
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
.xl7216
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
.xl7316
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
.xl7416
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
.xl7516
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
.xl7616
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
.xl7716
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
.xl7816
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
.xl7916
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
.xl8016
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
.xl8116
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
.xl8216
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
.xl8316
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
.xl8416
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
.xl8516
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
.xl8616
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
.xl8716
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
.xl8816
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
.xl8916
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
.xl9016
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
.xl9116
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
.xl9216
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
.xl9316
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
.xl9416
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
.xl9516
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
.xl9616
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
.xl9716
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
.xl9816
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
.xl9916
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
.xl10016
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
.xl10116
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
.xl10216
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
.xl10316
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
.xl10416
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
.xl10516
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
.xl10616
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
.xl10716
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
.xl10816
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
.xl10916
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
.xl11016
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
.xl11116
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
.xl11216
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
.xl11316
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
.xl11416
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
    factory.printing.leftMargin = 0;//左边距
    factory.printing.topMargin = 0;//上边距
    factory.printing.rightMargin = 0;//右边距
    factory.printing.bottomMargin = 0;//下边距
</script>
<!--[if !excel]>　　<![endif]-->
<!--下列信息由 Microsoft Excel 的发布为网页向导生成。-->
<!--如果同一条目从 Excel 中重新发布，则所有位于 DIV 标记之间的信息均将被替换。-->
<!----------------------------->
<!--“从 EXCEL 发布网页”向导开始-->
<!----------------------------->

<div id="2012年单井有关费用结算表_16" align=center x:publishsource="Excel">
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
<table border=0 cellpadding=0 cellspacing=0 width=862 class=xl7716
       style='border-collapse:collapse;table-layout:fixed;width:648pt'>
<col class=xl7816 width=85 style='mso-width-source:userset;mso-width-alt:2720;
 width:64pt'>
<col class=xl7816 width=127 style='mso-width-source:userset;mso-width-alt:
 4064;width:95pt'>
<col class=xl7816 width=119 style='mso-width-source:userset;mso-width-alt:
 3808;width:89pt'>
<col class=xl7816 width=125 style='mso-width-source:userset;mso-width-alt:
 4000;width:94pt'>
<col class=xl7816 width=105 span=2 style='mso-width-source:userset;mso-width-alt:
 3360;width:79pt'>
<col class=xl7816 width=98 span=2 style='mso-width-source:userset;mso-width-alt:
 3136;width:74pt'>
<tr height=35 style='mso-height-source:userset;height:26.25pt'>
    <td colspan=8 height=35 class=xl8916 width=862 style='height:26.25pt;
  width:648pt'>单 井 有 关 费 用 结 算 表</td>
</tr>
<tr height=20 style='mso-height-source:userset;height:15.0pt'>
    <td colspan=8 height=20 class=xl9016 style='height:15.0pt'>钻三公司经营办-09</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td colspan=8 height=31 class=xl8616 style='border-right:1.0pt solid black;
  height:23.45pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>计<span
            style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>划<span style='mso-spacerun:yes'>&nbsp;</span></td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6316 style='height:23.45pt;border-top:none'>队<span
            style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>号</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getDh(),"")%></td>
    <td class=xl6416 style='border-top:none;border-left:none'>井<span
            style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>号</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getJh(),"")%></td>
    <td class=xl6416 style='border-top:none;border-left:none'>建设单位</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getJsdw(),"")%></td>
    <td class=xl6416 style='border-top:none;border-left:none'>分地区</td>
    <td class=xl6516 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getFdq(),"")%></td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6316 style='height:23.45pt;border-top:none'>井<span
            style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>别</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getJb(),"")%>　</td>
    <td class=xl6416 style='border-top:none;border-left:none'>井<span
            style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>深</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getJs(),"")%>　</td>
    <td class=xl6816 style='border-top:none'>井<span
            style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>径</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getJj(),"")%>　</td>
    <td class=xl6416 style='border-top:none;border-left:none'>定额周期</td>
    <td class=xl6516 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getDezq(),"")%>　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6316 style='height:23.45pt;border-top:none'>泥浆密度</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getNjmd(),"")%>　</td>
    <td class=xl6416 style='border-top:none;border-left:none'>技套下深</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getJtxs(),"")%>　</td>
    <td class=xl6416 style='border-top:none;border-left:none'>取<span
            style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>芯</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getQx(),"")%>　</td>
    <td class=xl6416 style='border-top:none;border-left:none'>定额钻机月</td>
    <td class=xl6516 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getDezjy(),"")%>　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6316 style='height:23.45pt;border-top:none'>加深米数</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getJsms(),"")%>　</td>
    <td class=xl6416 style='border-top:none;border-left:none'>井 斜 角</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getJxj(),"")%>　</td>
    <td class=xl6416 style='border-top:none;border-left:none'>野营房维修</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getYyfwx(),"")%>　</td>
    <td rowspan=2 class=xl7216 style='border-bottom:1.0pt solid black;border-top:
  none'>计划签字</td>
    <td rowspan=2 class=xl9516 style='border-bottom:1.0pt solid black;border-top:
  none;text-align: left'  id="shr04b02beb-3532-40c9-8e28-e3b25a76f826">&nbsp;　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl7916 style='height:23.45pt'>备注</td>
    <td colspan=5 class=xl9116 style='border-right:.5pt solid black;border-left:
  none'><%=StringUtil.parseNull(bean.getBz(),"")%>　</td>
</tr>
<tr height=26 style='mso-height-source:userset;height:19.5pt'>
    <td colspan=8 height=26 class=xl8616 style='border-right:1.0pt solid black;
  height:19.5pt'><span style='mso-spacerun:yes'>&nbsp;</span>生<span
            style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>产<span style='mso-spacerun:yes'>&nbsp;</span></td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6316 style='height:23.45pt;border-top:none'>搬迁时间</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getBqsj(),"")%>　</td>
    <td class=xl6416 style='border-top:none;border-left:none'>实际建井周期</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getSjjjzq(),"")%>　</td>
    <td class=xl6416 style='border-top:none;border-left:none'>实际钻机月</td>
    <td class=xl6716 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getSjzjy(),"")%>　</td>
    <td class=xl6416 style='border-top:none'>安装费用</td>
    <td class=xl6516 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getAzfy(),"")%>　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6316 style='height:23.45pt;border-top:none'>开钻时间</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getKzsj(),"")%>　</td>
    <td class=xl6416 style='border-top:none;border-left:none'>实际钻井周期</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getSjzjzq(),"")%>　</td>
    <td class=xl6916 style='border-top:none;border-left:none'>实际井深</td>
    <td class=xl6716 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getSjjs(),"")%>　</td>
    <td class=xl6416 style='border-top:none'>整拖费</td>
    <td class=xl6516 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getZtf(),"")%>　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6316 style='height:23.45pt;border-top:none'>完井时间</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getWjsj(),"")%>　</td>
    <td class=xl6416 style='border-top:none;border-left:none'>是否整拖</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getSfzt(),"")%>　</td>
    <td class=xl6416 style='border-left:none'>搬迁费</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getBqf(),"")%>　</td>
    <td class=xl6416 style='border-top:none;border-left:none'>日常运费</td>
    <td class=xl6516 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getRcyf(),"")%>　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl7916 style='height:23.45pt'>备注</td>
    <td colspan=5 class=xl10116 style='border-right:.5pt solid black;border-left:
  none;text-align: left'><%=StringUtil.parseNull(bean.getBzsc(),"")%>　</td>
    <td class=xl7116 style='border-top:none;border-left:none'>生产办签字</td>
    <td class=xl8016 style='border-left:none;text-align: left'  id="shr33c165b3-b6a7-4144-b8a2-aaebe111845e">&nbsp;　</td>
</tr>
<tr height=24 style='mso-height-source:userset;height:18.0pt'>
    <td colspan=8 height=24 class=xl8616 style='border-right:1.0pt solid black;
  height:18.0pt'>经<span
            style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>管</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6316 style='height:23.45pt;border-top:none'>钻前劳务</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getZqlw(),"")%>　</td>
    <td class=xl6416 style='border-top:none;border-left:none'>套<span
            style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>管</td>
    <td class=xl6716 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getTg(),"")%>　</td>
    <td class=xl6416 style='border-top:none'>钻具租赁费</td>
    <td class=xl6716 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getZqzlf(),"")%>　</td>
    <td class=xl6416 style='border-top:none'>石粉材料</td>
    <td class=xl6516 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getSfcl(),"")%>　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6316 style='height:23.45pt;border-top:none'>管具劳务</td>
    <td class=xl6716 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getGjlw(),"")%>　</td>
    <td class=xl6416 style='border-top:none'>套管附件</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getTgfj(),"")%>　</td>
    <td class=xl6416 style='border-top:none;border-left:none'>刚性扶正器</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getGxfzq(),"")%>　</td>
    <td class=xl6416 style='border-top:none;border-left:none'>石粉劳务</td>
    <td class=xl6516 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getSflw(),"")%>　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6316 style='height:23.45pt;border-top:none'>固井劳务</td>
    <td class=xl6716 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getGjlw2(),"")%>　</td>
    <td class=xl6416 style='border-top:none'>添加剂</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getTjj(),"")%>　</td>
    <td class=xl6416 style='border-top:none;border-left:none'>井控固控摊销</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getJkgktx(),"")%>　</td>
    <td class=xl6416 style='border-top:none;border-left:none'>井控配件</td>
    <td class=xl6516 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getJkpj(),"")%>　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6316 style='height:23.45pt;border-top:none'>固井水泥</td>
    <td class=xl6716 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getGjsn(),"")%>　</td>
    <td class=xl6416 style='border-top:none'>隔离液</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getKly(),"")%>　</td>
    <td class=xl6816 style='border-top:none'>技术服务费</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getJsfwf(),"")%>　</td>
    <td class=xl6416 style='border-top:none;border-left:none'>外委劳务</td>
    <td class=xl6516 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getWwlw(),"")%>　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6316 style='height:23.45pt;border-top:none'>质量扣款</td>
    <td colspan=7 class=xl6716 style='border-right:1.0pt solid black;border-left:
  none;text-align: left'><%=StringUtil.parseNull(bean.getZlkk(),"")%>　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td rowspan=2 height=62 class=xl6316 style='height:46.9pt;border-top:none'>非正常开支</td>
    <td colspan=5 rowspan=2 class=xl10616><%=StringUtil.parseNull(bean.getFzckz(),"")%>　</td>
    <td rowspan=2 class=xl7016 style='border-top:none'>经管签字</td>
    <td rowspan=2 class=xl10416 style='border-top:none;text-align: left' id="shrb23121d4-db76-4d2d-b59d-eefd2873e0ab">&nbsp;　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
</tr>
<tr height=25 style='mso-height-source:userset;height:18.75pt'>
    <td colspan=8 height=25 class=xl8616 style='border-right:1.0pt solid black;
  height:18.75pt'>其<span
            style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>它<span
            style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>部<span
            style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>门</td>
</tr>
<tr height=47 style='mso-height-source:userset;height:35.25pt'>
    <td height=47 class=xl6316 style='height:35.25pt;border-top:none'>柴油</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getCy(),"")%>　</td>
    <td class=xl6816 style='border-top:none'>柴油运费</td>
    <td class=xl6716 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getCyyf(),"")%>　</td>
    <td class=xl6416 style='border-top:none'>柴油劳务费</td>
    <td class=xl6716 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getCylwf(),"")%>　</td>
    <td rowspan=2 class=xl7216 style='border-bottom:.5pt solid black;border-top:
  none'>能源办签字</td>
    <td rowspan=2 class=xl8516 style='border-bottom:.5pt solid black;border-top:
  none;text-align: left' id="shr55fc5e6f-6a0c-4976-b0dd-03d72ebd3448">&nbsp;　</td>
</tr>
<tr height=38 style='mso-height-source:userset;height:28.5pt'>
    <td height=38 class=xl6316 style='height:28.5pt;border-top:none'>网电费</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getWdf(),"")%>　</td>
    <td class=xl7816>原油</td>
    <td class=xl6916 style='border-top:none'><%=StringUtil.parseNull(bean.getYy(),"")%>　</td>
    <td class=xl7816>其他</td>
    <td class=xl7416 style='border-top:none'><%=StringUtil.parseNull(bean.getQtnyb(),"")%>　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl7316 style='height:23.45pt;border-top:none'>实际井深</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getSjjs(),"")%>　</td>
    <td class=xl6916 style='border-left:none'>取芯进尺</td>
    <td class=xl6416 style='border-left:none'><%=StringUtil.parseNull(bean.getQxjc(),"")%>　</td>
    <td class=xl6416 style='border-left:none'>弹性扶正器</td>
    <td class=xl7616 style='border-left:none'><%=StringUtil.parseNull(bean.getTxfzq(),"")%>　</td>
    <td rowspan=3 class=xl7216 style='border-bottom:.5pt solid black;border-top:
  none'>技术签字</td>
    <td rowspan=3 class=xl8516 style='border-bottom:.5pt solid black;border-top:
  none;text-align: left' id="shr8a49607b-d8da-4f7f-a594-9946f6d7d7c9">&nbsp;　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6316 style='height:23.45pt'>有效返工进尺</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getYxfgjc(),"")%>　</td>
    <td class=xl6416 style='border-left:none'>筛管下深</td>
    <td class=xl6716 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getSgxs(),"")%>　</td>
    <td rowspan=2 class=xl6916 style='border-bottom:.5pt solid black;border-top:
  none'>其他</td>
    <td rowspan=2 class=xl6916 style='border-bottom:.5pt solid black'><%=StringUtil.parseNull(bean.getQtjs(),"")%>　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6316 style='height:23.45pt;border-top:none'>泥浆服务方</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getNjfwf(),"")%>　</td>
    <td class=xl6416 style='border-top:none;border-left:none'>定向服务方</td>
    <td class=xl6716 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getDxfwf(),"")%>　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6316 style='height:23.45pt;border-top:none'>设备修理费</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getSbxlf(),"")%>　</td>
    <td class=xl6416 style='border-top:none;border-left:none'>上井劳务费</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getSjlwf(),"")%>　</td>
    <td class=xl6416 style='border-top:none;border-left:none'>其他</td>
    <td class=xl7516 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getQtjdk(),"")%>　</td>
    <td class=xl7016 style='border-top:none'>机动科签字</td>
    <td class=xl8416 style='border-top:none;border-left:none;text-align: left' id="shr27021cde-c852-4c4a-8809-dbcb155825d2">&nbsp;　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6316 style='height:23.45pt;border-top:none'>安全设施费</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getAqssf(),"")%>　</td>
    <td class=xl6416 style='border-top:none;border-left:none'>上井劳务费</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getSjlwf(),"")%>　</td>
    <td class=xl6416 style='border-top:none;border-left:none'>其他</td>
    <td class=xl7416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getQtaqk(),"")%>　</td>
    <td class=xl7216 style='border-top:none'>安全科签字</td>
    <td class=xl8516 style='border-top:none;border-left:none;text-align: left' id="shr254db449-d2de-4335-a130-6f1603cb741f">&nbsp;　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6316 style='height:23.45pt;border-top:none'>工农费</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getGnf(),"")%>　</td>
    <td class=xl6416 style='border-top:none;border-left:none'>非正常开支</td>
    <td colspan=3 class=xl6416 style='border-left:none'><%=StringUtil.parseNull(bean.getFzckz(),"")%>　</td>
    <td class=xl7016 style='border-left:none'>工农科签字</td>
    <td class=xl8516 style='border-left:none;text-align: left' id="shr61314660-7176-4f17-b19c-ba9840acd849">&nbsp;　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6316 style='height:23.45pt;border-top:none'>井队用料</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getJdyl(),"")%>　</td>
    <td class=xl6416 style='border-top:none;border-left:none'>其<span
            style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>他</td>
    <td colspan=3 class=xl6716 style='border-right:.5pt solid black;border-left:
  none'><%=StringUtil.parseNull(bean.getQtzhd(),"")%>　</td>
    <td class=xl7016 style='border-top:none;border-left:none'>综合队</td>
    <td class=xl8516 style='border-left:none;text-align: left' id="shr895ba579-95d8-4e88-b615-3c2b2443aa0e">&nbsp;　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6316 style='height:23.45pt;border-top:none'>井队用料</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getJdylwxd(),"")%>　</td>
    <td class=xl6416 style='border-top:none;border-left:none'>其<span
            style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>他</td>
    <td colspan=3 class=xl6716 style='border-right:.5pt solid black;border-left:
  none'><%=StringUtil.parseNull(bean.getQtwxd(),"")%>　</td>
    <td class=xl7016 style='border-top:none;border-left:none'>外修队</td>
    <td class=xl8516 style='border-left:none;text-align: left' id="shr3b6f38fb-fd8c-4a50-9587-431b841b2c7a">&nbsp;　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6316 style='height:23.45pt;border-top:none'>钻头</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getZt(),"")%>　</td>
    <td class=xl8116 style='border-left:none'>机油</td>
    <td class=xl6416 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getJy(),"")%>　</td>
    <td class=xl6416 style='border-top:none;border-left:none'>材料供井运费</td>
    <td class=xl6716 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getClgjfy(),"")%>　</td>
    <td rowspan=6 class=xl9716 width=98 style='border-bottom:1.0pt solid black;
  border-top:none;width:74pt'>供应签字<br>
    </td>
    <td rowspan=6 class=xl10816 style='border-bottom:.5pt solid black;text-align: left' id="shr6f531ccb-7cbe-4614-9a1b-3683992ffa89">&nbsp;　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl6316 style='height:23.45pt;border-top:none'>泥浆村料</td>
    <td class=xl6916 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getNjcl(),"")%>　</td>
    <td class=xl8216 width=119 style='border-left:none;width:89pt'>非渗透油层保护材料</td>
    <td class=xl6916 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getFstycbhcl(),"")%>　</td>
    <td class=xl6416 style='border-top:none;border-left:none'>MEG泥浆材料</td>
    <td class=xl7616 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getMegnjcl(),"")%>　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl8316 width=85 style='height:23.45pt;border-top:none;
  width:64pt'>胺基聚醇油层保护材料</td>
    <td class=xl6916 style='border-left:none'><%=StringUtil.parseNull(bean.getAjjcycbhcl(),"")%>　</td>
    <td class=xl6916 style='border-top:none;border-left:none'>其他油层保护材料</td>
    <td colspan=3 class=xl6716 style='border-right:.5pt solid black;border-left:
  none'><%=StringUtil.parseNull(bean.getQtycbhcl(),"")%>　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl7316 style='height:23.45pt'>一般材料</td>
    <td class=xl6916 style='border-left:none'><%=StringUtil.parseNull(bean.getYbcl(),"")%>　</td>
    <td class=xl6916 style='border-left:none'>奥凯龙材料</td>
    <td class=xl6916 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getAklcl(),"")%>　</td>
    <td class=xl8116 style='border-left:none'>扶正器</td>
    <td class=xl7616 style='border-top:none;border-left:none'><%=StringUtil.parseNull(bean.getFzq(),"")%>　</td>
</tr>
<tr height=31 style='mso-height-source:userset;height:23.45pt'>
    <td height=31 class=xl7316 style='height:23.45pt'>　</td>
    <td class=xl6916 style='border-left:none'>　</td>
    <td class=xl6916 style='border-left:none'>　</td>
    <td class=xl6916 style='border-left:none'>　</td>
    <td class=xl6416 style='border-left:none'>　</td>
    <td class=xl7616 style='border-left:none'>　</td>
</tr>
<tr height=50 style='mso-height-source:userset;height:37.5pt'>
    <td height=50 class=xl6616 style='height:37.5pt'>备注</td>
    <td colspan=5 class=xl11416 style='border-left:none'><%=StringUtil.parseNull(bean.getBzgy(),"")%>　</td>
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
    <td width=98 style='width:74pt'></td>
</tr>
<![endif]>
</table>

</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/Loadwebsign.js"></script>
<script type="text/javascript">
    document.all.DWebSignSeal.SetCurrUser("");
</script>

<!----------------------------->
<!--“从 EXCEL 发布网页”向导结束-->
<!----------------------------->
</body>

</html>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.net.InetAddress" %>
<%@ include file="../../../import.jsp"%>
<%
    CUser cUser = (CUser)session.getAttribute("cUser");
    cUser = cUser == null?new CUser():cUser;
    String orgId = cUser.getOrgnaId();
    Map paramMap = new HashMap();
    paramMap.put("orgnaId",orgId);
    COrgnization cOrgnization = orgnizationDAO.queryForBean(paramMap);
    String sqid = StringUtil.parseNull(request.getParameter("sqid"),"");
    Map map = new HashMap();
    map.put("sqid",sqid);
    OfficeSupplies officeSupplies = officeSuppliesDAO.queryForBean(map);
    String formId  = StringUtil.parseNull(request.getParameter("formId"),"");
    String connectId  = StringUtil.parseNull(request.getParameter("connectId"),"");
    String processId  = StringUtil.parseNull(request.getParameter("processId"),"");
    String curRole  = StringUtil.parseNull(request.getParameter("curRole"),"");
    List dataList = oDao.getAllQpdFormItemsByFormId2(formId,processId);
    dataList = dataList == null?new ArrayList():dataList; 
    String formItemId = oDao.getFormItemIdByConnectId(connectId,formId);
    String signdata =   oDao.getSignDataByProcessId(processId);
    signdata = StringUtil.parseNull(signdata,"");
    String[] nodeName  = request.getParameterValues("nodeName");
    String[] nodeId  = request.getParameterValues("nodeId");
    String[] spyj  = request.getParameterValues("spyj");
    List list = wDao.getActivitiesByFlowId(processId);
%>
 <html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">

<head>
    <title>会议申请单打印</title>
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 12">
<link rel=File-List href="会议申请单.files/filelist.xml">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]-->
<script type="text/javascript">
	// --- 为控件设置要签名的数据
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
	//document.all.DWebSignSeal.SetPosition(0,0,'shr034ddf84-e174-480e-b52d-c3e2542b4203');
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
    var shr = 'shr<%=StringUtil.parseNull(formItemId,"")%>';
	document.all.DWebSignSeal.SetPosition(-140,-35,shr);
    var sealURL='<%="http://"+sysConfig.getProperty("sealServer")+":"+request.getLocalPort()+request.getContextPath()+"/servlet/sealDown?userId="+cUser.getUserId()%>';
    document.all.DWebSignSeal.AddSeal(sealURL, "");
}
	</script>
    <style media=print>
        .Noprint{display:none;}
    </style>
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:宋体;
	panose-1:2 1 6 0 3 1 1 1 1 1;
	mso-font-alt:SimSun;
	mso-font-charset:134;
	mso-generic-font-family:auto;
	mso-font-pitch:variable;
	mso-font-signature:3 680460288 22 0 262145 0;}
@font-face
	{font-family:黑体;
	panose-1:2 1 6 9 6 1 1 1 1 1;
	mso-font-alt:SimHei;
	mso-font-charset:134;
	mso-generic-font-family:modern;
	mso-font-pitch:fixed;
	mso-font-signature:-2147482945 953122042 22 0 262145 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;
	mso-font-charset:0;
	mso-generic-font-family:roman;
	mso-font-pitch:variable;
	mso-font-signature:-536870145 1107305727 0 0 415 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:-520092929 1073786111 9 0 415 0;}
@font-face
	{font-family:"\@黑体";
	panose-1:2 1 6 9 6 1 1 1 1 1;
	mso-font-charset:134;
	mso-generic-font-family:modern;
	mso-font-pitch:fixed;
	mso-font-signature:-2147482945 953122042 22 0 262145 0;}
@font-face
	{font-family:"\@宋体";
	panose-1:2 1 6 0 3 1 1 1 1 1;
	mso-font-charset:134;
	mso-generic-font-family:auto;
	mso-font-pitch:variable;
	mso-font-signature:3 680460288 22 0 262145 0;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-unhide:no;
	mso-style-qformat:yes;
	mso-style-parent:"";
	margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	mso-pagination:none;
	font-size:10.5pt;
	mso-bidi-font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:宋体;
	mso-fareast-theme-font:minor-fareast;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-font-kerning:1.0pt;}
p.MsoHeader, li.MsoHeader, div.MsoHeader
	{mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-link:"页眉 Char";
	margin:0cm;
	margin-bottom:.0001pt;
	text-align:center;
	mso-pagination:none;
	tab-stops:center 207.65pt right 415.3pt;
	layout-grid-mode:char;
	border:none;
	mso-border-bottom-alt:solid windowtext .75pt;
	padding:0cm;
	mso-padding-alt:0cm 0cm 1.0pt 0cm;
	font-size:9.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:宋体;
	mso-fareast-theme-font:minor-fareast;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-font-kerning:1.0pt;}
p.MsoFooter, li.MsoFooter, div.MsoFooter
	{mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-link:"页脚 Char";
	margin:0cm;
	margin-bottom:.0001pt;
	mso-pagination:none;
	tab-stops:center 207.65pt right 415.3pt;
	layout-grid-mode:char;
	font-size:9.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:宋体;
	mso-fareast-theme-font:minor-fareast;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-font-kerning:1.0pt;}
p.MsoDate, li.MsoDate, div.MsoDate
	{mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-link:"日期 Char";
	mso-style-next:正文;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:5.0pt;
	margin-bottom:.0001pt;
	mso-para-margin-top:0cm;
	mso-para-margin-right:0cm;
	mso-para-margin-bottom:0cm;
	mso-para-margin-left:25.0gd;
	mso-para-margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	mso-pagination:none;
	font-size:10.5pt;
	mso-bidi-font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:宋体;
	mso-fareast-theme-font:minor-fareast;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-font-kerning:1.0pt;}
span.Char
	{mso-style-name:"页眉 Char";
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-unhide:no;
	mso-style-locked:yes;
	mso-style-link:页眉;
	mso-ansi-font-size:9.0pt;
	mso-bidi-font-size:9.0pt;}
span.Char0
	{mso-style-name:"页脚 Char";
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-unhide:no;
	mso-style-locked:yes;
	mso-style-link:页脚;
	mso-ansi-font-size:9.0pt;
	mso-bidi-font-size:9.0pt;}
span.Char1
	{mso-style-name:"日期 Char";
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-unhide:no;
	mso-style-locked:yes;
	mso-style-link:日期;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-default-props:yes;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;}
 /* Page Definitions */
 @page
	{mso-page-border-surround-header:no;
	mso-page-border-surround-footer:no;
	mso-footnote-separator:url("其它申请.files/header.htm") fs;
	mso-footnote-continuation-separator:url("其它申请.files/header.htm") fcs;
	mso-endnote-separator:url("其它申请.files/header.htm") es;
	mso-endnote-continuation-separator:url("其它申请.files/header.htm") ecs;}
@page Section1
	{size:595.3pt 841.9pt;
	margin:72.0pt 54.0pt 72.0pt 54.0pt;
	mso-header-margin:42.55pt;
	mso-footer-margin:49.6pt;
	mso-paper-source:0;
	layout-grid:15.6pt;}
div.Section1
	{page:Section1;}
-->
</style>
<!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:普通表格;
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-qformat:yes;
	mso-style-parent:"";
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin:0cm;
	mso-para-margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:10.5pt;
	mso-bidi-font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-font-kerning:1.0pt;}
table.MsoTableGrid
	{mso-style-name:网格型;
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-priority:59;
	mso-style-unhide:no;
	border:solid black 1.0pt;
	mso-border-themecolor:text1;
	mso-border-alt:solid black .5pt;
	mso-border-themecolor:text1;
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-border-insideh:.5pt solid black;
	mso-border-insideh-themecolor:text1;
	mso-border-insidev:.5pt solid black;
	mso-border-insidev-themecolor:text1;
	mso-para-margin:0cm;
	mso-para-margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:10.5pt;
	mso-bidi-font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-font-kerning:1.0pt;}
</style>

<![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="11266"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="2"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body lang=ZH-CN style='tab-interval:21.0pt;text-justify-trim:punctuation' onload="LoadSignData()">
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
  	<form name="form1" method="post" action="">
<div class=Section1 style='layout-grid:15.6pt'>

<div align=center>
<table align="center">
	<tr>
	<td class="Noprint">
		<input name="button" type="button" class="button" value="打印预览" onClick="factory.printing.Preview();"/>
	      <input name="submit" type="button" class="button" value="关闭" onClick="window.close();">
		  <!-- SignData隐藏域，用于将所有加密的数据提交到表单保存页面 -->
		  <input type="hidden" id="signdata" name="signdata"/>
	</td>
	</tr>
</table>
<table class=MsoTableGrid border=0 cellspacing=0 cellpadding=0
 style='border-collapse:collapse;border:none;mso-yfti-tbllook:1184;mso-padding-alt:
 0cm 5.4pt 0cm 5.4pt;mso-border-insideh:none;mso-border-insidev:none'>
 <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes'>
  <td width=664 valign=top style='width:498.1pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='text-align:center'><span
  style='font-size:22.0pt;font-family:黑体'>关于<%=officeSupplies.getMc()%>的请示<span lang=EN-US><o:p></o:p></span></span></p>
  <p class=MsoNormal><span style='font-size:16.0pt;font-family:宋体;mso-ascii-theme-font:
  major-fareast;mso-fareast-theme-font:major-fareast;mso-hansi-theme-font:major-fareast'><span
  lang=EN-US><o:p><p>&nbsp;&nbsp;<%=officeSupplies.getSy()%></p></o:p></span></span></p>
  <p class=MsoNormal><span lang=EN-US style='font-size:16.0pt;font-family:宋体;
  mso-ascii-theme-font:major-fareast;mso-fareast-theme-font:major-fareast;
  mso-hansi-theme-font:major-fareast'><o:p>&nbsp;</o:p></span></p>
  <p class=MsoNormal><span lang=EN-US style='font-size:16.0pt;font-family:宋体;
  mso-ascii-theme-font:major-fareast;mso-fareast-theme-font:major-fareast;
  mso-hansi-theme-font:major-fareast'><o:p>&nbsp;</o:p></span></p>
  <p class=MsoNormal style='text-indent:24.0pt;mso-char-indent-count:1.5'><span
  style='font-size:16.0pt;font-family:宋体;mso-ascii-theme-font:major-fareast;
  mso-fareast-theme-font:major-fareast;mso-hansi-theme-font:major-fareast'><span
  lang=EN-US><o:p></o:p></span></span></p>
  <p class=MsoNormal style='text-indent:16.0pt;mso-char-indent-count:1.0'><span
  lang=EN-US style='font-size:16.0pt;font-family:宋体;mso-ascii-theme-font:major-fareast;
  mso-fareast-theme-font:major-fareast;mso-hansi-theme-font:major-fareast'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span
  style='font-size:16.0pt;font-family:宋体;mso-ascii-theme-font:major-fareast;
  mso-fareast-theme-font:major-fareast;mso-hansi-theme-font:major-fareast'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=cOrgnization.getOrgnaName()%><span
  lang=EN-US><o:p></o:p></span></span></p>
  <p class=MsoNormal style='text-indent:16.0pt;mso-char-indent-count:1.0'><span
  lang=EN-US style='font-size:16.0pt;font-family:宋体;mso-ascii-theme-font:major-fareast;
  mso-fareast-theme-font:major-fareast;mso-hansi-theme-font:major-fareast'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><%=DateUtil.format(officeSupplies.getSqsj(),"yyyy年MM月dd日")%></span></p>
  </td>
 </tr>
   <%
                    for(int i=0;i<dataList.size();i++){
                        Map beanMap = (Map)dataList.get(i);    
                        String id = StringUtil.parseNull(beanMap.get("FORM_ITEM_ID"),"");
                  %>
 <tr style='mso-yfti-irow:1'>
  <td width=664 valign=top style='width:498.1pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class="Noprint"><span style='font-size:16.0pt;font-family:宋体;mso-ascii-theme-font:
  major-fareast;mso-fareast-theme-font:major-fareast;mso-hansi-theme-font:major-fareast'>
      <%=StringUtil.parseNull(beanMap.get("FORM_ITEM_TITLE"),"")%>意见：<span
  lang=EN-US><o:p></o:p></span></span></p>
  <p class=MsoNormal><span lang=EN-US style='font-size:16.0pt;font-family:宋体;
  mso-ascii-theme-font:major-fareast;mso-fareast-theme-font:major-fareast;
  mso-hansi-theme-font:major-fareast'><o:p><%=StringUtil.parseNull(beanMap.get("SPYJ"),"")%>&nbsp;</o:p></span></p>
  <p class=MsoNormal><span lang=EN-US style='font-size:16.0pt;font-family:宋体;
  mso-ascii-theme-font:major-fareast;mso-fareast-theme-font:major-fareast;
  mso-hansi-theme-font:major-fareast'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>
 <table align="right"><tr><td valign=top id="shr<%=id%>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=StringUtil.parseNull(beanMap.get("LRSJ"),"")%></td></tr></table>
  </td>
 </tr>
 <%} %>
</table>

</div>

<p class=MsoNormal style='text-indent:16.0pt;mso-char-indent-count:1.0'><span
lang=EN-US style='font-size:16.0pt;font-family:宋体;mso-ascii-theme-font:major-fareast;
mso-fareast-theme-font:major-fareast;mso-hansi-theme-font:major-fareast'><o:p>&nbsp;</o:p></span></p>

</div>
</form>

<!----------------------------->
<!--“从 EXCEL 发布网页”向导结束-->
<!----------------------------->
<!-- ---------装载控件---------------->
	 <script type="text/javascript" src="<%=request.getContextPath()%>/js/Loadwebsign.js"></script>
	 <script type="text/javascript">
	 document.all.DWebSignSeal.SetCurrUser("");
	 </script>
	<!-- ---------结束装载---------------->
</body>

</html>

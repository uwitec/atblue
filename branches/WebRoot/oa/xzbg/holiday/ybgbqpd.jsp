<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.net.InetAddress" %>
<%@ include file="../../../import.jsp"%>
 <%
    CUser cUser = (CUser)session.getAttribute("cUser");
    cUser = cUser == null?new CUser():cUser;
    String holidayid = StringUtil.parseNull(request.getParameter("holidayid"),"");
    Map map = new HashMap();
    map.put("holidayid",holidayid);
    OfficeHoliday holiday = officeHolidayDAO.queryForBean(map);
    holiday = holiday == null?new OfficeHoliday():holiday;
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
    String title="";
	
	if("1".equals(holiday.getRoleflag())&&"1".equals(holiday.getSfbr())){//基层正职干部请销假
		title="基层正职干部请销假";
	}else if("1".equals(holiday.getRoleflag())&&"0".equals(holiday.getSfbr())){ //基层干部职工请销假
		title="基层干部职工请销假";
	}else if("2".equals(holiday.getRoleflag())&&"1".equals(holiday.getSfbr())){ //机关科室长请销假
		title="机关科室长请销假";
	}else if("2".equals(holiday.getRoleflag())&&"0".equals(holiday.getSfbr())){ //机关普通干部请销假
		title="机关普通干部请销假";
	}
%>
<html>

<head>
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<meta name=ProgId content=Word.Document>
<meta name=Generator content="Microsoft Word 12">
<meta name=Originator content="Microsoft Word 12">
<link rel=File-List href="机关一般干部请销假审批表.files/filelist.xml">
<title>胜利油田职工因私事出国（境）审批表</title>
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>zyq</o:Author>
  <o:Template>Normal</o:Template>
  <o:LastAuthor>Windows 用户</o:LastAuthor>
  <o:Revision>2</o:Revision>
  <o:TotalTime>124</o:TotalTime>
  <o:LastPrinted>2011-08-24T00:58:00Z</o:LastPrinted>
  <o:Created>2012-04-19T10:24:00Z</o:Created>
  <o:LastSaved>2012-04-19T10:24:00Z</o:LastSaved>
  <o:Pages>2</o:Pages>
  <o:Words>60</o:Words>
  <o:Characters>342</o:Characters>
  <o:Company>Sinopec</o:Company>
  <o:Lines>2</o:Lines>
  <o:Paragraphs>1</o:Paragraphs>
  <o:CharactersWithSpaces>401</o:CharactersWithSpaces>
  <o:Version>12.00</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<link rel=themeData href="机关一般干部请销假审批表.files/themedata.thmx">
<link rel=colorSchemeMapping href="机关一般干部请销假审批表.files/colorschememapping.xml">
<!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:TrackMoves>false</w:TrackMoves>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:DrawingGridVerticalSpacing>7.8 磅</w:DrawingGridVerticalSpacing>
  <w:DisplayHorizontalDrawingGridEvery>0</w:DisplayHorizontalDrawingGridEvery>
  <w:DisplayVerticalDrawingGridEvery>2</w:DisplayVerticalDrawingGridEvery>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-US</w:LidThemeOther>
  <w:LidThemeAsian>ZH-CN</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:SpaceForUL/>
   <w:BalanceSingleByteDoubleByteWidth/>
   <w:DoNotLeaveBackslashAlone/>
   <w:ULTrailSpace/>
   <w:DoNotExpandShiftReturn/>
   <w:AdjustLineHeightInTable/>
   <w:SelectEntireFieldWithStartOrEnd/>
   <w:UseWord2002TableStyleRules/>
   <w:DontUseIndentAsNumberingTabStop/>
   <w:FELineBreak11/>
   <w:WW11IndentRules/>
   <w:DontAutofitConstrainedTables/>
   <w:AutofitLikeWW11/>
   <w:HangulWidthLikeWW11/>
   <w:UseNormalStyleForList/>
   <w:UseFELayout/>
  </w:Compatibility>
  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="--"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"
  DefSemiHidden="false" DefQFormat="false" LatentStyleCount="267">
  <w:LsdException Locked="false" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" Priority="99" SemiHidden="true"
   Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="99" SemiHidden="true" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" QFormat="true"
   Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" QFormat="true"
   Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" QFormat="true"
   Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" QFormat="true"
   Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" QFormat="true"
   Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" QFormat="true"
   Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" SemiHidden="true"
   UnhideWhenUsed="true" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>
 </w:LatentStyles>
</xml><![endif]-->
<style media=print>
    .Noprint{display:none;}
</style>
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
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;
	mso-font-charset:0;
	mso-generic-font-family:roman;
	mso-font-pitch:variable;
	mso-font-signature:-1610611985 1107304683 0 0 415 0;}
@font-face
	{font-family:华文中宋;
	mso-font-alt:微软雅黑;
	mso-font-charset:134;
	mso-generic-font-family:auto;
	mso-font-pitch:variable;
	mso-font-signature:0 135200768 16 0 262303 0;}
@font-face
	{font-family:仿宋_GB2312;
	mso-font-alt:微软雅黑;
	mso-font-charset:134;
	mso-generic-font-family:modern;
	mso-font-pitch:fixed;
	mso-font-signature:0 135135232 16 0 262144 0;}
@font-face
	{font-family:"\@宋体";
	panose-1:2 1 6 0 3 1 1 1 1 1;
	mso-font-charset:134;
	mso-generic-font-family:auto;
	mso-font-pitch:variable;
	mso-font-signature:3 680460288 22 0 262145 0;}
@font-face
	{font-family:"\@华文中宋";
	mso-font-charset:134;
	mso-generic-font-family:auto;
	mso-font-pitch:variable;
	mso-font-signature:0 135200768 16 0 262303 0;}
@font-face
	{font-family:"\@仿宋_GB2312";
	mso-font-charset:134;
	mso-generic-font-family:modern;
	mso-font-pitch:fixed;
	mso-font-signature:0 135135232 16 0 262144 0;}
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
	mso-bidi-font-size:12.0pt;
	font-family:"Times New Roman","serif";
	mso-fareast-font-family:宋体;
	mso-font-kerning:1.0pt;}
p.MsoHeader, li.MsoHeader, div.MsoHeader
	{mso-style-unhide:no;
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
	font-family:"Times New Roman","serif";
	mso-fareast-font-family:宋体;
	mso-font-kerning:1.0pt;}
p.MsoFooter, li.MsoFooter, div.MsoFooter
	{mso-style-unhide:no;
	mso-style-link:"页脚 Char";
	margin:0cm;
	margin-bottom:.0001pt;
	mso-pagination:none;
	tab-stops:center 207.65pt right 415.3pt;
	layout-grid-mode:char;
	font-size:9.0pt;
	font-family:"Times New Roman","serif";
	mso-fareast-font-family:宋体;
	mso-font-kerning:1.0pt;}
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-noshow:yes;
	mso-style-unhide:no;
	margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	mso-pagination:none;
	font-size:9.0pt;
	font-family:"Times New Roman","serif";
	mso-fareast-font-family:宋体;
	mso-font-kerning:1.0pt;}
span.Char
	{mso-style-name:"页眉 Char";
	mso-style-unhide:no;
	mso-style-locked:yes;
	mso-style-link:页眉;
	mso-ansi-font-size:9.0pt;
	mso-bidi-font-size:9.0pt;
	mso-font-kerning:1.0pt;}
span.Char0
	{mso-style-name:"页脚 Char";
	mso-style-unhide:no;
	mso-style-locked:yes;
	mso-style-link:页脚;
	mso-ansi-font-size:9.0pt;
	mso-bidi-font-size:9.0pt;
	mso-font-kerning:1.0pt;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-default-props:yes;
	mso-fareast-font-family:宋体;}
 /* Page Definitions */
 @page
	{mso-page-border-surround-header:no;
	mso-page-border-surround-footer:no;
	mso-footnote-separator:url("机关一般干部请销假审批表.files/header.htm") fs;
	mso-footnote-continuation-separator:url("机关一般干部请销假审批表.files/header.htm") fcs;
	mso-endnote-separator:url("机关一般干部请销假审批表.files/header.htm") es;
	mso-endnote-continuation-separator:url("机关一般干部请销假审批表.files/header.htm") ecs;}
@page Section1
	{size:21.0cm 842.0pt;
	margin:70.9pt 2.0cm 2.0cm 3.0cm;
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
	mso-style-unhide:no;
	mso-style-parent:"";
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin:0cm;
	mso-para-margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Times New Roman","serif";}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="3074"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
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

<p class=MsoNormal align=center style='margin-bottom:7.8pt;mso-para-margin-bottom:
.5gd;text-align:center'><b style='mso-bidi-font-weight:normal'><span
style='font-size:18.0pt;font-family:华文中宋'><%=title %><span lang=EN-US><o:p></o:p></span></span></b></p>
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
<table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0 width=619
 style='width:464.4pt;border-collapse:collapse;border:none;mso-border-alt:solid windowtext .5pt;
 mso-padding-alt:0cm 5.4pt 0cm 5.4pt;mso-border-insideh:.5pt solid windowtext;
 mso-border-insidev:.5pt solid windowtext' align="center">
 <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;height:33.3pt'>
  <td width=91 style='width:68.4pt;border:solid windowtext 1.0pt;mso-border-alt:
  solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:33.3pt'>
  <p class=MsoNormal align=center style='text-align:center;tab-stops:61.5pt'><span
  style='font-size:12.0pt;font-family:仿宋_GB2312'>姓　名<span lang=EN-US><o:p></o:p></span></span></p>
  </td>
  <td width=108 style='width:81.0pt;border:solid windowtext 1.0pt;border-left:
  none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:33.3pt'>
  <p class=MsoNormal align=center style='text-align:center;tab-stops:61.5pt'><span
  lang=EN-US style='font-size:12.0pt;font-family:仿宋_GB2312'><o:p><%=holiday.getXm() %>&nbsp;</o:p></span></p>
  </td>
  <td width=144 style='width:108.0pt;border:solid windowtext 1.0pt;border-left:
  none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:33.3pt'>
  <p class=MsoNormal align=center style='text-align:center;tab-stops:61.5pt'><span
  style='font-size:12.0pt;font-family:仿宋_GB2312'>单位及职务<span lang=EN-US>(</span>岗位<span
  lang=EN-US>)<o:p></o:p></span></span></p>
  </td>
  <td width=276 colspan=3 style='width:207.0pt;border:solid windowtext 1.0pt;
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:33.3pt'>
  <p class=MsoNormal align=center style='text-align:center;tab-stops:61.5pt'><span
  lang=EN-US style='font-size:12.0pt;font-family:仿宋_GB2312'><o:p><%=holiday.getDw() %>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:1;page-break-inside:avoid;height:32.8pt'>
  <td width=91 style='width:68.4pt;border:solid windowtext 1.0pt;border-top:
  none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:32.8pt'>
  <p class=MsoNormal style='tab-stops:61.5pt'><span style='font-size:12.0pt;
  font-family:仿宋_GB2312'>外出时间<span lang=EN-US><o:p></o:p></span></span></p>
  </td>
  <td width=288 colspan=3 style='width:216.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:32.8pt'>
  <p class=MsoNormal align=center style='text-align:center;tab-stops:61.5pt'><span
  lang=EN-US style='font-size:12.0pt;font-family:仿宋_GB2312'><span
  style='mso-spacerun:yes'>&nbsp;</span></span><span style='font-size:12.0pt;
  font-family:仿宋_GB2312'><%=DateUtil.format(holiday.getKssj(),"yyyy年MM月dd日")%><span lang=EN-US>至</span><%=DateUtil.format(holiday.getJssj(),"yyyy年MM月dd日")%><span lang=EN-US><o:p></o:p></span></span></p>
  </td>
  <td width=96 style='width:72.0pt;border-top:none;border-left:none;border-bottom:
  solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;mso-border-top-alt:
  solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:32.8pt'>
  <p class=MsoNormal align=center style='margin-top:0cm;margin-right:-5.35pt;
  margin-bottom:0cm;margin-left:-5.35pt;margin-bottom:.0001pt;mso-para-margin-top:
  0cm;mso-para-margin-right:-.51gd;mso-para-margin-bottom:0cm;mso-para-margin-left:
  -.51gd;mso-para-margin-bottom:.0001pt;text-align:center;tab-stops:61.5pt'><span
  style='font-size:12.0pt;font-family:仿宋_GB2312'>外出地点<span lang=EN-US><o:p></o:p></span></span></p>
  </td>
  <td width=144 style='width:108.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:32.8pt'>
  <p class=MsoNormal align=center style='text-align:center;tab-stops:61.5pt'><span
  lang=EN-US style='font-size:12.0pt;font-family:仿宋_GB2312'><o:p><%=StringUtil.parseNull(holiday.getWcdd(),"") %>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:2;height:64.95pt'>
  <td width=91 style='width:68.4pt;border:solid windowtext 1.0pt;border-top:
  none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:64.95pt'>
  <p class=MsoNormal align=center style='text-align:center;tab-stops:61.5pt'><span
  style='font-size:12.0pt;font-family:仿宋_GB2312'>外出<span lang=EN-US><o:p></o:p></span></span></p>
  <p class=MsoNormal align=center style='text-align:center;tab-stops:61.5pt'><span
  style='font-size:12.0pt;font-family:仿宋_GB2312'>事由<span lang=EN-US><o:p></o:p></span></span></p>
  </td>
  <td width=528 colspan=5 valign=top style='width:396.0pt;border-top:none;
  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:64.95pt'>
  <p class=MsoNormal align=left style='text-align:left;tab-stops:61.5pt'><span
  lang=EN-US style='font-size:12.0pt;font-family:仿宋_GB2312'><o:p><%=StringUtil.parseNull(holiday.getWcsy(),"")%>&nbsp;</o:p></span></p>
  <p class=MsoNormal align=center style='text-align:center;tab-stops:61.5pt'><span
  lang=EN-US style='font-size:12.0pt;font-family:仿宋_GB2312'><o:p>&nbsp;</o:p></span></p>
  <p class=MsoNormal style='tab-stops:61.5pt'><span style='font-size:12.0pt;
  font-family:仿宋_GB2312'>　　<span lang=EN-US><o:p></o:p></span></span></p>
  <p class=MsoNormal style='tab-stops:61.5pt'><span lang=EN-US
  style='font-size:12.0pt;font-family:仿宋_GB2312'><o:p>&nbsp;</o:p></span></p>
  <p class=MsoNormal style='tab-stops:61.5pt'><span lang=EN-US
  style='font-size:12.0pt;font-family:仿宋_GB2312'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
  <%
                    for(int i=0;i<dataList.size();i++){
                        Map beanMap = (Map)dataList.get(i);    
                        String id = StringUtil.parseNull(beanMap.get("FORM_ITEM_ID"),"");
                  %>
 <tr style='mso-yfti-irow:3;height:84.7pt'>
  <td width=91 style='width:68.4pt;border:solid windowtext 1.0pt;border-top:
  none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:84.7pt'>
  <p class=MsoNormal align=center style='text-align:center;tab-stops:61.5pt'><span
  style='font-size:12.0pt;font-family:仿宋_GB2312'><%=StringUtil.parseNull(beanMap.get("FORM_ITEM_TITLE"),"")%><span lang=EN-US><o:p></o:p></span></span></p>
   <input type="hidden" name="nodeName" value="<%=StringUtil.parseNull(beanMap.get("FORM_ITEM_NAME"),"")%>"/>
   <input type="hidden" name="nodeId" value="<%=StringUtil.parseNull(beanMap.get("FORM_ITEM_ID"),"")%>"/>
  </td>
  <td width=528 colspan=5 valign=top style='width:396.0pt;border-top:none;
  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:84.7pt'>
  <p class=MsoNormal align=center style='text-align:left;tab-stops:61.5pt'><span
  lang=EN-US style='font-size:12.0pt;font-family:仿宋_GB2312'><o:p><%=StringUtil.parseNull(beanMap.get("SPYJ"),"")%>
  </o:p></span></p>
  <p class=MsoNormal align=center style='text-align:center;tab-stops:61.5pt'><span
  lang=EN-US style='font-size:12.0pt;font-family:仿宋_GB2312'><o:p>&nbsp;</o:p></span></p>
  <p class=MsoNormal align=center style='text-align:center;tab-stops:61.5pt'><span
  lang=EN-US style='font-size:12.0pt;font-family:仿宋_GB2312'><o:p>&nbsp;</o:p></span></p>
  <p class=MsoNormal align=center style='text-align:center;tab-stops:61.5pt'><span
  lang=EN-US style='font-size:12.0pt;font-family:仿宋_GB2312'><o:p>&nbsp;</o:p></span></p>
  <p class=MsoNormal style='tab-stops:61.5pt'><span lang=EN-US
  style='font-size:12.0pt;font-family:仿宋_GB2312'><o:p>&nbsp;</o:p></span></p>
  <p class=MsoNormal style='text-indent:60.0pt;mso-char-indent-count:5.0;
  tab-stops:61.5pt'><table style='font-size:12.0pt;font-family:仿宋_GB2312' align="right"><tr><td>批准人：</td><td id="shr<%=id%>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=StringUtil.parseNull(beanMap.get("LRSJ"),DateUtil.format(new java.util.Date()))%></td></tr></table>
  </td>
 </tr>
 <%} %>
 <tr style='mso-yfti-irow:6;height:77.75pt'>
  <td width=91 style='width:68.4pt;border:solid windowtext 1.0pt;border-top:
  none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:77.75pt'>
  <p class=MsoNormal align=center style='text-align:center;tab-stops:61.5pt'><span
  style='font-size:12.0pt;font-family:仿宋_GB2312'>销假<span lang=EN-US><o:p></o:p></span></span></p>
  <p class=MsoNormal align=center style='text-align:center;tab-stops:61.5pt'><span
  style='font-size:12.0pt;font-family:仿宋_GB2312'>登记<span lang=EN-US><o:p></o:p></span></span></p>
  </td>
  <td width=528 colspan=5 valign=top style='width:396.0pt;border-top:none;
  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:77.75pt'>
  <p class=MsoNormal><span lang=EN-US style='font-size:12.0pt;font-family:仿宋_GB2312'><o:p>&nbsp;<%if("1".equals(StringUtil.parseNull(holiday.getXjdj(),""))){%>已销假！<%}%></o:p></span></p>
  <p class=MsoNormal><span lang=EN-US style='font-size:12.0pt;font-family:仿宋_GB2312'><o:p>&nbsp;</o:p></span></p>
  <p class=MsoNormal><span lang=EN-US style='font-size:12.0pt;font-family:仿宋_GB2312'><o:p>&nbsp;</o:p></span></p>
  <p class=MsoNormal><span lang=EN-US style='font-size:12.0pt;font-family:仿宋_GB2312;' align="right"><o:p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=DateUtil.format(holiday.getXjsj(),"yyyy-MM-dd")%></o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:7;mso-yfti-lastrow:yes;height:29.7pt'>
  <td width=91 style='width:68.4pt;border:solid windowtext 1.0pt;border-top:
  none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:29.7pt'>
  <p class=MsoNormal align=center style='text-align:center;tab-stops:61.5pt'><span
  style='font-size:12.0pt;font-family:仿宋_GB2312'>备注<span lang=EN-US><o:p></o:p></span></span></p>
  </td>
  <td width=528 colspan=5 valign=top style='width:396.0pt;border-top:none;
  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:29.7pt'>
  <p class=MsoNormal style='tab-stops:147.0pt'><span lang=EN-US
  style='font-size:12.0pt;font-family:仿宋_GB2312'><o:p>&nbsp;<%=StringUtil.parseNull(holiday.getBz(),"")%></o:p></span></p>
  <p class=MsoNormal style='tab-stops:147.0pt'><span lang=EN-US
  style='font-size:12.0pt;font-family:仿宋_GB2312'><o:p>&nbsp;</o:p></span></p>
  <p class=MsoNormal style='tab-stops:147.0pt'><span lang=EN-US
  style='font-size:12.0pt;font-family:仿宋_GB2312'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr class=MsoNormal>
 <td colspan="6" style='font-size:12.0pt;font-family:仿宋_GB2312'>说明：１、本表按照公司一般干部请销假制度填写、报批；</td>
 </tr>
  <tr class=MsoNormal>
 <td colspan="6" style='font-size:12.0pt;font-family:仿宋_GB2312'>２、本表一式二份，经部门领导和分管领导审批后，一份交公司人力资源（组织）办公室备案，一份作为差旅费报销凭证交由财务部门保存。</td>
 </tr>
 <![if !supportMisalignedColumns]>
 <tr height=0>
  <td width=91 style='border:none'></td>
  <td width=108 style='border:none'></td>
  <td width=144 style='border:none'></td>
  <td width=36 style='border:none'></td>
  <td width=96 style='border:none'></td>
  <td width=144 style='border:none'></td>
 </tr>
 <![endif]>
</table>
</div>
</form>
<!-- ---------装载控件---------------->
	 <script type="text/javascript" src="<%=request.getContextPath()%>/js/Loadwebsign.js"></script>
	 <script type="text/javascript">
	 document.all.DWebSignSeal.SetCurrUser("");
	 </script>
	<!-- ---------结束装载---------------->
</body>

</html>

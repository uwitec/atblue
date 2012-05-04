<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ include file="../../../import.jsp"%>
<%
    CUser cUser = (CUser)session.getAttribute("cUser");
    cUser = cUser == null?new CUser():cUser;
        String sqid = StringUtil.parseNull(request.getParameter("sqid"),"");
    Map map = new HashMap();
    map.put("sqid",sqid);
  	OfficeYysq yysq = officeYysqDAO.queryForBean(map);
    yysq = yysq == null?new OfficeYysq():yysq;
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
    Map paramMap = new HashMap();
    paramMap.put("orgnaId",yysq.getYybm());
    COrgnization cOrgnization = orgnizationDAO.queryForBean(paramMap);
%>
 <html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 12">
<link rel=File-List href="用印审批单.files/filelist.xml">
<style id="用印审批单_6142_Styles">
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
.font56142
	{color:windowtext;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.xl156142
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl636142
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl646142
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl656142
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:center;
	vertical-align:justify;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl666142
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:center;
	vertical-align:justify;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl676142
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:center;
	vertical-align:justify;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl686142
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:center;
	vertical-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl696142
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:center;
	vertical-align:justify;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl706142
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:center;
	vertical-align:justify;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl716142
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:center;
	vertical-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl726142
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:center;
	vertical-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl736142
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:center;
	vertical-align:justify;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl746142
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:windowtext;
	font-size:16.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl756142
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
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
    var sealURL='<%="http://127.0.0.1:"+request.getLocalPort()+request.getContextPath()+"/servlet/sealDown?userId="+cUser.getUserId()%>';
    document.all.DWebSignSeal.AddSeal(sealURL, "");
}
	</script>
</head>

<body onload="LoadSignData()">
<!--[if !excel]>　　<![endif]-->
<!--下列信息由 Microsoft Office Excel 的“发布为网页”向导生成。-->
<!--如果同一条目从 Excel 中重新发布，则所有位于 DIV 标记之间的信息均将被替换。-->
<!----------------------------->
<!--“从 EXCEL 发布网页”向导开始-->
<!----------------------------->

<div id="用印审批单_6142" align=center x:publishsource="Excel">
<table align="center">
	<tr>
	<td>
		<input name="button" type="button" class="button" value="打印" onClick="window.print()"/>
	      <input name="submit" type="submit" class="button" value="关闭" onClick="window.close();">
		  <!-- SignData隐藏域，用于将所有加密的数据提交到表单保存页面 -->
		  <input type="hidden" id="signdata" name="signdata"/>
	</td>
	</tr>
</table>
<table border=0 cellpadding=0 cellspacing=0 width=648 style='border-collapse:
 collapse;table-layout:fixed;width:486pt'>
 <col width=72 span=9 style='width:54pt'>
 <tr height=27 style='height:20.25pt'>
  <td colspan=9 height=27 class=xl746142 width=648 style='height:20.25pt;
  width:486pt'>用 印 审 批 单</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl646142 style='height:14.25pt'>记录表式</td>
  <td class=xl156142></td>
  <td class=xl156142></td>
  <td class=xl156142></td>
  <td class=xl156142></td>
  <td class=xl156142></td>
  <td class=xl156142></td>
  <td class=xl156142></td>
  <td class=xl156142></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td colspan=9 height=19 class=xl756142 style='height:14.25pt'>编号:钻井三公司党政办-17</td>
 </tr>
 <tr height=37 style='mso-height-source:userset;height:27.75pt'>
  <td rowspan=2 height=74 class=xl636142 style='height:55.5pt;border-top:none'>用印单位</td>
  <td colspan=4 rowspan=2 class=xl636142><%=cOrgnization.getOrgnaName()%></td>
  <td class=xl636142 style='border-top:none;border-left:none'>时间</td>
  <td colspan=3 class=xl636142 style='border-left:none'><%=DateUtil.format(yysq.getSqsj(),"yyyy-MM-dd")%></td>
 </tr>
 <tr height=37 style='mso-height-source:userset;height:27.75pt'>
  <td height=37 class=xl636142 style='height:27.75pt;border-top:none;
  border-left:none'>份数</td>
  <td colspan=3 class=xl636142 style='border-left:none'><%=yysq.getFs() == null?0:yysq.getFs().intValue() %></td>
 </tr>
 <tr height=38 style='mso-height-source:userset;height:28.5pt'>
  <td height=38 class=xl636142 style='height:28.5pt;border-top:none'>用印人</td>
  <td colspan=4 class=xl636142 style='border-left:none'><%=dao.findUserById(yysq.getYyr()).getRealName()%></td>
  <td class=xl636142 style='border-top:none;border-left:none'>经办人</td>
  <td colspan=3 class=xl636142 style='border-left:none'><%=dao.findUserById(yysq.getYyr()).getRealName()%></td>
 </tr>
 <tr height=57 style='mso-height-source:userset;height:42.75pt'>
  <td height=57 class=xl636142 style='height:42.75pt;border-top:none'>名称</td>
  <td colspan=8 class=xl636142 style='border-left:none'><%=yysq.getYymc()%></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td colspan=9 height=19 class=xl656142 style='border-right:.5pt solid black;
  height:14.25pt'>用 印 事 由</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td colspan=9 rowspan=8 height=341 class=xl686142 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;height:255.75pt;text-align:left;vertical-align:top;'><%=StringUtil.parseNull(yysq.getYysy(),"")%></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
 </tr>
 <tr height=19 style='height:14.25pt'>
 </tr>
 <tr height=19 style='height:14.25pt'>
 </tr>
 <tr height=19 style='height:14.25pt'>
 </tr>
 <tr height=19 style='height:14.25pt'>
 </tr>
 <tr height=19 style='height:14.25pt'>
 </tr>
 <tr height=208 style='mso-height-source:userset;height:156.0pt'>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td colspan=9 height=19 class=xl656142 style='border-right:.5pt solid black;
  height:14.25pt'>领导批示</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td colspan=8 rowspan=7 height=210 class=xl686142 style='border-right:none;
  border-bottom:.5pt solid black;height:157.5pt;text-align:left;vertical-align:top;'>
  <%
    for(int i=0;i<dataList.size();i++){ 
  Map beanMap = (Map)dataList.get(0);
   out.println(StringUtil.parseNull(beanMap.get("SPYJ"),""));
   %>
  <%} %>
  </td>
   <td colspan=1 rowspan=7 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;height:157.5pt;vertical-align:bottom;'>
	 	<table style='vertical-align:bottom;'>
	  <tr>
	  <td id="shr684a191b-be64-46fd-a6be-b30763ef6e53"></td>
	  </tr>
	  </table>
	 </td>
 </tr>
 <tr height=19 style='height:14.25pt;text-align:left'>
 </tr>
 <tr height=19 style='height:14.25pt'>
 </tr>
 <tr height=19 style='height:14.25pt'>
 </tr>
 <tr height=19 style='height:14.25pt'>
 </tr>
 <tr height=19 style='height:14.25pt'>
 </tr>
 <tr height=96 style='mso-height-source:userset;height:72.0pt'>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td rowspan=3 height=57 class=xl636142 style='height:42.75pt;border-top:none'>备注</td>
  <td colspan=8 rowspan=3 class=xl636142 style="text-align:left"><%=StringUtil.parseNull(yysq.getBz(),"")%></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
 </tr>
 <tr height=19 style='height:14.25pt'>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=72 style='width:54pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=72 style='width:54pt'></td>
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
</body>

</html>

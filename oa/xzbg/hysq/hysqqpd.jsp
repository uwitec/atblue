<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.net.InetAddress" %>
<%@ include file="../../../import.jsp"%>
<%
    CUser cUser = (CUser)session.getAttribute("cUser");
    cUser = cUser == null?new CUser():cUser;
        String sqid = StringUtil.parseNull(request.getParameter("sqid"),"");
    Map map = new HashMap();
    map.put("sqid",sqid);
    OfficeHysq hysq = officeHysqDAO.queryForBean(map);
    hysq = hysq == null?new OfficeHysq():hysq;
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
    paramMap.put("orgnaId",hysq.getSqbm());
     String[] checkman =oDao.getCjhyryBySqid(sqid);
    COrgnization cOrgnization = orgnizationDAO.queryForBean(paramMap);
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
    var sealURL='<%="http://10.66.117.234:"+request.getLocalPort()+request.getContextPath()+"/servlet/sealDown?userId="+cUser.getUserId()%>';
    document.all.DWebSignSeal.AddSeal(sealURL, "");
}
	</script>
<style id="会议申请单_14414_Styles">
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
.font514414
	{color:windowtext;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font614414
	{color:black;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font714414
	{color:black;
	font-size:9.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.xl1514414
	{padding:0px;
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
.xl6314414
	{padding:0px;
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
.xl6414414
	{padding:0px;
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
.xl6514414
	{padding:0px;
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
	white-space:normal;}
.xl6614414
	{padding:0px;
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
</head>

<body onload="LoadSignData()" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!-- MeadCo ScriptX -->
<object id="factory" viewastext style="display:none"
        classid="clsid:1663ed61-23eb-11d2-b92f-008048fdd814" codebase="<%="http://10.66.117.234:"+request.getLocalPort()+request.getContextPath()%>/soft/smsx.cab#Version=7,0,0,8">
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
<!--下列信息由 Microsoft Office Excel 的“发布为网页”向导生成。-->
<!--如果同一条目从 Excel 中重新发布，则所有位于 DIV 标记之间的信息均将被替换。-->
<!----------------------------->
<!--“从 EXCEL 发布网页”向导开始-->
<!----------------------------->

<div id="会议申请单_14414" align=center x:publishsource="Excel">
<table align="center">
	<tr>
	<td class="Noprint">
		<input name="button" type="button" class="button" value="打印预览" onClick="factory.printing.Preview(); "/>
	    <input name="submit" type="submit" class="button" value="关闭" onClick="window.close();">
		  <!-- SignData隐藏域，用于将所有加密的数据提交到表单保存页面 -->
		  <input type="hidden" id="signdata" name="signdata"/>
	</td>
	</tr>
</table>
<table border=0 cellpadding=0 cellspacing=0 width=644 style='border-collapse:
 collapse;table-layout:fixed;width:484pt'>
 <col width=72 style='width:54pt'>
 <col width=54 style='mso-width-source:userset;mso-width-alt:1728;width:41pt'>
 <col width=72 style='width:54pt'>
 <col width=104 style='mso-width-source:userset;mso-width-alt:3328;width:78pt'>
 <col width=72 style='width:54pt'>
 <col width=54 style='mso-width-source:userset;mso-width-alt:1728;width:41pt'>
 <col width=72 span=3 style='width:54pt'>
 <tr height=60 style='mso-height-source:userset;height:45.0pt'>
  <td colspan=9 height=60 class=xl6414414 width=644 style='height:45.0pt;
  width:484pt'>黄河钻井三公司会议申请单</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl6314414 style='height:14.25pt'>记录表式</td>
  <td class=xl6314414></td>
  <td class=xl6314414></td>
  <td class=xl1514414></td>
  <td class=xl1514414></td>
  <td class=xl1514414></td>
  <td class=xl1514414></td>
  <td class=xl1514414></td>
  <td class=xl1514414></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl6314414 colspan=3 style='height:14.25pt'>编号：钻井三公司党政办-19</td>
  <td class=xl1514414></td>
  <td class=xl1514414></td>
  <td class=xl1514414></td>
  <td class=xl1514414></td>
  <td class=xl1514414></td>
  <td class=xl1514414></td>
 </tr>
 <tr height=100 style='mso-height-source:userset;height:75.0pt'>
  <td colspan=2 height=100 class=xl6514414 width=126 style='height:75.0pt;
  width:95pt'><%=DateUtil.format(hysq.getSqsj(),"yyyy年MM月dd日")%><br>会议名称</td>
  <td colspan=7 class=xl6614414 style='border-left:none;text-align:left;'><%=hysq.getHymc()%></td>
 </tr>
 <tr height=100 style='mso-height-source:userset;height:75.0pt'>
  <td colspan=2 height=100 class=xl6614414 style='height:75.0pt'>申请部门</td>
  <td colspan=2 class=xl6614414 style='border-left:none'><%=StringUtil.parseNull(cOrgnization.getOrgnaName(),"")%></td>
  <td colspan=2 class=xl6514414 width=126 style='border-left:none;width:95pt'>申请召开<span
  style='mso-spacerun:yes'><br></span>时间期限</td>
  <td colspan=3 class=xl6614414 style='border-left:none;text-align:left'>
      <%
          if(hysq.getSqkssj() != null){ %>
      <%=DateUtil.format(hysq.getSqkssj(),"yyyy-MM-dd HH:mm")%>
      <% }%>
      - <br>
      <%if(hysq.getSqjssj() != null){ %>
      <%=DateUtil.format(hysq.getSqjssj(), "yyyy-MM-dd HH:mm")%>
      <% }%></td>
 </tr>
 <tr height=200 style='mso-height-source:userset;height:150.0pt'>
  <td colspan=2 height=200 class=xl6514414 width=126 style='height:150.0pt;
  width:95pt'>会议内容及目的</td>
  <td colspan=7 class=xl6614414 style='border-left:none;text-align:left'>
      <p><font style="font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;
      <%=StringUtil.parseNull(hysq.getHynr(),"")%></font></p></td>
 </tr>
 <tr height=100 style='mso-height-source:userset;height:75.0pt'>
  <td colspan=2 height=100 class=xl6514414 width=126 style='height:75.0pt;
  width:95pt'>参加会议人员及<span style='mso-spacerun:yes'>&nbsp; </span>人数</td>
  <td colspan=7 class=xl6614414 style='border-left:none;text-align:left'>
  <%
  StringBuffer sb = new StringBuffer();
  for(int i=0;i<checkman.length;i++){
      if(i > 0){
          sb.append(",");
      }
  	sb.append(dao.findUserById(checkman[i]).getRealName());
  } %>
  <%out.println(sb.toString());%><br>
  参加人数为<%=checkman.length%>
  </td>
 </tr>
 <tr height=100 style='mso-height-source:userset;height:75.0pt'>
  <td colspan=2 height=100 class=xl6514414 width=126 style='height:75.0pt;
  width:95pt'>分管领导审核<span style='mso-spacerun:yes'>&nbsp; </span>意见</td>
  <td colspan=2 class=xl6614414 style='border-left:none;text-align:left'>
	  <table>
	  <tr>
	  <td id="shr034ddf84-e174-480e-b52d-c3e2542b4203"></td>
	  </tr>
	  </table>
  </td>
  <td colspan=2 class=xl6514414 width=126 style='border-left:none;width:95pt'>主要领导审核<span
  style='mso-spacerun:yes'>&nbsp; </span>意见</td>
  <td colspan=3 class=xl6614414 style='border-left:none;text-align:left'>
	  	 <table>
		  <tr style='border-left:none;text-align:right'>
		  <td id="shr2cef866c-e5aa-4e3c-92bc-451d0e211762"></td>
		  </tr>
		 </table>
  </td>
 </tr>
 <tr height=100 style='mso-height-source:userset;height:75.0pt'>
  <td colspan=2 height=100 class=xl6614414 style='height:75.0pt'>办公室安排意见</td>
  <td colspan=7 class=xl6614414 style='border-left:none;text-align:left'>
      <p><font style="font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;
      <%=StringUtil.parseNull(hysq.getDzyj(),"")%>
      </font></p>
  </td>
 </tr>
 <tr height=80 style='mso-height-source:userset;height:60.0pt'>
  <td colspan=2 height=80 class=xl6614414 style='height:60.0pt'>备注</td>
  <td colspan=7 class=xl6614414 style='border-left:none;text-align:left'>
      <p><font style="font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;
      <%=StringUtil.parseNull(hysq.getBz(),"")%></font></p></td>
 </tr>
 <tr height=60 style='mso-height-source:userset;height:45.0pt'>
  <td height=60 class=xl1514414 style='height:45.0pt'></td>
  <td class=xl1514414></td>
  <td class=xl1514414></td>
  <td class=xl1514414></td>
  <td class=xl1514414></td>
  <td class=xl1514414></td>
  <td class=xl1514414></td>
  <td class=xl1514414></td>
  <td class=xl1514414></td>
 </tr>
 <tr height=60 style='mso-height-source:userset;height:45.0pt'>
  <td height=60 class=xl1514414 style='height:45.0pt'></td>
  <td class=xl1514414></td>
  <td class=xl1514414></td>
  <td class=xl1514414></td>
  <td class=xl1514414></td>
  <td class=xl1514414></td>
  <td class=xl1514414></td>
  <td class=xl1514414></td>
  <td class=xl1514414></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=72 style='width:54pt'></td>
  <td width=54 style='width:41pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=104 style='width:78pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=54 style='width:41pt'></td>
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
<!-- ---------装载控件---------------->
	 <script type="text/javascript" src="<%=request.getContextPath()%>/js/Loadwebsign.js"></script>
	 <script type="text/javascript">
	 document.all.DWebSignSeal.SetCurrUser("");
	 </script>
	<!-- ---------结束装载---------------->
</body>

</html>

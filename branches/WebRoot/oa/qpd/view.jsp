<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.Date"%>
<%@ page import="java.net.InetAddress" %>
<%@ include file="../../import.jsp" %>
<%
    CUser cUser = (CUser)session.getAttribute("cUser");
    cUser = cUser == null?new CUser():cUser;
    String formId  = StringUtil.parseNull(request.getParameter("formId"),"");
    String connectId  = StringUtil.parseNull(request.getParameter("connectId"),"");
    String processId  = StringUtil.parseNull(request.getParameter("processId"),"");
    Map map = new HashMap();
    map.put("formId", formId);
    OfficeQpdForm bean = officeQpdFormDAO.queryForBean(map);
    List dataList = oDao.getAllQpdFormItemsByFormId2(formId,processId);
    bean = bean == null?new OfficeQpdForm():bean;
    dataList = dataList == null?new ArrayList():dataList;
    String formItemId = oDao.getFormItemIdByConnectId(connectId,formId);
    String signdata =   oDao.getSignDataByProcessId(processId);
    signdata = StringUtil.parseNull(signdata,"");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<link href="style.css" rel="stylesheet" type="text/css">
      <link href="<%=request.getContextPath()%>/images/css.css" rel="stylesheet"
            type="text/css">
	<style type="text/css">
	<!--
	.STYLE5 {font-size: 24px}
	.STYLE6 {font-weight: bold}
	.STYLE7 {font-size: 36px}
	.STYLE9 {font-size: 18px; font-weight: bold; }
	.STYLE1 {font-size: 24px}
	.STYLE2 {color: #000000;font-size: 18px}
	.STYLE51 {font-size: 18px}
	.style52 {font-size: 12px}
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
	document.all.DWebSignSeal.SetPosition(-10,-20,shr);
    var sealURL='<%="http://"+sysConfig.getProperty("sealServer")+":"+request.getLocalPort()+"/"+request.getContextPath()+"servlet/sealDown?userId="+cUser.getUserId()%>';
    document.all.DWebSignSeal.AddSeal(sealURL, "");
}
function sumbitForm() {
    try{
	  // 判断当前是否盖章
	  if(qz==0||document.all.DWebSignSeal.FindSeal("",0) == "") {
		alert("还没有盖章或者签字");
		return false;
	  }
	  // 获取全部数据，包括印章数据，证书信息，和加密的表单数据，并赋值给表单隐藏域
	  form1.signdata.value = DWebSignSeal.GetStoreData();
	}catch(e){
        alert("请安装签章工具后再处理");
        return false;
    }
    document.form1.submit();
	return true;
}
	</script>
  </head>
  <body onload="LoadSignData()">
  	<form name="form1" method="post" action="">
	<input type="hidden" name="processId" value="<%=processId%>">
	<input type="hidden" name="connectId" value="<%=connectId%>">
	<input type="hidden" name="formId" value="<%=formId%>">
  	<table width="580" border="0" align="center" cellspacing="1">
	  <tr>
	    <td >
	      <input name="submit" type="submit" class="button" value="关闭" onClick="window.close();">
		  <!-- SignData隐藏域，用于将所有加密的数据提交到表单保存页面 -->
		  <input type="hidden" id="signdata" name="signdata"/>
		  <table border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#ECE9D8" bgcolor="#FFFFFF">
		  <tr><td>
		  		<table width="580"  border="0" align="center" cellpadding="0" cellspacing="0">
		<!-- ------------------------------------------------------------------------------------------------------------- -->
				 <%
				    String space = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
				    "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
				 %>
				 <tr>
				    <td align="left"><div align="center" class="style1 STYLE1">
				        <div align="left" class="STYLE2">
				          <p align="center" class="STYLE1">&nbsp;&nbsp;<%=StringUtil.parseNull(bean.getFormTitle(),"")%></p>
				          </div>
				    </div></td>
				  </tr>
                  <%
                    for(int i=0;i<dataList.size();i++){
                        Map beanMap = (Map)dataList.get(i);    
                        String id = StringUtil.parseNull(beanMap.get("FORM_ITEM_ID"),"");
                  %>
                      <tr>
                          <td >
                              <table width="100%" height="172" border="0" align="center" cellspacing="1">
                                  <tr>
                                      <td height="98" colspan="4">
                                          <span class="STYLE9"><%=StringUtil.parseNull(beanMap.get("FORM_ITEM_TITLE"),"")%>：</span><br>
                                          <input type="hidden" name="nodeName" value="<%=StringUtil.parseNull(beanMap.get("FORM_ITEM_NAME"),"")%>"/>
                                          <input type="hidden" name="nodeId" value="<%=StringUtil.parseNull(beanMap.get("FORM_ITEM_ID"),"")%>"/>
                                          <span style="height:79%;width:100%;font-size:28px;border-top:solid windowtext 1.0pt;border-left:solid windowtext 1.0pt;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;"><%=StringUtil.parseNull(beanMap.get("SPYJ"),"")%></span>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td width="128" height="70" class="head_left"><span class="STYLE9">签字：</span> </td>
                                      <td width="159" height="70" id="shr<%=id%>" class="head_right">&nbsp;</td>
                                      <td width="80" height="70" class="head_left"><span class="STYLE9">日期：</span> </td>
                                      <td width="200" height="70" class="head_right"><span class="STYLE51">
                          &nbsp;  <%=StringUtil.parseNull(beanMap.get("SJ"),DateUtil.format(new java.util.Date()))%>
						  </span> </td>
                                  </tr>
                              </table></td>
                      </tr>
                      <%  }
                  %>
		<!-- ------------------------------------------------------------------------------------------------------------- -->
				</table>
		  </td></tr>
		  </table>
	    </td>
	  </tr>
	</table>
  	</form>
  	<!-- ---------装载控件---------------->
	 <script type="text/javascript" src="<%=request.getContextPath()%>/js/Loadwebsign.js"></script>
	 <script type="text/javascript">
	 document.all.DWebSignSeal.SetCurrUser("");
	 </script>
	<!-- ---------结束装载---------------->
  </body>
</html>

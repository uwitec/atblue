<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.Date"%>
<%@ include file="../../../import.jsp" %>
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
    String formItemId = oDao.getFormItemIdByConnectId(connectId);
    String signdata =   oDao.getSignDataByProcessId(processId);
    signdata = StringUtil.parseNull(signdata,"");
    String[] nodeName  = request.getParameterValues("nodeName");
    String[] nodeId  = request.getParameterValues("nodeId");
    String[] spyj  = request.getParameterValues("spyj");
    if (request.getMethod().equals("POST")) {
          if(nodeId != null && nodeId.length > 0){
              signdata  = StringUtil.parseNull(request.getParameter("signdata"),"");
              map.put("processid", processId);
              OfficeQpd officeQpd = officeQpdDAO.queryForBean(map);
              if(officeQpd == null){
                  officeQpd = new  OfficeQpd();
                  officeQpd.setProcessid(processId);
                  officeQpd.setFormId(formId);
                  officeQpd.setSigndata(signdata);
                  officeQpd.setLrr(cUser.getUserId());
                  officeQpd.setLrsj(new java.util.Date());
                  officeQpdDAO.addOfficeQpd(officeQpd);
              }else{
                  officeQpd.setSigndata(signdata);
                  officeQpd.setFormId(formId);
                  officeQpd.setLrr(cUser.getUserId());
                  officeQpd.setLrsj(new java.util.Date());
                  officeQpdDAO.modOfficeQpd(officeQpd);
              }
              oDao.deleteAllQpdYjsByProcessId(processId);
              OfficeQpdyj officeQpdyj = null;
              for(int i=0; i<nodeId.length;i++){
                  officeQpdyj = new  OfficeQpdyj();
                  officeQpdyj.setProcessid(processId);
                  officeQpdyj.setFormItemId(nodeId[i]);
                  officeQpdyj.setSpyj(spyj[i]);
                  officeQpdyj.setLrr(cUser.getUserId());
                  officeQpdyj.setLrsj(new java.util.Date());
                  officeQpdyjDAO.addOfficeQpdyj(officeQpdyj);
              }
          }
%>
<script type="text/javascript">
    window.close();
</script>
<%   }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<link href="style.css" rel="stylesheet" type="text/css">
      <link href="<%=request.getContextPath()%>/css/xzbg-css.css" rel="stylesheet"
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
	document.all.DWebSignSeal.SetPosition(-140,-35,shr);
    var sealURL='<%="http://127.0.0.1:"+request.getLocalPort()+"/"+request.getContextPath()+"servlet/sealDown?userId="+cUser.getUserId()%>';
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
	<input type="hidden" name="yj" value="">
  	<table width="580" border="0" align="center" cellspacing="1">
	  <tr>
	    <td >
	      <input name="button" type="button" class="button" value="盖章" onClick="addSealB()"/>
	      <input name="submit" type="submit" class="button" value="保存并关闭" onClick="return sumbitForm()">
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
                                          <textarea  name="spyj"
                                                     <%if(!id.equals(formItemId)){%>
                                                           readonly="readonly"
                                                  <%}%>
                                                     cols="80" rows="6" class="TAcss"  width="100%"><%=StringUtil.parseNull(beanMap.get("SPYJ"),"")%></textarea>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td width="128" height="70"><span class="STYLE9">签字：</span> </td>
                                      <td width="159" height="70" id="shr<%=id%>"></td>
                                      <td width="80" height="70"><span class="STYLE9">日期：</span> </td>
                                      <td width="200" height="70"><span class="STYLE51">
                          &nbsp;  <%=StringUtil.parseNull(beanMap.get("LRSJ"),DateUtil.format(new java.util.Date()))%>
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
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
    String connectId = StringUtil.parseNull(bean.getConnectId(),"");
    String processId = StringUtil.parseNull(bean.getProcessId(),"");
    String signdata =   oDao.getSignDataByProcessId(processId);
    if("save".equals(flag) && request.getMethod().equals("POST")){
        map.put("connectId", connectId);
        String JSDW = request.getParameter("JSDW"); if(JSDW != null)bean.setJsdw(JSDW);
        String FDQ = request.getParameter("FDQ"); if(FDQ != null)bean.setFdq(FDQ);
        String JB = request.getParameter("JB"); if(JB != null)bean.setJb(JB);
        String JS = request.getParameter("JS"); if(JS != null)bean.setJs(JS);
        String JJ = request.getParameter("JJ"); if(JJ != null)bean.setJj(JJ);
        String DEZQ = request.getParameter("DEZQ");  if(DEZQ != null)bean.setDezq(DEZQ);
        String NJMD = request.getParameter("NJMD"); if(NJMD != null)bean.setNjmd(NJMD);
        String JTXS = request.getParameter("JTXS");  if(JTXS != null)bean.setJsdw(JTXS);
        String QX = request.getParameter("QX");       if(QX != null)bean.setQx(QX);
        String DEZJY = request.getParameter("DEZJY");   if(DEZJY != null)bean.setDezjy(DEZJY);
        String JSMS = request.getParameter("JSMS");   if(JSMS != null)bean.setJsms(JSMS);
        String JXJ = request.getParameter("JXJ");      if(JXJ != null)bean.setJxj(JXJ);
        String YYFWX = request.getParameter("YYFWX"); if(YYFWX != null)bean.setYyfwx(YYFWX);
        String BZ = request.getParameter("BZ");            if(BZ != null)bean.setBz(BZ);
        String BQSJ = request.getParameter("BQSJ");   if(BQSJ != null)bean.setBqsj(BQSJ);
        String SJJJZQ = request.getParameter("SJJJZQ");   if(SJJJZQ != null)bean.setSjjjzq(SJJJZQ);
        String SJZJY = request.getParameter("SJZJY");   if(SJZJY != null)bean.setSjzjy(SJZJY);
        String AZFY = request.getParameter("AZFY");   if(AZFY != null)bean.setAzfy(AZFY);
        String KZSJ = request.getParameter("KZSJ");    if(KZSJ != null)bean.setKzsj(KZSJ);
        String SJZJZQ = request.getParameter("SJZJZQ");  if(SJZJZQ != null)bean.setSjzjzq(SJZJZQ);
        String SJJS = request.getParameter("SJJS");    if(SJJS != null)bean.setSjjs(SJJS);
        String ZTF = request.getParameter("ZTF");   if(ZTF != null)bean.setZtf(ZTF);
        String WJSJ = request.getParameter("WJSJ");  if(WJSJ != null)bean.setWjsj(WJSJ);
        String SFZT = request.getParameter("SFZT");  if(SFZT != null)bean.setSfzt(SFZT);
        String BQF = request.getParameter("BQF");     if(BQF != null)bean.setBqf(BQF);
        String RCYF = request.getParameter("RCYF");  if(RCYF != null)bean.setRcyf(RCYF);
        String BZSC = request.getParameter("BZSC"); if(BZSC != null)bean.setBzsc(BZSC);
        String ZQLW = request.getParameter("ZQLW");  if(ZQLW != null)bean.setZqlw(ZQLW);
        String TG = request.getParameter("TG");           if(TG != null)bean.setTg(TG);
        String ZQZLF = request.getParameter("ZQZLF");  if(ZQZLF != null)bean.setZqzlf(ZQZLF);
        String SFCL = request.getParameter("SFCL");   if(SFCL != null)bean.setSfcl(SFCL);
        String GJLW = request.getParameter("GJLW");  if(GJLW != null)bean.setGjlw(GJLW);
        String TGFJ = request.getParameter("TGFJ");    if(TGFJ != null)bean.setTgfj(TGFJ);
        String GXFZQ = request.getParameter("GXFZQ");   if(GXFZQ != null)bean.setGxfzq(GXFZQ);
        String SFLW = request.getParameter("SFLW");      if(SFLW != null)bean.setSflw(SFLW);
        String GJLW2 = request.getParameter("GJLW2");  if(GJLW2 != null)bean.setGjlw2(GJLW2);
        String TJJ = request.getParameter("TJJ");              if(TJJ != null)bean.setTjj(TJJ);
        String JKGKTX = request.getParameter("JKGKTX");   if(JKGKTX != null)bean.setJkgktx(JKGKTX);
        String JKPJ = request.getParameter("JKPJ");        if(JKPJ != null)bean.setJkpj(JKPJ);
        String GJSN = request.getParameter("GJSN");      if(GJSN != null)bean.setGjsn(GJSN);
        String KLY = request.getParameter("KLY");             if(KLY != null)bean.setKly(KLY);
        String JSFWF = request.getParameter("JSFWF");      if(JSFWF != null)bean.setJsfwf(JSFWF);
        String WWLW = request.getParameter("WWLW");    if(WWLW != null)bean.setWwlw(WWLW);
        String ZLKK = request.getParameter("ZLKK");        if(ZLKK != null)bean.setZlkk(ZLKK);
        String FZCKZ = request.getParameter("FZCKZ");    if(FZCKZ != null)bean.setFzckz(FZCKZ);
        String CY = request.getParameter("CY");               if(CY != null)bean.setCy(CY);
        String CYYF = request.getParameter("CYYF");       if(CYYF != null)bean.setCyyf(CYYF);
        String CYLWF = request.getParameter("CYLWF");  if(CYLWF != null)bean.setCylwf(CYLWF);
        String WDF = request.getParameter("WDF");          if(WDF != null)bean.setWdf(WDF);
        String YY = request.getParameter("YY");                if(YY != null)bean.setYy(YY);
        String QTNYB = request.getParameter("QTNYB");  if(QTNYB != null)bean.setQtnyb(QTNYB);
        String SJJSJS = request.getParameter("SJJSJS");    if(SJJSJS != null)bean.setSjjsjs(SJJSJS);
        String QXJC = request.getParameter("QXJC");      if(QXJC != null)bean.setQxjc(QXJC);
        String TXFZQ = request.getParameter("TXFZQ");   if(TXFZQ != null)bean.setTxfzq(TXFZQ);
        String YXFGJC = request.getParameter("YXFGJC");  if(YXFGJC != null)bean.setYxfgjc(YXFGJC);
        String SGXS = request.getParameter("SGXS");        if(SGXS != null)bean.setSgxs(SGXS);
        String NJFWF = request.getParameter("NJFWF");   if(NJFWF != null)bean.setNjfwf(NJFWF);
        String DXFWF = request.getParameter("DXFWF");  if(DXFWF != null)bean.setDxfwf(DXFWF);
        String SBXLF = request.getParameter("SBXLF");      if(SBXLF != null)bean.setSbxlf(SBXLF);
        String SJLWF = request.getParameter("SJLWF");     if(SJLWF != null)bean.setSjlwf(SJLWF);
        String QTJDK = request.getParameter("QTJDK");     if(QTJDK != null)bean.setQtjdk(QTJDK);
        String AQSSF = request.getParameter("AQSSF");       if(AQSSF != null)bean.setAqssf(AQSSF);
        String SJLWFAQK = request.getParameter("SJLWFAQK");  if(SJLWFAQK != null)bean.setSjlwfaqk(SJLWFAQK);
        String QTAQK = request.getParameter("QTAQK");         if(QTAQK != null)bean.setQtaqk(QTAQK);
        String GNF = request.getParameter("GNF");           if(GNF != null)bean.setGnf(GNF);
        String FZCKZGNK = request.getParameter("FZCKZGNK");    if(FZCKZGNK != null)bean.setFzckzgnk(FZCKZGNK);
        String JDYL = request.getParameter("JDYL");          if(JDYL != null)bean.setJdyl(JDYL);
        String QTZHD = request.getParameter("QTZHD");        if(QTZHD != null)bean.setQtzhd(QTZHD);
        String JDYLWXD = request.getParameter("JDYLWXD");    if(JDYLWXD != null)bean.setJdylwxd(JDYLWXD);
        String QTWXD = request.getParameter("QTWXD");     if(QTWXD != null)bean.setQtwxd(QTWXD);
        String ZT = request.getParameter("ZT");               if(ZT != null)bean.setZt(ZT);
        String JY = request.getParameter("JY");                 if(JY != null)bean.setJy(JY);
        String CLGJFY = request.getParameter("CLGJFY");    if(CLGJFY != null)bean.setClgjfy(CLGJFY);
        String NJCL = request.getParameter("NJCL");                   if(NJCL != null)bean.setNjcl(NJCL);
        String FSTYCBHCL = request.getParameter("FSTYCBHCL");      if(FSTYCBHCL != null)bean.setFstycbhcl(FSTYCBHCL);
        String MEGNJCL = request.getParameter("MEGNJCL");     if(MEGNJCL != null)bean.setMegnjcl(MEGNJCL);
        String AJJCYCBHCL = request.getParameter("AJJCYCBHCL");      if(AJJCYCBHCL != null)bean.setAjjcycbhcl(AJJCYCBHCL);
        String QTYCBHCL = request.getParameter("QTYCBHCL");       if(QTYCBHCL != null)bean.setQtycbhcl(QTYCBHCL);
        String YBCL = request.getParameter("YBCL");              if(YBCL != null)bean.setYbcl(YBCL);
        String AKLCL = request.getParameter("AKLCL");        if(AKLCL != null)bean.setAklcl(AKLCL);
        String FZQ = request.getParameter("FZQ");          if(FZQ != null)bean.setFzq(FZQ);
        String BZGY = request.getParameter("BZGY");      if(BZGY != null)bean.setBzgy(BZGY);
        String QTJS = request.getParameter("QTJS");    if(QTJS != null)bean.setQtjs(QTJS);

        signdata  = StringUtil.parseNull(request.getParameter("signdata"),"");
        map.put("processid", processId);
        OfficeQpd officeQpd = officeQpdDAO.queryForBean(map);
        if(officeQpd == null){
            officeQpd = new  OfficeQpd();
            officeQpd.setProcessid(processId);
            officeQpd.setFormId("");
            officeQpd.setSigndata(signdata);
            officeQpd.setLrr(cUser.getUserId());
            officeQpd.setLrsj(new java.util.Date());
            officeQpdDAO.addOfficeQpd(officeQpd);
        }else{
            officeQpd.setSigndata(signdata);
            officeQpd.setFormId("");
            officeQpd.setLrr(cUser.getUserId());
            officeQpd.setLrsj(new java.util.Date());
            officeQpdDAO.modOfficeQpd(officeQpd);
        }
        if("true".equals(sftj)){
            String[] nextUsers = new String[10];
            connectId = workFlow.claimMission(processId, connectId, cUser.getUserId());
            if (!StringUtil.isBlankOrEmpty(connectId)) {
                String selUserId = "";
                String nextRole = workFlow.getNextRoleName(StringUtil.parseNull(connectId, ""),"1");
                if("生产部门".equals(nextRole)){
                    selUserId = bean.getScclr();
                }else if("多部门审核".equals(nextRole)){
                    nextUsers[0]  = bean.getJsclr();
                    nextUsers[1]  = bean.getJhclr();
                    nextUsers[2]  = bean.getNybclr();
                    nextUsers[3]  = bean.getJdkclr();
                    nextUsers[4]  = bean.getAqkclr();
                    nextUsers[5]  = bean.getGnkclr();
                    nextUsers[6]  = bean.getZhdclr();
                    nextUsers[7]  = bean.getWxdclr();
                    nextUsers[8]  = bean.getGyclr();
                    nextUsers[9]  = bean.getJyclr();
                }else {
                    selUserId = "";
                }
                if(nextUsers != null && nextUsers.length > 0){
                    connectId = workFlow.completeMission(processId, connectId, cUser.getUserId(), nextUsers, "1");
                }else{
                    connectId = workFlow.completeMission(processId, connectId, cUser.getUserId(), new String[]{selUserId}, "1");
                }
            }
            if (bean != null) {
                bean.setConnectId(connectId);
                map.put("processId", processId);
                WProcess wProcess = wProcessDAO.queryForBean(map);
                if (wProcess != null && "9".equals(wProcess.getProcessStatus())) {
                    bean.setSqzt("已完成");
                } else {
                    bean.setSqzt("正在审批");
                }
            }
        }
        jyglDjfyjsDAO.modJyglDjfyjs(bean);
        response.sendRedirect("wait.jsp");
    }

%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
		<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet"  type="text/css">
		<link href="<%=request.getContextPath()%>/images/css.css" rel="stylesheet"  type="text/css">
		<link href="<%=request.getContextPath()%>/css/ext-all.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" charset="GB2312"
			src="<%=request.getContextPath()%>/js/date/WdatePicker.js" defer="defer"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/ckeditor/ckeditor.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/ext/ext-all.js"></script>

		
		<script type="text/javascript">
            function _resizeNoPage() {
                document.getElementById("scrollDiv").style.width = document.body.clientWidth - 18;
                document.getElementById("scrollDiv").style.height = document.body.clientHeight - 50;
			function CheckDateTime(object){
			   var rr=/^(?:19|20)[0-9][0-9]-(?:(?:0[1-9])|(?:1[0-2]))-(?:(?:[0-2][1-9])|(?:[1-3][0-1])) (?:(?:[0-2][0-3])|(?:[0-1][0-9])):[0-5][0-9]$/
			   if(!rr.test(object.value)){
			    	object.focus();
			 		return false;
			   }
            }

			   return true;
			}
			function CheckDate(object){
			   var rr=/^(?:19|20)[0-9][0-9]-(?:(?:0[1-9])|(?:1[0-2]))-(?:(?:[0-2][1-9])|(?:[1-3][0-1]))$/
			   if(!rr.test(object.value)){
			    	object.focus();
			 		return false;
			  }
			  return true;
			}		

		</script>
		<script type="text/javascript" defer="defer">
		function saveIt(){
             document.form1.submit();
        }
        function saveItAndTj(){
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
            document.all.sftj.value = "true";
            document.form1.submit();
        }
		function mustSignSelect(obj){
			if(obj.value=="1"){
				document.form1.mb3.disabled = false;
			}else{
				document.form1.mb3.disabled = true;
			}
		}
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
		<script type="text/javascript">
            function tj(sid,pid,cid){
                var v = document.all.agree;
                var nextUserId = "";
                var varValue = "";
                if(v[0].checked && v[0].value == '1'){
                    nextUserId = document.all.agreed.value;
                    varValue = "1";
                }else{
                    nextUserId = document.all.disagreed.value;
                    varValue = "-1";
                }
               window.location = "tj.jsp?type=1&selUserId="+nextUserId+"&connectId="+cid+"&sqId="+sid+"&processId="+pid+"&varValue="+varValue;
            }
            function qz(){
                window
                        .open(
                        "<%=request.getContextPath()%>/oa/qpd/qpd.jsp?formId=9d4d71dc-3497-4c97-bf3a-92cbb31b493a&connectId=<%=connectId%>&processId=<%=processId%>",
                        "mywindow",
                        "height="
                                + 500
                                + ",width="
                                + 700
                                + ",status=0,toolbar=no,menubar=no,location=no,scrollbars=yes,top="
                                + 0
                                + ",left="
                                + 0
                                + ",resizable=yes,modal=yes,dependent=yes,dialog=yes,minimizable=no");
            }
		</script>
	</head>
	<body onload="_resizeNoPage();LoadSignData();">
		<form action="sp2.jsp" name="form1" method="post">
            <input type="hidden" name="flag" value="save"/>
            <input type="hidden" name="sftj" value=""/>
            <input type="hidden" name="pkid" value="<%=StringUtil.parseNull(request.getParameter("pkid"),"")%>"/>
            <input type="hidden" id="signdata" name="signdata"/>
			<table width="100%" height="25" border="0" cellpadding="0"
				cellspacing="0"
				background="<%=request.getContextPath()%>/images/mhead.jpg">
				<tr>
					<td width="3%" align="center">
						<img src="<%=request.getContextPath()%>/images/mlogo.jpg" width="11"
							height="11">
					</td>
					<td width="15%" class="mhead">
						单井费用申请审批
					</td>
					<td width="74%" align="left" class="mhead">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="left">
                                        <input type="button" name="sign" class="button" value="签字" onclick="addSealB();"/>&nbsp;&nbsp;&nbsp;
                                        <input type="button" class="button"
                                               onclick="saveIt();" value="保存">
                                        <input type="button" class="button"
                                               onclick="saveItAndTj();" value="保存并提交">
                                        <input type="button" class="button" id="button1"
                                               onclick="history.back()" value="返回">
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td>
						<%--固定表头DIV--%>
						<div id="scrollDiv"
							style="width: 1200px; overflow: auto; cursor: default; display: inline; position: absolute; height: 200px;">
							<table width="100%" border="0" align="center" cellpadding="0"
								cellspacing="0" class="mtabtab" id="mtabtab">
                                <tr>
                                    <td nowrap="nowrap" class="head_left">
                                        队号
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getDh(),"")%>&nbsp;
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        井号
                                    </td>
                                    <td class="head_right" style="text-align: left" colspan="6">
                                        <%=StringUtil.parseNull(bean.getJh(),"")%>&nbsp;
                                    </td>
                                </tr>
                                <%
                                    //生产
                                    if("33c165b3-b6a7-4144-b8a2-aaebe111845e".equals(orgId)){  %>
                                <tr bgcolor="yellow">
                                    <td nowrap="nowrap" class="head_left">
                                        搬迁时间
                                    </td>
                                    <td class="head_right" style="text-align: left;width:140px">
                                        <input type="text" name="BQSJ" value="<%=StringUtil.parseNull(bean.getBqsj(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        实际建井周期
                                    </td>
                                    <td class="head_right" style="text-align: left;width:140px">
                                        <input type="text" name="SJJJZQ" value="<%=StringUtil.parseNull(bean.getSjjjzq(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        实际钻机月
                                    </td>
                                    <td class="head_right" style="text-align: left;width:140px">
                                        <input type="text" name="SJZJY" value="<%=StringUtil.parseNull(bean.getSjzjy(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        安装费用
                                    </td>
                                    <td class="head_right" style="text-align: left;width:140px">
                                        <input type="text" name="AZFY" value="<%=StringUtil.parseNull(bean.getAzfy(),"")%>"/>
                                    </td>
                                </tr>
                                <tr bgcolor="yellow">
                                    <td nowrap="nowrap" class="head_left">
                                        开钻时间
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="KZSJ" value="<%=StringUtil.parseNull(bean.getKzsj(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        实际钻井周期
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="SJZJZQ" value="<%=StringUtil.parseNull(bean.getSjzjzq(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        实际井深
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="SJJS" value="<%=StringUtil.parseNull(bean.getSjjs(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        整拖费
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="ZTF" value="<%=StringUtil.parseNull(bean.getZtf(),"")%>"/>
                                    </td>
                                </tr>
                                <tr bgcolor="yellow">
                                    <td nowrap="nowrap" class="head_left">
                                        完井时间
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="WJSJ" value="<%=StringUtil.parseNull(bean.getWjsj(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        是否整拖
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="SFZT" value="<%=StringUtil.parseNull(bean.getSfzt(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        搬迁费
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="BQF" value="<%=StringUtil.parseNull(bean.getBqf(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        日常运费
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="RCYF" value="<%=StringUtil.parseNull(bean.getRcyf(),"")%>"/>
                                    </td>
                                </tr>
                                <tr bgcolor="yellow">
                                    <td nowrap="nowrap" class="head_left">
                                        备注
                                    </td>
                                    <td class="head_right" style="text-align: left" colspan="5">
                                        <textarea name="BZSC" rows="4" cols="80"><%=StringUtil.parseNull(bean.getBzsc(),"")%></textarea>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        生产办签字
                                    </td>
                                    <td class="head_right" style="text-align: left;height:140px;width:140px" id="shr33c165b3-b6a7-4144-b8a2-aaebe111845e">
                                        &nbsp;
                                    </td>
                                </tr>
                                <%   }else{  %>
                                <tr>
                                    <td nowrap="nowrap" class="head_left">
                                        搬迁时间
                                    </td>
                                    <td class="head_right" style="text-align: left;width:140px">
                                        <%=StringUtil.parseNull(bean.getBqsj(),"&nbsp;")%>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        实际建井周期
                                    </td>
                                    <td class="head_right" style="text-align: left;width:140px">
                                        <%=StringUtil.parseNull(bean.getSjjjzq(),"&nbsp;")%>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        实际钻机月
                                    </td>
                                    <td class="head_right" style="text-align: left;width:140px">
                                        <%=StringUtil.parseNull(bean.getSjzjy(),"&nbsp;")%>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        安装费用
                                    </td>
                                    <td class="head_right" style="text-align: left;width:140px">
                                        <%=StringUtil.parseNull(bean.getAzfy(),"&nbsp;")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" class="head_left">
                                        开钻时间
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getKzsj(),"&nbsp;")%>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        实际钻井周期
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getSjzjzq(),"&nbsp;")%>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        实际井深
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getSjjs(),"&nbsp;")%>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        整拖费
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getZtf(),"&nbsp;")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" class="head_left">
                                        完井时间
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getWjsj(),"&nbsp;")%>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        是否整拖
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getSfzt(),"&nbsp;")%>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        搬迁费
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getBqf(),"&nbsp;")%>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        日常运费
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getRcyf(),"&nbsp;")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" class="head_left">
                                        备注
                                    </td>
                                    <td class="head_right" style="text-align: left" colspan="5">
                                        <%=StringUtil.parseNull(bean.getBzsc(),"&nbsp;")%>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        生产办签字
                                    </td>
                                    <td class="head_right" style="text-align: left;height:140px;width:140px"  id="shr33c165b3-b6a7-4144-b8a2-aaebe111845e">
                                        &nbsp;
                                    </td>
                                </tr>
                                <% }
                                %>
                                <%
                                    //技术
                                    if("8a49607b-d8da-4f7f-a594-9946f6d7d7c9".equals(orgId)){  %>
                                <tr bgcolor="yellow">
                                    <td nowrap="nowrap" class="head_left">
                                        实际井深
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="SJJSJS" value="<%=StringUtil.parseNull(bean.getSjjsjs(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        取芯进尺
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="QXJC" value="<%=StringUtil.parseNull(bean.getQxjc(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        弹性扶正器
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="TXFZQ" value="<%=StringUtil.parseNull(bean.getTxfzq(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        有效返工进尺
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="YXFGJC" value="<%=StringUtil.parseNull(bean.getYxfgjc(),"")%>"/>
                                    </td>
                                </tr>
                                <tr bgcolor="yellow">
                                    <td nowrap="nowrap" class="head_left">
                                        筛管下深
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="SGXS" value="<%=StringUtil.parseNull(bean.getSgxs(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        泥浆服务方
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="NJFWF" value="<%=StringUtil.parseNull(bean.getNjfwf(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        定向服务方
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="DXFWF" value="<%=StringUtil.parseNull(bean.getDxfwf(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        技术签字
                                    </td>
                                    <td class="head_right" style="text-align: left;height:140px;width:140px" id="shr8a49607b-d8da-4f7f-a594-9946f6d7d7c9">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr bgcolor="yellow">
                                    <td nowrap="nowrap" class="head_left">
                                        其他
                                    </td>
                                    <td class="head_right" style="text-align: left" colspan="7">
                                        <input type="text" name="QTJS" value="<%=StringUtil.parseNull(bean.getQtjs(),"")%>"/>
                                    </td>
                                </tr>
                                <%   } %>
                                <%
                                    //计划
                                    if("04b02beb-3532-40c9-8e28-e3b25a76f826".equals(orgId)){  %>
                                <tr bgcolor="yellow">
                                    <td nowrap="nowrap" class="head_left">
                                        建设单位
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="JSDW" value="<%=StringUtil.parseNull(bean.getJsdw(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        分地区
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="FDQ" value="<%=StringUtil.parseNull(bean.getFdq(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        井    别
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="JB" value="<%=StringUtil.parseNull(bean.getJb(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        井    深
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="JS" value="<%=StringUtil.parseNull(bean.getJs(),"")%>"/>
                                    </td>
                                </tr>
                                <tr bgcolor="yellow">
                                    <td nowrap="nowrap" class="head_left">
                                        井    径
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="JJ" value="<%=StringUtil.parseNull(bean.getJj(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        定额周期
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="DEZQ" value="<%=StringUtil.parseNull(bean.getDezq(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        泥浆密度
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="NJMD" value="<%=StringUtil.parseNull(bean.getNjmd(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        技套下深
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="JTXS" value="<%=StringUtil.parseNull(bean.getJtxs(),"")%>"/>
                                    </td>
                                </tr>
                                <tr bgcolor="yellow">
                                    <td nowrap="nowrap" class="head_left">
                                        取    芯
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="QX" value="<%=StringUtil.parseNull(bean.getQx(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        定额钻机月
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="DEZJY" value="<%=StringUtil.parseNull(bean.getDezjy(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        加深米数
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="JSMS" value="<%=StringUtil.parseNull(bean.getJsms(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        井 斜 角
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="JXJ" value="<%=StringUtil.parseNull(bean.getJxj(),"")%>"/>
                                    </td>
                                </tr>
                                <tr bgcolor="yellow">
                                    <td nowrap="nowrap" class="head_left">
                                        野营房维修
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="YYFWX" value="<%=StringUtil.parseNull(bean.getYyfwx(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        备注
                                    </td>
                                    <td class="head_right" style="text-align: left" colspan="3">
                                        <input type="text" name="BZ" value="<%=StringUtil.parseNull(bean.getBz(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        计划签字
                                    </td>
                                    <td class="head_right" style="text-align: left;height:140px;width:140px" id="shr04b02beb-3532-40c9-8e28-e3b25a76f826">
                                        &nbsp;
                                    </td>
                                </tr>
                                <%   }%>
                                <%
                                    //能源办 考虑使用角色过滤
                                    if("55fc5e6f-6a0c-4976-b0dd-03d72ebd3448".equals(orgId)){  %>
                                <tr bgcolor="yellow">
                                    <td nowrap="nowrap" class="head_left">
                                        柴油
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="CY" value="<%=StringUtil.parseNull(bean.getCy(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        柴油运费
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="CYYF" value="<%=StringUtil.parseNull(bean.getCyyf(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        柴油劳务费
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="CYLWF" value="<%=StringUtil.parseNull(bean.getCylwf(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        网电费
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="WDF" value="<%=StringUtil.parseNull(bean.getWdf(),"")%>"/>
                                    </td>
                                </tr>
                                <tr bgcolor="yellow">
                                    <td nowrap="nowrap" class="head_left">
                                        原油
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="YY" value="<%=StringUtil.parseNull(bean.getYy(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        其他
                                    </td>
                                    <td class="head_right" style="text-align: left" colspan="3">
                                        <input type="text" name="QTNYB" value="<%=StringUtil.parseNull(bean.getQtnyb(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        能源办签字
                                    </td>
                                    <td class="head_right" style="text-align: left;height:140px;width:140px"  id="shr55fc5e6f-6a0c-4976-b0dd-03d72ebd3448">
                                        &nbsp;
                                    </td>
                                </tr>
                                <%   }%>
                                <%
                                    //机动科
                                    if("27021cde-c852-4c4a-8809-dbcb155825d2".equals(orgId)){  %>
                                <tr bgcolor="yellow">
                                    <td nowrap="nowrap" class="head_left">
                                        设备修理费
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="SBXLF" value="<%=StringUtil.parseNull(bean.getSbxlf(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        上井劳务费
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="SJLWF" value="<%=StringUtil.parseNull(bean.getSjlwf(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        其他
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="QTJDK" value="<%=StringUtil.parseNull(bean.getQtjdk(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        机动科签字
                                    </td>
                                    <td class="head_right" style="text-align: left;height:140px;width:140px" id="shr27021cde-c852-4c4a-8809-dbcb155825d2">
                                        &nbsp;
                                    </td>
                                </tr>

                                <%   }%>
                                <%
                                    //安全科
                                    if("254db449-d2de-4335-a130-6f1603cb741f".equals(orgId)){  %>
                                <tr bgcolor="yellow">
                                    <td nowrap="nowrap" class="head_left">
                                        安全设施费
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="AQSSF" value="<%=StringUtil.parseNull(bean.getAqssf(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        上井劳务费
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="SJLWFAQK" value="<%=StringUtil.parseNull(bean.getSjlwfaqk(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        其他
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="QTAQK" value="<%=StringUtil.parseNull(bean.getQtaqk(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        安全科签字
                                    </td>
                                    <td class="head_right" style="text-align: left;height:140px;width:140px" id="shr254db449-d2de-4335-a130-6f1603cb741f">
                                        &nbsp;
                                    </td>
                                </tr>

                                <%   }%>
                                <%
                                    //工农科
                                    if("61314660-7176-4f17-b19c-ba9840acd849".equals(orgId)){  %>
                                <tr bgcolor="yellow">
                                    <td nowrap="nowrap" class="head_left">
                                        工农费
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="GNF" value="<%=StringUtil.parseNull(bean.getGnf(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        非正常开支
                                    </td>
                                    <td class="head_right" style="text-align: left" colspan="3">
                                        <input type="text" name="FZCKZGNK" value="<%=StringUtil.parseNull(bean.getFzckzgnk(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        工农科签字
                                    </td>
                                    <td class="head_right" style="text-align: left;height:140px;width:140px"  id="shr61314660-7176-4f17-b19c-ba9840acd849">
                                        &nbsp;
                                    </td>
                                </tr>

                                <%   }%>
                                <%
                                    //综合队
                                    if("895ba579-95d8-4e88-b615-3c2b2443aa0e".equals(orgId)){  %>
                                <tr bgcolor="yellow">
                                    <td nowrap="nowrap" class="head_left">
                                        井队用料
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="JDYL" value="<%=StringUtil.parseNull(bean.getJdyl(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        其    他
                                    </td>
                                    <td class="head_right" style="text-align: left" colspan="3">
                                        <input type="text" name="QTZHD" value="<%=StringUtil.parseNull(bean.getQtzhd(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        综合队
                                    </td>
                                    <td class="head_right" style="text-align: left;height:140px;width:140px"  id="shr895ba579-95d8-4e88-b615-3c2b2443aa0e">
                                        &nbsp;
                                    </td>
                                </tr>

                                <%   }%>
                                <%
                                    //外修队
                                    if("3b6f38fb-fd8c-4a50-9587-431b841b2c7a".equals(orgId)){  %>
                                <tr bgcolor="yellow">
                                    <td nowrap="nowrap" class="head_left">
                                        井队用料
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="JDYLWXD" value="<%=StringUtil.parseNull(bean.getJdylwxd(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        其    他
                                    </td>
                                    <td class="head_right" style="text-align: left" colspan="3">
                                        <input type="text" name="QTWXD" value="<%=StringUtil.parseNull(bean.getQtwxd(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        外修队
                                    </td>
                                    <td class="head_right" style="text-align: left;height:140px;width:140px" id="shr3b6f38fb-fd8c-4a50-9587-431b841b2c7a">
                                        &nbsp;
                                    </td>
                                </tr>

                                <%   }%>
                                <%
                                    //供应
                                    if("6f531ccb-7cbe-4614-9a1b-3683992ffa89".equals(orgId)){  %>
                                <tr bgcolor="yellow">
                                    <td nowrap="nowrap" class="head_left">
                                        泥浆村料
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="NJCL" value="<%=StringUtil.parseNull(bean.getNjcl(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        非渗透油层<br>保护材料
                                    </td>
                                    <td class="head_right" style="text-align: left" colspan="5">
                                        <input type="text" name="FSTYCBHCL" value="<%=StringUtil.parseNull(bean.getFstycbhcl(),"")%>"/>
                                    </td>

                                </tr>
                                <tr bgcolor="yellow">
                                    <td nowrap="nowrap" class="head_left">
                                        胺基聚醇油层<br>保护材料
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="AJJCYCBHCL" value="<%=StringUtil.parseNull(bean.getAjjcycbhcl(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left" >
                                        其他油层保护材料
                                    </td>
                                    <td class="head_right" style="text-align: left" colspan="3">
                                        <input type="text" name="QTYCBHCL" value="<%=StringUtil.parseNull(bean.getQtycbhcl(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        MEG泥浆材料
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="MEGNJCL" value="<%=StringUtil.parseNull(bean.getMegnjcl(),"")%>"/>
                                    </td>
                                </tr>
                                <tr bgcolor="yellow">
                                    <td nowrap="nowrap" class="head_left">
                                        一般材料
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="YBCL" value="<%=StringUtil.parseNull(bean.getYbcl(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        奥凯龙材料
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="AKLCL" value="<%=StringUtil.parseNull(bean.getAklcl(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        扶正器
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="FZQ" value="<%=StringUtil.parseNull(bean.getFzq(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        供应签字
                                    </td>
                                    <td class="head_right" style="text-align: left;height:140px;width:140px" id="shr6f531ccb-7cbe-4614-9a1b-3683992ffa89">
                                        &nbsp;
                                    </td>
                                </tr>
                                <%   }%>
                                <%
                                    //经管
                                    if("b23121d4-db76-4d2d-b59d-eefd2873e0ab".equals(orgId)){  %>
                                <tr bgcolor="yellow">
                                    <td nowrap="nowrap" class="head_left">
                                        钻前劳务
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="ZQLW" value="<%=StringUtil.parseNull(bean.getZqlw(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        套    管
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="TG" value="<%=StringUtil.parseNull(bean.getTg(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        钻具租赁费
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="ZQZLF" value="<%=StringUtil.parseNull(bean.getZqzlf(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        石粉材料
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="SFCL" value="<%=StringUtil.parseNull(bean.getSfcl(),"")%>"/>
                                    </td>
                                </tr>
                                <tr bgcolor="yellow">
                                    <td nowrap="nowrap" class="head_left">
                                        管具劳务
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="GJLW" value="<%=StringUtil.parseNull(bean.getGjlw(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        套管附件
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="TGFJ" value="<%=StringUtil.parseNull(bean.getTgfj(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        刚性扶正器
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="GXFZQ" value="<%=StringUtil.parseNull(bean.getGxfzq(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        石粉劳务
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="SFLW" value="<%=StringUtil.parseNull(bean.getSflw(),"")%>"/>
                                    </td>
                                </tr>
                                <tr bgcolor="yellow">
                                    <td nowrap="nowrap" class="head_left">
                                        固井劳务
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="GJLW2" value="<%=StringUtil.parseNull(bean.getGjlw2(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        添加剂
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="TJJ" value="<%=StringUtil.parseNull(bean.getTjj(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        井控固控摊销
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="JKGKTX" value="<%=StringUtil.parseNull(bean.getJkgktx(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        井控配件
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="JKPJ" value="<%=StringUtil.parseNull(bean.getJkpj(),"")%>"/>
                                    </td>
                                </tr>
                                <tr bgcolor="yellow">
                                    <td nowrap="nowrap" class="head_left">
                                        固井水泥
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="GJSN" value="<%=StringUtil.parseNull(bean.getGjsn(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        隔离液
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="KLY" value="<%=StringUtil.parseNull(bean.getKly(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        技术服务费
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="JSFWF" value="<%=StringUtil.parseNull(bean.getJsfwf(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        外委劳务
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="WWLW" value="<%=StringUtil.parseNull(bean.getWwlw(),"")%>"/>
                                    </td>
                                </tr>
                                <tr bgcolor="yellow">
                                    <td nowrap="nowrap" class="head_left">
                                        质量扣款
                                    </td>
                                    <td class="head_right" style="text-align: left" colspan="7">
                                        <input type="text" name="ZLKK" value="<%=StringUtil.parseNull(bean.getZlkk(),"")%>"/>
                                    </td>
                                </tr>
                                <tr bgcolor="yellow">
                                    <td nowrap="nowrap" class="head_left">
                                        非正常开支
                                    </td>
                                    <td class="head_right" style="text-align: left" colspan="5">
                                        <input type="text" name="FZCKZ" value="<%=StringUtil.parseNull(bean.getFzckz(),"")%>"/>
                                    </td>
                                    <td nowrap="nowrap" class="head_left">
                                        经管签字
                                    </td>
                                    <td class="head_right" style="text-align: left;height:140px;width:140px"  id="shrb23121d4-db76-4d2d-b59d-eefd2873e0ab">
                                        &nbsp;
                                    </td>
                                </tr>
                                <%   }%>
							</table>
						</div>
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
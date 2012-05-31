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
    cOrgnization = cOrgnization == null?new COrgnization():cOrgnization;
	if (request.getMethod().equals("POST")) {
        String DH = StringUtil.parseNull(request.getParameter("DH"),"");
        String JH = StringUtil.parseNull(request.getParameter("JH"),"");
        String SCCLR = StringUtil.parseNull(request.getParameter("SCCLR"),"");
        String JHCLR = StringUtil.parseNull(request.getParameter("JHCLR"),"");
        String JSCLR = StringUtil.parseNull(request.getParameter("JSCLR"),"");
        String NYBCLR = StringUtil.parseNull(request.getParameter("NYBCLR"),"");
        String JDKCLR = StringUtil.parseNull(request.getParameter("JDKCLR"),"");
        String AQKCLR = StringUtil.parseNull(request.getParameter("AQKCLR"),"");
        String GNKCLR = StringUtil.parseNull(request.getParameter("GNKCLR"),"");
        String ZHDCLR = StringUtil.parseNull(request.getParameter("ZHDCLR"),"");
        String WXDCLR = StringUtil.parseNull(request.getParameter("WXDCLR"),"");
        String GYCLR = StringUtil.parseNull(request.getParameter("GYCLR"),"");
        String JYCLR = StringUtil.parseNull(request.getParameter("JYCLR"),"");
        String flag = StringUtil.parseNull(request.getParameter("flag"),"");
        JyglDjfyjs bean = new  JyglDjfyjs();
        bean.setPkid(StringUtil.getUUID());
        bean.setDh(DH);
        bean.setJh(JH);
        bean.setSqr(cUser.getUserId());
        bean.setSqsj(new java.util.Date());
        bean.setScclr(SCCLR);
        bean.setJhclr(JHCLR);
        bean.setJsclr(JSCLR);
        bean.setJyclr(JYCLR);
        bean.setNybclr(NYBCLR);
        bean.setJdkclr(JDKCLR);
        bean.setAqkclr(AQKCLR);
        bean.setGnkclr(GNKCLR);
        bean.setZhdclr(ZHDCLR);
        bean.setWxdclr(WXDCLR);
        bean.setGyclr(GYCLR);
        bean.setJyclr(JYCLR);
        if("startup".equals(flag)){
            bean.setSqzt("已申请");
            //创建流程代码在这里
            Status status = workflow.startWorkflow("d1325ed3-9ffd-4c21-91ae-399db5a02a08",cUser.getUserId());
            bean.setProcessId(status.getProcessId());
            bean.setConnectId(status.getConnectId());
        }
        jyglDjfyjsDAO.addJyglDjfyjs(bean);
%>
		<script>
		    window.location='index.jsp';
		</script>
<%	}%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
		<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet"  type="text/css">
		<link href="<%=request.getContextPath()%>/images/css.css" rel="stylesheet"  type="text/css">
		<link href="<%=request.getContextPath()%>/css/ext-all.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" charset="GB2312"
			src="<%=request.getContextPath()%>/js/date/WdatePicker.js" defer="defer"></script>

		
		<script type="text/javascript">
            function _resizeNoPage() {
                document.getElementById("scrollDiv").style.width = document.body.clientWidth - 18;
                document.getElementById("scrollDiv").style.height = document.body.clientHeight - 50;
            }
			function checkForm(){
                if(document.form1.DH.value==""){
                    document.form1.DH.focus();
                    alert("请输入队号");
                    return;
                }
                if(document.form1.JH.value==""){
                    document.form1.JH.focus();
                    alert("请输入井号");
                    return;
                }
				document.form1.submit();
			}
            function startup(){
                if(document.form1.DH.value==""){
                    document.form1.DH.focus();
                    alert("请输入队号");
                    return;
                }
                if(document.form1.JH.value==""){
                    document.form1.JH.focus();
                    alert("请输入井号");
                    return;
                }
                document.all.flag.value="startup";
                document.form1.submit();
            }
		</script>

	</head>
	<body onload="_resizeNoPage();">
		<form action="add.jsp" name="form1" method="post">
            <input type="hidden" name="flag" value=""/>
            <input type="hidden" name="dxtx" value=""/>
			<table width="100%" height="25" border="0" cellpadding="0"
				cellspacing="0"
				background="<%=request.getContextPath()%>/images/mhead.jpg">
				<tr>
					<td width="3%" align="center">
						<img src="<%=request.getContextPath()%>/images/mlogo.jpg" width="11"
							height="11">
					</td>
					<td width="15%" class="mhead">
						新建单井费用结算审批单
					</td>
					<td width="74%" align="left" class="mhead">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="left">
										<input type="button" class="button" id="button"
											onclick="checkForm();" value="保存">
										&nbsp;
                                        <input type="button" class="button"
                                               onclick="startup();" value="创建流程并启动">
                                        &nbsp;
										<input type="button" class="button" id="button1"
											onclick="history.back()" value="返回">
										&nbsp;
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
							style="width: 1000px; overflow: auto; cursor: default; display: inline; position: absolute; height: 200px;">
							<table width="100%" border="0" align="center" cellpadding="0"
								cellspacing="0" class="mtabtab" id="mtabtab">
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										队号<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" style="text-align: left">
                                        <input type="text" name="DH" value=""  style="width:500px"/>
									</td>
								</tr>
                                <tr>
                                    <td nowrap="nowrap" width="120" class="head_left">
                                        井号<span style="color: red">&nbsp;*</span>
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="JH" value=""  style="width:500px"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" width="120" class="head_left">
                                        选择审批人<span style="color: red">&nbsp;*</span>
                                    </td>
                                    <%
                                        List sclist = dao.getUsersByOrgId("33c165b3-b6a7-4144-b8a2-aaebe111845e");
                                        sclist = sclist == null?new ArrayList():sclist;
                                        List jslist = dao.getUsersByOrgId("8a49607b-d8da-4f7f-a594-9946f6d7d7c9");
                                        jslist = jslist == null?new ArrayList():jslist;
                                        List jylist = dao.getUsersByOrgId("b23121d4-db76-4d2d-b59d-eefd2873e0ab");
                                        jylist = jylist == null?new ArrayList():jylist;
                                        List jdlist = dao.getUsersByOrgId("27021cde-c852-4c4a-8809-dbcb155825d2");
                                        jdlist = jdlist == null?new ArrayList():jdlist;
                                        List aqlist = dao.getUsersByOrgId("254db449-d2de-4335-a130-6f1603cb741f");
                                        aqlist = aqlist == null?new ArrayList():aqlist;
                                        List gnlist = dao.getUsersByOrgId("61314660-7176-4f17-b19c-ba9840acd849");
                                        gnlist = gnlist == null?new ArrayList():gnlist;
                                        List zhlist = dao.getUsersByOrgId("895ba579-95d8-4e88-b615-3c2b2443aa0e");
                                        zhlist = zhlist == null?new ArrayList():zhlist;
                                        List wxlist = dao.getUsersByOrgId("ec46c87f-cf1b-4ea8-8041-c85ab579c09d");
                                        wxlist = wxlist == null?new ArrayList():wxlist;
                                    %>
                                    <td class="head_right" style="text-align: left">
                                        生产办
                                        <select name="SCCLR">
                                            <option value="">==请选择==</option>
                                             <%
                                                for(int i=0;i<sclist.size();i++){
                                                    Map m = (Map)sclist.get(i);
                                                    String userid = StringUtil.parseNull(m.get("USER_ID"),"");
                                                    String realname = StringUtil.parseNull(m.get("REAL_NAME"),"");
                                             %>
                                            <option value="<%=userid%>"><%=realname%></option>
                                            <%}%>
                                        </select>
                                        &nbsp;&nbsp;
                                        技术
                                        <select name="JSCLR">
                                            <option value="">==请选择==</option>
                                            <%
                                                for(int i=0;i<jslist.size();i++){
                                                    Map m = (Map)jslist.get(i);
                                                    String userid = StringUtil.parseNull(m.get("USER_ID"),"");
                                                    String realname = StringUtil.parseNull(m.get("REAL_NAME"),"");
                                            %>
                                            <option value="<%=userid%>"><%=realname%></option>
                                            <%}%>
                                        </select>
                                        &nbsp;&nbsp;
                                        经营<select name="JYCLR"><option value="">==请选择==</option>
                                                <%
                                                    for(int i=0;i<jylist.size();i++){
                                                        Map m = (Map)jylist.get(i);
                                                        String userid = StringUtil.parseNull(m.get("USER_ID"),"");
                                                        String realname = StringUtil.parseNull(m.get("REAL_NAME"),"");
                                                %>
                                                <option value="<%=userid%>"><%=realname%></option>
                                                <%}%>
                                            </select>&nbsp;&nbsp;
                                        能源办<select><option value="">==请选择==</option>

                                            </select>&nbsp;&nbsp;
                                        机动办<select><option value="">==请选择==</option>
                                        <%
                                            for(int i=0;i<jdlist.size();i++){
                                                Map m = (Map)jdlist.get(i);
                                                String userid = StringUtil.parseNull(m.get("USER_ID"),"");
                                                String realname = StringUtil.parseNull(m.get("REAL_NAME"),"");
                                        %>
                                        <option value="<%=userid%>"><%=realname%></option>
                                        <%}%>

                                    </select>&nbsp;&nbsp;
                                        安全科<select><option value="">==请选择==</option>
                                        <%
                                            for(int i=0;i<aqlist.size();i++){
                                                Map m = (Map)aqlist.get(i);
                                                String userid = StringUtil.parseNull(m.get("USER_ID"),"");
                                                String realname = StringUtil.parseNull(m.get("REAL_NAME"),"");
                                        %>
                                        <option value="<%=userid%>"><%=realname%></option>
                                        <%}%>
                                    </select>&nbsp;&nbsp;
                                        工农科<select><option value="">==请选择==</option>
                                        <%
                                            for(int i=0;i<gnlist.size();i++){
                                                Map m = (Map)gnlist.get(i);
                                                String userid = StringUtil.parseNull(m.get("USER_ID"),"");
                                                String realname = StringUtil.parseNull(m.get("REAL_NAME"),"");
                                        %>
                                        <option value="<%=userid%>"><%=realname%></option>
                                        <%}%>
                                    </select>&nbsp;&nbsp;
                                        综合队<select><option value="">==请选择==</option>
                                        <%
                                            for(int i=0;i<zhlist.size();i++){
                                                Map m = (Map)zhlist.get(i);
                                                String userid = StringUtil.parseNull(m.get("USER_ID"),"");
                                                String realname = StringUtil.parseNull(m.get("REAL_NAME"),"");
                                        %>
                                        <option value="<%=userid%>"><%=realname%></option>
                                        <%}%>
                                    </select>&nbsp;&nbsp;
                                        外修队<select><option value="">==请选择==</option>
                                        <%
                                            for(int i=0;i<wxlist.size();i++){
                                                Map m = (Map)wxlist.get(i);
                                                String userid = StringUtil.parseNull(m.get("USER_ID"),"");
                                                String realname = StringUtil.parseNull(m.get("REAL_NAME"),"");
                                        %>
                                        <option value="<%=userid%>"><%=realname%></option>
                                        <%}%>
                                    </select>&nbsp;&nbsp;
                                        供应<select><option value="">==请选择==</option></select>
                                    </td>
                                </tr>
							</table>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
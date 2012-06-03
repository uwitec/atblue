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
    Map map = new HashMap();
    map.put("pkid",pkid);
    JyglDjfyjs bean = jyglDjfyjsDAO.queryForBean(map);
    bean = bean == null?new JyglDjfyjs():bean;
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
	</head>
	<body onload="_resizeNoPage();">
		<form action="edit.jsp" name="form1" method="post">
            <input type="hidden" name="flag" value=""/>
            <input type="hidden" name="dxtx" value=""/>
            <input type="hidden" name="pkid" value="<%=StringUtil.parseNull(request.getParameter("pkid"),"")%>"/>
			<table width="100%" height="25" border="0" cellpadding="0"
				cellspacing="0"
				background="<%=request.getContextPath()%>/images/mhead.jpg">
				<tr>
					<td width="3%" align="center">
						<img src="<%=request.getContextPath()%>/images/mlogo.jpg" width="11"
							height="11">
					</td>
					<td width="15%" class="mhead">
						查看单井费用结算信息
					</td>
					<td width="74%" align="left" class="mhead">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="left">
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
                                        队号
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getDh(),"")%>&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" width="120" class="head_left">
                                        井号
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getJh(),"")%>&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" width="120" class="head_left">
                                        选择审批人
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
                                        List wxlist = dao.getUsersByOrgId("3b6f38fb-fd8c-4a50-9587-431b841b2c7a");
                                        wxlist = wxlist == null?new ArrayList():wxlist;
                                        List jhlist = dao.getUsersByOrgId("04b02beb-3532-40c9-8e28-e3b25a76f826");
                                        jhlist = jhlist == null?new ArrayList():jhlist;
                                        List nylist = dao.getUsersByOrgId("55fc5e6f-6a0c-4976-b0dd-03d72ebd3448");
                                        nylist = nylist == null?new ArrayList():nylist;
                                        List gylist = dao.getUsersByOrgId("6f531ccb-7cbe-4614-9a1b-3683992ffa89");  //物资配送队
                                        gylist = gylist == null?new ArrayList():gylist;
                                    %>
                                    <td class="head_right" style="text-align: left">
                                        生产办
                                        <select name="SCCLR" style="width: 100px">
                                            <%
                                                for(int i=0;i<sclist.size();i++){
                                                    Map m = (Map)sclist.get(i);
                                                    String userid = StringUtil.parseNull(m.get("USER_ID"),"");
                                                    String realname = StringUtil.parseNull(m.get("REAL_NAME"),"");
                                            %>
                                            <option value="<%=userid%>" <%if(userid.equals(bean.getScclr())){%>selected<%}%>><%=realname%></option>
                                            <%}%>
                                        </select>&nbsp;&nbsp;
                                        技&nbsp;&nbsp;术
                                        <select name="JSCLR" style="width: 100px">
                                            <%
                                                for(int i=0;i<jslist.size();i++){
                                                    Map m = (Map)jslist.get(i);
                                                    String userid = StringUtil.parseNull(m.get("USER_ID"),"");
                                                    String realname = StringUtil.parseNull(m.get("REAL_NAME"),"");
                                            %>
                                            <option value="<%=userid%>" <%if(userid.equals(bean.getJsclr())){%>selected<%}%>><%=realname%></option>
                                            <%}%>
                                        </select>&nbsp;&nbsp;
                                        计&nbsp;&nbsp;划
                                        <select name="JHCLR" style="width: 100px">
                                            <%
                                                for(int i=0;i<jhlist.size();i++){
                                                    Map m = (Map)jhlist.get(i);
                                                    String userid = StringUtil.parseNull(m.get("USER_ID"),"");
                                                    String realname = StringUtil.parseNull(m.get("REAL_NAME"),"");
                                            %>
                                            <option value="<%=userid%>" <%if(userid.equals(bean.getJhclr())){%>selected<%}%>><%=realname%></option>
                                            <%}%>
                                        </select>
                                        &nbsp;&nbsp;
                                        <br>
                                        能源办
                                        <select style="width: 100px" name="NYBCLR">
                                            <%
                                                for(int i=0;i<nylist.size();i++){
                                                    Map m = (Map)nylist.get(i);
                                                    String userid = StringUtil.parseNull(m.get("USER_ID"),"");
                                                    String realname = StringUtil.parseNull(m.get("REAL_NAME"),"");
                                            %>
                                            <option value="<%=userid%>" <%if(userid.equals(bean.getNybclr())){%>selected<%}%>><%=realname%></option>
                                            <%}%>
                                        </select>&nbsp;&nbsp;
                                        机动办
                                        <select style="width: 100px" name="JDKCLR">
                                            <%
                                                for(int i=0;i<jdlist.size();i++){
                                                    Map m = (Map)jdlist.get(i);
                                                    String userid = StringUtil.parseNull(m.get("USER_ID"),"");
                                                    String realname = StringUtil.parseNull(m.get("REAL_NAME"),"");
                                            %>
                                            <option value="<%=userid%>" <%if(userid.equals(bean.getJdkclr())){%>selected<%}%>><%=realname%></option>
                                            <%}%>

                                        </select>&nbsp;&nbsp;
                                        安全科
                                        <select style="width: 100px" name="AQKCLR">
                                            <%
                                                for(int i=0;i<aqlist.size();i++){
                                                    Map m = (Map)aqlist.get(i);
                                                    String userid = StringUtil.parseNull(m.get("USER_ID"),"");
                                                    String realname = StringUtil.parseNull(m.get("REAL_NAME"),"");
                                            %>
                                            <option value="<%=userid%>" <%if(userid.equals(bean.getAqkclr())){%>selected<%}%>><%=realname%></option>
                                            <%}%>
                                        </select>&nbsp;&nbsp;
                                        工农科
                                        <select style="width: 100px" name="GNKCLR">
                                            <%
                                                for(int i=0;i<gnlist.size();i++){
                                                    Map m = (Map)gnlist.get(i);
                                                    String userid = StringUtil.parseNull(m.get("USER_ID"),"");
                                                    String realname = StringUtil.parseNull(m.get("REAL_NAME"),"");
                                            %>
                                            <option value="<%=userid%>" <%if(userid.equals(bean.getGnkclr())){%>selected<%}%>><%=realname%></option>
                                            <%}%>
                                        </select>&nbsp;&nbsp;  <br>
                                        综合队
                                        <select style="width: 100px"  name="ZHDCLR">
                                            <%
                                                for(int i=0;i<zhlist.size();i++){
                                                    Map m = (Map)zhlist.get(i);
                                                    String userid = StringUtil.parseNull(m.get("USER_ID"),"");
                                                    String realname = StringUtil.parseNull(m.get("REAL_NAME"),"");
                                            %>
                                            <option value="<%=userid%>" <%if(userid.equals(bean.getZhdclr())){%>selected<%}%>><%=realname%></option>
                                            <%}%>
                                        </select>&nbsp;&nbsp;
                                        外修队
                                        <select style="width: 100px" name="WXDCLR">
                                            <%
                                                for(int i=0;i<wxlist.size();i++){
                                                    Map m = (Map)wxlist.get(i);
                                                    String userid = StringUtil.parseNull(m.get("USER_ID"),"");
                                                    String realname = StringUtil.parseNull(m.get("REAL_NAME"),"");
                                            %>
                                            <option value="<%=userid%>" <%if(userid.equals(bean.getWxdclr())){%>selected<%}%>><%=realname%></option>
                                            <%}%>
                                        </select>&nbsp;&nbsp;
                                        供&nbsp;&nbsp;应
                                        <select style="width: 100px" name="GYCLR">
                                            <%
                                                for(int i=0;i<gylist.size();i++){
                                                    Map m = (Map)gylist.get(i);
                                                    String userid = StringUtil.parseNull(m.get("USER_ID"),"");
                                                    String realname = StringUtil.parseNull(m.get("REAL_NAME"),"");
                                            %>
                                            <option value="<%=userid%>"><%=realname%></option>
                                            <%}%>

                                        </select>&nbsp;&nbsp;
                                        经&nbsp;&nbsp;营
                                        <select name="JYCLR" style="width: 100px">
                                            <%
                                                for(int i=0;i<jylist.size();i++){
                                                    Map m = (Map)jylist.get(i);
                                                    String userid = StringUtil.parseNull(m.get("USER_ID"),"");
                                                    String realname = StringUtil.parseNull(m.get("REAL_NAME"),"");
                                            %>
                                            <option value="<%=userid%>" <%if(userid.equals(bean.getJhclr())){%>selected<%}%>><%=realname%></option>
                                            <%}%>
                                        </select>&nbsp;&nbsp;
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
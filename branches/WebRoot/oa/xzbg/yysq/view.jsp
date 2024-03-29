<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
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
    OfficeYysq yysq = officeYysqDAO.queryForBean(map);
    String[] checkman =oDao.getCjhyryBySqid(sqid);
    yysq = yysq == null?new OfficeYysq():yysq;
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
		<link href="<%=request.getContextPath()%>/images/css.css" rel="stylesheet" type="text/css">
		<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet" type="text/css">
		<link href="<%=request.getContextPath()%>/js/ext/resources/css/ext-all.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" charset="GB2312"
			src="<%=request.getContextPath()%>/js/date/WdatePicker.js" defer="true"></script>
		<%--<script type="text/javascript"--%>
			<%--src="<%=request.getContextPath()%>/js/ckeditor/ckeditor.js"></script>--%>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/ext/ext-all.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/xheditor/jquery/jquery-1.4.4.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/xheditor/xheditor-1.1.14-zh-cn.min.js"></script>

		<script type="text/javascript">
            function _resizeNoPage() {
                document.getElementById("scrollDiv").style.width = document.body.clientWidth - 18;
                document.getElementById("scrollDiv").style.height = document.body.clientHeight - 50;
            }

			function CheckDateTime(object){
			   var rr=/^(?:19|20)[0-9][0-9]-(?:(?:0[1-9])|(?:1[0-2]))-(?:(?:[0-2][1-9])|(?:[1-3][0-1])) (?:(?:[0-2][0-3])|(?:[0-1][0-9])):[0-5][0-9]$/
			   if(!rr.test(object.value)){
			    	object.focus();
			 		return false;
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

			function checkForm(){
                var has = false;
                for (var i = 0; i < document.form1.ubox.length; i++) {
                    if (document.form1.ubox[i].checked) {
                        has = true;
                        break;
                    }
                }
                if (!has) {
                    alert("请选择签收用户.");
                    return;
                }
				if(document.form1.HYMC.value==""){
					document.form1.HYMC.focus();
					alert("请输入会议名称");
					return;
				}
				if(!CheckDateTime(document.form1.SQKSSJ)){
					alert("请输入正确的开始时间,例如2009-12-23 15:46");
					return;
				}
				if(!CheckDateTime(document.form1.SQJSSJ)){
					alert("请输入正确的结束时间,例如2009-12-23 15:46");
					return;
				}
				document.form1.submit();
			}
            function startup(){
                var has = false;
                for (var i = 0; i < document.form1.ubox.length; i++) {
                    if (document.form1.ubox[i].checked) {
                        has = true;
                        break;
                    }
                }
                if (!has) {
                    alert("请选择签收用户.");
                    return;
                }
                if(document.form1.HYMC.value==""){
                    document.form1.HYMC.focus();
                    alert("请输入会议名称");
                    return;
                }
                if(!CheckDateTime(document.form1.SQKSSJ)){
                    alert("请输入正确的开始时间,例如2009-12-23 15:46");
                    return;
                }
                if(!CheckDateTime(document.form1.SQJSSJ)){
                    alert("请输入正确的结束时间,例如2009-12-23 15:46");
                    return;
                }
                document.all.flag.value="startup";
                document.form1.submit();
            }
		</script>
		<script type="text/javascript" defer="true">
		
		function publicSelect(obj){
			if(obj.value=="1"){
				var bDisabled = document.form1.mustSign;
				for(var i=0; i<bDisabled.length; i++){
					document.form1.mustSign[i].disabled = false;
				}
				document.form1.mustSign[0].checked = true;
				document.form1.mustSign[1].checked = false;
				document.form1.mb3.disabled = false;
			}else{
				var bDisabled = document.form1.mustSign;
				for(var i=0; i<bDisabled.length; i++){
					document.form1.mustSign[i].disabled = true;
				}
				document.form1.mustSign[1].checked = true;
				document.form1.mustSign[0].checked = false;
				document.form1.mb3.disabled = true;
			}
		}
		
		function checkAll(obj){
			for(var i=0; i<document.form1.ubox.length; i++){
				document.form1.ubox[i].checked=obj.checked;
			}
		}
		
		function checkUnAll(){
			for(var i=0; i<document.form1.ubox.length; i++){
				document.form1.ubox[i].checked=!document.form1.ubox[i].checked;
			}
		}
		
		function mustSignSelect(obj){
			if(obj.value=="1"){
				document.form1.mb3.disabled = false;
			}else{
				document.form1.mb3.disabled = true;
			}
		}
		</script>
	</head>
	<body onload="_resizeNoPage();">
		<form action="add.jsp" name="form1" method="post">
            <input type="hidden" name="flag" value=""/>
			<table width="100%" height="25" border="0" cellpadding="0"
				cellspacing="0"
				background="<%=request.getContextPath()%>/images/mhead.jpg">
				<tr>
					<td width="3%" align="center">
						<img src="<%=request.getContextPath()%>/images/mlogo.jpg" width="11"
							height="11">
					</td>
					<td width="15%" class="mhead">
						查看用印申请
					</td>
					<td width="74%" align="left" class="mhead">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="left">
										<input type="button" class="button" id="button1" style="width: 40px"
											onclick="history.back()" value="返回">
										&nbsp;
									</td>
									<td>
									<input type="checkbox" name="checked" id="checked" value="" <%if(!"0".equals(yysq.getDxtx())){ %>checked<%}%>>短信提醒
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
                                        用印名称
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(yysq.getYymc(),"")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" width="120" class="head_left">
                                        用印部门
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%
                                            String yybm = StringUtil.parseNull(yysq.getYybm(),"");
                                            paramMap.put("orgnaId",yybm);
                                            COrgnization yyOrgnization = orgnizationDAO.queryForBean(paramMap);
                                            yyOrgnization = yyOrgnization ==null?new COrgnization():yyOrgnization;
                                        %>
                                        <%=yyOrgnization.getOrgnaName()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" width="120" class="head_left">
                                        份数<span style="color: red">&nbsp;*</span>
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%if(yysq.getFs() != null){%>
                                        <%=StringUtil.parseNull(yysq.getFs().intValue(),"")%>
                                        <%}else{%>
                                              &nbsp;
                                        <%}%>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" width="120" class="head_left">
                                        用印开始时间<span style="color: red">&nbsp;*</span>
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(yysq.getYykssj(),"")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" width="120" class="head_left">
                                        用印结束时间<span style="color: red">&nbsp;*</span>
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(yysq.getYyjssj(),"")%>
                                    </td>
                                </tr>

                                <tr>
                                    <td nowrap="nowrap" width="120" class="head_left">
                                        用印事由
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <textarea cols="80" id="YYSY" name="YYSY" rows="10" class="xheditor {submitID:'form1'}" style="width:100%"><%=StringUtil.parseNull(yysq.getYysy(),"")%></textarea>
                                    </td>
                                </tr>

                                <tr>
                                    <td nowrap="nowrap" width="120" class="head_left">
                                        备注
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <textarea cols="80" name="BZ" rows="5"><%=StringUtil.parseNull(yysq.getBz(),"")%></textarea>
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
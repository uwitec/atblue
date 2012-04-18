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
		<link href="<%=request.getContextPath()%>/css/xzbg-css.css" rel="stylesheet"
			type="text/css">
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
		CKEDITOR.replace( 'YYSY',
		{
			skin : 'office2003'
		});

		//隐藏不需要的工具按钮
		CKEDITOR.editorConfig = function( config )
		{
		    config.toolbar = 'MyToolbar';
		    config.toolbar_MyToolbar =
		    [
		        ['NewPage','Preview'],
		        ['Cut','Copy','Paste','PasteText','PasteFromWord','-'],
		        ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
		        ['Image','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
		        '/',
		        ['Styles','Format'],
		        ['Bold','Italic','Strike'],
		        ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
		        ['Link','Unlink','Anchor'],
		        ['Maximize','-','About']
		    ];
		};
		
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
						查看会议申请
					</td>
					<td width="74%" align="left" class="mhead">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="left">
                                        <input type="button" name="sign" class="button" value="签字"/>&nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="agree" value="1" checked="checked" onclick="document.getElementById('d').style.display='none';document.getElementById('a').style.display='';">同意
                                        <input type="radio" name="agree" value="0" onclick="document.getElementById('a').style.display='none';document.getElementById('d').style.display='';">不同意

                                        <span id="a">
                                            <%
                                                String nextRole = workFlow.getNextRoleName(StringUtil.parseNull(yysq.getConnectId(),""),"1");
                                                String options = workFlow.getNextUserSelectOptions(nextRole,orgId);
                                        %>
                                            <%if(!"结束".equals(nextRole)){ %>
                                            发送给&nbsp; <%=nextRole%>
                                             <select name="agreed">
                                            <%=options%>
                                         </select>  处理！
                                            <% }else{
                                            %>
                                            结束审批！
                                            <input type="hidden" name="agreed" value=""/>
                                            <%     }%>
                                       </span>
                                        <span id="d"  style="display: none">
                                            发送给
                                        <select name="disagreed">
                                            <%
                                                nextRole = workFlow.getNextRoleName(StringUtil.parseNull(yysq.getConnectId(),""),"-1");
                                                options = workFlow.getNextUserSelectOptions(nextRole,orgId);
                                            %>
                                            <%if(!"会议申请".equals(nextRole)){ %>
                                                    <%=options%>
                                            <% }else{ 
                                            Map m = new HashMap();
                                             m.put("userId",yysq.getYyr()) ;
                                             CUser u = userDAO.queryForBean(m);
                                              u = u ==null?new CUser():u;
                                            %>
                                               <option value="<%=u.getUserId()%>"><%=u.getRealName()%></option>
                                            <%     }%>
                                        </select> 处理！</span>

                                        <input type="button" class="button"
                                               onclick="tj('<%=yysq.getSqid()%>','<%=yysq.getProcessId()%>','<%=yysq.getConnectId()%>');" value="提交">
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
							style="width: 1000px; overflow: auto; cursor: default; display: inline; position: absolute; height: 200px;">
							<table width="100%" border="0" align="center" cellpadding="0"
								cellspacing="0" class="mtabtab" id="mtabtab">
                                <tr>
                                    <td nowrap="nowrap" width="120" class="NormalColumnTitle">
                                        用印名称
                                    </td>
                                    <td class="NormalDataColumn" align="left">
                                        &nbsp;&nbsp;
                                        <%=StringUtil.parseNull(yysq.getYymc(),"")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" width="120" class="NormalColumnTitle">
                                        用印部门
                                    </td>
                                    <td class="NormalDataColumn" align="left">
                                        &nbsp;&nbsp;
                                        <%=StringUtil.parseNull(cOrgnization.getOrgnaName(),"")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" width="120" class="NormalColumnTitle">
                                        份数<span style="color: red">&nbsp;*</span>
                                    </td>
                                    <td class="NormalDataColumn" align="left">
                                        &nbsp;&nbsp;
                                        <%=StringUtil.parseNull(yysq.getFs(),"")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" width="120" class="NormalColumnTitle">
                                        用印开始时间<span style="color: red">&nbsp;*</span>
                                    </td>
                                    <td class="NormalDataColumn" align="left">
                                        &nbsp;&nbsp;
                                        <%=StringUtil.parseNull(yysq.getYykssj(),"")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" width="120" class="NormalColumnTitle">
                                        用印结束时间<span style="color: red">&nbsp;*</span>
                                    </td>
                                    <td class="NormalDataColumn" align="left">
                                        &nbsp;&nbsp;
                                        <%=StringUtil.parseNull(yysq.getYyjssj(),"")%>
                                    </td>
                                </tr>

                                <tr>
                                    <td nowrap="nowrap" width="120" class="NormalColumnTitle">
                                        用印事由
                                    </td>
                                    <td class="NormalDataColumn" align="left">
                                        <textarea cols="80" id="YYSY" name="YYSY" rows="10"><%=StringUtil.parseNull(yysq.getYysy(),"")%></textarea>
                                    </td>
                                </tr>

                                <tr>
                                    <td nowrap="nowrap" width="120" class="NormalColumnTitle">
                                        备注
                                    </td>
                                    <td class="NormalDataColumn" align="left">
                                        &nbsp;&nbsp;
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
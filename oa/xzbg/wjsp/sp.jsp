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
    String documentid = StringUtil.parseNull(request.getParameter("documentid"),"");
    Map map = new HashMap();
    map.put("documentid",documentid);
    OfficeWjsp wjsp = officeWjspDAO.queryForBean(map);
    List hasFileList = officeFileDAO.getByFk(documentid);
    wjsp = wjsp == null?new OfficeWjsp():wjsp;
     List userList  = dao.getAllUser();
    String connectId = StringUtil.parseNull(wjsp.getConnectId(),"");
    String processId = StringUtil.parseNull(wjsp.getProcessId(),"");
    List orgTreeList = dao.getSelectOrgTrees();
    orgTreeList = orgTreeList == null?new ArrayList():orgTreeList;
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
		<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet"  type="text/css">
		<link href="<%=request.getContextPath()%>/images/css.css" rel="stylesheet"  type="text/css">
		<script type="text/javascript" charset="GB2312"
			src="<%=request.getContextPath()%>/js/date/WdatePicker.js" defer="true"></script>
        <script type="text/javascript" charset="GB2312"
                src="<%=request.getContextPath()%>/js/prototype.js"></script>
		
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

		<script type="text/javascript">
            function tj(sid,pid,cid){
                var v = document.all.agree;
                var nextUserId = "";
                var varValue = "";
                 if(document.form1.qzgz.value !="isSign"){
				 	alert("本次需要审核的文档中没有您的签名印章，请签名后重新提交。");
				    return false;
		     	}
                if(v[0].checked && v[0].value == '1'){
                    nextUserId = document.all.agreed.value;
                    varValue = "1";
                }else{
                    nextUserId = document.all.disagreed.value;
                    varValue = "-1";
                }
               window.location = "tj.jsp?type=1&selUserId="+nextUserId+"&connectId="+cid+"&documentid="+sid+"&processId="+pid+"&varValue="+varValue;
            }
            function doSave(){
                //动态屏蔽
                if(document.form1.bgshg.value==""){
                    document.form1.bgshg.focus();
                    alert("请输入办公室核稿人");
                    return;
                }
                if(document.form1.gyfs.value==""){
                    document.form1.gyfs.focus();
                    alert("请输入份数");
                    return;
                }
                if(document.form1.fa.value==""){
                    document.form1.fa.focus();
                    alert("请输入发送对象");
                    return;
                }
                var url = "save.jsp";
                var pars = "";
                var myAjax = new Ajax.Request(
                        url,
                        {method: 'post', parameters: Form.serialize(document.forms[0]), onComplete: prototype_response}
                );

            }
            function prototype_response(response){
               alert("保存成功!");
            }
            function qz(){
                window
                        .open(
                        "<%=request.getContextPath()%>/oa/qpd/qpd.jsp?formId=20b9a84e-51ab-4af8-9a59-e11316bfc5c9&connectId=<%=connectId%>&processId=<%=processId%>",
                        "mywindow",
                        "height="
                                + 700
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
	<body onload="_resizeNoPage();">
		<form action="add.jsp" name="form1" method="post">
			<input type="hidden" name="qzgz" id="qzgz">
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
						文件审批
					</td>
					<td width="74%" align="left" class="mhead">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="left">
                                        <input type="button" name="sign" class="button" value="签字" onclick="qz();"/>&nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="agree" value="1" checked="checked" onclick="document.getElementById('d').style.display='none';document.getElementById('a').style.display='';">同意
                                        <input type="radio" name="agree" value="0" onclick="document.getElementById('a').style.display='none';document.getElementById('d').style.display='';">不同意
                                        <font style="font-size: 12px">
                                        <span id="a">
                                            <%
                                                String nextRole = workFlow.getNextRoleName(StringUtil.parseNull(wjsp.getConnectId(),""),"1");
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
                                                nextRole = workFlow.getNextRoleName(StringUtil.parseNull(wjsp.getConnectId(),""),"-1");
                                                options = workFlow.getNextUserSelectOptions(nextRole,orgId);
                                            %>
                                            <%if(!"发起单位".equals(nextRole)){ %>
                                                    <%=options%>
                                            <% }else{ 
                                            Map m = new HashMap();
                                             m.put("userId",wjsp.getSqr()) ;
                                             CUser u = userDAO.queryForBean(m);
                                    u = u ==null?new CUser():u;
                                    %>
                                    <option value="<%=u.getUserId()%>"><%=u.getRealName()%></option>
                                    <%     }%>
                                    </select> 处理！</span>
                                    </font>
                                    <input type="button" class="button"
                                           onclick="tj('<%=wjsp.getDocumentid()%>','<%=wjsp.getProcessId()%>','<%=wjsp.getConnectId()%>');" value="提交">
                                    <input type="button" class="button" id="button1"
                                           onclick="history.back()" value="返回">
                                    </td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</table>
            <%
                if("党政办公室".equals(cOrgnization.getOrgnaName())){  %>
            <table width="100%">
                <tr>
                    <td>
                        <table width="100%" border="0" align="center" cellpadding="0"
                               cellspacing="0" class="mtabtab">
                            <tr>
                                <td nowrap="nowrap" width="120" class="head_left">
                                    办公室核稿<span style="color: red">&nbsp;*</span>
                                </td>
                                <td class="head_right" style="text-align: left">
                                    <input type="text" name="bgshg" class="inputStyle"
                                           style="width: 200px;" value="<%=StringUtil.parseNull(wjsp.getBgshg(),"")%>">&nbsp;
                                </td>
                                <td nowrap="nowrap" width="120" class="head_left">
                                    份数<span style="color: red">&nbsp;*</span>
                                </td>
                                <td class="head_right" style="text-align: left">
                                    <input type="text" name="gyfs" class="inputStyle"
                                           style="width: 60px;" maxlength="20" value="<%=StringUtil.parseNull(wjsp.getGyfs(),"")%>">&nbsp;
                                </td>

                                <td nowrap="nowrap" width="120" class="head_left">
                                    发送<span style="color: red">&nbsp;*</span>
                                </td>
                                <td class="head_right" style="text-align: left">
                                    <input type="text" name="fa" class="inputStyle"
                                           style="width: 500px;" value="<%=StringUtil.parseNull(wjsp.getFa(),"")%>">&nbsp;
                                    <input type="button" value="保存" onclick="doSave()"/>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <% }else{ %>
            <table width="100%">
                <tr>
                    <td>
                        <table width="100%" border="0" align="center" cellpadding="0"
                               cellspacing="0" class="mtabtab">
                            <tr>
                                <td nowrap="nowrap" width="120" class="head_left">
                                    办公室核稿
                                </td>
                                <td class="head_right" style="text-align: left">
                                    <%=StringUtil.parseNull(wjsp.getBgshg(),"")%> &nbsp;
                                </td>
                                <td nowrap="nowrap" width="120" class="head_left">
                                    份数
                                </td>
                                <td class="head_right" style="text-align: left">
                                    <%=StringUtil.parseNull(wjsp.getGyfs(),"")%> &nbsp;
                                </td>

                                <td nowrap="nowrap" width="120" class="head_left">
                                    发送
                                </td>
                                <td class="head_right" style="text-align: left">
                                    <%=StringUtil.parseNull(wjsp.getFa(),"")%> &nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <%   }

            %>

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
										文件标题
									</td>
									<td class="head_right" style="text-align: left">
                                        <input type="hidden" name="documentid" value="<%=StringUtil.parseNull(wjsp.getDocumentid(),"")%>"  style="width:500px"/>
                                        <%=StringUtil.parseNull(wjsp.getBt(),"")%>&nbsp;
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										发文类型
									</td>
									<td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(wjsp.getLb(),"")%> &nbsp;
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										文件编号
									</td>
									<td class="head_right" style="text-align: left">
										 <%=StringUtil.parseNull(wjsp.getWjbh(),"")%> &nbsp;
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										密级
									</td>
									<td class="head_right" style="text-align: left">
										 <%=StringUtil.parseNull(wjsp.getMmcd(),"")%>&nbsp;
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										缓急时限
									</td>
									<td class="head_right" style="text-align: left">
										 <%=StringUtil.parseNull(wjsp.getHjsx(),"")%>&nbsp;
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										签发日期
									</td>
									<td class="head_right" style="text-align: left">
										 <%=StringUtil.parseNull(wjsp.getQfrq(),"")%>&nbsp;
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
                                        主办单位
									</td>
									<td class="head_right" style="text-align: left">
                                        <%
                                            paramMap.put("orgnaId",wjsp.getNgbm());
                                            COrgnization cOrgnization1 = orgnizationDAO.queryForBean(paramMap);
                                            cOrgnization1 = cOrgnization1 == null?new COrgnization():cOrgnization1;
                                        %>
                                        <%=StringUtil.parseNull(cOrgnization1.getOrgnaName(),"")%>&nbsp;
                                    </td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										备注
									</td>
									<td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(wjsp.getBz(),"")%>&nbsp;
									</td>
								</tr>
                                <%if(hasFileList!=null && hasFileList.size()>0){ %>
                                <tr>
                                    <td nowrap="nowrap" width="120" class="head_left">
                                        已有附件
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%
                                            for(int i=0; i<hasFileList.size(); i++){
                                                OfficeFile beanFile = (OfficeFile)hasFileList.get(i);%>
                                        <a href="<%=request.getContextPath()%>/officeFileDownload?pkid=<%=beanFile.getPkid() %>" >
                                            <img src="<%=request.getContextPath()%>/fileIco/<%=beanFile.getWjlx() %>.png" onerror="this.src='<%=request.getContextPath()%>/fileIco/other.png'" style="cursor: pointer;" border="0" alt="<%=beanFile.getWjm() %>(<%=StringUtil.getFileSize(beanFile.getWjcc().doubleValue()) %>)"><%=beanFile.getWjm() %>
                                        </a>&nbsp;&nbsp;&nbsp;
                                        <a href="javascript:delFile('<%=beanFile.getPkid() %>','<%=documentid %>')">[删除]</a></br>
                                        <%}%>
                                    </td>
                                </tr>
                                <%} %>
							</table>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
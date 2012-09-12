<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ include file="../../../import.jsp"%>
<%

    CUser cUser = (CUser)session.getAttribute("cUser");
    cUser = cUser == null?new CUser():cUser;
    String orgId = cUser.getOrgnaId();

    String pkid = StringUtil.parseNull(request.getParameter("pkid"),"");
    Map map = new HashMap();
    map.put("pkid",pkid);
     Map map1 = new HashMap();
    map1.put("fkid",pkid);
    List list = officePlanDAO.queryForList(map1); 
    OfficePlanProcess officePlanProcess = officePlanProcessDAO.queryForBean(map);
    officePlanProcess = officePlanProcess == null?new OfficePlanProcess():officePlanProcess;
    String connectId = StringUtil.parseNull(officePlanProcess.getConnectId(),"");
    String processId = StringUtil.parseNull(officePlanProcess.getProcessId(),"");
    Map paramMap = new HashMap();
    paramMap.put("orgnaId",officePlanProcess.getBm());
    COrgnization cOrgnization = orgnizationDAO.queryForBean(paramMap);
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
		<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet"  type="text/css">
		<link href="<%=request.getContextPath()%>/images/css.css" rel="stylesheet"  type="text/css">
		<link href="<%=request.getContextPath()%>/js/ext/resources/css/ext-all.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" charset="GB2312"
			src="<%=request.getContextPath()%>/js/date/WdatePicker.js" defer="true"></script>
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
               window.location = "tj.jsp?type=1&selUserId="+nextUserId+"&connectId="+cid+"&pkid="+sid+"&processId="+pid+"&varValue="+varValue;
            }
            function qz(){
                window
                        .open(
                        "<%=request.getContextPath()%>/oa/qpd/qpd.jsp?formId=855a093f-7777-43bb-9512-a05cfb03bf03&connectId=<%=connectId%>&processId=<%=processId%>",
                        "mywindow",
                        "height="
                                + 800
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
            <input type="hidden" name="flag" value=""/>
            <input type="hidden" name="qzgz" id="qzgz">
			<table width="100%" height="25" border="0" cellpadding="0"
				cellspacing="0"
				background="<%=request.getContextPath()%>/images/mhead.jpg">
				<tr>
					<td width="3%" align="center">
						<img src="<%=request.getContextPath()%>/images/mlogo.jpg" width="11"
							height="11">
					</td>
					<td width="15%" class="mhead">
						查看预计划费用支出表
					</td>
					<td width="74%" align="left" class="mhead">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="left">
                                        <input type="button" name="sign" class="button" value="签字" onclick="qz();"/>&nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="agree" value="1" checked="checked" onclick="document.getElementById('d').style.display='none';document.getElementById('a').style.display='';">同意
                                        <input type="radio" name="agree" value="0" onclick="document.getElementById('a').style.display='none';document.getElementById('d').style.display='';">不同意

                                        <span id="a">
                                            <%
                                                String nextRole = workFlow.getNextRoleName(StringUtil.parseNull(officePlanProcess.getConnectId(), ""),"1");
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
                                                nextRole = workFlow.getNextRoleName(StringUtil.parseNull(officePlanProcess.getConnectId(),""),"-1");
                                                options = workFlow.getNextUserSelectOptions(nextRole,orgId);
                                            %>
                                            <%if(!"申请人".equals(nextRole)){ %>
                                                    <%=options%>
                                            <% }else{ 
                                            Map m = new HashMap();
                                             m.put("userId",officePlanProcess.getSqr()) ;
                                             CUser u = userDAO.queryForBean(m);
                                              u = u ==null?new CUser():u;
                                            %>
                                               <option value="<%=u.getUserId()%>"><%=u.getRealName()%></option>
                                            <%     }%>
                                        </select> 处理！</span>

                                        <input type="button" class="button"
                                               onclick="tj('<%=officePlanProcess.getPkid()%>','<%=officePlanProcess.getProcessId()%>','<%=officePlanProcess.getConnectId()%>');" value="提交">
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
						cellspacing="0" id="tab_id" class="mtabtab">
						<tr class="form_th">
						<th  nowrap="nowrap" width="80">
						序号
					</th>
					<th  nowrap="nowrap" width="80">
						负责部门
					</th>
					<th  nowrap="nowrap" width="80">
						费用名称
					</th>
					<th  nowrap="nowrap" width="80">
						费用项目
					</th>
					<th  nowrap="nowrap" width="80">
						项目明细
					</th>
					<th  nowrap="nowrap" width="80">
						型号规格
					</th>
					<th nowrap="nowrap"  width="80">
						单位
					</th>
					<th nowrap="nowrap"  width="40">
						单价<br>(元)
					</th>
					<th nowrap="nowrap"  width="50">
						单价<br>(万元)
					</th>
					<th nowrap="nowrap"  width="40">
						数量
					</th>
					<th nowrap="nowrap"  width="50">
						预计划<br>费用
					</th>
					<th nowrap="nowrap"  width="80">
						定价依据
					</th>
					<th nowrap="nowrap"  width="80">
						推荐服务厂商1
					</th>
					<th nowrap="nowrap"  width="80">
						有无市场准入证
					</th>
					<th nowrap="nowrap"  width="80">
						推荐服务厂商2
					</th>
					<th nowrap="nowrap"  width="80">
						有无市场准入证
					</th>
					<th nowrap="nowrap"  width="80">
						发生<br>年月
					</th>
					<th nowrap="nowrap"  width="80">
						备注
					</th>
					</tr>
					<%for(int i=0;i<list.size();i++){ 
						OfficePlan officePlan = (OfficePlan)list.get(i);
					%>
						<tr>
							<td  style="text-align: center;border-left: 1px solid #01a0fe;" >
								<%=i + 1%>
							</td>
							<td>
								<%=StringUtil.parseNull(cOrgnization.getOrgnaName(),"&nbsp;") %>
							</td>
							<td>
								<%=StringUtil.parseNull(officePlan.getMc(),"&nbsp;") %>
							</td>
							<td>
								<%=StringUtil.parseNull(officePlan.getXm(),"&nbsp;") %>
							</td>
							<td>
								<%=StringUtil.parseNull(officePlan.getXmmx(),"&nbsp;") %>
							</td>
							<td>
								<%=StringUtil.parseNull(officePlan.getGg(),"&nbsp;") %>
							</td>
							<td>
								<%=StringUtil.parseNull(officePlan.getDw(),"&nbsp;") %>
							</td>
							<td>
								<%=StringUtil.parseNull(officePlan.getDj(),"&nbsp;") %>
							</td>
							<td>
								<%=StringUtil.parseNull(officePlan.getDj_w(),"&nbsp;") %>
							</td>
							<td>
								<%=StringUtil.parseNull(officePlan.getSl(),"&nbsp;") %>
							</td>
							<td>
								<%=StringUtil.parseNull(officePlan.getFy(),"&nbsp;") %>
							</td>
							<td>
								<%=StringUtil.parseNull(officePlan.getDjyj(),"&nbsp;") %>
							</td>
							<td>
								<%=StringUtil.parseNull(officePlan.getTjfwcs(),"&nbsp;") %>
							</td>
							<td>
								<%=StringUtil.parseNull(officePlan.getYwsczrz(),"&nbsp;") %>
							</td>
							<td>
								<%=StringUtil.parseNull(officePlan.getTjfwcs2(),"&nbsp;") %>
							</td>
							<td>
								<%=StringUtil.parseNull(officePlan.getYwsczrz2(),"&nbsp;") %>
							</td>
							<td>
								<%=StringUtil.parseNull(officePlan.getNy(),"&nbsp;") %>
							</td>
							<td>
								<%=StringUtil.parseNull(officePlan.getBz(),"&nbsp;") %>
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
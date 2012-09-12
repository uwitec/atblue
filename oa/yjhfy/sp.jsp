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
    String sqid = StringUtil.parseNull(request.getParameter("sqid"),"");
    Map map = new HashMap();
    map.put("sqid",sqid);
    JyglYjhfy bean = jyglYjhfyDAO.queryForBean(map);
    bean = bean == null?new JyglYjhfy():bean;
    String connectId = StringUtil.parseNull(bean.getConnectId(),"");
    String processId = StringUtil.parseNull(bean.getProcessId(),"");
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
		<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet"  type="text/css">
		<link href="<%=request.getContextPath()%>/images/css.css" rel="stylesheet"  type="text/css">
		<link href="<%=request.getContextPath()%>/js/ext/resources/css/ext-all.css" rel="stylesheet" type="text/css">
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
               window.location = "tj.jsp?type=1&selUserId="+nextUserId+"&connectId="+cid+"&sqId="+sid+"&processId="+pid+"&varValue="+varValue;
            }
            function qz(){
                window
                        .open(
                        "<%=request.getContextPath()%>/oa/qpd/qpd.jsp?formId=6cf1b420-6beb-4aa2-9ea3-567b2547405e&connectId=<%=connectId%>&processId=<%=processId%>",
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
						查看预计划费用申请
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
                                                String nextRole = workFlow.getNextRoleName(StringUtil.parseNull(bean.getConnectId(), ""),"1");
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
                                                nextRole = workFlow.getNextRoleName(StringUtil.parseNull(bean.getConnectId(),""),"-1");
                                                options = workFlow.getNextUserSelectOptions(nextRole,orgId);
                                            %>
                                            <%if(!"申请人".equals(nextRole)){ %>
                                                    <%=options%>
                                            <% }else{ 
                                            Map m = new HashMap();
                                             m.put("userId",bean.getSqr()) ;
                                             CUser u = userDAO.queryForBean(m);
                                              u = u ==null?new CUser():u;
                                            %>
                                               <option value="<%=u.getUserId()%>"><%=u.getRealName()%></option>
                                            <%     }%>
                                        </select> 处理！</span>

                                        <input type="button" class="button"
                                               onclick="tj('<%=bean.getSqid()%>','<%=bean.getProcessId()%>','<%=bean.getConnectId()%>');" value="提交">
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
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        负责部门
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getFzbm(),"&nbsp;")%>
                                    </td>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        季度
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getJd(),"&nbsp;")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        费用名称
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getFymc(),"&nbsp;")%>
                                    </td>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        费用项目
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getFyxm(),"&nbsp;")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        项目明细
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getXmmx(),"&nbsp;")%>
                                    </td>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        型号规格
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getXhgz(),"&nbsp;")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        单位
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getDw(),"&nbsp;")%>
                                    </td>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        单价（元）
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getDj(),"&nbsp;")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        单价（万元）
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getDj2(),"&nbsp;")%>
                                    </td>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        数量
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getSl(),"&nbsp;")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        预计费用（万元）
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getYjfy(),"&nbsp;")%>
                                    </td>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        定价依据
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getDjyj(),"&nbsp;")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        推荐服务厂商
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getTjfwcs1(),"&nbsp;")%>
                                    </td>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        有无市场准入证
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getYwzrz1(),"&nbsp;")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        推荐服务厂商
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getTjfwcs2(),"&nbsp;")%>
                                    </td>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        有无市场准入证
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getYwzrz2(),"&nbsp;")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        发生月份
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getFsyf(),"&nbsp;")%>
                                    </td>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        备注
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getBz(),"&nbsp;")%>
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
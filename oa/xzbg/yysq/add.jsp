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
    cOrgnization = cOrgnization == null?new COrgnization():cOrgnization;
	if (request.getMethod().equals("POST")) {
        String YYMC = StringUtil.parseNull(request.getParameter("YYMC"),"");
        String YYBM = StringUtil.parseNull(request.getParameter("YYBM"),"");
        String YYSY = StringUtil.parseNull(request.getParameter("YYSY"),"");
        String BZ = StringUtil.parseNull(request.getParameter("BZ"),"");
        String YYKSSJ = StringUtil.parseNull(request.getParameter("YYKSSJ"),"");
        String YYJSSJ = StringUtil.parseNull(request.getParameter("YYJSSJ"),"");
        String FS = StringUtil.parseNull(request.getParameter("FS"),"");
        String flag = StringUtil.parseNull(request.getParameter("flag"),"");
        String dxtx = StringUtil.parseNull(request.getParameter("dxtx"),"");
        OfficeYysq officeYysq = new  OfficeYysq();
        officeYysq.setSqid(StringUtil.getUUID());
        officeYysq.setBz(BZ);
        officeYysq.setYymc(YYMC);
        officeYysq.setYybm(YYBM);
        officeYysq.setYysy(YYSY);
        officeYysq.setSqzt("已保存");
        officeYysq.setDxtx(dxtx);
        officeYysq.setSqsj(new java.util.Date());
        if(!StringUtil.isBlankOrEmpty(FS)){
            officeYysq.setFs(Double.valueOf(FS));
        }
        if(cUser != null)
            officeYysq.setYyr(cUser.getUserId());
        if(!StringUtil.isBlankOrEmpty(YYKSSJ)){
            officeYysq.setYykssj(DateUtil.parse(YYKSSJ));
        }
        if(!StringUtil.isBlankOrEmpty(YYJSSJ)){
            officeYysq.setYyjssj(DateUtil.parse(YYJSSJ));
        }
        if("startup".equals(flag)){
            officeYysq.setSqzt("已申请");
            //创建流程代码在这里
            Status status = workflow.startWorkflow("06cb3db8-36c2-4f1e-bbf3-db5809037f74",cUser.getUserId());
            officeYysq.setProcessId(status.getProcessId());
            officeYysq.setConnectId(status.getConnectId());
        }
        officeYysqDAO.addOfficeYysq(officeYysq);
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
				if(document.form1.YYMC.value==""){
					document.form1.YYMC.focus();
					alert("请输入用印名称");
					return;
				}
				if(document.getElementById("checked").checked){
                	 document.all.dxtx.value="1";
                }else if(!document.getElementById("checked").checked){
                	document.all.dxtx.value="0";
                }
				document.form1.submit();
			}
            function startup(){
                if(document.form1.YYMC.value==""){
                    document.form1.YYMC.focus();
                    alert("请输入用印名称");
                    return;
                }
                 if(document.getElementById("checked").checked){
                	 document.all.dxtx.value="1";
                }else if(!document.getElementById("checked").checked){
                	document.all.dxtx.value="0";
                }
                document.all.flag.value="startup";
                document.form1.submit();
            }
		</script>
		<script type="text/javascript" defer="true">
		CKEDITOR.replace('YYSY',
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
						新建用印申请
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
										用印名称<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" style="text-align: left">
                                        <input type="text" name="YYMC" value=""  style="width:500px"/>
                                        <input type="checkbox" name="checked" id="checked" value="1">短信提醒
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										用印部门<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" style="text-align: left">
                                        <input type="hidden" name="YYBM" value="<%=StringUtil.parseNull(orgId,"")%>"/><%=StringUtil.parseNull(cOrgnization.getOrgnaName(),"")%>
									</td>
								</tr>
                                <tr>
                                    <td nowrap="nowrap" width="120" class="head_left">
                                        份数<span style="color: red">&nbsp;*</span>
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="FS" value=""  style="width:500px" onkeyup="this.value=this.value.replace(/[^\d\.]+?/g, '')"/>
                                    </td>
                                </tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										用印开始时间<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" style="text-align: left">
										<input type="text"
											onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
											name="YYKSSJ" class="Wdate" style="width: 200px;">
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
                                        用印结束时间<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" style="text-align: left">
										<input type="text"
											onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
											name="YYJSSJ" class="Wdate" style="width: 200px;">
									</td>
								</tr>

								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
                                        用印事由
									</td>
									<td class="head_right" style="text-align: left">
										<textarea cols="80" id="YYSY" name="YYSY" rows="10"></textarea>
									</td>
								</tr>

								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										备注
									</td>
									<td class="head_right" style="text-align: left">
                                        <textarea cols="80"name="BZ" rows="5"></textarea>
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
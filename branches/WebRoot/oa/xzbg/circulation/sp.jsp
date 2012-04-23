<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Date"%>
<%@ include file="../../../import.jsp"%>
<%
OfficeCirculationDAO officeCirculationDAO = (OfficeCirculationDAO)SpringFactory.instance.getBean("officeCirculationDAO");
	OfficeCirculationCheckDAO officeCirculationCheckDAO = (OfficeCirculationCheckDAO)SpringFactory.instance.getBean("officeCirculationCheckDAO");
	String pkid = request.getParameter("pkid");
	
	List hasFileList = officeFileDAO.getByFk(pkid);
	OfficeCirculation document = officeCirculationDAO.selectByPrimaryKey(pkid); 
	List allUserList = dao.getAllUser();
	
	
	if (request.getMethod().equals("POST")) {
		
		String messageid = request.getParameter("messageid");
		if(messageid !=null && !messageid.equals("")){
			UMessage _message = uMessageDAO.findById(messageid);
			_message.setFlag(1);
			_message.setReceivetime(DateUtil.getDateTime());
			uMessageDAO.update(_message);
		}
				

		String nbyj = request.getParameter("nbyj");
		String ldps = request.getParameter("ldps");
		String clyj = request.getParameter("clyj");
		String zyld = request.getParameter("zyld");
		document.setClyj(clyj);
		officeCirculationDAO.updateByPrimaryKey(document);
		String[] ubox = request.getParameterValues("ubox");
			StringBuilder sb = new StringBuilder("");
			for(int i=0; i<ubox.length; i++){
				if(i==0){
					sb.append(ubox[i]);
				}else{
					sb.append("&").append(ubox[i]);
				}
			} 
		out.print("<script>");
		out.print("window.location='check_index.jsp';");
		out.print("</script>");
	} 

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
	<script src="<%=contentPath%>/js/common.js"
			type="text/javascript" defer="defer"></script>
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
			function checkForm(act){
				document.form1.submit();
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
			
			
		</script>
		<script type="text/javascript">
			Ext.onReady(function(){
			    var win;
			    var button = Ext.get('mb3');
			
			    button.on('click', function(){
			        // create the window on the first click and reuse on subsequent clicks
			        if(!win){
			            win = new Ext.Window({
			                applyTo:'hello-win',
			                layout:'fit',
			                width:500,
			                height:400,
			                closeAction:'hide',
			                plain: true,
							pageX:100, 
							pageY:100,
							items: new Ext.TabPanel({
			                    applyTo: 'hello-tabs',
			                    autoTabs:true,
			                    activeTab:0,
			                    deferredRender:false,
			                    border:false
			                }),
			                buttons: [{
			                    text:'确定',
			                    handler: function(){
			                    	document.form1.mb3.value = "";
			                    	for(var i=0; i<document.form1.ubox.length; i++){
			                    		if(document.form1.ubox[i].checked){
			                    			document.form1.mb3.value+=document.form1.ubox[i].title + ";";
			                    		}
										//document.form1.ubox[i].checked=obj.checked;
									}
			                        win.hide();
			                    }
			                },{
			                    text: '关闭',
			                    handler: function(){
			                        win.hide();
			                    }
			                }]
			            });
			        }
			        win.show(this);
			    });
			});
		</script>
	</head>
	<body onload="_resizeNoPage();">
		<form  name="form1" method="post">
			<input type="hidden" name="act" value="">
			<div id="hello-win" class="x-hidden">
				<div id="hello-tabs">
			        <div class="x-tab" title="请选择传阅领导">
			            <table border="0" width="100%">
			            		<tr>
			            			<td colspan="6" align="left">
			            				<input type="checkbox" name="allBox" onclick="checkAll(this);">全选&nbsp;
			            				<input type="checkbox" name="allBox" onclick="checkUnAll();">反选&nbsp;
			            				<hr width="100%">
			            			</td>
			            		</tr>
				            	<%for(int i=0; i<allUserList.size(); i++){
				            		CUser u = (CUser)allUserList.get(i);
				            		if(i==0){	
				            	%>
				            	<tr>
				            		<td><input type="checkbox" name="ubox" value="<%=u.getUserId() %>" title="<%=u.getRealName() %>"><%=u.getRealName() %></td>
				            	<%	}else if(i%6==0){ %>
				            	</tr>
				            	<tr>
				            		<td><input type="checkbox" name="ubox" value="<%=u.getUserId() %>" title="<%=u.getRealName() %>"><%=u.getRealName() %></td>
				            	<%	}else{ %>
				            		<td><input type="checkbox" name="ubox" value="<%=u.getUserId() %>" title="<%=u.getRealName() %>"><%=u.getRealName() %></td>
				            	<%	} %>
				            	<%} %>
				            	<%
				            	if(allUserList.size()%6!=0){
					            	for(int i=0; i<allUserList.size()%4-1; i++){%>
					            		<td>&nbsp;</td>
					            	<%}%>
					            </tr>
					            <%}%>
			            </table>
			        </div>
	    		</div>
			</div>
			<table width="100%" height="25" border="0" cellpadding="0"
				cellspacing="0"
				background="<%=contentPath%>/images/mhead.jpg">
				<tr>
					<td width="3%" align="center">
						<img src="<%=contentPath%>/images/mlogo.jpg" width="11"
							height="11">
					</td>
					<td width="15%" class="mhead">
						来文传阅
					</td>
					<td width="74%" align="left" class="mhead">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="left">
										<input type="button" class="button" id="button"
											onclick="checkForm('save');" value="保存">
										&nbsp;
										<input type="button" class="button" id="button"
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
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										来文时间
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<%=DateUtil.format(document.getLwsj(),"yyyy-MM-dd") %>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										来文单位
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<%=StringUtil.parseNull(document.getLwdw(),"") %>
									</td>
								</tr>
								
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										文件编号
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<%=StringUtil.parseNull(document.getWjbh(),"") %>
									</td>
								</tr>

								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										文件名称
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<%=StringUtil.parseNull(document.getWjmc(),"") %>
									</td>
								</tr>
								
								<%if(hasFileList!=null && hasFileList.size()>0){ %>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										附件
									</td>
									<td class="NormalDataColumn" align="left" id="hasFile">
										&nbsp;&nbsp;
										<%
											for(int i=0; i<hasFileList.size(); i++){
												OfficeFile beanFile = (OfficeFile)hasFileList.get(i);%>
											<a href="../../officeFileDownload?pkid=<%=beanFile.getPkid() %>" >
												<img src="<%=contentPath%>/fileIco/<%=beanFile.getWjlx() %>.png" onerror="this.src='<%=contentPath%>/fileIco/other.png'" style="cursor: pointer;" border="0" alt="<%=beanFile.getWjm() %>(<%=StringUtil.getFileSize(beanFile.getWjcc().doubleValue()) %>)"><%=beanFile.getWjm() %>
											</a>&nbsp;&nbsp;&nbsp;
									     <%}%>
									</td>
								</tr>
								<%} %>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										处理意见
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<textarea rows="5" name="clyj" cols="50"></textarea>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										传阅公司领导及相关人员
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<input id="mb3" type="text" name="checkman" style="width: 400px;" readonly="readonly" class="inputStyle">
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
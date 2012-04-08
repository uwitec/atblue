
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Date"%>
<%@ include file="../../../import.jsp"%>
<%
	String noticeid = request.getParameter("noticeid");
	OfficeNotice on = officeNoticeDAO.selectByPrimaryKey(noticeid);
	String[] checkman = officeNoticeCheckDAO.getCheckUsersByNoticeid(noticeid);
	List hasFileList = officeFileDAO.getByFk(noticeid);
	
	List checkList = officeNoticeCheckDAO.getCheckByNoticeid(noticeid);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
        <script src="<%=request.getContextPath()%>/js/common.js"
                type="text/javascript" defer="defer"></script>
        <link href="<%=request.getContextPath()%>/css/xzbg-css.css" rel="stylesheet"
              type="text/css">
        <link href="<%=request.getContextPath()%>/js/ext/ /css/ext-all.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" charset="GB2312"
                src="<%=request.getContextPath()%>/js/date/WdatePicker.js" defer="defer"></script>
        <script type="text/javascript"
                src="<%=request.getContextPath()%>/js/ckeditor/ckeditor.js"></script>
        <script type="text/javascript"
                src="<%=request.getContextPath()%>/js/ext/adapter/ext/ext-base.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/ext/ext-all.js"></script>
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
			                height:300,
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
			<div id="hello-win" class="x-hidden">
				<div id="hello-tabs">
			        <div class="x-tab" title="以下用户需要签收该通知">
			            <table border="0" width="100%">
			            		<tr>
			            			<td colspan="4" align="left">
			            				<hr width="100%">
			            			</td>
			            		</tr>
				            	<%for(int i=0; i<checkList.size(); i++){
				            		OfficeNoticeCheck u = (OfficeNoticeCheck)checkList.get(i);
				            		CUser _tUser = dao.findUserById(u.getCheckman());
				            		if(i==0){	
				            	%>
				            	<tr>
				            		<td><input type="checkbox" name="ubox" <%if(u.getCheckflag()!=null && u.getCheckflag().equals("1")){ %> checked="checked"<%} %> disabled="disabled"><%=_tUser.getRealName() %></td>
				            	<%	}else if(i%4==0){ %>
				            	</tr>
				            	<tr>
				            		<td><input type="checkbox" name="ubox" <%if(u.getCheckflag()!=null && u.getCheckflag().equals("1")){%> checked="checked"<%} %> disabled="disabled"><%=_tUser.getRealName() %></td>
				            	<%	}else{ %>
				            		<td><input type="checkbox" name="ubox" <%if(u.getCheckflag()!=null && u.getCheckflag().equals("1")){ %> checked="checked"<%} %> disabled="disabled"><%=_tUser.getRealName() %></td>
				            	<%	} %>
				            	<%} %>
				            	<%
				            	if(checkList.size()%4!=0){
					            	for(int i=0; i<checkList.size()%4-1; i++){%>
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
				background="<%=contentPath%>/resource/images/mhead.jpg">
				<tr>
					<td width="3%" align="center">
						<img src="<%=contentPath%>/resource/images/mlogo.jpg" width="11"
							height="11">
					</td>
					<td width="15%" class="mhead">
						通知
					</td>
					<td width="74%" align="left" class="mhead">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="left">
										
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
										通知/公告
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<%if(on.getIspublic().equals("1")){ %>
										通知
										<%}else{ %>
										公告
										<%} %>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										通知状态
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<%if(on.getStatus().equals("1")){ %>
										发布
										<%}else{ %>
										草稿
										<%} %>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										是否需要签收
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<%if(on.getMustsign().equals("1")){ %>
										<span id="mb3" style="cursor: pointer;">需签收</span>
										<%}else{ %>
										不需签收
										<%} %>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										通知标题
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;<%=on.getNotititle() %>
									</td>
								</tr>

								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										开始时间
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;<%=DateUtil.format(on.getStartime(),"yyyy-MM-dd HH:mm") %>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										结束时间
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;<%=DateUtil.format(on.getEndtime(),"yyyy-MM-dd HH:mm") %>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										过期时间
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;<%=DateUtil.format(on.getEnddate(),"yyyy-MM-dd") %>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										正文
									</td>
									<td class="NormalDataColumn" align="left">
										<%=on.getContent() %>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										签发人
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<%=StringUtil.parseNull(on.getSubscriber(),"") %>
									</td>
								</tr>

								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										备注
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;<%=StringUtil.parseNull(on.getNote(),"")  %>
									</td>
								</tr>
								<%if(hasFileList!=null && hasFileList.size()>0){ %>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										已有附件
									</td>
									<td class="NormalDataColumn" align="left" id="hasFile">
										&nbsp;&nbsp;
										<%
											for(int i=0; i<hasFileList.size(); i++){
												OfficeFile beanFile = (OfficeFile)hasFileList.get(i);%>
											<a href="../../officeFileDownload?pkid=<%=beanFile.getPkid() %>" >
												<img src="../../resource/fileIco/<%=beanFile.getWjlx() %>.png" onerror="this.src='../resource/fileIco/other.png'" style="cursor: pointer;" border="0" alt="<%=beanFile.getWjm() %>(<%=StringUtil.getFileSize(beanFile.getWjcc().doubleValue()) %>)"><%=beanFile.getWjm() %>
											</a>&nbsp;&nbsp;&nbsp;
									     <%}%>
									</td>
								</tr>
								<%} %>
								
							</table>
						</div>
					</td>
				</tr>

			</table>
	</body>
</html>
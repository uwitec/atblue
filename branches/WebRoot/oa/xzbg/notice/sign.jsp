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
	OfficeNoticeCheck onc = officeNoticeCheckDAO.getCheckByNoticeidUserid(_user.getUserId(), noticeid);
	
	List checkList = officeNoticeCheckDAO.getCheckByNoticeid(noticeid);
	
	if(request.getMethod().equals("POST")){
		String qm = request.getParameter("qm");
		onc.setCheckflag("1");
		onc.setChecktime(DateUtil.getDateTime());
		onc.setIp(request.getRemoteAddr());
		onc.setQm(qm);
		officeNoticeCheckDAO.updateByPrimaryKey(onc);
		out.print("<script>");
        out.print("window.location='index_sign.jsp';");
        out.print("</script>");
	}
    List userList  = dao.getGsldAllUser();
    List userList1  = dao.getJgksAllUser();
    List userList2  = dao.getJcdwAllUser();
    userList = userList == null?new ArrayList():userList;
    userList1 = userList1 == null?new ArrayList():userList1;
    userList2 = userList2 == null?new ArrayList():userList2;
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
        <script src="<%=request.getContextPath()%>/js/common.js"
                type="text/javascript" defer="defer"></script>
        <link href="<%=contentPath%>/css/css.css" rel="stylesheet" type="text/css">
        <link href="<%=contentPath%>/images/css.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/js/ext/resources/css/ext-all.css" rel="stylesheet" type="text/css">
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
			                    border:false,
                                defaults:{autoScroll: true}
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
			
			function checkForm(){
				if(document.form1.qm.value==""){
					alert("请输入签收人姓名");
					return;
				}
				document.form1.submit();
			}
		</script>
	</head>
	<body onload="_resizeNoPage();">
			<form method="post" name="form1">
            <div id="hello-win" class="x-hidden">
                <div id="hello-tabs">
                    <div class="x-tab" title="请选择签收用户">
                        <table border="0" width="100%">
                            <tr>
                                <td colspan="6" align="left">
                                    <input type="checkbox" name="allBox" onclick="checkAll(this);">全选&nbsp;
                                    <input type="checkbox" name="allBox" onclick="checkUnAll();">反选&nbsp;
                                    <hr width="100%">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6" align="left">
                                    <hr width="100%">
                                    <h2>公司领导</h2>
                                    <hr width="100%">
                                </td>
                            </tr>
                            <%for(int i=0; i<userList.size(); i++){
                                CUser u = (CUser)userList.get(i);
                                if(i==0){
                            %>
                            <tr>
                                <td><input type="checkbox" name="ubox"  <%if(StringUtil.contains(checkman,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>"><%=u.getRealName() %></td>
                                <%	}else if(i%6==0){ %>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="ubox" <%if(StringUtil.contains(checkman,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>"><%=u.getRealName() %></td>
                                <%	}else{ %>
                                <td><input type="checkbox" name="ubox" <%if(StringUtil.contains(checkman,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>"><%=u.getRealName() %></td>
                                <%	} %>
                                <%} %>
                                <%
                                    if(userList.size()%6!=0){
                                        for(int i=0; i<userList.size()%6-1; i++){%>
                                <td>&nbsp;</td>
                                <%}%>
                            </tr>
                            <%}%>
                            <tr>
                                <td colspan="6" align="left">
                                    <hr width="100%">
                                    <h2>机关科室</h2>
                                    <hr width="100%">
                                </td>
                            </tr>
                            <%for(int i=0; i<userList1.size(); i++){
                                CUser u = (CUser)userList1.get(i);
                                if(i==0){
                            %>
                            <tr>
                                <td><input type="checkbox" name="ubox"  <%if(StringUtil.contains(checkman,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>"><%=u.getRealName() %></td>
                                <%	}else if(i%6==0){ %>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="ubox" <%if(StringUtil.contains(checkman,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>"><%=u.getRealName() %></td>
                                <%	}else{ %>
                                <td><input type="checkbox" name="ubox" <%if(StringUtil.contains(checkman,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>"><%=u.getRealName() %></td>
                                <%	} %>
                                <%} %>
                                <%
                                    if(userList1.size()%6!=0){
                                        for(int i=0; i<userList1.size()%6-1; i++){%>
                                <td>&nbsp;</td>
                                <%}%>
                            </tr>
                            <%}%>
                            <tr>
                                <td colspan="6" align="left">
                                    <hr width="100%">
                                    <h2>基层单位</h2>
                                    <hr width="100%">
                                </td>
                            </tr>
                            <%for(int i=0; i<userList2.size(); i++){
                                CUser u = (CUser)userList2.get(i);
                                if(i==0){
                            %>
                            <tr>
                                <td><input type="checkbox" name="ubox"  <%if(StringUtil.contains(checkman,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>"><%=u.getRealName() %></td>
                                <%	}else if(i%6==0){ %>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="ubox" <%if(StringUtil.contains(checkman,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>"><%=u.getRealName() %></td>
                                <%	}else{ %>
                                <td><input type="checkbox" name="ubox" <%if(StringUtil.contains(checkman,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>"><%=u.getRealName() %></td>
                                <%	} %>
                                <%} %>
                                <%
                                    if(userList2.size()%6!=0){
                                        for(int i=0; i<userList2.size()%6-1; i++){%>
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
						通知
					</td>
					<td width="74%" align="left" class="mhead">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="left">
									<%if(onc!=null && onc.getCheckflag().equals("0")){ %>
										<input type="button" class="button" id="button"
											onclick="checkForm();" value="签收">
										&nbsp;
									<%} %>
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
								cellspacing="0" class="mtabtab" id="tab_id">
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										通知/公告
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<%if(on.getIspublic().equals("1")){ %>
										通知
										<%}else{ %>
										公告
										<%} %>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										通知状态
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<%if(on.getStatus().equals("1")){ %>
										发布
										<%}else{ %>
										草稿
										<%} %>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										是否需要签收
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<%if(on.getMustsign().equals("1")){ %>
										<span id="mb3" style="cursor: pointer;color: blue">需要签收</span>
										<%}else{ %>
										不需签收
										<%} %>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										通知标题
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<%=on.getNotititle() %>&nbsp;&nbsp;
									</td>
								</tr>

								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										开始时间
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<%=DateUtil.format(on.getStartime(),"yyyy-MM-dd HH:mm") %>&nbsp;&nbsp;
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										结束时间
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<%=DateUtil.format(on.getEndtime(),"yyyy-MM-dd HH:mm") %>&nbsp;&nbsp;
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										过期时间
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<%=DateUtil.format(on.getEnddate(),"yyyy-MM-dd") %> &nbsp;&nbsp;
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										正文
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<%=on.getContent() %>&nbsp;&nbsp;
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										签发人
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<%=StringUtil.parseNull(on.getSubscriber(),"") %>&nbsp;&nbsp;
									</td>
								</tr>

								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										备注
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<%=StringUtil.parseNull(on.getNote(),"") %>&nbsp;&nbsp;
									</td>
								</tr>
								<%if(hasFileList!=null && hasFileList.size()>0){ %>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										已有附件
									</td>
									<td class="head_right" align="left" id="hasFile" style="text-align: left">
										<%
											for(int i=0; i<hasFileList.size(); i++){
												OfficeFile beanFile = (OfficeFile)hasFileList.get(i);%>
											<a href="<%=request.getContextPath()%>/officeFileDownload?pkid=<%=beanFile.getPkid() %>" >
												<img src="<%=request.getContextPath()%>/fileIco/<%=beanFile.getWjlx() %>.png" onerror="this.src='<%=request.getContextPath()%>/fileIco/other.png'" style="cursor: pointer;" border="0" alt="<%=beanFile.getWjm() %>(<%=StringUtil.getFileSize(beanFile.getWjcc().doubleValue()) %>)"><%=beanFile.getWjm() %>
											</a>&nbsp;&nbsp;&nbsp;
									     <%}%>
									</td>
								</tr>
								<%} %>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										签收
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<%if(onc!=null && onc.getCheckflag().equals("0")){ %>
										<input type="text" name="qm" class="inputStyle"
											style="width: 100px;" value="<%=_user.getRealName() %>">
										<%}else if(onc!=null){ %>
										<%=onc.getQm() + "</br>&nbsp;&nbsp;" + DateUtil.format(onc.getChecktime(),"yyyy-MM-dd HH:mm") + "</br>&nbsp;&nbsp;" + onc.getIp() %>
										<%} %>
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
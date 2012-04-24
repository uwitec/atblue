<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Date"%>
<%@ include file="../../../import.jsp"%>
<%
    OfficeCirculationDAO officeCirculationDAO = (OfficeCirculationDAO)SpringFactory.instance.getBean("officeCirculationDAO");
    OfficeCirculationCheckDAO officeCirculationCheckDAO = (OfficeCirculationCheckDAO)SpringFactory.instance.getBean("officeCirculationCheckDAO");
	String pkid = request.getParameter("pkid");
    List checkList = oDao.getOfficeCirculationCheckList(pkid);
    String[] checkmans = new String[1];
    checkmans[0] = "";
    String checkman = "";
    if(checkList != null && checkList.size() > 0){
        checkmans = new String[checkList.size()];
        for(int i=0; i<checkList.size(); i++){
            Map map = (Map)checkList.get(i);
            String name = StringUtil.parseNull(map.get("REAL_NAME"),"");
            checkman = checkman + name +";";
            checkmans[i] = StringUtil.parseNull(map.get("CHECKMAN"),"");
        }
    }
    OfficeCirculation document = null;
    try{
	    document = officeCirculationDAO.selectByPrimaryKey(pkid);
    }catch(Exception e){
        e.printStackTrace();
    }
	List hasFileList = officeFileDAO.getByFk(pkid);
	OfficeCirculationCheck officeCirculationCheck = officeCirculationCheckDAO.selectByPrimaryCyid(pkid);
	if(officeCirculationCheck==null) officeCirculationCheck = new OfficeCirculationCheck();
    List userList  = dao.getAllUser();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
		<script src="<%=contentPath%>/js/common.js"
			type="text/javascript" defer="defer"></script>
        <link href="<%=contentPath%>/css/css.css" rel="stylesheet" type="text/css">
        <link href="<%=contentPath%>/images/css.css" rel="stylesheet" type="text/css">
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
				
				document.form1.act.value=act;
				
				if(document.form1.lwdw.value==""){
					document.form1.lwdw.focus();
					alert("请输入来文单位");
					return;
				}
				if(document.form1.wjbh.value==""){
					document.form1.wjbh.focus();
					alert("请输入文件编号");
					return;
				}
				if(document.form1.wjmc.value==""){
					document.form1.wjmc.focus();
					alert("请选择文件名称");
					return;
				}
				
				if(act=='pub'){
					if(!window.confirm("确认传阅【" + document.form1.wjmc.value + "】文件？")){
						return;
					}
				}
				document.form1.submit();
			}
			
			/****************
			 * 生成多个附件
			 * chivasju
			 ****************/
			var fileCount = 1;
			function addFile(){
				fileCount++;
				var fileTd = document.getElementById("fileTd");
				var fileTable = document.getElementById("mtabtab");
				var tableRows  = fileTable.getElementsByTagName("tr");
    			var objTR = fileTable.insertRow();
    			var objTD = objTR.insertCell(); 
    			objTD.innerHTML = "<td nowrap='nowrap' width='120' class='head_left'>&nbsp;</td>";
    			objTD = objTR.insertCell(); 
    			objTD.innerHTML += "<td class='head_right' align='left'>"
    			objTD.innerHTML += fileCount +  ".&nbsp;&nbsp;&nbsp;<input type='file' name='file_" + fileCount + "' style='width: 400px;'></td>";
			}
			function delFile(pkid, fkid){
				var ajax = GetO();
				if(window.confirm("是否删除该附件?")){
					ajax.open("GET", "./delete_file.jsp?pkid=" + pkid + "&fkid=" + fkid, false);
					ajax.setRequestHeader("If-Modified-Since","0");
					ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
					ajax.setRequestHeader("Content-Type","text/html; encoding=gb18030");
				    ajax.onreadystatechange = function() { 
	        			if (ajax.readyState == 4) {
	            			var rtnStr = ajax.responseText;
	            			document.getElementById('hasFile').innerHTML = rtnStr;
	        			} 
   					 }
   					 ajax.send(null);
				}
			}
            Ext.onReady(function(){
                var win;
                var button = Ext.get('checkman');

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
                                border:false,
                                defaults:{autoScroll: true}
                            }),
                            buttons: [{
                                text:'确定',
                                handler: function(){
                                    document.form1.checkman.value = "";
                                    for(var i=0; i<document.form1.ubox.length; i++){
                                        if(document.form1.ubox[i].checked){
                                            document.form1.checkman.value+=document.form1.ubox[i].title + ";";
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
		
		<script type="text/javascript">
			function lbz(obj){
				document.form1.wjbh.value=obj.value;
			}
		</script>
	</head>
	<body onload="_resizeNoPage();">
		<form name="form1" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="act" value="">
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
                            <%for(int i=0; i<userList.size(); i++){
                                CUser u = (CUser)userList.get(i);
                                if(i==0){
                            %>
                            <tr>
                                <td><input type="checkbox" name="ubox" <%if(StringUtil.contains(checkmans,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>" title="<%=u.getRealName() %>"><%=u.getRealName() %></td>
                                <%	}else if(i%6==0){ %>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="ubox" <%if(StringUtil.contains(checkmans,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>" title="<%=u.getRealName() %>"><%=u.getRealName() %></td>
                                <%	}else{ %>
                                <td><input type="checkbox" name="ubox" <%if(StringUtil.contains(checkmans,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>" title="<%=u.getRealName() %>"><%=u.getRealName() %></td>
                                <%	} %>
                                <%} %>
                                <%
                                    if(userList.size()%6!=0){
                                        for(int i=0; i<userList.size()%6-1; i++){%>
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
						来文查看
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
									<td nowrap="nowrap" width="120" class="head_left">
										来文时间
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<%=StringUtil.parseNull(document.getLwsj(),"") %> &nbsp;&nbsp;
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										来文单位
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<%=StringUtil.parseNull(document.getLwdw(),"") %> &nbsp;&nbsp;
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										文件编号
									</td>
									<td class="head_right" align="left" style="text-align: left">

										<%=StringUtil.parseNull(document.getWjbh(),"") %> &nbsp;&nbsp;
									</td>
								</tr>

								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										文件名称
									</td>
									<td class="head_right" align="left" style="text-align: left">

										<%=StringUtil.parseNull(document.getWjmc(),"") %> &nbsp;&nbsp;
									</td>
								</tr>
                                <tr>
                                    <td nowrap="nowrap" width="120" class="head_left">
                                        传阅人<span style="color: red">&nbsp;*</span>
                                    </td>
                                    <td class="head_right" align="left" style="text-align: left">
                                        <input type="text" name="checkman" readonly="readonly" class="inputStyle"
                                               style="width: 400px;" value="<%=checkman%>">
                                        &nbsp;
                                    </td>
                                </tr>
								<%--<tr>--%>
									<%--<td nowrap="nowrap" width="120" class="head_left">--%>
										<%--办公室负责人--%>
									<%--</td>--%>
									<%--<td class="head_right" align="left" style="text-align: left">--%>

										<%--<%if(officeCirculationCheck.getCheckman()==null){out.println("&nbsp;");}else{ %>--%>
										<%--<%=dao.findUserById(officeCirculationCheck.getCheckman()).getRealName()%>--%>
										<%--<%} %> &nbsp;&nbsp;--%>
									<%--</td>--%>
								<%--</tr>--%>
								<%--<tr>--%>
									<%--<td nowrap="nowrap" width="120" class="head_left">--%>
										<%--领导批示--%>
									<%--</td>--%>
									<%--<td class="head_right" align="left" style="text-align: left">--%>

										<%--<%=StringUtil.replace(StringUtil.parseNull(document.getLdps(),""),"\n","</br>&nbsp;&nbsp;") %>&nbsp;&nbsp;--%>
									<%--</td>--%>
								<%--</tr>--%>
								<%--<tr>--%>
									<%--<td nowrap="nowrap" width="120" class="head_left">--%>
										<%--拟办意见--%>
									<%--</td>--%>
									<%--<td class="head_right" align="left" style="text-align: left">--%>

										<%--<%=StringUtil.replace(StringUtil.parseNull(document.getNbyj(),""),"\n","</br>&nbsp;&nbsp;") %>&nbsp;&nbsp;--%>
									<%--</td>--%>
								<%--</tr>--%>
								<%--<tr>--%>
									<%--<td nowrap="nowrap" width="120" class="head_left">--%>
										<%--处理意见--%>
									<%--</td>--%>
									<%--<td class="head_right" align="left" style="text-align: left">--%>

										<%--<%=StringUtil.replace(StringUtil.parseNull(document.getClyj(),""),"\n","</br>&nbsp;&nbsp;") %>&nbsp;&nbsp;--%>
									<%--</td>--%>
								<%--</tr>--%>
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
									     <%}%>&nbsp;&nbsp;
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
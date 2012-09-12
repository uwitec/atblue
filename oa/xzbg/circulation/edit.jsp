<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Date"%>
<%@ include file="../../../import.jsp"%>
<%
    CUser cUser = (CUser)session.getAttribute("cUser");
    cUser = cUser == null?new CUser():cUser;
    OfficeCirculationDAO officeCirculationDAO = (OfficeCirculationDAO)SpringFactory.instance.getBean("officeCirculationDAO");
    OfficeCirculationCheckDAO officeCirculationCheckDAO = (OfficeCirculationCheckDAO)SpringFactory.instance.getBean("officeCirculationCheckDAO");
	String pkid = request.getParameter("pkid");
	OfficeCirculation document = officeCirculationDAO.selectByPrimaryKey(pkid);
	List hasFileList = officeFileDAO.getByFk(pkid);
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
	if (request.getMethod().equals("POST")) {

		FileUploadUtil fileUpload = new FileUploadUtil(request);

		String lwsj = fileUpload.getParameter("lwsj");
		String lwdw = fileUpload.getParameter("lwdw");
		String wjbh = fileUpload.getParameter("wjbh");
		String wjmc = fileUpload.getParameter("wjmc");
		String nbr = fileUpload.getParameter("nbr");
		String act = fileUpload.getParameter("act");
		String fs = fileUpload.getParameter("fs");
		String swh = fileUpload.getParameter("swh");

		
		try{
			document.setLwsj(DateUtil.parse(lwsj));
		}catch(Exception e){}
		document.setLwdw(lwdw);
		document.setWjbh(wjbh);
		document.setWjmc(wjmc);
		document.setLrr(_user.getUserId());
		document.setLrsj(DateUtil.getDateTime());
        document.setZt("已保存");
		document.setFs(fs);
		document.setSwh(swh);
        if("startup".equals(act)){
            document.setZt("已申请");
            //创建流程代码在这里
            Status status = workflow.startWorkflow("debd1b0c-875d-4cc8-8169-58aa168f721d",cUser.getUserId());
            document.setProcessId(status.getProcessId());
            document.setConnectId(status.getConnectId());
        }
		officeCirculationDAO.updateByPrimaryKey(document);
		
		//保存附件信息
		List fileList = fileUpload.uploadFile(filePath);
		for (int i = 0; i < fileList.size(); i++) {
			Map map = (Map) fileList.get(i);
			OfficeFile uploadFile = new OfficeFile();
			uploadFile.setPkid((String) map.get("rename"));
			uploadFile.setFkid(pkid);
			uploadFile.setLrip(request.getRemoteAddr());
			uploadFile.setLrr(_user.getUserId());
			uploadFile.setLrsj(DateUtil.getDateTime());
			try {
				uploadFile.setWjcc(new BigDecimal((Long) map
						.get("fileSize")));
			} catch (Exception e) {
			}
			uploadFile.setWjlj((String) map.get("fullPath"));
			uploadFile.setWjm((String) map.get("realName"));
			uploadFile.setWjlx((String) map.get("fileType"));
			uploadFile.setXzcs(new Integer(0));
			officeFileDAO.insert(
					uploadFile);
		}
        String[] ubox = fileUpload.getParameters("ubox");
        for(int i=0; i<ubox.length; i++){
            if(!StringUtil.isBlankOrEmpty(ubox[i])){
                oDao.delOfficeCirculationCheck(ubox[i],pkid);
                OfficeCirculationCheck odc = new OfficeCirculationCheck();
                odc.setPkid(StringUtil.getUUID());
                odc.setCheckflag("0");
                odc.setCheckman(ubox[i]);
                odc.setCyid(pkid);
                officeCirculationCheckDAO.insert(odc);
            }
        }
//		//保存用户
//		if(act!=null && act.equals("pub")){
//
//			String ps = fileUpload.getParameter("ps");
//			String ld = request.getParameter("ldps");
//			if(ps!=null && ps.equals("2")){
//				workFlow.startWorkflow("8b6a1ca1-7eef-489c-8ad1-aaa758212d3b",ld);
//			}else{
//				workFlow.startWorkflow("8b6a1ca1-7eef-489c-8ad1-aaa758212d3b",nbr);
//			}
//			/**
//			OfficeCirculationCheck odc = new OfficeCirculationCheck();
//			odc.setPkid(StringUtil.getUUID());
//			odc.setCheckflag("0");
//			odc.setCheckman(nbr);
//			odc.setCyid(pkid);
//			odc.setTaskid(tid);
//			document.setZt(tid);
//			SpringFactory.getInstance().getOfficeCirculationDAO().updateByPrimaryKey(document);
//			SpringFactory.getInstance().getOfficeCirculationCheckDAO().insert(odc);
//			**/
//			//抛入消息池
//			UMessage um = new UMessage();
//			um.setAppkey(document.getCyid());
//			um.setAppname("文件传阅");
//			um.setFlag(0);
//			um.setId(StringUtil.getUUID());
//			um.setUrl("/office/circulation/sp.jsp?pkid="+document.getCyid());
//			um.setMessage("[" + DateUtil.format(document.getLrsj(),"yyyy-MM-dd") + "]&nbsp;传阅文件" + document.getWjbh() + "需要审批。");
//			um.setReceiver(nbr);
//			um.setReceiverid(nbr);
//			um.setSender(_user.getUserId());
//			um.setSendtime(DateUtil.getDateTime());
//			uMessageDAO.insert(um);
//		}
		
		out.print("<script>");
		out.print("window.location='index.jsp';");
		out.print("</script>");
	}

    List userList  = dao.getGsldAllUser();
    List userList1  = dao.getJgksAllUser();
    List userList2  = dao.getJcdwAllUser();
    userList = userList == null?new ArrayList():userList;
    userList1 = userList1 == null?new ArrayList():userList1;
    userList2 = userList2 == null?new ArrayList():userList2;
	List ldList = dao.findUsersByRole(zyldRole); 
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
		<script src="<%=contentPath%>/js/common.js"
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
		</script>
		
		<script type="text/javascript">
			function lbz(obj){
				document.form1.wjbh.value=obj.value;
			}
			
			function  selLdps(){
				document.form1.nbr.disabled=true;
				document.form1.ldps.disabled=false;
			}
			
			function  selNbr(){
				document.form1.nbr.disabled=false;
				document.form1.ldps.disabled=true;
			}
			 function doAddAttachRow(tid){
	    	var tbl = document.getElementById(tid);
	    	var rows = tbl.rows;
	    	var len = rows.length;
	    	var newTr = tbl.insertRow();
	    	var newTd = newTr.insertCell(0);
	    	newTd.align="center";
	    	newTd.className="head_right";
	    	newTd.appendChild(document.createTextNode(len));
	    	newTd = newTr.insertCell(1);
	    	newTd.className="head_right";
	    	newTd.appendChild(document.createTextNode("文件："));
	    	var node = document.createElement("input");
	    	
			node.type = "file";
			node.size = "60";
			node.name = "fjlist";
	    	newTd.appendChild(node);
	    	newTd = newTr.insertCell(2);
	    	newTd.align="center";
	    	newTd.className="head_right";
	    	var node = document.createElement("a");
	    	node.href="javascript:void(0)";
	    	node.onclick= function (){
				doDeleteRow(this);
			};
	    	node.appendChild(document.createTextNode("[删除]"));
	    	newTd.appendChild(node);
	    }
	        function doDeleteRow(t,uuid){
	    	if( uuid != undefined && uuid != null && uuid != ''){
	    		if(!confirm("确定要删除此附件信息么?")){
	    			return ;
	    		}
	    	}
	    	var row = t.parentElement.parentElement;
	    	var index = row.rowIndex;
	    	//通过Ajax删除附件记录
	    	document.getElementById("attachTab").deleteRow(row.rowIndex);
	    	var rows = document.getElementById("attachTab").rows;
	    	var len = rows.length;
	    	for(var i=1; i<len; i++){
	    		var r = rows[i];
	    		var c = r.cells[0];
	    		c.innerText = i;
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
            function checkPartAll(obj,alt){
                for(var i=0; i<document.form1.ubox.length; i++){
                    if(document.form1.ubox[i].getAttribute("alt") == alt){
                        document.form1.ubox[i].checked=obj.checked;
                    }
                }
            }

            function checkPartNot(obj,alt){
                for(var i=0; i<document.form1.ubox.length; i++){
                    if(document.form1.ubox[i].getAttribute("alt")  == alt){
                        document.form1.ubox[i].checked=!document.form1.ubox[i].checked;
                    }
                }
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
                            <tr>
                                <td colspan="6" align="left">
                                    <hr width="100%">
                                    <h2>公司领导</h2>
                                    <input type="checkbox" onclick="checkPartAll(this,'gsld');"/>全选<input type="checkbox"  onclick="checkPartNot(this,'gsld');"/>反选
                                    <hr width="100%">
                                </td>
                            </tr>
                            <%for(int i=0; i<userList.size(); i++){
                                CUser u = (CUser)userList.get(i);
                                if(i==0){
                            %>
                            <tr>
                                <td><input type="checkbox" name="ubox"  <%if(StringUtil.contains(checkmans,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>" alt="gsld"><%=u.getRealName() %></td>
                                <%	}else if(i%6==0){ %>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="ubox" <%if(StringUtil.contains(checkmans,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>" alt="gsld"><%=u.getRealName() %></td>
                                <%	}else{ %>
                                <td><input type="checkbox" name="ubox" <%if(StringUtil.contains(checkmans,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>" alt="gsld"><%=u.getRealName() %></td>
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
                                    <input type="checkbox"  onclick="checkPartAll(this,'jgks');"/>全选<input type="checkbox" onclick="checkPartNot(this,'jgks');"/>反选
                                    <hr width="100%">
                                </td>
                            </tr>
                            <%for(int i=0; i<userList1.size(); i++){
                                CUser u = (CUser)userList1.get(i);
                                if(i==0){
                            %>
                            <tr>
                                <td><input type="checkbox" name="ubox"  <%if(StringUtil.contains(checkmans,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>" alt="jgks"><%=u.getRealName() %></td>
                                <%	}else if(i%6==0){ %>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="ubox" <%if(StringUtil.contains(checkmans,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>" alt="jgks"><%=u.getRealName() %></td>
                                <%	}else{ %>
                                <td><input type="checkbox" name="ubox" <%if(StringUtil.contains(checkmans,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>" alt="jgks"><%=u.getRealName() %></td>
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
                                    <input type="checkbox"  onclick="checkPartAll(this,'jcdw');"/>全选<input type="checkbox" onclick="checkPartNot(this,'jcdw');"/>反选
                                    <hr width="100%">
                                </td>
                            </tr>
                            <%for(int i=0; i<userList2.size(); i++){
                                CUser u = (CUser)userList2.get(i);
                                if(i==0){
                            %>
                            <tr>
                                <td><input type="checkbox" name="ubox"  <%if(StringUtil.contains(checkmans,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>" alt="jcdw"><%=u.getRealName() %></td>
                                <%	}else if(i%6==0){ %>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="ubox" <%if(StringUtil.contains(checkmans,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>" alt="jcdw"><%=u.getRealName() %></td>
                                <%	}else{ %>
                                <td><input type="checkbox" name="ubox" <%if(StringUtil.contains(checkmans,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>" alt="jcdw"><%=u.getRealName() %></td>
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
						来文登记
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
                                               onclick="checkForm('startup');" value="创建并启动流程">
										&nbsp;
										<input type="button" class="button" id="button"
											onclick="window.location='index.jsp';" value="返回">
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
										来文时间 <span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<input type="text" name="lwsj" class="Wdate" onClick="WdatePicker()" value="<%=DateUtil.format(document.getLwsj(),"yyyy-MM-dd") %>">
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										来文单位 <span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<input type="text" name="lwdw" class="inputStyle" value="<%=StringUtil.parseNull(document.getLwdw(),"") %>"
											style="width: 200px;">
									</td>
								</tr>
								
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										文件编号<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<input type="text" name="wjbh" class="inputStyle" value="<%=StringUtil.parseNull(document.getWjbh(),"") %>"
											style="width: 300px;">
									</td>
								</tr>

								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										文件名称<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<input type="text" name="wjmc" class="inputStyle" value="<%=StringUtil.parseNull(document.getWjmc(),"") %>"
											style="width: 400px;">
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										份数
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<input type="text" name="fs" class="inputStyle" value="<%=StringUtil.parseNull(document.getFs(),"") %>"
											style="width: 50px;" onkeyup="this.value=this.value.replace(/[^\d\.]+?/g, '')">
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										收文号
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<input type="text" name="swh" class="inputStyle" value="<%=StringUtil.parseNull(document.getSwh(),"") %>"
											style="width: 200px;">
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
											<a href="javascript:delFile('<%=beanFile.getPkid() %>','<%=pkid %>')">[删除]</a></br>&nbsp;&nbsp;
									     <%}%> &nbsp;&nbsp;
									</td>
								</tr>
								<%} %>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										附件&nbsp;
									</td>
									<td class="head_right" align="left" id="fileTd" style="text-align: left">
										1.&nbsp;&nbsp;
										<input type="file" name="file_1" style="width: 400px;">
									</td>
								</tr>
							</table>
							<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"
                       				class="mtabtab" id="attachTab">
				               <tr>
				               		<td class="head_right" width="100%" nowrap colspan="3" style="text-align: left">其他附件：<input type="button" name="b_bc" class="button" value="添加" onclick="doAddAttachRow('attachTab');"></td>
				               </tr>
         				</table>
						</div>
					</td>
				</tr>

			</table>
		</form>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Date"%>
<%@ include file="../../../import.jsp"%>
<%
	OfficeDocumentsDAO officeDocumentsDAO = (OfficeDocumentsDAO)SpringFactory.instance.getBean("officeDocumentsDAO");
	OfficeDocumentsCheckDAO officeDocumentsCheckDAO = (OfficeDocumentsCheckDAO)SpringFactory.instance.getBean("officeDocumentsCheckDAO");
	String pkid = request.getParameter("pkid");
	OfficeDocuments document = officeDocumentsDAO.selectByPrimaryKey(pkid);
    List checkList = oDao.getOfficeDocumentsCheckList(pkid);
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

		String lb = fileUpload.getParameter("lb");
		String wjbh = fileUpload.getParameter("wjbh");
		String bt = fileUpload.getParameter("bt");
		String mmcd = fileUpload.getParameter("mmcd");
		String qfr = fileUpload.getParameter("qfr");
		String qfrq = fileUpload.getParameter("qfrq");
		String ngbm = fileUpload.getParameter("ngbm");
		String hjsx = fileUpload.getParameter("hjsx");
		String gyfs = fileUpload.getParameter("gyfs");
		String ztc = fileUpload.getParameter("ztc");
		String zs = fileUpload.getParameter("zs");
		String cs = fileUpload.getParameter("cs");
		String cb = fileUpload.getParameter("cb");
		String sfjj = fileUpload.getParameter("sfjj");
		String bz = fileUpload.getParameter("bz");
		String act = fileUpload.getParameter("act");
		String dxtx = StringUtil.parseNull(fileUpload.getParameter("dxtx"),"");

		
		document.setLb(lb);
		document.setWjbh(wjbh);
		document.setBt(bt);
		document.setMmcd(mmcd);
		document.setQfr(qfr);
		document.setDxtx(dxtx);
		try{
			document.setQfrq(DateUtil.parse(qfrq));
		}catch(Exception e){}
		document.setNgbm(ngbm);
		document.setHjsx(hjsx);
		try{
			document.setGyfs(Integer.parseInt(gyfs));
		}catch(Exception e){
			
		}
		document.setZtc(ztc);
		document.setZs(zs);
		document.setCs(cs);
		document.setCb(cb);
		document.setFwjb(sfjj);
		document.setBz(bz);
		document.setCjr(_user.getUserId());
		document.setCjrq(DateUtil.getDateTime());
		if(act!=null && act.equals("pub")){
			document.setStatus((int)1);
		}else{
			document.setStatus((int)0);
		}
		
		
		officeDocumentsDAO.updateByPrimaryKey(document);
		//保存附件信息
		List fileList = fileUpload.uploadFile();
		for (int i = 0; i < fileList.size(); i++) {
			Map map = (Map) fileList.get(i);
			OfficeFile uploadFile = new OfficeFile();
			uploadFile.setPkid((String) map.get("rename"));
			uploadFile.setFkid(pkid);
			uploadFile.setLrip(request.getRemoteAddr());
			uploadFile.setLrr(_user.getRealName());
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
		
		//保存用户
//		if(act!=null && act.equals("pub")){

			String[] ubox = fileUpload.getParameters("ubox");
			
			for(int i=0; i<ubox.length; i++){
                if(!StringUtil.isBlankOrEmpty(ubox[i])){
                    oDao.delOfficeDocumentsCheck(ubox[i],pkid);
                    OfficeDocumentsCheck odc = new OfficeDocumentsCheck();
                    odc.setChekid(StringUtil.getUUID());
                    odc.setCheckflag("0");
                    odc.setCheckman(ubox[i]);
                    odc.setDocumentid(pkid);
                    officeDocumentsCheckDAO.insert(odc);
                }
			}
//		}
		
		out.print("<script>");
		out.print("window.location='manager.jsp';");
		out.print("</script>");
	}

    List userList  = dao.getGsldAllUser();
    List userList1  = dao.getJgksAllUser();
    List userList2  = dao.getJcdwAllUser();
    userList = userList == null?new ArrayList():userList;
    userList1 = userList1 == null?new ArrayList():userList1;
    userList2 = userList2 == null?new ArrayList():userList2;
	List hasFileList = officeFileDAO.getByFk(pkid);
	List departmentList = orgnizationDAO.queryForList(null);
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
		<script src="<%=contentPath%>/js/common.js"
			type="text/javascript" defer="defer"></script>
        <link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet"	type="text/css">
        <link href="<%=request.getContextPath()%>/images/css.css" rel="stylesheet"	type="text/css">
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
//				if(act=='pub'){
					var has = false;
					for(var i=0; i<document.form1.ubox.length; i++){
						if(document.form1.ubox[i].checked){
							has = true;
							break;
						}
					}
					if(!has){ 
						alert("请选择签收用户.");
						return;
					}
//				}
				if(document.form1.wjbh.value==""){
					document.form1.wjbh.focus();
					alert("请输入文件编号");
					return;
				}
				if(document.form1.bt.value==""){
					document.form1.wjbh.focus();
					alert("请输入文件标题");
					return;
				}
				if(document.form1.lb.value==""){
					document.form1.lb.focus();
					alert("请选择文件类别");
					return;
				}
				if(act=='pub'){
					if(!window.confirm("确认发放【" + document.form1.wjbh.value + "】文件？")){
						return;
					}
				}
				if(document.getElementById("checked").checked){
                	 document.all.dxtx.value="1";
                }else if(!document.getElementById("checked").checked){
                	document.all.dxtx.value="0";
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
		</script>
		<script type="text/javascript" defer="defer">
		
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
			
			function lbz(obj){
				document.form1.wjbh.value=obj.value;
			}
		</script>
	</head>
	<body onload="_resizeNoPage();">
		<form name="form1" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="dxtx" value=""/>
			<input type="hidden" name="pkid" value="<%=pkid %>">
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
                                    <hr width="100%">
                                </td>
                            </tr>
                            <%for(int i=0; i<userList.size(); i++){
                                CUser u = (CUser)userList.get(i);
                                if(i==0){
                            %>
                            <tr>
                                <td><input type="checkbox" name="ubox"  <%if(StringUtil.contains(checkmans,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>" title="<%=u.getRealName() %>"><%=u.getRealName() %></td>
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
                                <td><input type="checkbox" name="ubox"  <%if(StringUtil.contains(checkmans,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>"><%=u.getRealName() %></td>
                                <%	}else if(i%6==0){ %>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="ubox" <%if(StringUtil.contains(checkmans,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>"><%=u.getRealName() %></td>
                                <%	}else{ %>
                                <td><input type="checkbox" name="ubox" <%if(StringUtil.contains(checkmans,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>"><%=u.getRealName() %></td>
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
                                <td><input type="checkbox" name="ubox"  <%if(StringUtil.contains(checkmans,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>"><%=u.getRealName() %></td>
                                <%	}else if(i%6==0){ %>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="ubox" <%if(StringUtil.contains(checkmans,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>"><%=u.getRealName() %></td>
                                <%	}else{ %>
                                <td><input type="checkbox" name="ubox" <%if(StringUtil.contains(checkmans,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>"><%=u.getRealName() %></td>
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
						发文登记
					</td>
					<td width="74%" align="left" class="mhead">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="left">
										<input type="button" class="button"
											onclick="checkForm('pub');" value="发文">
										&nbsp;
										<input type="button" class="button"
											onclick="checkForm('save');" value="保存">
										&nbsp;
										<input type="button" class="button"
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
										文件标题<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<input type="text" name="bt" class="inputStyle" value="<%=StringUtil.parseNull(document.getBt(),"") %>"
											style="width: 400px;"><input type="checkbox" name="checked" id="checked" value="1" checked>短信提醒
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										发文类型<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<select name="lb" onchange="lbz(this)" style="width: 200px;">
			                            	<option value="" <%if(document.getLb()==null || document.getLb().equals("")){ %>selected<%} %>>请选择 </option>
			                                <option value="公司文件" <%if(document.getLb().equals("公司文件")){ %>selected<%} %>>公司文件</option>
			                                <option value="党委文件" <%if(document.getLb().equals("党委文件")){ %>selected<%} %>>党委文件</option>
			                                <option value="办公室文件" <%if(document.getLb().equals("办公室文件")){ %>selected<%} %>>办公室文件</option>
			                                <option value="会议纪要" <%if(document.getLb().equals("会议纪要")){ %>selected<%} %>>会议纪要</option>
			                                <option value="领导讲话" <%if(document.getLb().equals("领导讲话")){ %>selected<%} %>>领导讲话</option>
			                                <option value="督查通报" <%if(document.getLb().equals("督查通报")){ %>selected<%} %>>督查通报</option>
			                                <option value="调研报告" <%if(document.getLb().equals("调研报告")){ %>selected<%} %>>调研报告</option>
			                                <option value="各委员会文件" <%if(document.getLb().equals("各委员会文件")){ %>selected<%} %>>各委员会文件</option>
			                                <option value="其它" <%if(document.getLb().equals("其它")){ %>selected<%} %>>其它</option>
		                            	</select> 
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
										密级
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<select name="mmcd" style="width: 100px;">
			                                <option value="无" <%if(document.getMmcd()!=null && document.getMmcd().equals("无")){ %>selected<%} %>>无</option>
			                                <option value="秘密" <%if(document.getMmcd()!=null && document.getMmcd().equals("秘密")){ %>selected<%} %>>秘密</option>
			                                <option value="机密" <%if(document.getMmcd()!=null && document.getMmcd().equals("机密")){ %>selected<%} %>>机密</option>
			                                <option value="绝密" <%if(document.getMmcd()!=null && document.getMmcd().equals("绝密")){ %>selected<%} %>>绝密</option>
		                            	</select>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										缓急时限
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<select id="hjsx" name="hjsx" style="width: 100px;">
			                                <option value="无" <%if(document.getHjsx()!=null && document.getHjsx().equals("无")){ %>selected<%} %>>无</option>
			                                <option value="平急" <%if(document.getHjsx()!=null && document.getHjsx().equals("平急")){ %>selected<%} %>>平急</option>
			                                <option value="紧急" <%if(document.getHjsx()!=null && document.getHjsx().equals("紧急")){ %>selected<%} %>>紧急</option>
			                                <option value="特急" <%if(document.getHjsx()!=null && document.getHjsx().equals("特急")){ %>selected<%} %>>特急</option>
		                            	</select>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										签收人<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<input type="text" name="checkman" readonly="readonly" class="inputStyle"
											style="width: 200px;" value="<%=checkman%>">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										签发人
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<input type="text" name="qfr" class="inputStyle" value="<%=StringUtil.parseNull(document.getQfr(),"") %>"
											style="width: 200px;">
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										签发日期
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<input type="text" name="qfrq" class="Wdate" onClick="WdatePicker()" value="<%=DateUtil.format(document.getQfrq(),"yyyy-MM-dd") %>">
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										拟稿部门
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<select name="ngbm" style="width: 200px;">
											<%for(int i=0;i<departmentList.size(); i++){
												COrgnization dep = (COrgnization)departmentList.get(i);%>
											<option value="<%=dep.getOrgnaName() %>" <%if(document.getNgbm().equals(dep.getOrgnaName())){ %>selected<%} %>><%=dep.getOrgnaName() %></option>
											<%} %>
										</select>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										共印份数
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<input type="text" name="gyfs" class="inputStyle" value="<%=StringUtil.parseNull(document.getGyfs(),"") %>"
											style="width: 30px;">
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										主送
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<input type="text" name="zs" class="inputStyle" value="<%=StringUtil.parseNull(document.getZs(),"") %>"
											style="width: 300px;">
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										抄送
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<input type="text" name="cs" class="inputStyle" value="<%=StringUtil.parseNull(document.getCs(),"") %>"
											style="width: 300px;">
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										抄报
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<input type="text" name="cb" class="inputStyle" value="<%=StringUtil.parseNull(document.getCb(),"") %>"
											style="width: 300px;">
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										备注
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<input type="text" name="bz" class="inputStyle" value="<%=StringUtil.parseNull(document.getBz(),"") %>"
											style="width: 400px;">
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
											<a href="../../officeFileDownload?pkid=<%=beanFile.getPkid() %>" >
												<img src="<%=request.getContextPath()%>/fileIco/<%=beanFile.getWjlx() %>.png" onerror="this.src='<%=request.getContextPath()%>/fileIco/other.png'" style="cursor: pointer;" border="0" alt="<%=beanFile.getWjm() %>(<%=StringUtil.getFileSize(beanFile.getWjcc().doubleValue()) %>)"><%=beanFile.getWjm() %>
											</a>&nbsp;&nbsp;&nbsp;
											<a href="javascript:delFile('<%=beanFile.getPkid() %>','<%=pkid %>')">[删除]</a></br>&nbsp;&nbsp;
									     <%}%>
									</td>
								</tr>
								<%} %>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										附件&nbsp;
										<img src="<%=contentPath%>/images/add.gif"
											style="cursor: pointer;" alt="增加电子版" onclick="addFile();">
									</td>
									<td class="head_right" align="left" id="fileTd" style="text-align: left">
										1.&nbsp;&nbsp;
										<input type="file" name="file_1" style="width: 400px;">
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
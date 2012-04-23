<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Date"%>
<%@ include file="../../../import.jsp"%>
<% 
	OfficeDocumentsDAO officeDocumentsDAO = (OfficeDocumentsDAO)SpringFactory.instance.getBean("officeDocumentsDAO");
	OfficeDocumentsCheckDAO officeDocumentsCheckDAO = (OfficeDocumentsCheckDAO)SpringFactory.instance.getBean("officeDocumentsCheckDAO");
	
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

		String documentid = StringUtil.getUUID();
		OfficeDocuments document = new OfficeDocuments();
		document.setDocumentid(documentid);
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
			document.setStatus(1);
		}else{
			document.setStatus(0);
		}
		
		
		officeDocumentsDAO.insert(document);
		//保存附件信息
		List fileList = fileUpload.uploadFile(filePath);
		for (int i = 0; i < fileList.size(); i++) {
			Map map = (Map) fileList.get(i);
			OfficeFile uploadFile = new OfficeFile();
			uploadFile.setPkid(StringUtil.getUUID());
			uploadFile.setFkid(documentid);
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
			officeFileDAO.insert(uploadFile);
		}
		
		//保存用户
		if(act!=null && act.equals("pub")){
			String[] ubox = fileUpload.getParameters("ubox");
			
			for(int i=0; i<ubox.length; i++){
				OfficeDocumentsCheck odc = new OfficeDocumentsCheck();
				odc.setChekid(StringUtil.getUUID());
				odc.setCheckflag("0");
				odc.setCheckman(ubox[i]);
				odc.setDocumentid(documentid);
				
				officeDocumentsCheckDAO.insert(odc);
			}
		}
		
		out.print("<script>");
		out.print("window.location='manager.jsp';");
		out.print("</script>");
	}

	List userList = dao.getAllUser();
	List departmentList = orgnizationDAO.queryForList(null);
%>
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
				
				
				document.form1.act.value=act;
				if(act=='pub'){
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
				}
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
    			objTD.innerHTML = "<td nowrap='nowrap' width='120' class='NormalColumnTitle'>&nbsp;</td>";
    			objTD = objTR.insertCell(); 
    			objTD.innerHTML += "<td class='NormalDataColumn' align='left'>"
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
			                    border:false
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
			 function doAddAttachRow(tid){
	    	var tbl = document.getElementById(tid);
	    	var rows = tbl.rows;
	    	var len = rows.length;
	    	var newTr = tbl.insertRow();
	    	var newTd = newTr.insertCell(0);
	    	newTd.align="center";
	    	newTd.className="NormalDataColumn";
	    	newTd.appendChild(document.createTextNode(len));
	    	newTd = newTr.insertCell(1);
	    	newTd.className="NormalDataColumn";
	    	newTd.appendChild(document.createTextNode("文件："));
	    	var node = document.createElement("input");
	    	
			node.type = "file";
			node.size = "60";
			node.name = "fjlist";
	    	newTd.appendChild(node);
	    	newTd = newTr.insertCell(2);
	    	newTd.align="center";
	    	newTd.className="NormalDataColumn";
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
		</script>
	</head>
	<body onload="_resizeNoPage();">
		<form action="add.jsp" name="form1" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="dxtx" value=""/>
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
						发文登记
					</td>
					<td width="74%" align="left" class="mhead">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="left">
										<input type="button" class="button" id="button"
											onclick="checkForm('pub');" value="发文">
										&nbsp;
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
										文件标题<span style="color: red">&nbsp;*</span>
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<input type="text" name="bt" class="inputStyle"
											style="width: 400px;">
											<input type="checkbox" name="checked" id="checked" value="1" checked>短信提醒
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										发文类型<span style="color: red">&nbsp;*</span>
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<select name="lb" onchange="lbz(this)" style="width: 200px;">
			                            	<option value="" selected>请选择 </option>
			                                <option value="公司文件">公司文件</option>
			                                <option value="党委文件">党委文件</option>
			                                <option value="办公室文件">办公室文件</option>
			                                <option value="会议纪要">会议纪要</option>
			                                <option value="领导讲话">领导讲话</option>
			                                <option value="督查通报">督查通报</option>
			                                <option value="调研报告">调研报告</option>
			                                <option value="各委员会文件">各委员会文件</option>
			                                <option value="其它">其它</option>
		                            	</select> 
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										文件编号<span style="color: red">&nbsp;*</span>
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<input type="text" name="wjbh" class="inputStyle"
											style="width: 300px;">
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										密级
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<select name="mmcd" style="width: 100px;">
			                                <option value="无">无</option>
			                                <option value="秘密">秘密</option>
			                                <option value="机密">机密</option>
			                                <option value="绝密">绝密</option>
		                            	</select>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										缓急时限
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<select id="hjsx" name="hjsx" style="width: 100px;">
			                                <option value="无">无</option>
			                                <option value="平急">平急</option>
			                                <option value="紧急">紧急</option>
			                                <option value="特急">特急</option>
		                            	</select>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										签收人<span style="color: red">&nbsp;*</span>
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<input type="text" name="checkman" readonly="readonly" class="inputStyle"
											style="width: 400px;">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										签发人
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<input type="text" name="qfr" class="inputStyle" value="<%=_user.getRealName() %>"
											style="width: 50px;">
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										签发日期
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<input type="text" name="qfrq" class="Wdate" onClick="WdatePicker()" value="<%=DateUtil.format(DateUtil.getDate(),"yyyy-MM-dd") %>">
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										拟稿部门
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<select name="ngbm" style="width: 200px;">
											<%for(int i=0;i<departmentList.size(); i++){ 
												COrgnization dep = (COrgnization)departmentList.get(i);%>
											<option value="<%=dep.getOrgnaName() %>"><%=dep.getOrgnaName() %></option>
											<%} %>
										</select> 
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										共印份数
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<input type="text" name="gyfs" class="inputStyle" value="5"
											style="width: 30px;">
									</td>
								</tr>
								<!-- tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										主题词
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<input type="text" name="ztc" class="inputStyle"
											style="width: 400px;">
									</td>
								</tr -->
								
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										主送
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
											<textarea name="zs" class="inputStyle" 
											style="width: 300px;"></textarea>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										抄送
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<textarea name="cs" class="inputStyle" 
											style="width: 300px;"></textarea>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										抄报
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<textarea name="cb" class="inputStyle" 
											style="width: 300px;"></textarea>
									</td>
								</tr>
								<!--  tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										是否加急
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<select name="sfjj" style="width: 100px;">
			                            	<option value="否" selected>否</option>
			                                <option value="是">是</option>
		                            	</select> 
									</td>
								</tr-->

								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										备注
									</td>
									<td class="NormalDataColumn" align="left">
										&nbsp;&nbsp;
										<input type="text" name="bz" class="inputStyle"
											style="width: 400px;">
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="NormalColumnTitle">
										附件&nbsp;
									</td>
									<td class="NormalDataColumn" align="left" id="fileTd">
										1.&nbsp;&nbsp;
										<input type="file" name="file_1" style="width: 400px;">
									</td>
								</tr>
							</table>
							<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"
                       				class="mtabtab" id="attachTab">
				               <tr>
				               		<td class="NormalDataColumn" width="100%" nowrap colspan="3">其他附件：<input type="button" name="b_bc" class="button" value="添加" onclick="doAddAttachRow('attachTab');"></td>
				               </tr>
         					</table>
						</div>
					</td>
				</tr>

			</table>
		</form>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.sql.Timestamp" %>
<%@ include file="../../../import.jsp"%>
<%

	if (request.getMethod().equals("POST")) {

		FileUploadUtil fileUpload = new FileUploadUtil(request);
		String status = fileUpload.getParameter("status");
		String mustSign = fileUpload.getParameter("mustSign");
		String isPublic = fileUpload.getParameter("isPublic");
		String notititle = fileUpload.getParameter("notititle");
		String starttime = fileUpload.getParameter("starttime");
		String endtime = fileUpload.getParameter("endtime");
		String enddate = fileUpload.getParameter("enddate");
		String editor = fileUpload.getParameter("editor");
		String subscriber = fileUpload.getParameter("subscriber");
		String bz = fileUpload.getParameter("bz");

		String noticeid = StringUtil.getUUID();
		OfficeNotice on = new OfficeNotice();
		on.setNoticeid(noticeid);
		on.setNotititle(notititle);
		on.setContent(editor);
		on.setIp(request.getRemoteAddr());
		on.setIspublic(isPublic==null||isPublic.equals("")?"0":isPublic);
		on.setMustsign(mustSign==null||mustSign.equals("")?"0":mustSign);
		on.setNote(bz);
		on.setNotiunit(_user.getOrgnaId());
		on.setRlsdate(DateUtil.getDateTime());
		on.setStatus(status);
		on.setSubscriber(subscriber);

		try {
			on.setStartime(new Timestamp(DateUtil.parse(starttime,
					"yyyy-MM-dd HH:mm").getTime()));
		} catch (Exception e) {

		}

		try {
			on.setEndtime(new Timestamp(DateUtil.parse(endtime,
					"yyyy-MM-dd HH:mm").getTime()));
		} catch (Exception e) {

		}

		try {
			on.setEnddate(DateUtil.parse(enddate));
		} catch (Exception e) {

		}
        officeNoticeDAO.insert(on);

		//保存附件信息
		List fileList = fileUpload.uploadFile(filePath);
		for (int i = 0; i < fileList.size(); i++) {
			Map map = (Map) fileList.get(i);
			OfficeFile uploadFile = new OfficeFile();
			uploadFile.setPkid(StringUtil.getUUID());
			uploadFile.setFkid(noticeid);
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
		String[] ubox = fileUpload.getParameters("ubox");
		
		for(int i=0; i<ubox.length; i++){
			OfficeNoticeCheck onc = new OfficeNoticeCheck();
			onc.setNoticeid(on.getNoticeid());
			onc.setCheckflag("0");
			onc.setCheckid(StringUtil.getUUID());
			onc.setCheckman(ubox[i]);
            officeNoticeCheckDAO.insert(onc);
			
		}
%>
		<script>
		    window.location='index.jsp';
		</script>
<%	}
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
		<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet"  type="text/css">
		<link href="<%=request.getContextPath()%>/images/css.css" rel="stylesheet"  type="text/css">
		<link href="<%=request.getContextPath()%>/css/ext-all.css" rel="stylesheet" type="text/css">
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
				if(document.form1.status[0].checked && document.form1.mustSign[0].checked){
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
				if(document.form1.notititle.value==""){
					document.form1.notititle.focus();
					alert("请输入通知标题");
					return;
				}
				if(!CheckDateTime(document.form1.starttime)){
					alert("请输入正确的开始时间,例如2009-12-23 15:46");
					return;
				}
				if(!CheckDateTime(document.form1.endtime)){
					alert("请输入正确的结束时间,例如2009-12-23 15:46");
					return;
				}
				if(!CheckDate(document.form1.enddate)){
					alert("请输入正确的过期时间,例如2009-12-23");
					return;
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
		CKEDITOR.replace( 'editor',
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
//			                    deferredRender:false,
			                    border:false
			                }),
			                buttons: [{
			                    text:'确定',
			                    handler: function(){
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
		<form action="add.jsp" name="form1" method="post"
			enctype="multipart/form-data">
        <div id="hello-win" class="x-hidden">
            <div id="hello-tabs">
                <div class="x-tab" title="请选择签收用户">
                    <table border="0" width="100%">
                        <tr>
                            <td colspan="6" align="left">
                                <input type="checkbox" name="allBox" onclick="checkAll(this);">全选&nbsp;
                                <input type="checkbox" name="allBox" onclick="checkUnAll();">反选&nbsp;
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
                            <td><input type="checkbox" name="ubox" value="<%=u.getUserId() %>"><%=u.getRealName() %></td>
                            <%	}else if(i%6==0){ %>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="ubox" value="<%=u.getUserId() %>"><%=u.getRealName() %></td>
                            <%	}else{ %>
                            <td><input type="checkbox" name="ubox" value="<%=u.getUserId() %>"><%=u.getRealName() %></td>
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
                            <td><input type="checkbox" name="ubox" value="<%=u.getUserId() %>"><%=u.getRealName() %></td>
                            <%	}else if(i%6==0){ %>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="ubox" value="<%=u.getUserId() %>"><%=u.getRealName() %></td>
                            <%	}else{ %>
                            <td><input type="checkbox" name="ubox" value="<%=u.getUserId() %>"><%=u.getRealName() %></td>
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
                            <td><input type="checkbox" name="ubox" value="<%=u.getUserId() %>"><%=u.getRealName() %></td>
                            <%	}else if(i%6==0){ %>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="ubox" value="<%=u.getUserId() %>"><%=u.getRealName() %></td>
                            <%	}else{ %>
                            <td><input type="checkbox" name="ubox" value="<%=u.getUserId() %>"><%=u.getRealName() %></td>
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
				background="<%=request.getContextPath()%>/images/mhead.jpg">
				<tr>
					<td width="3%" align="center">
						<img src="<%=request.getContextPath()%>/images/mlogo.jpg" width="11"
							height="11">
					</td>
					<td width="15%" class="mhead">
						新建通知
					</td>
					<td width="74%" align="left" class="mhead">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="left">
										<input type="button" class="button" id="button"
											onclick="checkForm();" value="保存">
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
										通知/公告<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<input type="radio" name="isPublic" value="1"
											checked="checked" onclick="publicSelect(this);">
										通知&nbsp;
										<input type="radio" name="isPublic" value="0"
											onclick="publicSelect(this);">
										公告
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										通知状态<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<input type="radio" name="status" value="1" checked="checked">
										发布&nbsp;
										<input type="radio" name="status" value="0">
										草稿
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										是否需要签收<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<input type="radio" name="mustSign" value="1"
											checked="checked" onclick="mustSignSelect(this);">
										需签收&nbsp;
										<input type="radio" name="mustSign" value="0" onclick="mustSignSelect(this);">
										不需签收&nbsp;
										<button id="mb3" class="button">
											签收人
										</button>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										通知标题<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<input type="text" name="notititle" class="inputStyle"
											style="width: 400px;">
									</td>
								</tr>

								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										开始时间<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<input type="text"
											onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"
											name="starttime" class="Wdate" style="width: 200px;">
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										结束时间<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<input type="text"
											onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"
											name="endtime" class="Wdate" style="width: 200px;">
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										过期时间<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<input type="text" name="enddate" class="Wdate" onClick="WdatePicker()">
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										正文
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<textarea cols="80" id="editor" name="editor" rows="10"></textarea>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										签发人
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<input type="text" name="subscriber" class="inputStyle"
											value="<%=_user.getRealName()%>" style="width: 100px;">
									</td>
								</tr>

								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										备注
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<input type="text" name="bz" class="inputStyle"
											style="width: 200px;">
									</td>
								</tr>
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
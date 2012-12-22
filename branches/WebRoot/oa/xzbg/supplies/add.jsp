<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ include file="../../../import.jsp"%>
<%
    CUser cUser = (CUser)session.getAttribute("cUser");
    String curRole = request.getParameter("curRole");
    cUser = cUser == null?new CUser():cUser;
    String orgId = cUser.getOrgnaId();
    Map paramMap = new HashMap();
    paramMap.put("orgnaId",orgId);
    COrgnization cOrgnization = orgnizationDAO.queryForBean(paramMap);
    cOrgnization = cOrgnization == null?new COrgnization():cOrgnization;
	if (request.getMethod().equals("POST")) {
		FileUploadUtil fileUpload = new FileUploadUtil(request);
        String mc = StringUtil.parseNull(fileUpload.getParameter("mc"),"");
        String sqdw = StringUtil.parseNull(fileUpload.getParameter("sqdw"),"");
        curRole = StringUtil.parseNull(fileUpload.getParameter("curRole"),"");
        String editor = StringUtil.parseNull(fileUpload.getParameter("editor"),"");
        String sqsj = StringUtil.parseNull(fileUpload.getParameter("sqsj"),"");
        String flag = StringUtil.parseNull(fileUpload.getParameter("flag"),"");
        String dxtx = StringUtil.parseNull(fileUpload.getParameter("dxtx"),"");
        OfficeSupplies officeSupplies = new  OfficeSupplies();
        String sqid = StringUtil.getUUID();
        officeSupplies.setSqid(sqid);
        officeSupplies.setMc(mc);
        //officeSupplies.setSl(sl);
        officeSupplies.setSqzt("已保存");//保存状态
        officeSupplies.setDxtx(dxtx);
        officeSupplies.setSy(editor);
        officeSupplies.setSqdw(sqdw);
        officeSupplies.setRoleflag(curRole);
        officeSupplies.setSqsj(DateUtil.parse(sqsj,"yyyy-MM-dd"));
        if(cUser != null)
            officeSupplies.setSqr(cUser.getUserId());
        if("startup".equals(flag)){
            officeSupplies.setSqzt("已申请");
            //创建流程代码在这里
            Status status =null;
            if("1".equals(curRole)){//井队启动
            	status = workflow.startWorkflow("ae2c48f7-1f3f-41e6-888b-11b31b9249f6",cUser.getUserId());
            }else if("2".equals(curRole)){//科室长启动
            	status = workflow.startWorkflow("f57a7396-c2d7-4deb-b39e-562fa937acd7",cUser.getUserId());
            }else if("3".equals(curRole)){//科室长启动
                status = workflow.startWorkflow("fbcb0432-d64e-44b3-91d9-a99b64b091b1",cUser.getUserId());
            }
            officeSupplies.setProcessId(status.getProcessId());
            officeSupplies.setConnectId(status.getConnectId());
        }
        officeSuppliesDAO.addOfficeSupplies(officeSupplies);
        
        //保存附件信息
		List fileList = fileUpload.uploadFile(filePath);
		for (int i = 0; i < fileList.size(); i++) {
			Map map = (Map) fileList.get(i);
			OfficeFile uploadFile = new OfficeFile();
			uploadFile.setPkid(StringUtil.getUUID());
			uploadFile.setFkid(sqid);
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
%>
		<script>
		    window.location='index.jsp?curRole=<%=curRole%>';
		</script>
<%	}
     List userList  = dao.getAllUser();
     List departmentList = orgnizationDAO.queryForList(null);
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
		<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet"  type="text/css">
		<link href="<%=request.getContextPath()%>/images/css.css" rel="stylesheet"  type="text/css">
		<link href="<%=request.getContextPath()%>/js/ext/resources/css/ext-all.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" charset="GB2312"
			src="<%=request.getContextPath()%>/js/date/WdatePicker.js" defer="true"></script>
		<%--<script type="text/javascript"--%>
			<%--src="<%=request.getContextPath()%>/js/ckeditor/ckeditor.js"></script>--%>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/ext/ext-all.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/xheditor/jquery/jquery-1.4.4.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/xheditor/xheditor-1.1.14-zh-cn.min.js"></script>

		
		<script type="text/javascript" defer="true">
//		CKEDITOR.replace( 'editor',
//		{
//			skin : 'office2003'
//		});
//
//		//隐藏不需要的工具按钮
//		CKEDITOR.editorConfig = function( config )
//		{
//		    config.toolbar = 'MyToolbar';
//		    config.toolbar_MyToolbar =
//		    [
//		        ['NewPage','Preview'],
//		        ['Cut','Copy','Paste','PasteText','PasteFromWord','-'],
//		        ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
//		        ['Image','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
//		        '/',
//		        ['Styles','Format'],
//		        ['Bold','Italic','Strike'],
//		        ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
//		        ['Link','Unlink','Anchor'],
//		        ['Maximize','-','About']
//		    ];
//		};
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
                 if(document.form1.mc.value==""){
                    document.form1.mc.focus();
                    alert("请输入名称！");
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
                if(document.form1.mc.value==""){
                    document.form1.mc.focus();
                    alert("请输入名称！");
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
		<form action="add.jsp" name="form1" id="form1" method="post"
			enctype="multipart/form-data">
            <input type="hidden" name="flag" value=""/>
             <input type="hidden" name="curRole" value="<%=curRole%>">
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
						新建其他申请
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
							style="width: 1000px; overflow: auto; cursor: default; display: inline; position: absolute; height: 500px;">
							<table width="100%" border="0" align="center" cellpadding="0"
								cellspacing="0" class="mtabtab" id="mtabtab">
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										名称<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" style="text-align: left">
                                        关于<input type="text" name="mc" class="inputStyle"
											style="width: 200px;" maxlength="20">的请示
											<input type="checkbox" name="checked" id="checked" value="1">短信提醒
									</td>
								</tr>
								
								<!-- tr>
									<td nowrap="nowrap" width="120" class="head_left">
										数量<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" style="text-align: left">
										<input type="text" name="sl" class="inputStyle"
											style="width: 300px;">
									</td -->
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										申请单位<span style="color: red">&nbsp;*</span>
									</td>
										<td class="head_right" style="text-align: left">
                                        <input type="hidden" name="sqdw" value="<%=StringUtil.parseNull(cOrgnization.getOrgnaName(),"")%>"/><%=StringUtil.parseNull(cOrgnization.getOrgnaName(),"")%>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										申请日期
									</td>
									<td class="head_right" style="text-align: left">
										<input type="text" name="sqsj" class="Wdate" onClick="WdatePicker()" value="<%=DateUtil.format(DateUtil.getDate(),"yyyy-MM-dd") %>">
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										事由
									</td>
									<td class="head_right" style="text-align: left">
									<textarea cols="80" id="editor" name="editor" rows="15" style="width:100%"  class="xheditor {submitID:'form1'}">
                                        <p>
                                            <strong>公司领导：</strong></p>
                                        <p>
                                            &nbsp;</p>
                                        <p>
                                            &nbsp;</p>
                                        <p>
                                            &nbsp;</p>
                                        <p>
                                            <strong>&nbsp;妥否，请批示。 </strong></p>
                                    </textarea>
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
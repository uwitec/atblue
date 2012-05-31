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
		String orgId = _user.getOrgnaId();
//	String options = workFlow.getNextUserSelectOptions("副经理",orgId);
	String nexVal = "";
	String sql = "select to_char(sysdate,'yyyy-')||lpad(to_number(substr(swh,6))+1,'3','0') val from office_circulation  where substr(swh,0,4)='" + DateUtil.format(DateUtil.getDate(),"yyyy") +"' order by substr(swh,0,4) desc, substr(swh,6) desc";
	sql ="SELECT * FROM (SELECT A.*, rownum r FROM (" + sql;
	sql += ") A WHERE rownum<=1*1) B WHERE r > (1 - 1) *1";
	List valList = officeCirculationDAO.getMapByFreeSql(sql);
	if(valList != null && valList.size()>0){
		Map map = (Map)valList.get(0);
		nexVal = (String)map.get("VAL");
	}else{
		nexVal = DateUtil.format(DateUtil.getDate(),"yyyy")+"-"+"001";
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
		String dxtx = fileUpload.getParameter("dxtx");

		String documentid = StringUtil.getUUID();
		
		OfficeCirculation document = new OfficeCirculation();
		
		document.setCyid(documentid);
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
		document.setDxtx(dxtx);
        if("startup".equals(act)){
            document.setZt("已申请");
            //创建流程代码在这里
            Status status = workflow.startWorkflow("debd1b0c-875d-4cc8-8169-58aa168f721d",cUser.getUserId());
            document.setProcessId(status.getProcessId());
            document.setConnectId(status.getConnectId());
        }
		officeCirculationDAO.insert(document);
		
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
			officeFileDAO.insert(
					uploadFile);
		}
//        String[] ubox = fileUpload.getParameters("ubox");
//        for(int i=0; i<ubox.length; i++){
//            OfficeCirculationCheck odc = new OfficeCirculationCheck();
//            odc.setPkid(StringUtil.getUUID());
//            odc.setCheckflag("0");
//            odc.setCheckman(ubox[i]);
//            odc.setCyid(documentid);
//            officeCirculationCheckDAO.insert(odc);
//        }
//
//		//保存用户
//		if(act!=null && act.equals("pub")){
//
//				String ps = fileUpload.getParameter("ps");
//
//				Status status = null;
//
//				OfficeCirculationCheck odc = new OfficeCirculationCheck();
//				odc.setPkid(StringUtil.getUUID());
//				odc.setCheckflag("0");
//				odc.setCheckman(nbr);
//				odc.setCyid(documentid);
//				officeCirculationDAO.updateByPrimaryKey(document);
//				officeCirculationCheckDAO.insert(odc);
//
//				//抛入消息池
//				UMessage um = new UMessage();
//				um.setAppkey(document.getCyid());
//				um.setAppname("文件传阅");
//				um.setFlag(0);
//				um.setId(StringUtil.getUUID());
//				um.setUrl("/office/circulation/sp.jsp?pkid="+document.getCyid());
//				um.setMessage("[" + DateUtil.format(document.getLrsj(),"yyyy-MM-dd") + "]&nbsp;传阅文件" + document.getWjbh() + "需要审批。");
//				um.setReceiver(nbr);
//				um.setReceiverid(nbr);
//				um.setSender(_user.getUserId());
//				um.setSendtime(DateUtil.getDateTime());
//				uMessageDAO.insert(um);
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
    userList = userList == null?new ArrayList():userList;
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
        <script src="<%=request.getContextPath()%>/js/common.js"
                type="text/javascript" defer="defer"></script>
        <link href="<%=contentPath%>/css/css.css" rel="stylesheet" type="text/css">
        <link href="<%=contentPath%>/images/css.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" charset="GB2312"
			src="<%=request.getContextPath()%>/js/date/WdatePicker.js" defer="defer"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/ckeditor/ckeditor.js"></script>

		
		<script type="text/javascript">
			function checkForm(act){
//                var has = false;
//                for(var i=0; i<document.form1.ubox.length; i++){
//                    if(document.form1.ubox[i].checked){
//                        has = true;
//                        break;
//                    }
//                }
//                if(!has){
//                    alert("请选择签收用户.");
//                    return;
//                }
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
				if(document.getElementById("checked").checked){
                	 document.all.dxtx.value="1";
                }else if(!document.getElementById("checked").checked){
                	document.all.dxtx.value="0";
                }
				document.form1.submit();
			}
			
			
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
		
		<script type="text/javascript">
			function lbz(obj){
				document.form1.wjbh.value=obj.value;
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
			<input type="hidden" name="act" value="">
			<input type="hidden" name="dxtx" value=""/>
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
                                        <input type="button" class="button"
                                               onclick="checkForm('save');" value="保存">
										&nbsp;
                                        <input type="button" class="button"
                                               onclick="checkForm('startup');" value="创建并启动流程">
										&nbsp;
										<input type="button" class="button"
											onclick="window.location='index.jsp'" value="返回">
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
										来文时间<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<input type="text" name="lwsj" class="Wdate" onClick="WdatePicker()" value="<%=DateUtil.format(DateUtil.getDate(),"yyyy-MM-dd") %>">
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										来文单位<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<input type="text" name="lwdw" class="inputStyle"
											style="width: 200px;"><input type="checkbox" name="checked" id="checked" value="1">短信提醒
									</td>
								</tr>
								
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										文件编号<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<input type="text" name="wjbh" class="inputStyle"
											style="width: 300px;">
									</td>
								</tr>

								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										文件名称<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<input type="text" name="wjmc" class="inputStyle"
											style="width: 400px;">
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										份数
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<input type="text" name="fs" class="inputStyle"
											style="width: 50px;" onkeyup="this.value=this.value.replace(/[^\d\.]+?/g, '')">
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										收文号
									</td>
									<td class="head_right" align="left" style="text-align: left">
										<input type="text" name="swh" class="inputStyle"
											style="width: 200px;" value="<%=nexVal %>">
									</td>
								</tr>
                                <%--<tr>--%>
                                    <%--<td nowrap="nowrap" width="120" class="head_left">--%>
                                        <%--传阅人<span style="color: red">&nbsp;*</span>--%>
                                    <%--</td>--%>
                                    <%--<td class="head_right" align="left" style="text-align: left">--%>
                                       <%--<button id="mb3" class="button">--%>
											<%--签收人--%>
										<%--</button>--%>
                                    <%--</td>--%>
                                <%--</tr>--%>
								<%--<tr>--%>
									<%--<td nowrap="nowrap" width="120" class="head_left">--%>
										<%--部门经理--%>
									<%--</td>--%>
									<%--<td class="head_right" align="left" style="text-align: left">--%>
										<%--<select name="nbr" style="width: 100px;">--%>
											<%--<%=options%>--%>
		                            	<%--</select>--%>
									<%--</td>--%>
								<%--</tr>--%>
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
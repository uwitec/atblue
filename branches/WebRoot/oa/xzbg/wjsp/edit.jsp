<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ include file="../../../import.jsp"%>
<%

    CUser cUser = (CUser)session.getAttribute("cUser");
    cUser = cUser == null?new CUser():cUser;
    String orgId = cUser.getOrgnaId();
    Map paramMap = new HashMap();
    paramMap.put("orgnaId",orgId);
    COrgnization cOrgnization = orgnizationDAO.queryForBean(paramMap);
    String documentid = StringUtil.parseNull(request.getParameter("documentid"),"");
    Map map1 = new HashMap();
    map1.put("documentid",documentid);
    OfficeWjsp wjsp = officeWjspDAO.queryForBean(map1);
    List hasFileList = officeFileDAO.getByFk(documentid);
    wjsp = wjsp == null?new OfficeWjsp():wjsp;
	if (request.getMethod().equals("POST")) {
        FileUploadUtil fileUpload = new FileUploadUtil(request);
        String bt = StringUtil.parseNull(fileUpload.getParameter("bt"),"");
        documentid = StringUtil.parseNull(fileUpload.getParameter("documentid"),"");
        String lb = StringUtil.parseNull(fileUpload.getParameter("lb"),"");
        String wjbh = StringUtil.parseNull(fileUpload.getParameter("wjbh"),"");
        String mmcd = StringUtil.parseNull(fileUpload.getParameter("mmcd"),"");
        String hjsx = StringUtil.parseNull(fileUpload.getParameter("hjsx"),"");
        String ngbm = StringUtil.parseNull(fileUpload.getParameter("ngbm"),"");
        String bz = StringUtil.parseNull(fileUpload.getParameter("bz"),"");
        String qfrq = StringUtil.parseNull(fileUpload.getParameter("qfrq"),"");
        String flag = StringUtil.parseNull(fileUpload.getParameter("flag"),"");
        String dxtx = StringUtil.parseNull(fileUpload.getParameter("dxtx"),"");
        wjsp.setDocumentid(documentid);
        wjsp.setBz(bz);
        wjsp.setBt(bt);
        wjsp.setLb(lb);
        wjsp.setHjsx(hjsx);
        wjsp.setMmcd(mmcd);
        wjsp.setNgbm(ngbm);
        wjsp.setWjbh(wjbh);
        wjsp.setSqzt("已保存");//保存状态
         wjsp.setDxtx(dxtx);
        wjsp.setQfrq(new java.util.Date());
        if(cUser != null)
            wjsp.setSqr(cUser.getUserId());
        if("startup".equals(flag)){
            wjsp.setSqzt("已申请");
            //创建流程代码在这里
            Status status = workflow.startWorkflow("297abec3-fa04-4a32-b67b-3ef36368aa38",cUser.getUserId());
            wjsp.setProcessId(status.getProcessId());
            wjsp.setConnectId(status.getConnectId());
        }
        try{
        	officeWjspDAO.modOfficeWjsp(wjsp);
        }catch(Exception e){
        	e.printStackTrace();
        }
        
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
%>
		<script>
		    window.location='index.jsp';
		</script>
<%	}
     List userList  = dao.getAllUser();
     List departmentList = orgnizationDAO.queryForList(null);
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
		<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet" type="text/css">
		<link href="<%=request.getContextPath()%>/images/css.css" rel="stylesheet" type="text/css">
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
                 if(document.form1.bt.value==""){
                    document.form1.bt.focus();
                    alert("请输入文件标题！");
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
               if(document.form1.bt.value==""){
                    document.form1.bt.focus();
                    alert("请输入文件标题！");
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
		<form action="edit.jsp" name="form1" method="post" enctype="multipart/form-data">
            <input type="hidden" name="flag" value=""/>
            <input type="hidden" name="dxtx" value=""/>
            <input type="hidden" name="documentid" value="<%=documentid%>"/>
			<table width="100%" height="25" border="0" cellpadding="0"
				cellspacing="0"
				background="<%=request.getContextPath()%>/images/mhead.jpg">
				<tr>
					<td width="3%" align="center">
						<img src="<%=request.getContextPath()%>/images/mlogo.jpg" width="11"
							height="11">
					</td>
					<td width="15%" class="mhead">
						修改文件审批
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
							style="width: 1000px; overflow: auto; cursor: default; display: inline; position: absolute; height: 200px;">
							<table width="100%" border="0" align="center" cellpadding="0"
								cellspacing="0" class="mtabtab" id="mtabtab">
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										文件标题<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" style="text-align: left">
										<input type="text" name="bt" class="inputStyle" value="<%=wjsp.getBt()%>"
											style="width: 200px;" maxlength="20">
											<input type="checkbox" name="checked" id="checked" value="" <%if(!"0".equals(wjsp.getDxtx())){ %>checked<%}%>>短信提醒
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										发文类型<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" style="text-align: left">
										<select name="lb" onchange="lbz(this)" style="width: 200px;">
			                            	<option value="" selected>请选择 </option>
			                                <option value="公司文件" <%if("公司文件".equals(wjsp.getLb())){out.println("selected");}%>>公司文件</option>
			                                <option value="党委文件" <%if("党委文件".equals(wjsp.getLb())){out.println("selected");}%>>党委文件</option>
			                                <option value="办公室文件" <%if("办公室文件".equals(wjsp.getLb())){out.println("selected");}%>>办公室文件</option>
			                                <option value="会议纪要" <%if("会议纪要".equals(wjsp.getLb())){out.println("selected");}%>>会议纪要</option>
			                                <option value="领导讲话" <%if("领导讲话".equals(wjsp.getLb())){out.println("selected");}%>>领导讲话</option>
			                                <option value="督查通报" <%if("督查通报".equals(wjsp.getLb())){out.println("selected");}%>>督查通报</option>
			                                <option value="调研报告" <%if("调研报告".equals(wjsp.getLb())){out.println("selected");}%>>调研报告</option>
			                                <option value="各委员会文件" <%if("各委员会文件".equals(wjsp.getLb())){out.println("selected");}%>>各委员会文件</option>
			                                <option value="其它" <%if("其它".equals(wjsp.getLb())){out.println("selected");}%>>其它</option>
		                            	</select> 
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										文件编号<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" style="text-align: left">
										<input type="text" name="wjbh" class="inputStyle" value="<%=wjsp.getWjbh()%>"
											style="width: 300px;">
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										密级
									</td>
									<td class="head_right" style="text-align: left">
										<select name="mmcd" style="width: 100px;">
			                                <option value="无" <%if("无".equals(wjsp.getMmcd())){out.println("selected");}%>>无</option>
			                                <option value="秘密" <%if("秘密".equals(wjsp.getMmcd())){out.println("selected");}%>>秘密</option>
			                                <option value="机密" <%if("机密".equals(wjsp.getMmcd())){out.println("selected");}%>>机密</option>
			                                <option value="绝密" <%if("绝密".equals(wjsp.getMmcd())){out.println("selected");}%>>绝密</option>
		                            	</select>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										缓急时限
									</td>
									<td class="head_right" style="text-align: left">
										<select id="hjsx" name="hjsx" style="width: 100px;">
			                                <option value="无" <%if("无".equals(wjsp.getHjsx())){out.println("selected");}%>>无</option>
			                                <option value="平急" <%if("平急".equals(wjsp.getHjsx())){out.println("selected");}%>>平急</option>
			                                <option value="紧急" <%if("紧急".equals(wjsp.getHjsx())){out.println("selected");}%>>紧急</option>
			                                <option value="特急" <%if("特急".equals(wjsp.getHjsx())){out.println("selected");}%>>特急</option>
		                            	</select>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										签发日期
									</td>
									<td class="head_right" style="text-align: left">
										<input type="text" name="qfrq" class="Wdate" onClick="WdatePicker()" value="<%=DateUtil.format(wjsp.getQfrq(),"yyyy-MM-dd") %>">
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										拟稿部门
									</td>
									<td class="head_right" style="text-align: left">
										<select name="ngbm" style="width: 200px;">
											<%for(int i=0;i<departmentList.size(); i++){ 
												COrgnization dep = (COrgnization)departmentList.get(i);%>
											<option value="<%=dep.getOrgnaName() %>" <%if(dep.getOrgnaName().equals(wjsp.getNgbm())){out.println("selected");} %>><%=dep.getOrgnaName() %></option>
											<%} %>
										</select> 
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										备注
									</td>
									<td class="head_right" style="text-align: left">
										<input type="text" name="bz" class="inputStyle" value="<%=wjsp.getBz()%>"
											style="width: 400px;">
									</td>
								</tr>
								<%if(hasFileList!=null && hasFileList.size()>0){ %>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										已有附件
									</td>
									<td class="head_right" style="text-align: left">
										<%
											for(int i=0; i<hasFileList.size(); i++){
												OfficeFile beanFile = (OfficeFile)hasFileList.get(i);%>
											<a href="../../officeFileDownload?pkid=<%=beanFile.getPkid() %>" >
												<img src="<%=request.getContextPath()%>/fileIco/<%=beanFile.getWjlx() %>.png" onerror="this.src='<%=request.getContextPath()%>/fileIco/other.png'" style="cursor: pointer;" border="0" alt="<%=beanFile.getWjm() %>(<%=StringUtil.getFileSize(beanFile.getWjcc().doubleValue()) %>)"><%=beanFile.getWjm() %>
											</a>&nbsp;&nbsp;&nbsp;
											<a href="javascript:delFile('<%=beanFile.getPkid() %>','<%=documentid %>')">[删除]</a></br>
									     <%}%>
									</td>
								</tr>
								<%} %>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										附件&nbsp;
									</td>
									<td class="head_right" style="text-align: left">
										1.&nbsp;&nbsp;
										<input type="file" name="file_1" style="width: 400px;">
									</td>
								</tr>
							</table>
							<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0"
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
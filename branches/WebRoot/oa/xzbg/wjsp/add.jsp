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
    cOrgnization = cOrgnization == null?new COrgnization():cOrgnization;
	if (request.getMethod().equals("POST")) {
		FileUploadUtil fileUpload = new FileUploadUtil(request);
        String bt = StringUtil.parseNull(fileUpload.getParameter("bt"),"");
        String lb = StringUtil.parseNull(fileUpload.getParameter("lb"),"");
        String wjbh = StringUtil.parseNull(fileUpload.getParameter("wjbh"),"");
        String mmcd = StringUtil.parseNull(fileUpload.getParameter("mmcd"),"");
        String hjsx = StringUtil.parseNull(fileUpload.getParameter("hjsx"),"");
        String ngbm = StringUtil.parseNull(fileUpload.getParameter("ngbm"),"");
        String bz = StringUtil.parseNull(fileUpload.getParameter("bz"),"");
        String qfrq = StringUtil.parseNull(fileUpload.getParameter("qfrq"),"");
        String flag = StringUtil.parseNull(fileUpload.getParameter("flag"),"");
        String dxtx = StringUtil.parseNull(fileUpload.getParameter("dxtx"),"");
        OfficeWjsp officeWjsp = new  OfficeWjsp();
        String documentid = StringUtil.getUUID();
        officeWjsp.setDocumentid(documentid);
        officeWjsp.setBz(bz);
        officeWjsp.setBt(bt);
        officeWjsp.setLb(lb);
        officeWjsp.setHjsx(hjsx);
        officeWjsp.setMmcd(mmcd);
        officeWjsp.setNgbm(ngbm);
        officeWjsp.setWjbh(wjbh);
        officeWjsp.setSqzt("已保存");//保存状态
        officeWjsp.setDxtx(dxtx);
        officeWjsp.setQfrq(new java.util.Date());
        if(cUser != null)
            officeWjsp.setSqr(cUser.getUserId());
        if("startup".equals(flag)){
            officeWjsp.setSqzt("已申请");
            //创建流程代码在这里
            Status status = workflow.startWorkflow("297abec3-fa04-4a32-b67b-3ef36368aa38",cUser.getUserId());
            officeWjsp.setProcessId(status.getProcessId());
            officeWjsp.setConnectId(status.getConnectId());
        }
        officeWjspDAO.addOfficeWjsp(officeWjsp);
        
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
//     List departmentList = orgnizationDAO.queryForList(null);
     List orgTreeList = dao.getSelectOrgTrees();
    orgTreeList = orgTreeList == null?new ArrayList():orgTreeList;
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
		<form action="add.jsp" name="form1" method="post" enctype="multipart/form-data">
            <input type="hidden" name="flag" value=""/>
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
						新建文件审批
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
										文件标题<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" style="text-align: left">
										<input type="text" name="bt" class="inputStyle"
											style="width: 200px;" maxlength="20">
											<input type="checkbox" name="checked" id="checked" value="1">短信提醒
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										发文类型<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" style="text-align: left">
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
									<td nowrap="nowrap" width="120" class="head_left">
										文件编号<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" style="text-align: left">
										<input type="text" name="wjbh" class="inputStyle"
											style="width: 300px;">
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										密级
									</td>
									<td class="head_right" style="text-align: left">
										<select name="mmcd" style="width: 100px;">
			                                <option value="无">无</option>
			                                <option value="秘密">秘密</option>
			                                <option value="机密">机密</option>
			                                <option value="绝密">绝密</option>
		                            	</select>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										缓急时限
									</td>
									<td class="head_right" style="text-align: left">
										<select id="hjsx" name="hjsx" style="width: 100px;">
			                                <option value="无">无</option>
			                                <option value="平急">平急</option>
			                                <option value="紧急">紧急</option>
			                                <option value="特急">特急</option>
		                            	</select>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										签发日期
									</td>
									<td class="head_right" style="text-align: left">
										<input type="text" name="qfrq" class="Wdate" onClick="WdatePicker()" value="<%=DateUtil.format(DateUtil.getDate(),"yyyy-MM-dd") %>">
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										拟稿部门
									</td>
									<td class="head_right" style="text-align: left">
										<select name="ngbm" style="width: 200px;">
                                            <option value="">请选择</option>
											<%for(int i=0;i<orgTreeList.size(); i++){
                                                Map dep = (Map)orgTreeList.get(i);%>
											<option value="<%=StringUtil.parseNull(dep.get("ORGNA_ID"),"")%>"><%=StringUtil.parseNull(dep.get("ORGNA_NAME"),"")%></option>
											<%} %>
										</select> 
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										备注
									</td>
									<td class="head_right" style="text-align: left">
                                        <textarea rows="4" cols="40" name="bz"></textarea>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										附件&nbsp;
									</td>
									<td class="head_right" style="text-align: left" id="fileTd">
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
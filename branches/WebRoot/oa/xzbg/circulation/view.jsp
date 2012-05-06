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
//	OfficeCirculationCheck officeCirculationCheck = officeCirculationCheckDAO.selectByPrimaryCyid(pkid);
//	if(officeCirculationCheck==null) officeCirculationCheck = new OfficeCirculationCheck();
    List userList  = dao.getGsldAllUser();
    List userList1  = dao.getJgksAllUser();
    List userList2  = dao.getJcdwAllUser();
    userList = userList == null?new ArrayList():userList;
    userList1 = userList1 == null?new ArrayList():userList1;
    userList2 = userList2 == null?new ArrayList():userList2;
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
		</script>
	</head>
	<body onload="_resizeNoPage();">
		<form name="form1" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="act" value="">
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
                                      <%=checkman%>
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
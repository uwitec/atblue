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
    String sqid = StringUtil.parseNull(request.getParameter("sqid"),"");
    Map map = new HashMap();
    map.put("sqid",sqid);
    OfficeHysq hysq = officeHysqDAO.queryForBean(map);
    String[] checkman =oDao.getCjhyryBySqid(sqid);
    hysq = hysq == null?new OfficeHysq():hysq;
    	if (request.getMethod().equals("POST")) {
        String SQID = StringUtil.parseNull(request.getParameter("SQID"),"");
        String DZYJ = StringUtil.parseNull(request.getParameter("DZYJ"),"");
        map.put("sqid",SQID);
        OfficeHysq officeHysq = officeHysqDAO.queryForBean(map);
        officeHysq.setSqid(SQID);
        officeHysq.setDzyj(DZYJ);
        officeHysqDAO.modOfficeHysq(officeHysq);
%>
		<script>
		    window.close();
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
		<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet" type="text/css">
		<link href="<%=request.getContextPath()%>/images/css.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" charset="GB2312"
			src="<%=request.getContextPath()%>/js/date/WdatePicker.js" defer="true"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/ckeditor/ckeditor.js"></script>
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
				if(document.form1.DZYJ.value==""){
					document.form1.DZYJ.focus();
					alert("请输入党政意见！");
					return;
				}
				document.form1.submit();
			}
            function startup(){
                var has = false;
                for (var i = 0; i < document.form1.ubox.length; i++) {
                    if (document.form1.ubox[i].checked) {
                        has = true;
                        break;
                    }
                }
                if (!has) {
                    alert("请选择签收用户.");
                    return;
                }
                if(document.form1.HYMC.value==""){
                    document.form1.HYMC.focus();
                    alert("请输入会议名称");
                    return;
                }
                if(!CheckDateTime(document.form1.SQKSSJ)){
                    alert("请输入正确的开始时间,例如2009-12-23 15:46");
                    return;
                }
                if(!CheckDateTime(document.form1.SQJSSJ)){
                    alert("请输入正确的结束时间,例如2009-12-23 15:46");
                    return;
                }
                document.all.flag.value="startup";
                document.form1.submit();
            }
		</script>
		<script type="text/javascript" defer="true">
		CKEDITOR.replace( 'HYNR',
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
		</script>
	</head>
	<body>
		<form action="yj.jsp" name="form1" method="post">
            <input type="hidden" name="flag" value=""/>
            <input type="hidden" name="sqid" value=""/>
			<table width="100%" height="25" border="0" cellpadding="0"
				cellspacing="0"
				background="<%=request.getContextPath()%>/images/mhead.jpg">
				<tr>
					<td width="3%" align="center">
						<img src="<%=request.getContextPath()%>/images/mlogo.jpg" width="11"
							height="11">
					</td>
					<td width="15%" class="mhead">
						查看会议申请
					</td>
					<td width="74%" align="left" class="mhead">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="left">
									<input type="button" class="button" id="button"
											onclick="checkForm();" value="保存">
										<input type="button" class="button" id="button1"
											onclick="window.close();" value="返回">
										&nbsp;
									</td>
									<td align="left">
									    <input type="checkbox" name="checked" id="checked" value="" <%if(!"0".equals(hysq.getDxtx())){ %>checked<%}%>>短信提醒
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
							<table width="100%" border="0" align="center" cellpadding="0"
								cellspacing="0" class="mtabtab" id="mtabtab">
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										会议名称
									</td>
									<td class="head_right" style="text-align: left">
                                        <input type="hidden" name="SQID" value="<%=StringUtil.parseNull(hysq.getSqid(),"")%>"  style="width:500px"/>
                                        <%=StringUtil.parseNull(hysq.getHymc(),"")%>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										申请部门
									</td>
									<td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(cOrgnization.getOrgnaName(),"")%>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										与会人员
									</td>
									<td class="head_right" style="text-align: left">
                                        <%
                                            StringBuffer sb = new StringBuffer();
                                            for(int i=0;i<checkman.length;i++){
                                                if(i > 0){
                                                    sb.append(",");
                                                }
                                                sb.append(dao.findUserById(checkman[i]).getRealName());
                                            } %>
                                        <%out.println(sb.toString());%>
									</td>
								</tr>

								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										申请开始时间
									</td>
									<td class="head_right" style="text-align: left">
                                        <%
                                            if(hysq.getSqkssj() != null){ %>
                                        <%=DateUtil.format(hysq.getSqkssj(),"yyyy-MM-dd HH:mm")%>
                                        <% }%> &nbsp;
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										申请结束时间
									</td>
									<td class="head_right" style="text-align: left">
                                        <%if(hysq.getSqjssj() != null){ %>
                                        <%=DateUtil.format(hysq.getSqjssj(), "yyyy-MM-dd HH:mm")%>
                                        <% }%>&nbsp;
									</td>
								</tr>

								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										会议内容及目的
									</td>
									<td class="head_right" style="text-align: left">
										<%=StringUtil.parseNull(hysq.getHynr(),"")%>&nbsp;
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										党政意见
									</td>
									<td class="head_right" style="text-align: left">
                                        <textarea cols="60"name="DZYJ" rows="5"><%=StringUtil.parseNull(hysq.getDzyj(),"")%></textarea>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										备注
									</td>
									<td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(hysq.getBz(),"")%>&nbsp;
									</td>
								</tr>
							</table>
					</td>
				</tr>

			</table>
		</form>
	</body>
</html>
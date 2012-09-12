<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ include file="../../import.jsp"%>
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
    JyglYjhfy bean = jyglYjhfyDAO.queryForBean(map);
    bean = bean == null?new JyglYjhfy():bean;
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
		<link href="<%=request.getContextPath()%>/images/css.css" rel="stylesheet" type="text/css">
		<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet" type="text/css">
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
		CKEDITOR.replace( 'YYSY',
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
	<body onload="_resizeNoPage();">
		<form action="add.jsp" name="form1" method="post">
            <input type="hidden" name="flag" value=""/>
			<table width="100%" height="25" border="0" cellpadding="0"
				cellspacing="0"
				background="<%=request.getContextPath()%>/images/mhead.jpg">
				<tr>
					<td width="3%" align="center">
						<img src="<%=request.getContextPath()%>/images/mlogo.jpg" width="11"
							height="11">
					</td>
					<td width="15%" class="mhead">
						查看预计划费用申请
					</td>
					<td width="74%" align="left" class="mhead">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="left">
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
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        负责部门
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getFzbm(),"&nbsp;")%>
                                    </td>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        季度
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getJd(),"&nbsp;")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        费用名称
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getFymc(),"&nbsp;")%>
                                    </td>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        费用项目
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getFyxm(),"&nbsp;")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        项目明细
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getXmmx(),"&nbsp;")%>
                                    </td>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        型号规格
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getXhgz(),"&nbsp;")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        单位
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getDw(),"&nbsp;")%>
                                    </td>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        单价（元）
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getDj(),"&nbsp;")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        单价（万元）
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getDj2(),"&nbsp;")%>
                                    </td>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        数量
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getSl(),"&nbsp;")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        预计费用（万元）
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getYjfy(),"&nbsp;")%>
                                    </td>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        定价依据
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getDjyj(),"&nbsp;")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        推荐服务厂商
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getTjfwcs1(),"&nbsp;")%>
                                    </td>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        有无市场准入证
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getYwzrz1(),"&nbsp;")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        推荐服务厂商
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getTjfwcs2(),"&nbsp;")%>
                                    </td>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        有无市场准入证
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getYwzrz2(),"&nbsp;")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        发生月份
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getFsyf(),"&nbsp;")%>
                                    </td>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        备注
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <%=StringUtil.parseNull(bean.getBz(),"&nbsp;")%>
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
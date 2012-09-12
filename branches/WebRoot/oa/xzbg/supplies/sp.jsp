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
    OfficeSupplies officeSupplies = officeSuppliesDAO.queryForBean(map);
    officeSupplies = officeSupplies == null?new OfficeSupplies():officeSupplies;
     List userList  = dao.getAllUser();
    String connectId = StringUtil.parseNull(officeSupplies.getConnectId(),"");
    String processId = StringUtil.parseNull(officeSupplies.getProcessId(),"");
 	String formId="";
	if("1".equals(officeSupplies.getRoleflag())){
		formId="859106e7-46b6-49f7-a334-ccad832ffcd9";
	}else if("2".equals(officeSupplies.getRoleflag())){
		formId="83389b53-80e4-441c-8463-f4d39176bd23";
	}else if("3".equals(officeSupplies.getRoleflag())){
        formId="11a99f76-9309-452c-be1b-4c1a932462fd";
    }
    List hasFileList = officeFileDAO.getByFk(sqid);
    List orgList = dao.getOrgsByParentId("a4947f11-4a47-4d8c-9f6e-85aa35aecca7");//获取所有的机关科室
    orgList = orgList == null?new ArrayList():orgList;
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
		<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet"  type="text/css">
		<link href="<%=request.getContextPath()%>/images/css.css" rel="stylesheet"  type="text/css">
        <link href="<%=request.getContextPath()%>/js/ext/resources/css/ext-all.css" rel="stylesheet" type="text/css">
        <script type="text/javascript"
                src="<%=request.getContextPath()%>/js/ckeditor/ckeditor.js"></script>
        <script type="text/javascript"
                src="<%=request.getContextPath()%>/js/ext/adapter/ext/ext-base.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/ext/ext-all.js"></script>
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
        </script>
		<script type="text/javascript">
            function _resizeNoPage() {
                document.getElementById("scrollDiv").style.width = document.body.clientWidth - 18;
                document.getElementById("scrollDiv").style.height = document.body.clientHeight - 50;
			function CheckDateTime(object){
			   var rr=/^(?:19|20)[0-9][0-9]-(?:(?:0[1-9])|(?:1[0-2]))-(?:(?:[0-2][1-9])|(?:[1-3][0-1])) (?:(?:[0-2][0-3])|(?:[0-1][0-9])):[0-5][0-9]$/
			   if(!rr.test(object.value)){
			    	object.focus();
			 		return false;
			   }
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
		</script>
		
		<script type="text/javascript">
            function tj(sid,pid,cid){
                var v = document.all.agree;
                var nextUserId = "";
                var varValue = "";
                 if(document.form1.qzgz.value !="isSign"){
				 	alert("本次需要审核的文档中没有您的签名印章，请签名后重新提交。");
				    return false;
		     	}
                if(v[0].checked && v[0].value == '1'){
                    nextUserId = document.all.agreed.value;
                    varValue = "1";
                }else{
                    nextUserId = document.all.disagreed.value;
                    varValue = "-1";
                }
                if(document.form1.checkman){
                    if(document.all.checkman.value == ''){
                        alert("请选择待办理单位!");
                        return ;
                    }
                    window.location = "tj.jsp?type=1&selUserId="+nextUserId+"&connectId="+cid+"&sqid="+sid+"&processId="+pid+"&varValue="+varValue+"&checkman="+document.all.checkman.value;
                }else{
                    window.location = "tj.jsp?type=1&selUserId="+nextUserId+"&connectId="+cid+"&sqid="+sid+"&processId="+pid+"&varValue="+varValue+"&checkman=";
                }

            }
            function qz(){
                window
                        .open(
                        "<%=request.getContextPath()%>/oa/qpd/qpd.jsp?formId=<%=formId%>&connectId=<%=connectId%>&processId=<%=processId%>&sqid=<%=sqid%>",
                        "mywindow",
                        "height="
                                + 800
                                + ",width="
                                + 700
                                + ",status=0,toolbar=no,menubar=no,location=no,scrollbars=yes,top="
                                + 0
                                + ",left="
                                + 0
                                + ",resizable=yes,modal=yes,dependent=yes,dialog=yes,minimizable=no");
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
                            width:800,
                            height:200,
                            closeAction:'hide',
                            plain: true,
                            pageX:100,
                            pageY:100,
                            items: new Ext.TabPanel({
                                applyTo: 'hello-tabs',
                                autoTabs:true,
                                activeTab:0,
//			                    deferredRender:false,
                                border:false ,
                                defaults:{autoScroll: true}
                            }),
                            buttons: [{
                                text:'确定',
                                handler: function(){
                                    if(document.form1.checkman && document.form1.mb3){
                                        document.form1.checkman.value = "";
                                        document.form1.mb3.value = "";
                                        for(var i=0; i<document.form1.ubox.length; i++){
                                            if(document.form1.ubox[i].checked){
                                                document.form1.mb3.value+=document.form1.ubox[i].title + ";";
                                                document.form1.checkman.value+=document.form1.ubox[i].value + ";";
                                            }
                                        }
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
        </script>
	</head>
	<body onload="_resizeNoPage();">
		<form action="add.jsp" name="form1" method="post">
            <input type="hidden" name="flag" value=""/>
            <input type="hidden" name="qzgz" id="qzgz">

            <div id="hello-win" class="x-hidden">
                <div id="hello-tabs">
                    <div class="x-tab" title="请选择办理部门">
                        <table border="0" width="100%">
                            <%for(int i=0; i<orgList.size(); i++){
                                Map u = (Map)orgList.get(i);
                                if(i==0){
                            %>
                            <tr>
                                <td><input type="checkbox" name="ubox" value="<%=StringUtil.parseNull(u.get("ORGNA_ID"),"")%>" title="<%=StringUtil.parseNull(u.get("ORGNA_NAME"),"")%>" alt="gsld"  ><%=StringUtil.parseNull(u.get("ORGNA_NAME"),"")%></td>
                                <%	}else if(i%6==0){ %>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="ubox" value="<%=StringUtil.parseNull(u.get("ORGNA_ID"),"")%>" title="<%=StringUtil.parseNull(u.get("ORGNA_NAME"),"")%>" alt="gsld"><%=StringUtil.parseNull(u.get("ORGNA_NAME"),"")%></td>
                                <%	}else{ %>
                                <td><input type="checkbox" name="ubox" value="<%=StringUtil.parseNull(u.get("ORGNA_ID"),"")%>" title="<%=StringUtil.parseNull(u.get("ORGNA_NAME"),"")%>" alt="gsld"><%=StringUtil.parseNull(u.get("ORGNA_NAME"),"")%></td>
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
				background="<%=request.getContextPath()%>/images/mhead.jpg">
				<tr>
					<td width="3%" align="center">
						<img src="<%=request.getContextPath()%>/images/mlogo.jpg" width="11"
							height="11">
					</td>
					<td width="15%" class="mhead">
						文件审批
					</td>
					<td width="74%" align="left" class="mhead">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="left">
                                        <input type="button" name="sign" class="button" value="签字" onclick="qz();"/>&nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="agree" value="1" checked="checked" onclick="document.getElementById('d').style.display='none';document.getElementById('a').style.display='';">同意
                                        <input type="radio" name="agree" value="0" onclick="document.getElementById('a').style.display='none';document.getElementById('d').style.display='';">不同意

                                        <span id="a">
                                            <%
                                                String nextRole = workFlow.getNextRoleName(StringUtil.parseNull(officeSupplies.getConnectId(),""),"1");
                                                String options = workFlow.getNextUserSelectOptions(nextRole,orgId);
                                        %>
                                            <%if(!"结束".equals(nextRole)){ %>
                                            发送给&nbsp; <%=nextRole%>
                                             <select name="agreed">
                                            <%=options%>
                                         </select>  处理！
                                            <% }else{
                                            %>
                                            结束审批！
                                            <input type="hidden" name="agreed" value=""/>
                                            选择待处理部门:
                                            <input type="text" value="" id="mb3" name="mb3"/>
                                            <input type="hidden" value="" id="checkman" name="checkman"/>

                                            <%     }%>
                                       </span>
                                        <span id="d"  style="display: none">
                                            发送给
                                        <select name="disagreed">
                                            <%
                                                nextRole = workFlow.getNextRoleName(StringUtil.parseNull(officeSupplies.getConnectId(),""),"-1");
                                                options = workFlow.getNextUserSelectOptions(nextRole,orgId);
                                            %>
                                            <%if(!"其他申请".equals(nextRole)){ %>
                                                    <%=options%>
                                            <% }else{ 
                                            Map m = new HashMap();
                                             m.put("userId",officeSupplies.getSqr()) ;
                                             CUser u = userDAO.queryForBean(m);
                                              u = u ==null?new CUser():u;
                                            %>
                                               <option value="<%=u.getUserId()%>"><%=u.getRealName()%></option>
                                            <%     }%>
                                        </select> 处理！</span>

                                        <input type="button" class="button"
                                               onclick="tj('<%=officeSupplies.getSqid()%>','<%=officeSupplies.getProcessId()%>','<%=officeSupplies.getConnectId()%>');" value="提交">
                                        <input type="button" class="button" id="button1"
                                               onclick="history.back()" value="返回">
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
                                        申请名称
									</td>
									<td class="head_right" style="text-align: left">
                                        关于<%=StringUtil.parseNull(officeSupplies.getMc(),"")%>的请示
											<input type="checkbox" name="checked" id="checked" value="" <%if(!"0".equals(officeSupplies.getDxtx())){ %>checked<%}%>>短信提醒
									</td>
								</tr>
									
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										数量
									</td>
									<td class="head_right" style="text-align: left">
									<%=StringUtil.parseNull(officeSupplies.getSl(),"")%> &nbsp;
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										申请单位
									</td>
									<td class="head_right" style="text-align: left">
										<%=StringUtil.parseNull(officeSupplies.getSqdw(),"")%>&nbsp;
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										申请日期
									</td>
									<td class="head_right" style="text-align: left">
										<%=DateUtil.format(officeSupplies.getSqsj(),"yyyy-MM-dd")%>&nbsp;
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										事由
									</td>
									<td class="head_right" style="text-align: left">
                                        <textarea cols="80" id="editor" name="editor" rows="10"><%=StringUtil.parseNull(officeSupplies.getSy(),"")%></textarea>
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
                                        <a href="<%=request.getContextPath()%>/officeFileDownload?pkid=<%=beanFile.getPkid() %>" >
                                            <img src="<%=request.getContextPath()%>/fileIco/<%=beanFile.getWjlx() %>.png" onerror="this.src='<%=request.getContextPath()%>/fileIco/other.png'" style="cursor: pointer;" border="0" alt="<%=beanFile.getWjm() %>(<%=StringUtil.getFileSize(beanFile.getWjcc().doubleValue()) %>)"><%=beanFile.getWjm() %>
                                        </a>&nbsp;&nbsp;&nbsp;
                                        <%}%>
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
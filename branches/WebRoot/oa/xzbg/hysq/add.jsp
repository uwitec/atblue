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
        String HYMC = StringUtil.parseNull(request.getParameter("HYMC"),"");
        String SQBM = StringUtil.parseNull(request.getParameter("SQBM"),"");
        String HYNR = StringUtil.parseNull(request.getParameter("HYNR"),"");
        String BZ = StringUtil.parseNull(request.getParameter("BZ"),"");
        String SQKSSJ = StringUtil.parseNull(request.getParameter("SQKSSJ"),"");
        String SQJSSJ = StringUtil.parseNull(request.getParameter("SQJSSJ"),"");
        String flag = StringUtil.parseNull(request.getParameter("flag"),"");
        String dxtx = StringUtil.parseNull(request.getParameter("dxtx"),"");
        OfficeHysq officeHysq = new  OfficeHysq();
        officeHysq.setSqid(StringUtil.getUUID());
        officeHysq.setBz(BZ);
        officeHysq.setHymc(HYMC);
        officeHysq.setHynr(HYNR);
        officeHysq.setSqbm(SQBM);
        officeHysq.setSqzt("已保存");//保存状态
        officeHysq.setDxtx(dxtx);
        officeHysq.setSqsj(new java.util.Date());
        if(cUser != null)
            officeHysq.setSqr(cUser.getUserId());
        if(!StringUtil.isBlankOrEmpty(SQKSSJ)){
            officeHysq.setSqkssj(new Timestamp(DateUtil.parse(SQKSSJ,
                    "yyyy-MM-dd HH:mm").getTime()));
        }
        if(!StringUtil.isBlankOrEmpty(SQJSSJ)){
            officeHysq.setSqjssj(new Timestamp(DateUtil.parse(SQJSSJ,
                    "yyyy-MM-dd HH:mm").getTime()));
        }
        if("startup".equals(flag)){
            officeHysq.setSqzt("已申请");
            //创建流程代码在这里
            Status status = workflow.startWorkflow("d1325ed3-9ffd-4c21-91ae-399db5a02a08",cUser.getUserId());
            officeHysq.setProcessId(status.getProcessId());
            officeHysq.setConnectId(status.getConnectId());
        }
        officeHysqDAO.addOfficeHysq(officeHysq);
		//保存用户
		String[] ubox = request.getParameterValues("ubox");
		for(int i=0; i<ubox.length; i++){
            OfficeCjhyry  officeCjhyry = new OfficeCjhyry();
            officeCjhyry.setPkid(StringUtil.getUUID());
            officeCjhyry.setSqid(officeHysq.getSqid());
            officeCjhyry.setUserid(ubox[i]);
            officeCjhyryDAO.addOfficeCjhyry(officeCjhyry);
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
				if(document.getElementById("checked").checked){
                	 document.all.dxtx.value="1";
                }else if(!document.getElementById("checked").checked){
                	document.all.dxtx.value="0";
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
                if(document.getElementById("checked").checked){
                	 document.all.dxtx.value="1";
                }else if(!document.getElementById("checked").checked){
                	document.all.dxtx.value="0";
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

        function checkPartAll(obj,alt){
            for(var i=0; i<document.form1.ubox.length; i++){
                if(document.form1.ubox[i].getAttribute("alt") == alt){
                    document.form1.ubox[i].checked=obj.checked;
                }
            }
        }

        function checkPartNot(obj,alt){
            for(var i=0; i<document.form1.ubox.length; i++){
                if(document.form1.ubox[i].getAttribute("alt")  == alt){
                    document.form1.ubox[i].checked=!document.form1.ubox[i].checked;
                }
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
			                    border:true ,
                                defaults:{autoScroll: true}
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
		<form action="add.jsp" name="form1" method="post">
			<input type="hidden" name="dxtx" value=""/>
            <input type="hidden" name="flag" value=""/>
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
                                    <input type="checkbox" onclick="checkPartAll(this,'gsld');"/>全选<input type="checkbox"  onclick="checkPartNot(this,'gsld');"/>反选
                                    <hr width="100%">
                                </td>
                            </tr>
                            <%for(int i=0; i<userList.size(); i++){
                                CUser u = (CUser)userList.get(i);
                                if(i==0){
                            %>
                            <tr>
                                <td><input type="checkbox" name="ubox" value="<%=u.getUserId() %>" title="<%=u.getRealName() %>" alt="gsld"  ><%=u.getRealName() %></td>
                                <%	}else if(i%6==0){ %>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="ubox" value="<%=u.getUserId() %>" title="<%=u.getRealName() %>" alt="gsld"><%=u.getRealName() %></td>
                                <%	}else{ %>
                                <td><input type="checkbox" name="ubox" value="<%=u.getUserId() %>" title="<%=u.getRealName() %>" alt="gsld"><%=u.getRealName() %></td>
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
                                    <input type="checkbox"  onclick="checkPartAll(this,'jgks');"/>全选<input type="checkbox" onclick="checkPartNot(this,'jgks');"/>反选
                                    <hr width="100%">
                                </td>
                            </tr>
                            <%for(int i=0; i<userList1.size(); i++){
                                CUser u = (CUser)userList1.get(i);
                                if(i==0){
                            %>
                            <tr>
                                <td><input type="checkbox" name="ubox" value="<%=u.getUserId() %>" title="<%=u.getRealName() %>" alt="jgks"><%=u.getRealName() %></td>
                                <%	}else if(i%6==0){ %>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="ubox" value="<%=u.getUserId() %>" title="<%=u.getRealName() %>" alt="jgks"><%=u.getRealName() %></td>
                                <%	}else{ %>
                                <td><input type="checkbox" name="ubox" value="<%=u.getUserId() %>" title="<%=u.getRealName() %>" alt="jgks"><%=u.getRealName() %></td>
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
                                    <input type="checkbox"  onclick="checkPartAll(this,'jcdw');"/>全选<input type="checkbox" onclick="checkPartNot(this,'jcdw');"/>反选
                                    <hr width="100%">
                                </td>
                            </tr>
                            <%for(int i=0; i<userList2.size(); i++){
                                CUser u = (CUser)userList2.get(i);
                                if(i==0){
                            %>
                            <tr>
                                <td><input type="checkbox" name="ubox" value="<%=u.getUserId() %>" title="<%=u.getRealName() %>" alt="jcdw"><%=u.getRealName() %></td>
                                <%	}else if(i%6==0){ %>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="ubox" value="<%=u.getUserId() %>" title="<%=u.getRealName() %>" alt="jcdw"><%=u.getRealName() %></td>
                                <%	}else{ %>
                                <td><input type="checkbox" name="ubox" value="<%=u.getUserId() %>" title="<%=u.getRealName() %>" alt="jcdw"><%=u.getRealName() %></td>
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
						新建会议申请
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
										会议名称<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" style="text-align: left">
                                        <input type="text" name="HYMC" value=""  style="width:500px"/>
                                        <input type="checkbox" name="checked" id="checked" value="1">短信提醒
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										申请部门<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" style="text-align: left">
                                        <input type="hidden" name="SQBM" value="<%=StringUtil.parseNull(orgId,"")%>"/><%=StringUtil.parseNull(cOrgnization.getOrgnaName(),"")%>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										与会人员<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" style="text-align: left">
										<button id="mb3" class="button">
											参加人
										</button>
									</td>
								</tr>

								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										申请开始时间<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" style="text-align: left">
										<input type="text"
											onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"
											name="SQKSSJ" class="Wdate" style="width: 200px;">
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										申请结束时间<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" style="text-align: left">
										<input type="text"
											onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"
											name="SQJSSJ" class="Wdate" style="width: 200px;">
									</td>
								</tr>

								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										会议内容及目的
									</td>
									<td class="head_right" style="text-align: left">
										<textarea cols="80" id="HYNR" name="HYNR" rows="10"></textarea>
									</td>
								</tr>

								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										备注
									</td>
									<td class="head_right" style="text-align: left">
                                        <textarea cols="80"name="BZ" rows="5"></textarea>
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
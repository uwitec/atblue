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
	String pkid = StringUtil.parseNull(request.getParameter("pkid"),"");
	OfficeCirculation document = officeCirculationDAO.selectByPrimaryKey(pkid);
	List hasFileList = officeFileDAO.getByFk(pkid);
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
	if (request.getMethod().equals("POST")) {
        String[] ubox = request.getParameterValues("ubox");
        for(int i=0; i<ubox.length; i++){
            if(!StringUtil.isBlankOrEmpty(ubox[i])){
                oDao.delOfficeCirculationCheck(ubox[i],pkid);
                OfficeCirculationCheck odc = new OfficeCirculationCheck();
                odc.setPkid(StringUtil.getUUID());
                odc.setCheckflag("0");
                odc.setCheckman(ubox[i]);
                odc.setCyid(pkid);
                officeCirculationCheckDAO.insert(odc);
            }
        }
        String act = StringUtil.parseNull(request.getParameter("act"),"");
        if("chuanyue".equals(act)){
            document.setZt("正在传阅中");
            officeCirculationDAO.updateByPrimaryKey(document);
        }
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
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>确定传阅人并开始传阅</title>
		<script src="<%=contentPath%>/js/common.js"
			type="text/javascript" defer="defer"></script>
        <link href="<%=contentPath%>/css/css.css" rel="stylesheet" type="text/css">
        <link href="<%=contentPath%>/images/css.css" rel="stylesheet" type="text/css">
		<link href="<%=request.getContextPath()%>/css/ext-all.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" charset="GB2312"
			src="<%=request.getContextPath()%>/js/date/WdatePicker.js" defer="defer"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/ckeditor/ckeditor.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/ext/ext-all.js"></script>
		
		<script type="text/javascript">
			function checkForm(act){
                document.form1.act.value=act;
                if("chuanyue" == act){
                    if(confirm("确定要传阅该文件？")){
                        document.form1.submit();
                    }
                }else{
                    document.form1.submit();
                }
			}
		</script>
		
		<script type="text/javascript">
			function lbz(obj){
				document.form1.wjbh.value=obj.value;
			}
			
			function  selLdps(){
				document.form1.nbr.disabled=true;
				document.form1.ldps.disabled=false;
			}
			
			function  selNbr(){
				document.form1.nbr.disabled=false;
				document.form1.ldps.disabled=true;
			}
            Ext.onReady(function(){
                var win;
                var button = Ext.get('checkman');

                button.on('click', function(){
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
                                deferredRender:false,
                                border:false,
                                defaults:{autoScroll: true}
                            }),
                            buttons: [{
                                text:'确定',
                                handler: function(){
                                    document.form1.checkman.value = "";
                                    for(var i=0; i<document.form1.ubox.length; i++){
                                        if(document.form1.ubox[i].checked){
                                            document.form1.checkman.value+=document.form1.ubox[i].title + ";";
                                        }
                                        //document.form1.ubox[i].checked=obj.checked;
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
		</script>
	</head>
	<body onload="_resizeNoPage();">
		<form name="form1" method="post">
			<input type="hidden" name="act" value="">
			<input type="hidden" name="pkid" value="<%=pkid%>">
            <div id="hello-win" class="x-hidden">
                <div id="hello-tabs">
                    <div class="x-tab" title="请选择签收用户">
                        <table border="0" width="100%">
                            <tr>
                                <td colspan="6" align="left">
                                    <input type="checkbox" name="allBox" onclick="checkAll(this);">全选&nbsp;
                                    <input type="checkbox" name="allBox" onclick="checkUnAll();">反选&nbsp;
                                    <hr width="100%">
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
                                <td><input type="checkbox" name="ubox"  <%if(StringUtil.contains(checkmans,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>" alt="gsld"><%=u.getRealName() %></td>
                                <%	}else if(i%6==0){ %>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="ubox" <%if(StringUtil.contains(checkmans,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>" alt="gsld"><%=u.getRealName() %></td>
                                <%	}else{ %>
                                <td><input type="checkbox" name="ubox" <%if(StringUtil.contains(checkmans,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>" alt="gsld"><%=u.getRealName() %></td>
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
                                <td><input type="checkbox" name="ubox"  <%if(StringUtil.contains(checkmans,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>" alt="jgks"><%=u.getRealName() %></td>
                                <%	}else if(i%6==0){ %>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="ubox" <%if(StringUtil.contains(checkmans,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>" alt="jgks"><%=u.getRealName() %></td>
                                <%	}else{ %>
                                <td><input type="checkbox" name="ubox" <%if(StringUtil.contains(checkmans,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>" alt="jgks"><%=u.getRealName() %></td>
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
                                <td><input type="checkbox" name="ubox"  <%if(StringUtil.contains(checkmans,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>" alt="jcdw"><%=u.getRealName() %></td>
                                <%	}else if(i%6==0){ %>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="ubox" <%if(StringUtil.contains(checkmans,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>" alt="jcdw"><%=u.getRealName() %></td>
                                <%	}else{ %>
                                <td><input type="checkbox" name="ubox" <%if(StringUtil.contains(checkmans,u.getUserId())){ %> checked="checked"<%} %>  value="<%=u.getUserId() %>" alt="jcdw"><%=u.getRealName() %></td>
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
				background="<%=contentPath%>/images/mhead.jpg">
				<tr>
					<td width="3%" align="center">
						<img src="<%=contentPath%>/images/mlogo.jpg" width="11"
							height="11">
					</td>
					<td width="15%" class="mhead">
						确定传阅人
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
                                               onclick="checkForm('chuanyue');" value="开始传阅">
										&nbsp;
										<input type="button" class="button"
											onclick="window.location='index.jsp';" value="返回">
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
                                        选择传阅人
                                    </td>
                                    <td class="head_right" align="left" style="text-align: left">
                                        <input type="text" name="checkman" readonly="readonly" class="inputStyle"
                                               style="width: 400px;"  value="<%=checkman%>">
                                        &nbsp;
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
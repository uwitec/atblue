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
    cOrgnization = cOrgnization == null?new COrgnization():cOrgnization;
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
<link href="<%=request.getContextPath()%>/images/css.css" rel="stylesheet"
      type="text/css">
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
        if(document.all["bean.mailZt"].value==""){
            document.all["bean.mailZt"].focus();
            alert("请输入邮件主题");
            return;
        }
        document.form1.submit();
    }
</script>
<script type="text/javascript" defer="defer">
    CKEDITOR.replace( 'mailNr',
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
                        border:false ,
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
<form action="mail_save.d" name="form1" method="post">
    <input type="hidden" name="action" value="add"/>
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
                                <hr width="100%">
                            </td>
                        </tr>
                        <%for(int i=0; i<userList.size(); i++){
                            CUser u = (CUser)userList.get(i);
                            if(i==0){
                        %>
                        <tr>
                            <td><input type="checkbox" name="ubox" value="<%=u.getUserId() %>"><%=u.getRealName() %></td>
                            <%	}else if(i%6==0){ %>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="ubox" value="<%=u.getUserId() %>"><%=u.getRealName() %></td>
                            <%	}else{ %>
                            <td><input type="checkbox" name="ubox" value="<%=u.getUserId() %>"><%=u.getRealName() %></td>
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
                                <hr width="100%">
                            </td>
                        </tr>
                        <%for(int i=0; i<userList1.size(); i++){
                            CUser u = (CUser)userList1.get(i);
                            if(i==0){
                        %>
                        <tr>
                            <td><input type="checkbox" name="ubox" value="<%=u.getUserId() %>"><%=u.getRealName() %></td>
                            <%	}else if(i%6==0){ %>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="ubox" value="<%=u.getUserId() %>"><%=u.getRealName() %></td>
                            <%	}else{ %>
                            <td><input type="checkbox" name="ubox" value="<%=u.getUserId() %>"><%=u.getRealName() %></td>
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
                                <hr width="100%">
                            </td>
                        </tr>
                        <%for(int i=0; i<userList2.size(); i++){
                            CUser u = (CUser)userList2.get(i);
                            if(i==0){
                        %>
                        <tr>
                            <td><input type="checkbox" name="ubox" value="<%=u.getUserId() %>"><%=u.getRealName() %></td>
                            <%	}else if(i%6==0){ %>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="ubox" value="<%=u.getUserId() %>"><%=u.getRealName() %></td>
                            <%	}else{ %>
                            <td><input type="checkbox" name="ubox" value="<%=u.getUserId() %>"><%=u.getRealName() %></td>
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
                新建邮件
            </td>
            <td width="74%" align="left" class="mhead">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tbody>
                    <tr>
                        <td align="left">
                            <input type="button" class="button" id="button"
                                   onclick="checkForm();" value="保存">
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
                                邮件主题<span style="color: red">&nbsp;*</span>
                            </td>
                            <td class="head_right" align="left">
                                <input type="text" name="bean.mailZt" value=""  style="width:500px"/>
                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                收件人<span style="color: red">&nbsp;*</span>
                            </td>
                            <td class="head_right" align="left">
                                <button id="mb3" class="button">
                                    选择
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                邮件正文
                            </td>
                            <td class="head_right" align="left">
                                <textarea cols="80" id="mailNr" name="bean.mailNr" rows="10"></textarea>
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
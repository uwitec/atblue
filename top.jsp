<%@ page import="cn.com.atblue.manager.bean.CUser" %>
<%@ page import="cn.com.atblue.common.util.MenuUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    CUser cUser = (CUser)session.getAttribute("cUser");
    cUser = cUser == null?new CUser():cUser;
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <style type="text/css">
        <!--
        body {
            background-image: url(images2/index_01.gif);
            background-repeat: repeat-x;
            background-color: #FFFFFF;
        }
        -->
    </style>
    <link href="images2/css.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/prototype.js"></script>
    <script type="text/javascript">
        function changeMenu(t, url,id) {
            changeStatus(t, "choose", "unchoose");
            loadSubMenu(id);
        }
        function changeMenu2(t, url) {
            changeStatus(t, "txt3", "txt2");
            var cframe = parent.document.getElementById("contentFrame");
            cframe.src = url;
        }
        function changeStatus(t, focusClass, unFocusClass) {
            if (t.className == focusClass) {
                t.className = unFocusClass;
            }
            if (t.className == unFocusClass) {
                t.className = focusClass;
            }
            var ctr = t.parentNode;
            var cells = ctr.cells;
            for (var i = 0; i < cells.length; i++) {
                var ccell = cells[i];
                if (ccell.className == focusClass || ccell.className == unFocusClass) {
                    if (cells[i] != t) {
                        cells[i].className = unFocusClass;
                    }
                }
            }
        }
                window.onload = function () {
                    //加载完成，触发首菜单
//                    var obj = document.getElementById("fw0");
//                	if (obj)obj.onclick();
                }

        function loadSubMenu(pMenuId){
            new Ajax.Request("<%=request.getContextPath()%>/loadSubMenu.jsp?parentId="+pMenuId, {
                method:'get',
                onSuccess: function(transport) {
                    var response = transport.responseText || "";
                    var s = eval(response);
                    var menuTr = document.getElementById('submenus');
                    //删除当前所有子节点
                    while(menuTr.lastChild){
                        menuTr.removeChild(menuTr.lastChild);
                    }
                    if(s != null && s.length > 0){
                        for(var i=0;i< s.length;i++){
                            var menu = s[i];
                            var cell = menuTr.insertCell(i);
                            cell.className="txt2";
                            cell.width="96px";
                            cell.id = "sw"+i;
                            cell.onclick = Function ("changeMenu2(this,'"+menu.path+"');");
                            cell.style.cursor="hand";//("style","cursor: hand");
                            cell.innerHTML=menu.name;
                        }
                        var cell = menuTr.insertCell(s.length);
                        cell.innerHTML="&nbsp;";
                    }
//                    document.getElementById('submenus').innerHTML = response;
                    var obj = document.getElementById("sw0");
                    if (obj)obj.onclick();
                },
                onFailure: function() { alert('删除附件出现错误'); }
            });
        }
    </script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td width="497"><img src="images2/index_03.gif" width="497" height="59" alt=""></td>
                <td width="300"></td>
                <td width="400" valign="top"><table width="400" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="36"><img src="images2/index_06.gif" width="36" height="20" alt=""></td>
                        <td align="center" background="images2/index_07.gif"><table width="90%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="15"><img src="images2/index_09.gif" width="15" height="20" alt=""></td>
                                <td class="txt1">下载中心</td>
                                <td width="10" align="center"><img src="images2/index_11.gif" width="2" height="20"></td>
                                <td width="13"><img src="images2/index_13.gif" width="13" height="20" alt=""></td>
                                <td class="txt1" onclick="goIndex();" style="cursor: hand">反回首页</td>
                                <td width="10" align="center"><img src="images2/index_11.gif" width="2" height="20"></td>
                                <td width="11"><img src="images2/index_17.gif" width="11" height="20" alt=""></td>
                                <td class="txt1" onclick="logout();" style="cursor: hand">系统注销</td>
                            </tr>
                        </table></td>
                        <td width="19"><img src="images2/index_19.gif" width="19" height="20" alt=""></td>
                    </tr>
                </table></td>
                <td valign="top">&nbsp;</td>
            </tr>
        </table></td>
    </tr>
    <tr>
        <td height="34"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left:110px;" >
            <tr align="left">
                <%=MenuUtil.getPageMenus2(cUser.getUserId(), "0", request.getContextPath())%>
                <td class="unchoose">&nbsp;</td>
            </tr>
        </table></td>
    </tr>
    <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td width="19"><img src="images2/index_35.gif" width="19" height="29" alt=""></td>
                <td background="images2/index_36.gif"><table width="480" border="0" cellspacing="0" cellpadding="0" style="margin-left:50px;" >
                <tr id="submenus">
                        <td class="txt2">&nbsp;</td>
                </tr>
                </table></td>
                <td width="11"><img src="images2/index_39.gif" width="11" height="29" alt=""></td>
            </tr>
        </table></td>
    </tr>
</table>
</body>
<script type="text/javascript">
	function logout() {
	    if (window.parent != null) {//如果页面在框架页面内，
	        window.parent.name = "";
	        window.parent.location.href = "<%=request.getContextPath()%>/login.jsp";
	    } else {
	        window.location.href = "<%=request.getContextPath()%>/login.jsp";
	    }
	}
    function goIndex(){
        parent.location = "workbench.jsp";
//        window.open("index.jsp","contentFrame");
    }
</script>
</html>
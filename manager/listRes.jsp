<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="cn.com.atblue.common.SpringFactory" %>
<%@ page import="cn.com.atblue.common.util.StringUtil" %>
<%@ page import="cn.com.atblue.manager.dao.Dao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<html>
<head>
    <link rel="StyleSheet" href="<%=request.getContextPath() %>/js/dtree/default/dtree.css" type="text/css"/>
    <link href="<%=request.getContextPath() %>/css/css.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/dtree/dtree.js"></script>
    <title>菜单url树状列表</title>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="bgdh">
    <tr>
        <td width="5%">
            <input class="button" name="addBut" type="button" id="addBut" value="添加" onClick="add()"></td>
        <td width="5%"><input class="button" name="modBut" type="button" id="modBut" value="修改" onClick="mod()"></td>
        <td width="5%"><input class="button" name="delBut" type="button" id="delBut" value="删除" onClick="del()"></td>
        <td width="5%">
        </td>
        <td width="80%">&nbsp;</td>
    </tr>
</table>
<table width="100%" border="0">
    <tr>
        <td>
            <div class="dtree">
                <script>
                    var selectedId = null;
                    urlTree = new dTree('urlTree','../js/dtree/default/images/');
                    <%
                     Dao dao = (Dao)SpringFactory.instance.getBean("dao");
                     List list = dao.getAllMenus();
                     if(null != list && list.size() > 0){
                         for(int i=0;i<list.size();i++){
                             Map res = (Map)list.get(i);
                             String resId = StringUtil.parseNull(res.get("RES_ID"),"");
                             String resName = StringUtil.parseNull(res.get("RES_NAME"),"");
                             String parentId = StringUtil.parseNull(res.get("PARENT_ID"),"");
                             %>
                            urlTree.add('<%= resId%>', '<%= parentId%>', '<%= resName%>', "javascript:operate('<%= resId%>')");
                            <%
                         }
                     }
             %>
                    urlTree.setCookie('csurlTree', null);
                    urlTree.newroot = new Node(0);
                    document.write(urlTree);
                    urlTree.setCookie('csurlTree', null);
                    <%
             if(null == request.getParameter("selectedId")){
                 %>
                    selectedId = urlTree.getSelected();
                    <%
             }else{
                 %>
                    urlTree.setCookie('csurlTree', null);
                    <%
             }
             %>
                    function operate(arg) {
                        selectedId = arg;
                    }
                    function add() {
                        if (isSelected()) {
                            window.location.href = "resource_add.d?parentId=" + selectedId;
                        }
                    }
                    function mod() {
                        if (isSelected()) {
                            window.location.href = "resource_mod.d?resId=" + selectedId;
                        }
                    }
                    function del() {
                        if (isSelected()) {
                            if (confirm("该操作执行时，将会删除所有的子菜单，确定要删除吗？")) {
                                window.location.href = "resource_del.d?resId=" + selectedId;
                            }
                        }
                    }
                    function addRoot() {
                    <%--if(<%=rootList.size()%> <=0){--%>
                    <%--window.location.href="addRes.jsp?parentId=0&rootSize=<%=rootList.size()%>";--%>
                    <%--}else{--%>
                    <%--alert("请不要重复添加根");--%>
                    <%--return false;--%>
                    <%--}--%>
                    }
                    function moveUrl() {
                        window.location.href = "moveUrl.jsp";
                    }

                    function isSelected() {
                        if (selectedId == '' || selectedId == null || selectedId == 'null') {
                            alert('请首先选中您要操作的节点！');
                            return false;
                        } else {
                            return true;
                        }
                    }
                </script>
            </div>
        </td>
    </tr>

</table>
</body>
</html>
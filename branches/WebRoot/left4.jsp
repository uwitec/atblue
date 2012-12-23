<%@ page import="cn.com.atblue.common.util.StringUtil" %>
<%@ page import="cn.com.atblue.common.SpringFactory" %>
<%@ page import="cn.com.atblue.manager.dao.Dao" %>
<%@ page import="java.util.List" %>
<%@ page import="cn.com.atblue.manager.bean.CUser" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="cn.com.atblue.manager.dao.CResourceDAO" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="cn.com.atblue.manager.bean.CResource" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String id = StringUtil.parseNull(request.getParameter("id"),"");
    String name = StringUtil.parseNull(request.getParameter("name"),"");
    String path = StringUtil.parseNull(request.getParameter("path"),"");
    CUser cUser = (CUser)session.getAttribute("cUser");
    cUser = cUser == null?new CUser():cUser;
    CResourceDAO resourceDAO = (CResourceDAO)SpringFactory.instance.getBean("resourceDAO");
    Map param = new HashMap();
    param.put("resId",id);
    CResource cResource = resourceDAO.queryForBean(param);
    cResource = cResource == null?new CResource():cResource;
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="css/css.css" rel="stylesheet" type="text/css">
    <link href="css/web.css" rel="stylesheet" type="text/css">
    <link type="text/css" rel="stylesheet" href="js/dhtmlxtree/dhtmlxtree.css"  />
    <script  src="js/dhtmlxtree/dhtmlxcommon.js"></script>
    <script  src="js/dhtmlxtree/dhtmlxtree.js"></script>
    <style type="text/css">
        <!--
        body {
            background-image: url(images/bj.jpg);
            background-repeat: repeat-x;
        }
        -->
    </style>
    <title>菜单</title>
</head>

<body topmargin="0" leftmargin="0" style="background-color: transparent;">
<table border="0" cellpadding="0" cellspacing="0" >
    <tr><td valign="top">
        <div id="treeDiv" style="width:100%;height: 100%;"></div>
    </td></tr>
</table>
<script type="text/javascript">
    var node = {};
    var tree=new dhtmlXTreeObject('treeDiv',"100%","100%",'<%=id%>');
    tree.setImagePath("js/dhtmlxtree/imgs/csh_books/");
    tree.enableCheckBoxes(false);
    tree.enableDragAndDrop(false);
    <%
       Dao dao = (Dao)SpringFactory.instance.getBean("dao");
       List list  = dao.getMenu(cUser.getUserId(),"",id);
       list = list == null?new ArrayList():list;
       for(int i=0;i<list.size();i++){
        Map map = (Map)list.get(i);
        String key = StringUtil.parseNull(map.get("RES_ID"),"");
        String parentKey = StringUtil.parseNull(map.get("PARENT_ID"),"");
        String info = StringUtil.parseNull(map.get("RES_NAME"),"");
        String url = StringUtil.parseNull(map.get("RES_DESC"),"");
        %>
    tree.insertNewChild('<%=parentKey%>','<%=key%>','<%=info%>');
    node["<%=key%>"] ="<%=url%>";
    <% }
     %>
    tree.attachEvent("onClick",treeClick);
    function treeClick(cnode){
        var url = node[cnode];
        if(url != null && url !="/" && url !="#"){
            window.open('<%=request.getContextPath()%>' +url,"mainFrame");
        }
    }
</script>
</body>
</html>
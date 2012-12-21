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
    <link rel="StyleSheet" href="js/dtree/default/dtree.css" type="text/css" />
    <script type="text/javascript" src="js/dtree/dtree.js" charset="GB2312"></script>
   <script type="text/javascript">
       var d = new dTree ('d','js/dtree/default/images/');
       d.config.useSelection = true;
       d.add("<%=id%>","-1","<%=cResource.getResName()%>","");//从基层队下找菜单树
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
        d.add("<%=key%>", "<%=parentKey%>", "<%=info%>","javascript:goTarget('<%=url%>')");
       <% }
        %>
       function goTarget(url){
           if(url != null && url !="/" && url !="#"){
               window.open('<%=request.getContextPath()%>' +url,"mainFrame");
           }
       }


   </script>
    <title>菜单</title>
</head>

<body topmargin="0" leftmargin="0" style="background-color: transparent;" onload="d.openAll();">
<table border="0" cellpadding="0" cellspacing="0" >
    <tr><td valign="top">
        <script type="text/javascript">document.write(d);</script>
    </td></tr>
</table>
</body>
</html>
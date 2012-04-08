<%@ page language="java" pageEncoding="gbk" %>
<%@page import="cn.com.atblue.common.SpringFactory" %>
<%@page import="cn.com.atblue.manager.bean.CMenu" %>
<%@page import="cn.com.atblue.manager.dao.Dao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="cn.com.atblue.manager.bean.CUser" %>
<%@ page import="java.util.Map" %>
<%@ page import="cn.com.atblue.common.util.StringUtil" %>
<%
    String node = request.getParameter("node") == null ? "0" : request
            .getParameter("node");
    if (node.indexOf("#") != -1) {
        node = node.split("#")[0];
    }
    CUser cUser = (CUser)session.getAttribute("cUser");
    cUser = cUser == null?new CUser():cUser;
    StringBuffer buf = new StringBuffer();
    Dao dao = (Dao) SpringFactory.instance.getBean("dao");
    List menuList = dao.getResList(cUser.getUserId(),node);
    menuList = menuList == null ? new ArrayList() : menuList;
    buf.append("[");
    for (int i = 0; i < menuList.size(); i++) {
        Map resource = (Map) menuList.get(i);
        if (i != 0) {
            buf.append(",");
        }
        String resId = StringUtil.parseNull(resource.get("RES_ID"), "");
        String resName = StringUtil.parseNull(resource.get("RES_NAME"), "");
        String resDesc = StringUtil.parseNull(resource.get("RES_DESC"), "");
        if (resName != null && resName.indexOf("-") != -1) {
            int index = resName.indexOf("-");
            resName = resName.substring(0, index);
        }
        buf.append("{");
        buf.append("\"id\":").append("\"" + resId + "#" + resDesc + "\"")
                .append(",");
        buf.append("\"text\":")
                .append("\"" + resName + "\"").append(",");
        List childs = dao.getMenuByParentId(cUser.getUserId(), resId);
        if(childs != null && childs.size() >0){
            buf.append("\"leaf\":").append("false").append(",");
            buf.append("\"cls\":").append("\"task-folder\",");
            buf.append("\"expanded\":").append("true");
        }else {
            buf.append("\"leaf\":").append("true").append("");
        }
        buf.append("}");
    }
    buf.append("]");
//    System.out.println(buf.toString());
    response.getWriter().write(buf.toString());
    response.getWriter().flush();
%>
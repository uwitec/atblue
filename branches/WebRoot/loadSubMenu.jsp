<%@ page import="cn.com.atblue.common.SpringFactory" %>
<%@ page import="cn.com.atblue.common.util.StringUtil" %>
<%@ page import="cn.com.atblue.manager.bean.CUser" %>
<%@ page import="cn.com.atblue.manager.dao.Dao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String parentId = StringUtil.parseNull(request.getParameter("parentId"), "");
    CUser cUser = (CUser) session.getAttribute("cUser");
    cUser = cUser == null ? new CUser() : cUser;
    Dao dao = (Dao) SpringFactory.instance.getBean("dao");
    StringBuffer s = new StringBuffer("[");
    List list = dao.getResList(cUser.getUserId(), parentId);
    for (int i = 0; i < list.size(); i++) {
        Map resource = (Map) list.get(i);
        String resId = StringUtil.parseNull(resource.get("RES_ID"), "");
        String resName = StringUtil.parseNull(resource.get("RES_NAME"), "");
        String resDesc = StringUtil.parseNull(resource.get("RES_DESC"), "");
        String path = "";
        if(!"/".equals(resDesc) && !"".equals(resDesc)){
            path = resDesc;
//            s.append("<td class=\"txt2\" width=\"96px\"  id=\"sw" + i + "\"" +
//                    "  onClick=\"changeMenu2(this,'" + resDesc + "');\"   style=\"cursor: hand\">" + resName + "</td>");
        }else{
            path = request.getContextPath() + "/center.jsp" + "?id=" + resId + "&path=";
//            s.append("<td class=\"txt2\" width=\"96px\"  id=\"sw" + i + "\"" +
//                    "  onClick=\"changeMenu2(this,'" + path + "');\"   style=\"cursor: hand\">" + resName + "</td>");
        }
        if(i > 0){
          s.append(",");
        }
        s.append("{\"id\":\""+resId+"\",\"name\":\""+resName+"\",\"path\":\""+path+"\"}");
    }
    s.append("]");
    response.setHeader("Charset", "UTF-8");
    response.getWriter().print(s.toString());
    response.getWriter().flush();
%>
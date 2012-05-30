package cn.com.atblue.common.util;

import cn.com.atblue.common.SpringFactory;
import cn.com.atblue.manager.bean.CUser;
import cn.com.atblue.manager.dao.Dao;

import java.util.List;
import java.util.Map;

public class MenuUtil {
    public static String getPageMenus(String userId, String parentId, String contextPath) {
        Dao dao = (Dao) SpringFactory.instance.getBean("dao");
        StringBuffer s = new StringBuffer();
        List list = dao.getResList(userId, parentId);
        for (int i = 0; i < list.size(); i++) {
            Map resource = (Map) list.get(i);
            String resId = StringUtil.parseNull(resource.get("RES_ID"), "");
            String resName = StringUtil.parseNull(resource.get("RES_NAME"), "");
            String path = contextPath + "/center.jsp" + "?id=" + resId + "&name=" + resName + "&path=";
            s.append("<td width=\"91\" class=\"dh\" style=\"cursor: pointer; text-algin:center\" id=\"fw" + i + "\"" +
                    "onClick=\"changeMenu(this,'" + path + "');\" >" + resName + "</td>");
        }
        return s.toString();
    }

    public static String getPageMenus2(String userId, String parentId, String contextPath) {
        Dao dao = (Dao) SpringFactory.instance.getBean("dao");
        StringBuffer s = new StringBuffer();
        List list = dao.getResList(userId, parentId);
        for (int i = 0; i < list.size(); i++) {
            Map resource = (Map) list.get(i);
            String resId = StringUtil.parseNull(resource.get("RES_ID"), "");
            String resName = StringUtil.parseNull(resource.get("RES_NAME"), "");
            String path = contextPath + "/center.jsp" + "?id=" + resId + "&name=" + resName + "&path=";
            s.append("<td width=\"98\" height=\"31\" class=\"txt_unchoose\"  id=\"fw" + i + "\"" +
                    "onClick=\"changeMenu(this,'" + path + "');\"   style=\"cursor: hand\">" + resName + "</td>");
            s.append("<td height=\"31\">&nbsp;</td>");
        }
        return s.toString();
    }

}

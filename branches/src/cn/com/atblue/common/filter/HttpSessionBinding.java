package cn.com.atblue.common.filter;

import cn.com.atblue.manager.bean.CUser;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;
import java.util.Vector;

public class HttpSessionBinding implements HttpSessionBindingListener {
    private ServletContext application;

    public HttpSessionBinding(ServletContext application) {
        this.application = application;
    }

    @Override
    public void valueBound(HttpSessionBindingEvent httpSessionBindingEvent) {
        Vector activeSessions = (Vector) application.getAttribute("activeSessions");
        if (activeSessions == null) {
            activeSessions = new Vector();
        }
        CUser cUser = (CUser) httpSessionBindingEvent.getSession().getAttribute("cUser");
        if (cUser != null) {
            activeSessions.add(httpSessionBindingEvent.getSession());
        }
        application.setAttribute("activeSessions", activeSessions);
    }

    @Override
    public void valueUnbound(HttpSessionBindingEvent httpSessionBindingEvent) {
        CUser cUser = (CUser) httpSessionBindingEvent.getSession().getAttribute("cUser");
        if (cUser == null) {
            Vector activeSessions = (Vector) application.getAttribute("activeSessions");
            if (activeSessions != null) {
                activeSessions.remove(httpSessionBindingEvent.getSession().getId());
                application.setAttribute("activeSessions", activeSessions);
            }
        }
    }
}

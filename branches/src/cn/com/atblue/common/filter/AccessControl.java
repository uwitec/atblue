package cn.com.atblue.common.filter;

import cn.com.atblue.common.util.StringUtil;
import cn.com.atblue.manager.bean.CUser;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AccessControl implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {
    }
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();
        boolean isQuit = true;
        if (session != null) {
            CUser cUser = (CUser) session.getAttribute("cUser");
            if (cUser != null && !StringUtil.isBlankOrEmpty(cUser.getUserName())) {
                isQuit = false;
            }
        }
        String path = request.getRequestURI();
        if (path == null || "/".equals(path) ||
                path.endsWith("/login.jsp") || path.endsWith("/login.d")) {
            isQuit = false;
        }
        if (isQuit) {
            response.sendRedirect(request.getContextPath() + "/login.jsp?flag=isQuit");
        }
        filterChain.doFilter(request, response);
    }
    public void destroy() {
    }
}

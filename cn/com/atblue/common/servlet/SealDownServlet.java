package cn.com.atblue.common.servlet;

import cn.com.atblue.common.SpringFactory;
import cn.com.atblue.oa.bean.OfficeSeal;
import cn.com.atblue.oa.dao.ODao;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SealDownServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ODao oDao = (ODao) SpringFactory.instance.getBean("oDao");
        String userId = req.getParameter("userId");
        OfficeSeal officeSeal = oDao.getSealByUserId(userId);
        ServletOutputStream out = resp.getOutputStream();
        if (officeSeal != null) {
            byte[] bytes = officeSeal.getSeal();
            out.write(bytes);
            out.flush();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}

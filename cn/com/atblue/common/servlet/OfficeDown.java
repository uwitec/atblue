package cn.com.atblue.common.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

import javax.activation.FileTypeMap;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.com.atblue.common.SpringFactory;
import cn.com.atblue.common.SysConfig;
import cn.com.atblue.oa.bean.OfficeFile;
import cn.com.atblue.oa.dao.OfficeFileDAO;

public class OfficeDown extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ServletOutputStream out = null;
		out = response.getOutputStream();
		String pkid = request.getParameter("pkid");
		
		OfficeFileDAO officeFileDAO = (OfficeFileDAO) SpringFactory.instance.getBean("officeFileDAO");
		OfficeFile bean = officeFileDAO.selectByPrimaryKey(pkid);
		if (bean != null) {
			response.setHeader("Connection", "close");
			response.setContentType(FileTypeMap.getDefaultFileTypeMap()
					.getContentType(bean.getWjm())
					+ "; charset=UTF-8");
			response.setHeader("Content-disposition", "attachment; filename="
					+ new String(bean.getWjm().getBytes("GBK"), "ISO8859_1"));
			 SysConfig sysConfig =(SysConfig)SpringFactory.instance.getBean("propertyConfig");
		     String filePath = sysConfig.getProperty("system.filePath");
		     File file = new File(filePath+bean.getWjlj());
		     FileInputStream in=new FileInputStream(file);
			int aRead = 0;
			while ((aRead = in.read()) != -1 & in != null) {
				out.write(aRead);
			}
			out.flush();
			out.close();
			in.close();

		}

	}

	public static void main(String[] args) {
		System.out.println(FileTypeMap.getDefaultFileTypeMap().getContentType(
				"a.xls"));
	}
}

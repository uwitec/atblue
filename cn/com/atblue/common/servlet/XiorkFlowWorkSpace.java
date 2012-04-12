package cn.com.atblue.common.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.com.atblue.common.util.StringUtil;

public class XiorkFlowWorkSpace extends HttpServlet {

	private static String js = "";
	

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		if (js.equals("")) {
			try {
				InputStream is = XiorkFlowWorkSpace.class
						.getResourceAsStream("XiorkFlowWorkSpace.js");
				
				StringBuffer sb = new StringBuffer();
				int i;
				while ((i = is.read()) != -1) {
					sb.append((char) i);
				}
				js = StringUtil.replace(sb.toString(), "$$$$$$$$$$", request.getContextPath());
				js = StringUtil.parseISOtoUTF(js);
				is.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		response.setContentType("text/html; charset=utf-8");
		PrintWriter pw = response.getWriter();    
		pw.print(js);   

	}

	public static void main(String[] args) {

	}
}

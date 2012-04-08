<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStream"%>
<%@page import="org.apache.poi.poifs.filesystem.POIFSFileSystem"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@page import="java.util.Date"%>
<%@ include file="../../../import.jsp"%>
<%
	response.reset();
	String pkid = request.getParameter("pkid");
	OfficeCirculationDAO officeCirculationDAO = (OfficeCirculationDAO)SpringFactory.instance.getBean("officeCirculation");
	OfficeCirculationCheckDAO officeCirculationCheckDAO = (OfficeCirculationCheckDAO)SpringFactory.instance.getBean("officeCirculationCheckDAO");
	OfficeCirculation document = officeCirculationDAO.selectByPrimaryKey(pkid);
	
	
	response.setHeader("Content-Disposition", "attachment;filename=file.xls");
	

	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition", "attachment;filename="
			+ StringUtil.parseGBtoISO(document.getWjbh()) + ".xls");

	ServletOutputStream sos = response.getOutputStream();

	String xlsPath = "/WEB-INF/template/circulation.xls";
	
	
	InputStream is = new FileInputStream(request.getRealPath(xlsPath));

	POIFSFileSystem fs = new POIFSFileSystem(is);

	HSSFWorkbook wb = new HSSFWorkbook(fs);
	HSSFSheet sheet = wb.getSheetAt(0);
	
	
	HSSFRow row = sheet.getRow(2);
	HSSFCell cell = row.getCell((short) 6);
	if (cell == null)
		cell = row.createCell((short) 6);
	//cell.setEncoding(HSSFCell.ENCODING_UTF_16);
	cell.setCellType(HSSFCell.CELL_TYPE_STRING);
	cell.setCellValue(DateUtil.format(document.getLwsj(),"yyyy年MM月dd日"));
	
	row = sheet.getRow(3);
	cell = row.getCell((short) 1);
	if (cell == null)
		cell = row.createCell((short) 1);
	//cell.setEncoding(HSSFCell.ENCODING_UTF_16);
	cell.setCellType(HSSFCell.CELL_TYPE_STRING);
	cell.setCellValue(document.getLwdw());
	
	cell = row.getCell((short) 3);
	if (cell == null)
		cell = row.createCell((short) 3);
	//cell.setEncoding(HSSFCell.ENCODING_UTF_16);
	cell.setCellType(HSSFCell.CELL_TYPE_STRING);
	cell.setCellValue(StringUtil.parseNull(document.getWjbh(),""));
	
	
	cell = row.getCell((short) 5);
	if (cell == null)
		cell = row.createCell((short) 5);
	//cell.setEncoding(HSSFCell.ENCODING_UTF_16);
	cell.setCellType(HSSFCell.CELL_TYPE_STRING);
	cell.setCellValue(StringUtil.parseNull(document.getFs(),""));
	
	
	cell = row.getCell((short) 7);
	if (cell == null)
		cell = row.createCell((short) 7);
	//cell.setEncoding(HSSFCell.ENCODING_UTF_16);
	cell.setCellType(HSSFCell.CELL_TYPE_STRING);
	cell.setCellValue(StringUtil.parseNull(document.getSwh(),""));
	
	row = sheet.getRow(4);
	cell = row.getCell((short) 0);
	if (cell == null)
		cell = row.createCell((short) 0);
	//cell.setEncoding(HSSFCell.ENCODING_UTF_16);
	cell.setCellType(HSSFCell.CELL_TYPE_STRING);
	cell.setCellValue(StringUtil.parseNull("文件标题：" + StringUtil.parseNull(document.getWjmc(),""),""));
	
	row = sheet.getRow(6);
	cell = row.getCell((short) 0);
	if (cell == null)
		cell = row.createCell((short) 0);
	//cell.setEncoding(HSSFCell.ENCODING_UTF_16);
	cell.setCellType(HSSFCell.CELL_TYPE_STRING);
	cell.getCellStyle().setWrapText(true);
	cell.setCellValue(StringUtil.parseNull("领导批示：\n\n" + StringUtil.parseNull(document.getLdps(),""),""));
	
	row = sheet.getRow(11);
	cell = row.getCell((short) 0);
	if (cell == null)
		cell = row.createCell((short) 0);
	//cell.setEncoding(HSSFCell.ENCODING_UTF_16);
	cell.setCellType(HSSFCell.CELL_TYPE_STRING);
	cell.setCellValue("批阅签名：");
	
	row = sheet.getRow(25);
	cell = row.getCell((short) 0);
	if (cell == null)
		cell = row.createCell((short) 0);
	//cell.setEncoding(HSSFCell.ENCODING_UTF_16);
	cell.setCellType(HSSFCell.CELL_TYPE_STRING);
	cell.setCellValue(StringUtil.parseNull("处理结果：" + StringUtil.parseNull(document.getClyj(),""),""));
	
	String sql = "select u_user.user_real_name user_real_name,flw_history.finishtime finishtime from flw_history,flw_instdata,office_circulation,u_user " + 
				 "where flw_history.instanceid=flw_instdata.instanceid and flw_instdata.key='pkid' and flw_instdata.value=office_circulation.cyid and u_user.user_id=replace(flw_history.finishman,'|','') " + 
					"and flw_history.status=9 and flw_history.definitionid='71e96656-d121-4553-96c0-0fe85a422a65' and flw_instdata.value='" + pkid + "' " + 
					"order by flw_history.orderby " ;
	//System.out.println(sql);
	List signList = officeCirculationDAO.getMapByFreeSql(sql);
	if(signList!=null && signList.size()>0){
		for(int i=0; i<signList.size();i++){
			Map map = (Map)signList.get(i);
			String xm = (String)map.get("USER_REAL_NAME");
			Date sj = DateUtil.parse(map.get("FINISHTIME")+"","yyyy-MM-dd") ;
			
			row = sheet.getRow(11+i);
			cell = row.getCell((short) 5);
			if (cell == null)
				cell = row.createCell((short) 5);
			//cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellType(HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(xm + "\n\r  " + DateUtil.format(sj,"yyyy.MM.dd"));
			
		}
	}
	
	
	wb.write(sos);
	out.clear();
	out = pageContext.pushBody();
	
%>

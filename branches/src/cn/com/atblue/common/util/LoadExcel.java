package cn.com.atblue.common.util;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi2.hssf.model.Workbook;

import cn.com.atblue.common.SpringFactory;
import cn.com.atblue.common.SysConfig;
import cn.com.atblue.oa.bean.OfficePlan;
import cn.com.atblue.oa.bean.OfficePlanProcess;
import cn.com.atblue.oa.dao.OfficePlanDAO;
import cn.com.atblue.oa.dao.OfficePlanProcessDAO;

public class LoadExcel {

	 private static OfficePlanDAO officePlanDAO = (OfficePlanDAO)SpringFactory.instance.getBean("officePlanDAO");
	 private static OfficePlanProcessDAO officePlanProcessDAO = (OfficePlanProcessDAO)SpringFactory.instance.getBean("officePlanProcessDAO");
	    
	public void readExcel(String path,String bm){
		SysConfig sysConfig =(SysConfig)SpringFactory.instance.getBean("propertyConfig");
        String filePath = sysConfig.getProperty("system.filePath");
		try {
			InputStream is1 = null;
			InputStream is2 = null;
			FileOutputStream fileOut = null;
			is1 = new FileInputStream(filePath+path);
			System.out.println(filePath+path);
			POIFSFileSystem fs1 = new POIFSFileSystem(is1);
			HSSFWorkbook workbook = new HSSFWorkbook(fs1);
			HSSFSheet sheet = workbook.getSheetAt(0);
			
			OfficePlanProcess officePlanProcess = new OfficePlanProcess();
			HSSFRow row1 = sheet.getRow((short)(0));
			officePlanProcess.setPkid(StringUtil.getUUID());
			officePlanProcess.setBm(bm);
			officePlanProcess.setSqzt("已保存");
			officePlanProcess.setBt(row1.getCell(0).getStringCellValue());
			officePlanProcessDAO.addOfficePlanProcess(officePlanProcess);
			for(int i=0;i<sheet.getLastRowNum();i++){
				OfficePlan officePlan = new OfficePlan(); 
				HSSFRow row = sheet.getRow((short)(i+2));
				HSSFCell cell=null;
				String val=null;
				try {
					cell = row.getCell(0);
					val = cell.getStringCellValue();
					officePlan.setMc(val);
				} catch (RuntimeException e1) {
					e1.printStackTrace();
				}
				
				try {
					cell = row.getCell(1);
					val = cell.getStringCellValue();
					officePlan.setXm(val);
				} catch (RuntimeException e3) {
					e3.printStackTrace();
				}
				
				try {
					cell = row.getCell(2);
					val = cell.getStringCellValue();
					officePlan.setXmmx(val);
				} catch (RuntimeException e2) {
					e2.printStackTrace();
				}
				
				try {
					cell = row.getCell(3);
					val = cell.getStringCellValue();
					officePlan.setGg(val);
				} catch (RuntimeException e1) {
					e1.printStackTrace();
				}
				
				cell = row.getCell(4);
				val = cell.getStringCellValue();
				officePlan.setDw(val);
				
				try {
					cell = row.getCell(5);
					officePlan.setDj(cell.getNumericCellValue());
				} catch (RuntimeException e) {
					e.printStackTrace();
				}
				
				try {
					cell = row.getCell(6);
					officePlan.setDj_w(cell.getNumericCellValue());
				} catch (RuntimeException e) {
					e.printStackTrace();
				}
				
				try {
					cell = row.getCell(7);
					officePlan.setSl(cell.getNumericCellValue());
				} catch (RuntimeException e) {
					e.printStackTrace();
				}
				
				try {
					cell = row.getCell(8);
					officePlan.setFy(cell.getNumericCellValue());
				} catch (RuntimeException e) {
					e.printStackTrace();
				}
				
				cell = row.getCell(9);
				val = cell.getStringCellValue();
				officePlan.setDjyj(val);
				
				try {
					cell = row.getCell(10);
					val = cell.getStringCellValue();
					officePlan.setTjfwcs(val);
				} catch (RuntimeException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				cell = row.getCell(11);
				val = cell.getStringCellValue();
				officePlan.setYwsczrz(val);
				
				cell = row.getCell(12);
				val = cell.getStringCellValue();
				officePlan.setTjfwcs2(val);
				
				cell = row.getCell(13);
				val = cell.getStringCellValue();
				officePlan.setYwsczrz2(val);
				
				try {
					cell = row.getCell(14);
					val = cell.getStringCellValue();
					officePlan.setNy(val);
				} catch (Exception e) {
				}
				try {
					cell = row.getCell(15);
					val = cell.getStringCellValue();
					officePlan.setBz(val);
				} catch (RuntimeException e) {
					e.printStackTrace();
				}
				
				officePlan.setPkid(StringUtil.getUUID());
				officePlan.setFkid(officePlanProcess.getPkid());
				officePlanDAO.addOfficePlan(officePlan);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
    public static void main(String[] args) {
        String source = "d:\\upload\\2012-07-16\\2012年3季度内部预计划费用.xls";

        new LoadExcel().readExcel("", "");
    }
}

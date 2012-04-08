package com.fr.io;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.Arrays;
import com.fr.base.FRContext;
import com.fr.web.dav.LocalEnv;
import com.fr.report.ResultWorkBook;
import com.fr.report.TemplateWorkBook;
import com.fr.report.io.ExcelExporter;
import com.fr.report.io.TemplateWorkBookIO;
import com.fr.util.Utils;

public class ExportBatch {
	public static void main(String[] args) {
		try {
			String envpath = "D:\\FineReport_6.5\\WebReport\\WEB-INF";
			FRContext.setCurrentEnv(new LocalEnv(envpath));
			TemplateWorkBook workbook = TemplateWorkBookIO
					.readTemplateWorkBook(FRContext.getCurrentEnv(),
							"doc\\Primary\\Parameter\\Parameter.cpt");
			File parafile = new File(envpath + "\\para.txt");
			FileInputStream fileinputstream;
			fileinputstream = new FileInputStream(parafile);
			BufferedReader bufferedReader = new BufferedReader(
					new InputStreamReader(fileinputstream));
			java.util.Map paramap = new java.util.HashMap();

			String lineText = bufferedReader.readLine();
			lineText = lineText.trim();
			String[] paraname = Utils.splitString(lineText, ",");
			System.out.println(Arrays.toString(paraname));
			int number = 0;
			while ((lineText = bufferedReader.readLine()) != null) {
				lineText = lineText.trim();
				String[] paravalue = Utils.splitString(lineText, ",");
				for (int j = 0; j < paravalue.length; j++) {
					paramap.put(paraname[j], paravalue[j]);
				}
				ResultWorkBook result = workbook.execute(paramap);
				OutputStream outputdtream = new FileOutputStream(new File(
						"E:\\ExportEg" + number + ".xls"));
				ExcelExporter excelexporter = new ExcelExporter();
				excelexporter.export(outputdtream, result);
				paramap.clear();
				number++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
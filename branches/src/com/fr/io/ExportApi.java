package com.fr.io;

import java.io.File;
import java.io.FileOutputStream;
import com.fr.base.FRContext;
import com.fr.web.dav.LocalEnv;
import com.fr.report.ResultWorkBook;
import com.fr.report.TemplateWorkBook;
import com.fr.report.WorkBook;
import com.fr.report.io.CSVExporter;
import com.fr.report.io.ExcelExporter;
import com.fr.report.io.PDFExporter;
import com.fr.report.io.TemplateExporter;
import com.fr.report.io.TemplateImporter;
import com.fr.report.io.TextExporter;
import com.fr.report.io.WordExporter;
import com.fr.report.io.core.EmbeddedTableDataExporter;
import com.fr.base.Parameter;

public class ExportApi {
	public static void main(String[] args) {
		String envpath = "D:\\FineReport_6.5\\WebReport\\WEB-INF";
		FRContext.setCurrentEnv(new LocalEnv(envpath));
		ResultWorkBook rworkbook = null;
		try {
			File cptfile = new File(
					"D:\\FineReport_6.5\\WebReport\\WEB-INF\\reportlets\\doc\\Primary\\Parameter\\Parameter.cpt");
			TemplateImporter tplImp = new TemplateImporter();
			TemplateWorkBook workbook = tplImp.generateWorkBook(cptfile);
			Parameter[] parameters = workbook.getParameters();
			parameters[0].setValue("����");
			java.util.Map parameterMap = new java.util.HashMap();
			for (int i = 0; i < parameters.length; i++) {
				parameterMap.put(parameters[i].getName(), parameters[i]
						.getValue());
			}
			FileOutputStream outputStream;
			outputStream = new FileOutputStream(new File("E:\\EmbExport.cpt"));
			EmbeddedTableDataExporter EmbExport = new EmbeddedTableDataExporter();
			EmbExport.export(outputStream, workbook);
			outputStream = new FileOutputStream(new File("E:\\TmpExport.cpt"));
			TemplateExporter TmpExport = new TemplateExporter();
			TmpExport.export(outputStream, workbook);
			outputStream = new FileOutputStream(new File("E:\\ExcelExport.xls"));
			ExcelExporter ExcelExport = new ExcelExporter(null);
			ExcelExport.export(outputStream, workbook.execute(parameterMap));
			outputStream = new FileOutputStream(new File("E:\\WordExport.doc"));
			WordExporter WordExport = new WordExporter();
			WordExport.export(outputStream, workbook.execute(parameterMap));
			outputStream = new FileOutputStream(new File("E:\\PdfExport.pdf"));
			PDFExporter PdfExport = new PDFExporter();
			PdfExport.export(outputStream, workbook.execute(parameterMap));
			outputStream = new FileOutputStream(new File("E:\\TxtExport.txt"));
			TextExporter TxtExport = new TextExporter();
			TxtExport.export(outputStream, workbook.execute(parameterMap));
			outputStream = new FileOutputStream(new File("E:\\CsvExport.csv"));
			CSVExporter CsvExport = new CSVExporter();
			CsvExport.export(outputStream, workbook.execute(parameterMap));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
package com.fr.io;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import com.fr.report.TemplateWorkBook;
import com.fr.report.io.ExcelImporter;
import com.fr.report.io.TemplateExporter;

public class ExceltoCpt {
	public static void main(String[] args) throws Exception {
		File excelFile = new File("D:\\aa.xls");
		TemplateWorkBook tpl = new ExcelImporter().generateWorkBook(excelFile);
		OutputStream outputStream = new FileOutputStream(
				new File("E:\\abc.cpt"));
		new TemplateExporter().export(outputStream, tpl);
	}
}
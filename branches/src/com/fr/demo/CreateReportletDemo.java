package com.fr.demo;

import java.awt.Color;
import com.fr.base.FRFont;
import com.fr.base.Style;
import com.fr.base.unit.OLDPIX;
import com.fr.report.TemplateCellElement;
import com.fr.report.DefaultTemplateCellElement;
import com.fr.report.TemplateWorkBook;
import com.fr.report.WorkBook;
import com.fr.report.WorkSheet;
import com.fr.third.com.lowagie.text.Font;
import com.fr.web.Reportlet;
import com.fr.web.ReportletRequest;

public class CreateReportletDemo extends Reportlet {
	public TemplateWorkBook createReport(ReportletRequest arg0) {
		WorkBook workbook = new WorkBook();
		WorkSheet sheet1 = new WorkSheet();
		TemplateCellElement CellA1 = new DefaultTemplateCellElement(0, 0,
				"FineReport");
		Style style = Style.getInstance();
		FRFont frfont = FRFont.getInstance("Arial", Font.BOLD, 20, Color.red);
		style = style.deriveFRFont(frfont);
		CellA1.setStyle(style);
		sheet1.addCellElement(CellA1);
		sheet1.setColumnWidth(0, new OLDPIX(150));
		sheet1.setRowHeight(1, new OLDPIX(35));
		workbook.addReport(sheet1);
		return workbook;
	}
}
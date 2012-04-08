package com.fr.demo;

import java.awt.Color;
import com.fr.base.Constants;
import com.fr.base.FRFont;
import com.fr.base.Style;
import com.fr.base.background.ColorBackground;
import com.fr.base.unit.OLDPIX;
import com.fr.report.DefaultTemplateCellElement;
import com.fr.report.TemplateCellElement;
import com.fr.report.TemplateWorkBook;
import com.fr.report.WorkBook;
import com.fr.report.WorkSheet;
import com.fr.third.com.lowagie.text.Font;
import com.fr.web.Reportlet;
import com.fr.web.ReportletRequest;

public class SetCellElementStyle extends Reportlet {
	public TemplateWorkBook createReport(ReportletRequest arg0) {
		WorkBook workbook = new WorkBook();
		WorkSheet worksheet = new WorkSheet();
		TemplateCellElement cellElement = new DefaultTemplateCellElement(1, 1,
				2, 2, "FineReport");
		worksheet.setColumnWidth(1, new OLDPIX(300));
		worksheet.setRowHeight(1, new OLDPIX(30));
		Style style = cellElement.getStyle();
		if (style == null) {
			style = Style.getInstance();
		}
		FRFont frFont = FRFont.getInstance("Dialog", Font.BOLD, 16);
		frFont = frFont.applyForeground(new Color(21, 76, 160));
		style = style.deriveFRFont(frFont);
		ColorBackground background = ColorBackground.getInstance(new Color(255,
				255, 177));
		style = style.deriveBackground(background);
		style = style.deriveHorizontalAlignment(Constants.CENTER);
		style = style.deriveBorder(Constants.LINE_DASH, Color.red,
				Constants.LINE_DOT, Color.gray, Constants.LINE_DASH_DOT,
				Color.BLUE, Constants.LINE_DOUBLE, Color.CYAN);
		cellElement.setStyle(style);
		worksheet.addCellElement(cellElement);
		workbook.addReport(worksheet);
		return workbook;
	}
}
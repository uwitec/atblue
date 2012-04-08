package com.fr.demo;

import java.io.File;
import com.fr.base.FRContext;
import com.fr.base.dav.Env;
import com.fr.report.Report;
import com.fr.report.TemplateCellElement;
import com.fr.report.TemplateECReport;
import com.fr.report.TemplateReport;
import com.fr.report.TemplateWorkBook;
import com.fr.report.WorkBook;
import com.fr.report.WorkSheet;
import com.fr.report.io.TemplateImporter;
import com.fr.web.Reportlet;
import com.fr.web.ReportletRequest;

public class ChangeRowAndCol extends Reportlet {
	public TemplateWorkBook createReport(ReportletRequest reportletrequest) {
		WorkBook workbook = new WorkBook();
		Env oldEnv = FRContext.getCurrentEnv();
		String envPath = oldEnv.getPath();
		WorkSheet newworksheet = new WorkSheet();
		String change = "0";
		try {
			File cptfile = new File(envPath
					+ "\\reportlets\\doc\\Primary\\GroupReport\\Group.cpt");
			TemplateImporter tplimp = new TemplateImporter();
			workbook = tplimp.generateWorkBook(cptfile);
			if (reportletrequest.getParameter("change") != null) {
				change = reportletrequest.getParameter("change").toString();
			}
			if (change.equals("1")) {
				TemplateECReport report = (TemplateECReport) workbook
						.getTemplateReport(0);
				int col = 0, row = 0;
				byte direction = 0;
				java.util.Iterator it = report.cellIterator();
				while (it.hasNext()) {
					TemplateCellElement cell = (TemplateCellElement) it.next();
					col = cell.getColumn();
					row = cell.getRow();
					cell.setColumn(row);
					cell.setRow(col);
					direction = cell.getCellExpandAttr().getDirection();
					if (direction == 0) {
						cell.getCellExpandAttr().setDirection((byte) 1);
					} else if (direction == 1) {
						cell.getCellExpandAttr().setDirection((byte) 0);
					}
					newworksheet.addCellElement(cell);
				}
				workbook.setReport(0, newworksheet);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return workbook;
	}
}
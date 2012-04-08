package com.fr.demo;

import com.fr.base.FRContext;
import com.fr.web.dav.LocalEnv;
import com.fr.report.TemplateWorkBook;
import com.fr.report.io.TemplateWorkBookIO;
import com.fr.base.Parameter;
import com.fr.base.dav.Env;
import com.fr.web.Reportlet;
import com.fr.web.ReportletRequest;

public class URLParameterDemo extends Reportlet {
	public TemplateWorkBook createReport(ReportletRequest reportletRequest) {
		Env oldEnv = FRContext.getCurrentEnv();
		String envPath = oldEnv.getPath();
		FRContext.setCurrentEnv(new LocalEnv(envPath));
		String countryValue = reportletRequest.getParameter("����")
				.toString();
		try {
			TemplateWorkBook wbTpl = TemplateWorkBookIO.readTemplateWorkBook(
					FRContext.getCurrentEnv(), "doc\\Primary\\Parameter\\Parameter.cpt");
			Parameter[] ps = wbTpl.getParameters();
			ps[0].setValue(countryValue);
			wbTpl.getReportParameterAttr().setParameterUI(null);
			return wbTpl;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
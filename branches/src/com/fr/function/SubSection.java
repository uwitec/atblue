package com.fr.function;
import com.fr.report.script.AbstractFunction;
import com.fr.report.script.core.FArray;

public class SubSection extends AbstractFunction {
	public Object run(Object[] args) {
		Object para = args[0];
		String parastr = para.toString();
		if (parastr.startsWith("(") && parastr.endsWith(")")) {
			parastr = parastr.substring(1, parastr.length() - 1);
		}
		String test[] = parastr.split(",");
		int len = test.length;
		int loopnum = len / 500;
		if (len % 500 != 0) {
			loopnum += 1;
		}
		;
		FArray result = new FArray();
		String str = "";
		int k = 1;
		for (int i = 0; i < loopnum; i++) {
			for (int j = 500 * i; j < 500 * (i + 1) && j < len; j++) {
				if (k != 500 && j != (len - 1)) {
					str += test[j] + ",";
				} else {
					str += test[j];
				}
				k++;
			}
			str = "(" + str + ")";
			result.add(str);
			str = "";
			k = 1;
		}
		return result;
	}
}
package com.fr.data;

import com.fr.data.AbstractTableData;

public class ArrayTableDataDemo extends AbstractTableData {
	private String[] columnNames;
	private Object[][] rowData;

	public ArrayTableDataDemo() {
		String[] columnNames = { "Name", "Score" };
		Object[][] datas = { { "Alex", new Integer(15) },
				{ "Helly", new Integer(22) }, { "Bobby", new Integer(99) } };
		this.columnNames = columnNames;
		this.rowData = datas;
	}

	public int getColumnCount() {
		return columnNames.length;
	}

	public String getColumnName(int columnIndex) {
		return columnNames[columnIndex];
	}

	public int getRowCount() {
		return rowData.length;
	}

	public Object getValueAt(int rowIndex, int columnIndex) {
		return rowData[rowIndex][columnIndex];
	}
}
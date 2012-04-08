package com.fr.data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import com.fr.base.FRContext;
import com.fr.data.AbstractTableData;
import com.fr.base.Parameter;

public class ParamTableDataDemo extends AbstractTableData {
	private String[] columnNames = null;
	private int columnNum = 10;
	private int colNum = 0;
	private ArrayList valueList = null;

	public ParamTableDataDemo() {
		this.parameters = new Parameter[] { new Parameter("tableName") };
		columnNames = new String[columnNum];
		for (int i = 0; i < columnNum; i++) {
			columnNames[i] = "column#" + String.valueOf(i);
		}
	}

	public int getColumnCount() {
		return columnNum;
	}

	public String getColumnName(int columnIndex) {
		return columnNames[columnIndex];
	}

	public int getRowCount() {
		init();
		return valueList.size();
	}

	public Object getValueAt(int rowIndex, int columnIndex) {
		init();
		if (columnIndex >= colNum) {
			return null;
		}
		return ((Object[]) valueList.get(rowIndex))[columnIndex];
	}

	public void init() {
		if (valueList != null) {
			return;
		}
		String tableName = parameters[0].getValue().toString();
		String sql = "select * from " + tableName + ";";
		FRContext.getLogger().info("Query SQL of ParamTableDataDemo: \n" + sql);
		valueList = new ArrayList();
		Connection conn = this.getConnection();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			ResultSetMetaData rsmd = rs.getMetaData();
			colNum = rsmd.getColumnCount();
			Object[] objArray = null;
			while (rs.next()) {
				objArray = new Object[colNum];
				for (int i = 0; i < colNum; i++) {
					objArray[i] = rs.getObject(i + 1);
				}
				valueList.add(objArray);
			}
			rs.close();
			stmt.close();
			conn.close();
			FRContext.getLogger().info(
					"Query SQL of ParamTableDataDemo: \n" + valueList.size()
							+ " rows selected");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Connection getConnection() {
		String driverName = "sun.jdbc.odbc.JdbcOdbcDriver";
		String url = "jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=D:\\FineReport_6.5\\WebReport\\FRDemo.mdb";
		String username = "";
		String password = "";
		Connection con = null;
		try {
			Class.forName(driverName);
			con = DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return con;
	}

	public void release() throws Exception {
		super.release();
		this.valueList = null;
	}
}
package com.fr.data;

import java.io.InputStream;
import java.io.StringBufferInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import com.fr.base.FRContext;
import com.fr.data.AbstractTableData;

public class XMLRead extends AbstractTableData {
	private String[] columnNames = { "id", "name", "MemoryFreeSize",
			"MemoryTotalSize", "MemoryUsage" };
	private ArrayList valueList = null;

	public int getColumnCount() {
		return 5;
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
		return ((Object[]) valueList.get(rowIndex))[columnIndex];
	}

	private void init() {
		// ȷ��ֻ��ִ��һ��
		if (valueList != null) {
			return;
		}
		valueList = new ArrayList();
		String sql = "select * from xmltest";
		String[] name = { "MemoryFreeSize", "MemoryTotalSize", "MemoryUsage" };
		Connection conn = this.getConncetion();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			// �ö��󱣴����
			Object[] objArray = null;
			while (rs.next()) {
				objArray = new Object[5];
				String[] xmldata = null;
				objArray[0] = rs.getObject(1);
				objArray[1] = rs.getObject(2);
				InputStream in = new StringBufferInputStream("<demo>"
						+ rs.getObject(3).toString() + "</demo>");
				GetXmlDate getxmldata = new GetXmlDate();
				// ��xml�����н��������ص�Ϊname��Ӧ��valueֵ����
				xmldata = getxmldata.readerXMLSource(in, name);
				// ���������ֵ�������ս��ArrayList��
				objArray[2] = xmldata[0];
				objArray[3] = xmldata[1];
				objArray[4] = xmldata[2];
				valueList.add(objArray);
			}
			// �ͷ����Դ
			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Connection getConncetion() {
		String driverName = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@192.168.100.169:1521:orcl10g";
		String username = "temp";
		String password = "temp123";
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

	// �ͷ�һЩ��Դ����Ϊ���ܻ����ظ����ã��������ͷ�valueList�����ϴβ�ѯ�Ľ���ͷŵ�
	public void release() throws Exception {
		super.release();
		this.valueList = null;
	}
}

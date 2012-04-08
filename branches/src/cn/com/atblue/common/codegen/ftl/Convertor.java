package cn.com.atblue.common.codegen.ftl;

import cn.com.atblue.common.codegen.bean.Column;

import java.util.HashMap;
import java.util.Map;

public class Convertor {
    private static String[][] convert = {{"CHAR(1)", "Boolean", "java.lang.Boolean", "VARCHAR"}, {"CHAR(*)", "String", "java.lang.String", "VARCHAR"}, {"VARCHAR", "String", "java.lang.String", "VARCHAR"}, {"VARCHAR2", "String", "java.lang.String", "VARCHAR"}, {"NUMBER(*,0)", "Integer", "java.lang.Integer", "NUMBER"}, {"NUMBER(*,*)", "Double", "java.lang.Double", "NUMBER"}, {"DATE", "Date", "java.util.Date", "DATE"}, {"TIMESTAMP", "Timestamp", "java.sql.Timestamp", "TIMESTAMP"}, {"BLOB", "byte[]", "byte[]", "BLOB"}, {"CLOB", "String", "java.lang.String", "CLOB"}};

    private static Map<String, Integer> baseTypeMap = new HashMap();

    public static String getBeanType(Column column) {
        return convert[((Integer) baseTypeMap.get(getBaseType(column))).intValue()][1];
    }

    public static String getJavaType(Column column) {
        return convert[((Integer) baseTypeMap.get(getBaseType(column))).intValue()][2];
    }

    public static String getJdbcType(Column column) {
        return convert[((Integer) baseTypeMap.get(getBaseType(column))).intValue()][3];
    }

    private static String getBaseType(Column column) {
        String type = column.getDataType();
        int length = column.getDataLength();
        int precision = column.getDataPrecision();
        int scale = column.getDataScale();
        if ("CHAR".equals(type)) {
            if (length == 1) {
                return "CHAR(1)";
            }
            return "CHAR(*)";
        }
        if ("NUMBER".equals(type)) {
            if (precision == 0) {
                return "NUMBER(*,*)";
            }
            if (scale == 0) {
                return "NUMBER(*,0)";
            }
            return "NUMBER(*,*)";
        }

        return type;
    }

    static {
        for (int i = 0; i < convert.length; i++)
            baseTypeMap.put(convert[i][0], Integer.valueOf(i));
    }
}
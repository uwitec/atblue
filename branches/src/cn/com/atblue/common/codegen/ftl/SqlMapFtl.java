package cn.com.atblue.common.codegen.ftl;

import cn.com.atblue.common.codegen.CodeConfig;
import cn.com.atblue.common.codegen.bean.Column;
import cn.com.atblue.common.codegen.bean.Table;
import cn.com.atblue.common.util.StringUtil;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SqlMapFtl extends FtlBasic {
    public SqlMapFtl(Table table, CodeConfig codeConfig) {
        super(table, codeConfig);
    }

    public void execute() {
        String className = parseTableName(getTable().getTableName());

        String columnAddListStr = "";
        String columnValListStr = "";
        String columnModListStr = "";
        String columnColListStr = "";
        List dynamicRuleList = new ArrayList();
        List columnList = getTable().getColumnList();
        for (int i = 0; i < columnList.size(); i++) {
            Column column = (Column) columnList.get(i);
            String columnName = column.getColumnName().toLowerCase();
            columnAddListStr = columnAddListStr + columnName + ",";
            if ((i + 1) % 5 == 0) columnAddListStr = columnAddListStr + "\n\t\t\t\t";
            columnValListStr = columnValListStr + "#" + parsePropertyName(columnName) + "#,";
            if ((i + 1) % 5 == 0) columnValListStr = columnValListStr + "\n\t\t\t\t";
            columnModListStr = columnModListStr + columnName + "=#" + parsePropertyName(columnName) + "#,";
            columnColListStr = columnColListStr + columnName + " as " + parsePropertyName(columnName) + ",";
            if ((i + 1) % 3 == 0) columnModListStr = columnModListStr + "\n\t\t\t\t";
            Map dynamicMap = new HashMap();
            dynamicMap.put("columnName", columnName);
            dynamicMap.put("columnParsedName", parsePropertyName(columnName));
            dynamicRuleList.add(dynamicMap);
        }
        if (columnAddListStr.length() > 0) {
            columnAddListStr = columnAddListStr.replaceAll("^\\s+", "");
            columnAddListStr = columnAddListStr.replaceAll("\\s+$", "");
            columnAddListStr = columnAddListStr.substring(0, columnAddListStr.length() - 1);
        }
        if (columnValListStr.length() > 0) {
            columnValListStr = columnValListStr.replaceAll("^\\s+", "");
            columnValListStr = columnValListStr.replaceAll("\\s+$", "");
            columnValListStr = columnValListStr.substring(0, columnValListStr.length() - 1);
        }
        if (columnModListStr.length() > 0) {
            columnModListStr = columnModListStr.replaceAll("^\\s+", "");
            columnModListStr = columnModListStr.replaceAll("\\s+$", "");
            columnModListStr = columnModListStr.substring(0, columnModListStr.length() - 1);
        }
        if (columnColListStr.length() > 0) {
            columnColListStr = columnColListStr.replaceAll("^\\s+", "");
            columnColListStr = columnColListStr.replaceAll("\\s+$", "");
            columnColListStr = columnColListStr.substring(0, columnColListStr.length() - 1);
        }

        Map map = new HashMap();
        map.put("copyRightStartYear", getCopyRightStartYear());
        map.put("copyRightStopYear", getCopyRightStopYear());
        map.put("classComments", StringUtil.parseNull(getTable().getComments(), ""));
        map.put("createTime", getCreateTime());
        map.put("className", StringUtil.parseNull(className, ""));
        map.put("tableName", StringUtil.parseNull(getTable().getTableName().toLowerCase(), ""));
        map.put("sqlMapPrefix", StringUtil.parseNull(this.config.getPrefixOfSqlmap() + "." + className.toLowerCase(), ""));
        map.put("absoluteClassName", StringUtil.parseNull(getPackageOfBean() + "." + className, ""));
        map.put("dynamicRuleList", dynamicRuleList);
        map.put("columnAddListStr", StringUtil.parseNull(columnAddListStr, ""));
        map.put("columnValListStr", StringUtil.parseNull(columnValListStr, ""));
        map.put("columnModListStr", StringUtil.parseNull(columnModListStr, ""));
        map.put("columnColListStr", StringUtil.parseNull(columnColListStr, ""));
        map.put("pkName",table.getPkName()+"=#"+parsePropertyName(table.getPkName())+"#");
        writeFile("SqlMap.ftl", map, getFileOfSqlMap());
    }
}
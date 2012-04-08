package cn.com.atblue.common.codegen.ftl;


import cn.com.atblue.common.codegen.CodeConfig;
import cn.com.atblue.common.codegen.bean.Column;
import cn.com.atblue.common.codegen.bean.Table;
import cn.com.atblue.common.util.StringUtil;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BeanFtl extends FtlBasic {
    public BeanFtl(Table table, CodeConfig codeConfig) {
        super(table, codeConfig);
    }

    public void execute() {
        Map map = new HashMap();
        map.put("copyRightStartYear", getCopyRightStartYear());
        map.put("copyRightStopYear", getCopyRightStopYear());
        map.put("package", getPackageOfBean());
        map.put("importList", getImportList());
        map.put("classComments", StringUtil.parseNull(getTable().getComments(), ""));
        map.put("createTime", getCreateTime());
        map.put("className", StringUtil.parseNull(parseTableName(getTable().getTableName()), ""));
        map.put("columnList", getColumnMapList());
        writeFile("JavaBean.ftl", map, getFileOfBean());
    }

    public List<String> getImportList() {
        List list = new ArrayList();
        List columnList = getTable().getColumnList();
        for (int i = 0; i < columnList.size(); i++) {
            Column column = (Column) columnList.get(i);
            String beanType = Convertor.getBeanType(column);
            if (("Date".equals(beanType)) || ("Timestamp".equals(beanType))) {
                list.add("java.util.Date");
                break;
            }
        }
        return list;
    }

    public List<Map> getColumnMapList() {
        List list = new ArrayList();
        List columnList = getTable().getColumnList();
        for (int i = 0; i < columnList.size(); i++) {
            Column column = (Column) columnList.get(i);
            String beanType = StringUtil.parseNull(Convertor.getBeanType(column), "");
            Map map = new HashMap();
            map.put("name", StringUtil.parseNull(parsePropertyName(column.getColumnName()), ""));
            map.put("beanType", StringUtil.parseNull(beanType, "String"));
            map.put("comments", StringUtil.parseNull(column.getComments(), ""));
            map.put("setter", "set" + StringUtil.parseNull(parseTableName(column.getColumnName()), ""));
            if ("boolean".equals(beanType))
                map.put("getter", "is" + StringUtil.parseNull(parseTableName(column.getColumnName()), ""));
            else {
                map.put("getter", "get" + StringUtil.parseNull(parseTableName(column.getColumnName()), ""));
            }
            list.add(map);
        }
        return list;
    }
}
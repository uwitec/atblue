package cn.com.atblue.common.codegen.ftl;


import cn.com.atblue.common.codegen.CodeConfig;
import cn.com.atblue.common.codegen.bean.Column;
import cn.com.atblue.common.codegen.bean.Table;
import cn.com.atblue.common.util.StringUtil;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class JspListFtl extends FtlBasic {
    public JspListFtl(Table table, CodeConfig codeConfig) {
        super(table, codeConfig);
    }

    public void execute() {
        Map map = new HashMap();
        map.put("classComments", StringUtil.parseNull(getTable().getComments(), ""));
        map.put("className", StringUtil.parseNull(parseTableName(getTable().getTableName()), ""));
        map.put("columnList", getColumnMapList());
        writeFile("JspList.ftl", map, getFileOfJspList());
    }

    public List<Map> getColumnMapList() {
        List list = new ArrayList();
        List columnList = getTable().getColumnList();
        for (int i = 0; i < columnList.size(); i++) {
            Column column = (Column) columnList.get(i);
            String beanType = StringUtil.parseNull(Convertor.getBeanType(column), "");
            Map map = new HashMap();
            map.put("name", StringUtil.parseNull(parsePropertyName(column.getColumnName()), "").toUpperCase());
            map.put("type", StringUtil.parseNull(beanType, "String"));
            map.put("comments", StringUtil.parseNull(column.getComments(), ""));
            list.add(map);
        }
        return list;
    }
}
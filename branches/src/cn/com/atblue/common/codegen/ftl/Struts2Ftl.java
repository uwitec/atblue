package cn.com.atblue.common.codegen.ftl;


import cn.com.atblue.common.codegen.CodeConfig;
import cn.com.atblue.common.codegen.bean.Table;
import cn.com.atblue.common.util.StringUtil;

import java.util.HashMap;
import java.util.Map;

public class Struts2Ftl extends FtlBasic {
    public Struts2Ftl(Table table, CodeConfig codeConfig) {
        super(table, codeConfig);
    }

    public void execute() {
        Map map = new HashMap();
        String className = StringUtil.parseNull(parseTableName(getTable().getTableName()), "");
        String className2 =className.toLowerCase();
        String actionName =  (className.charAt(0)+"").toLowerCase()+className.substring(1)+"Action";
        map.put("classComments", StringUtil.parseNull(getTable().getComments(), ""));
        map.put("className", className);
        map.put("className2", className2);
        map.put("actionName", actionName);
        writeFile("Struts2.ftl", map, getFileOfStruts2());
    }
}
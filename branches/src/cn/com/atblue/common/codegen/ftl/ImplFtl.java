package cn.com.atblue.common.codegen.ftl;

import cn.com.atblue.common.codegen.CodeConfig;
import cn.com.atblue.common.codegen.bean.Table;
import cn.com.atblue.common.util.StringUtil;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ImplFtl extends FtlBasic {
    public ImplFtl(Table table, CodeConfig codeConfig) {
        super(table, codeConfig);
    }

    public void execute() {
        String className = parseTableName(getTable().getTableName());
        Map map = new HashMap();
        map.put("copyRightStartYear", getCopyRightStartYear());
        map.put("copyRightStopYear", getCopyRightStopYear());
        map.put("package", getPackageOfImpl());
        map.put("importList", getImportList());
        map.put("classComments", StringUtil.parseNull(getTable().getComments(), ""));
        map.put("createTime", getCreateTime());
        map.put("className", StringUtil.parseNull(className, ""));
        map.put("sqlMapPrefix", StringUtil.parseNull( this.config.getPrefixOfSqlmap()+ "." + className.toLowerCase(), ""));
        writeFile("JavaImpl.ftl", map, getFileOfImpl());
    }

    public List<String> getImportList() {
        String tableName = parseTableName(getTable().getTableName());
        List list = new ArrayList();
        list.add(getPackageOfBean() + "." + tableName);
        list.add(getPackageOfDao() + "." + tableName + "DAO");
        return list;
    }
}
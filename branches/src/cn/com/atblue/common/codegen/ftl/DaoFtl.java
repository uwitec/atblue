package cn.com.atblue.common.codegen.ftl;

import cn.com.atblue.common.codegen.CodeConfig;
import cn.com.atblue.common.codegen.bean.Table;
import cn.com.atblue.common.util.StringUtil;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DaoFtl extends FtlBasic {
    public DaoFtl(Table table, CodeConfig codeConfig) {
        super(table, codeConfig);
    }

    public void execute() {
        Map map = new HashMap();
        map.put("copyRightStartYear", getCopyRightStartYear());
        map.put("copyRightStopYear", getCopyRightStopYear());
        map.put("package", getPackageOfDao());
        map.put("importList", getImportList());
        map.put("classComments", StringUtil.parseNull(getTable().getComments(), ""));
        map.put("createTime", getCreateTime());
        map.put("className", StringUtil.parseNull(parseTableName(getTable().getTableName()), ""));
        writeFile("JavaDAO.ftl", map, getFileOfDao());
    }

    public List<String> getImportList() {
        String tableName = parseTableName(getTable().getTableName());
        List list = new ArrayList();
        list.add(getPackageOfBean() + "." + tableName);
        return list;
    }
}
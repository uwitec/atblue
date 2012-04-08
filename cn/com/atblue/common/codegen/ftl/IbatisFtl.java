package cn.com.atblue.common.codegen.ftl;

import cn.com.atblue.common.codegen.CodeConfig;
import cn.com.atblue.common.codegen.bean.Table;
import cn.com.atblue.common.util.StringUtil;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class IbatisFtl extends FtlBasic {
    private List<Table> tableList;

    public IbatisFtl(List<Table> tableList, CodeConfig codeConfig) {
        super(null, codeConfig);
        this.tableList = tableList;
    }

    public void execute() {
        List sqlMapList = new ArrayList();
        for (int i = 0; i < tableList.size(); i++) {
            Table tmp = (Table) tableList.get(i);
            String comments = StringUtil.parseNull(tmp.getComments(), "");
            String relativeUrl = getPackageOfImpl() + "." + parseTableName(tmp.getTableName()) + "Impl";
            relativeUrl = relativeUrl.replaceAll("\\.", "/") + ".xml";
            Map map = new HashMap();
            map.put("comments", comments);
            map.put("relativeUrl", StringUtil.parseNull(relativeUrl, ""));
            sqlMapList.add(map);
        }

        Map map = new HashMap();
        map.put("copyRightStartYear", getCopyRightStartYear());
        map.put("copyRightStopYear", getCopyRightStopYear());
        map.put("createTime", getCreateTime());
        map.put("sqlMapList", sqlMapList);
        File outfile = new File(getFileOfService(), "ibatis.xml");
        writeFile("Ibatis.ftl", map, outfile);
    }
}
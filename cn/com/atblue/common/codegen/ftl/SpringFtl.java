package cn.com.atblue.common.codegen.ftl;

import cn.com.atblue.common.codegen.CodeConfig;
import cn.com.atblue.common.codegen.bean.Table;
import cn.com.atblue.common.util.StringUtil;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SpringFtl extends FtlBasic {
    private List<Table> tableList;

    public SpringFtl(List<Table> tableList, CodeConfig codeConfig) {
        super(null, codeConfig);
        this.tableList = tableList;
    }

    public void execute() {
        List springBeanList = new ArrayList();
        for (int i = 0; i < tableList.size(); i++) {
            Table tmp = (Table) tableList.get(i);
            String springBeanComments = StringUtil.parseNull(tmp.getComments(), "");
            String springBeanId = parsePropertyName(tmp.getTableName()) + "DAO";
            String springBeanClass = getPackageOfImpl() + "." + parseTableName(tmp.getTableName()) + "Impl";
            String springActionClass = getPackageOfAction() + "." + parseTableName(tmp.getTableName()) + "Action";
            Map map = new HashMap();
            map.put("springBeanComments", springBeanComments);
            map.put("springBeanId", StringUtil.parseNull(springBeanId, ""));
            map.put("springBeanClass", StringUtil.parseNull(springBeanClass, ""));

            map.put("springActionId", parseTableName(tmp.getTableName())+"Action");
            map.put("springActionClass", springActionClass);
            springBeanList.add(map);
        }

        Map map = new HashMap();
        map.put("copyRightStartYear", getCopyRightStartYear());
        map.put("copyRightStopYear", getCopyRightStopYear());
        map.put("createTime", getCreateTime());
        map.put("springBeanList", springBeanList);
        File outfile = new File(getFileOfService(), "spring.xml");
        writeFile("Spring.ftl", map, outfile);
    }
}
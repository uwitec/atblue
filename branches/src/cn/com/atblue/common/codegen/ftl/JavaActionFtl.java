package cn.com.atblue.common.codegen.ftl;


import cn.com.atblue.common.codegen.CodeConfig;
import cn.com.atblue.common.codegen.bean.Column;
import cn.com.atblue.common.codegen.bean.Table;
import cn.com.atblue.common.util.StringUtil;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class JavaActionFtl extends FtlBasic {
    public JavaActionFtl(Table table, CodeConfig codeConfig) {
        super(table, codeConfig);
    }

    public void execute() {
        Map map = new HashMap();
        String beanType = StringUtil.parseNull(parseTableName(getTable().getTableName()), "");
        String daoType = beanType+"DAO";
        String beanName = (beanType.charAt(0)+"").toLowerCase()+beanType.substring(1);
        String daoName =  beanName+"DAO";
        String pkName = parsePropertyName(table.getPkName());
        String pkName2 =(pkName.charAt(0)+"").toUpperCase()+pkName.substring(1);
        map.put("classComments", StringUtil.parseNull(getTable().getComments(), ""));
        map.put("beanType", beanType);
        map.put("daoType", daoType);
        map.put("beanName", beanName);
        map.put("daoName", daoName);
        map.put("pkname",pkName);
        map.put("pkname2",pkName2);
        writeFile("JavaAction.ftl", map, getFileOfAction());
    }
}
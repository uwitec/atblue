package cn.com.atblue.common.codegen;

import cn.com.atblue.common.codegen.bean.Table;
import cn.com.atblue.common.codegen.ftl.*;
import cn.com.atblue.common.codegen.jdbc.DaoSupport;

import javax.sql.DataSource;
import java.util.List;

public class CodeManager {
    private DataSource dataSource;
    private String outputDir;//输出目录
    private String prefixOfPackage;//包前缀
    private String prefixOfSqlmap;//SqlMap前缀
    private String prefixOfTable;//表前缀

    public void generate() {
        CodeConfig codeConfig = new CodeConfig();
        codeConfig.setOutputDir(this.outputDir);
        codeConfig.setPrefixOfPackage(this.prefixOfPackage);
        codeConfig.setPrefixOfSqlmap(this.prefixOfSqlmap);
        DaoSupport fi = new DaoSupport(dataSource);
        List tableList = fi.getTableList(this.prefixOfTable);
        new SpringFtl(tableList, codeConfig).execute();
        new IbatisFtl(tableList, codeConfig).execute();
        for (int i = 0; i < tableList.size(); i++) {
            Table table = (Table) tableList.get(i);
            table.setColumnList(fi.getColumnList(table.getTableName()));
            new BeanFtl(table, codeConfig).execute();
            new DaoFtl(table, codeConfig).execute();
            new ImplFtl(table, codeConfig).execute();
            new SqlMapFtl(table, codeConfig).execute();
            new JspAddFtl(table, codeConfig).execute();
            new JspModFtl(table, codeConfig).execute();
            new JspListFtl(table, codeConfig).execute();
            new JavaActionFtl(table, codeConfig).execute();
            new Struts2Ftl(table, codeConfig).execute();
//            System.out.println("TableName=" + table.getTableName());
        }
    }

    public DataSource getDataSource() {
        return dataSource;
    }

    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public String getOutputDir() {
        return outputDir;
    }

    public void setOutputDir(String outputDir) {
        this.outputDir = outputDir;
    }

    public String getPrefixOfPackage() {
        return prefixOfPackage;
    }

    public void setPrefixOfPackage(String prefixOfPackage) {
        this.prefixOfPackage = prefixOfPackage;
    }

    public String getPrefixOfSqlmap() {
        return prefixOfSqlmap;
    }

    public void setPrefixOfSqlmap(String prefixOfSqlmap) {
        this.prefixOfSqlmap = prefixOfSqlmap;
    }

    public String getPrefixOfTable() {
        return prefixOfTable;
    }

    public void setPrefixOfTable(String prefixOfTable) {
        this.prefixOfTable = prefixOfTable;
    }
}

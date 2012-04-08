package cn.com.atblue.common.codegen.ftl;

import cn.com.atblue.common.codegen.CodeConfig;
import cn.com.atblue.common.codegen.bean.Table;
import cn.com.atblue.common.util.DateUtil;
import freemarker.template.Template;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public class FtlBasic {
    protected Table table;
    protected CodeConfig config;
    private String prefixOfPackage = "";
    private String prefixOfFilePath = "";

    public FtlBasic(Table table,CodeConfig config) {
        this.table = table;
        this.config = config;
        this.prefixOfPackage = (config.getPrefixOfPackage());
        this.prefixOfFilePath = ("src/" + config.getPrefixOfPackage().replaceAll("\\.", "/"));
    }

    public String getCopyRightStartYear() {
        return DateUtil.getLocalDate("yyyy");
    }

    public String getCopyRightStopYear() {
        return DateUtil.format(DateUtil.addYear(DateUtil.getDate(), 3), "yyyy");
    }

    public String getCreateTime() {
        return DateUtil.getLocalDate("yyyy-MM-dd HH:mm:ss");
    }

    public String getPackageOfBean() {
        return this.prefixOfPackage + ".bean";
    }

    public String getPackageOfDao() {
        return this.prefixOfPackage + ".dao";
    }

    public String getPackageOfImpl() {
        return this.prefixOfPackage + ".dao.impl";
    }

    public File getFileOfService() {
        return new File(this.config.getOutputDir(), this.prefixOfFilePath);
    }

    public File getFileOfBean() {
        String f = this.prefixOfFilePath + "/bean/" + parseTableName(this.table.getTableName()) + ".java";
        return new File(this.config.getOutputDir(), f);
    }

    public File getFileOfDao() {
        String f = this.prefixOfFilePath + "/dao/" + parseTableName(this.table.getTableName()) + "DAO.java";
        return new File(this.config.getOutputDir(), f);
    }

    public File getFileOfImpl() {
        String f = this.prefixOfFilePath + "/dao/impl/" + parseTableName(this.table.getTableName()) + "Impl.java";
        return new File(this.config.getOutputDir(), f);
    }

    public File getFileOfSqlMap() {
        String f = this.prefixOfFilePath + "/dao/impl/" + parseTableName(this.table.getTableName()) + "Impl.xml";
        return new File(this.config.getOutputDir(), f);
    }

    public void writeFile(String template, Object object, File outfile) {
        if (!outfile.exists()) {
            try {
                if (!outfile.getParentFile().exists()) {
                    outfile.getParentFile().mkdirs();
                }
                outfile.createNewFile();
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        OutputStream outstream = null;
        try {
            outstream = new FileOutputStream(outfile);
            Template templete = TemplateFactory.getTemplate(template);
            TemplateFactory.write(templete, object, outstream);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (outstream != null)
                try {
                    outstream.close();
                } catch (IOException ex) {
                    ex.printStackTrace();
                }
        }
    }

    public String getPrefixOfFilePath() {
        return this.prefixOfFilePath;
    }

    public void setPrefixOfFilePath(String prefixOfFilePath) {
        this.prefixOfFilePath = prefixOfFilePath;
    }

    public String getPrefixOfPackage() {
        return this.prefixOfPackage;
    }

    public void setPrefixOfPackage(String prefixOfPackage) {
        this.prefixOfPackage = prefixOfPackage;
    }

    public Table getTable() {
        return this.table;
    }

    public void setTable(Table table) {
        this.table = table;
    }

    protected String parsePropertyName(String s) {
        String v = parseTableName(s);
        return String.valueOf(v.charAt(0)).toLowerCase() + v.substring(1);
    }

    protected String parseTableName(String s) {
        String[] p = s.split("_");
        if (p == null) {
            return "";
        }
        String v = "";
        for (int i = 0; i < p.length; i++) {
            if ((p[i] == null) || (p[i].trim().length() == 0)) {
                continue;
            }
            String pl = p[i].toLowerCase();
            v = v + String.valueOf(pl.charAt(0)).toUpperCase() + pl.substring(1);
        }
        return v;
    }
}
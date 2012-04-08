package cn.com.atblue.common.codegen;

public class CodeConfig {
    private String outputDir;//输出目录
    private String prefixOfPackage;//包前缀
    private String prefixOfSqlmap;//SqlMap前缀

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
}

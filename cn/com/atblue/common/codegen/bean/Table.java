package cn.com.atblue.common.codegen.bean;

import java.util.ArrayList;
import java.util.List;

public class Table {
    private String tableName;
    private String comments;
    private String pkName;
    private List<Column> columnList;

    public Table() {
        this.columnList = new ArrayList();
    }

    public String getComments() {
        return this.comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public String getTableName() {
        return this.tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public List<Column> getColumnList() {
        return this.columnList;
    }

    public void setColumnList(List<Column> columnList) {
        this.columnList = columnList;
    }

    public String getPkName() {
        return pkName;
    }

    public void setPkName(String pkName) {
        this.pkName = pkName;
    }
}
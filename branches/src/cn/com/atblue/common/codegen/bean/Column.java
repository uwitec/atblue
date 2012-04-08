package cn.com.atblue.common.codegen.bean;

import org.jdom.Element;

public class Column {
    private String columnName;
    private int dataLength;
    private int dataPrecision;
    private int dataScale;
    private String dataType;
    private String comments;

    public Column() {
    }

    public String getColumnName() {
        return this.columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }

    public String getComments() {
        return this.comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public int getDataLength() {
        return this.dataLength;
    }

    public void setDataLength(int dataLength) {
        this.dataLength = dataLength;
    }

    public int getDataPrecision() {
        return this.dataPrecision;
    }

    public void setDataPrecision(int dataPrecision) {
        this.dataPrecision = dataPrecision;
    }

    public int getDataScale() {
        return this.dataScale;
    }

    public void setDataScale(int dataScale) {
        this.dataScale = dataScale;
    }

    public String getDataType() {
        return this.dataType;
    }

    public void setDataType(String dataType) {
        this.dataType = dataType;
    }
}
package cn.com.atblue.oa.bean;

import java.util.Date;

/**
* 
* @newtime 2012-04-15 16:30:05
*/
public class OfficeQpdFormitem {

private String formItemId;
private String formId;
private String formItemName;
private String formItemTitle;
private String lrr;
private Date lrsj;
private Double px;

public String getFormItemId(){
return this.formItemId;
}

public void setFormItemId(String formItemId){
this.formItemId=formItemId;
}

public String getFormId(){
return this.formId;
}

public void setFormId(String formId){
this.formId=formId;
}

public String getFormItemName(){
return this.formItemName;
}

public void setFormItemName(String formItemName){
this.formItemName=formItemName;
}

public String getFormItemTitle(){
return this.formItemTitle;
}

public void setFormItemTitle(String formItemTitle){
this.formItemTitle=formItemTitle;
}

public String getLrr(){
return this.lrr;
}

public void setLrr(String lrr){
this.lrr=lrr;
}

public Date getLrsj(){
return this.lrsj;
}

public void setLrsj(Date lrsj){
this.lrsj=lrsj;
}

public Double getPx(){
return this.px;
}

public void setPx(Double px){
this.px=px;
}
}

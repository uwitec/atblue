package cn.com.atblue.oa.bean;

import java.util.Date;

/**
* 
* @newtime 2012-04-15 15:46:36
*/
public class OfficeQpdForm {

private String formId;
private String formName;
private String formTitle;
private String lrr;
private Date lrsj;

public String getFormId(){
return this.formId;
}

public void setFormId(String formId){
this.formId=formId;
}

public String getFormName(){
return this.formName;
}

public void setFormName(String formName){
this.formName=formName;
}

public String getFormTitle(){
return this.formTitle;
}

public void setFormTitle(String formTitle){
this.formTitle=formTitle;
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
}

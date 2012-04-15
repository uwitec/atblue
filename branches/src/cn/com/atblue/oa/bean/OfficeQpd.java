package cn.com.atblue.oa.bean;

import java.util.Date;

/**
* 
* @newtime 2012-04-15 15:46:08
*/
public class OfficeQpd {

private String processid;
private String formId;
private String signdata;
private String lrr;
private Date lrsj;

public String getProcessid(){
return this.processid;
}

public void setProcessid(String processid){
this.processid=processid;
}

public String getFormId(){
return this.formId;
}

public void setFormId(String formId){
this.formId=formId;
}

public String getSigndata(){
return this.signdata;
}

public void setSigndata(String signdata){
this.signdata=signdata;
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

package cn.com.atblue.oa.bean;

import java.util.Date;

/**
* 
* @newtime 2012-04-15 15:46:21
*/
public class OfficeQpdyj {

private String processid;
private String formItemId;
private String spyj;
private String lrr;
private Date lrsj;

public String getProcessid(){
return this.processid;
}

public void setProcessid(String processid){
this.processid=processid;
}

public String getFormItemId(){
return this.formItemId;
}

public void setFormItemId(String formItemId){
this.formItemId=formItemId;
}

public String getSpyj(){
return this.spyj;
}

public void setSpyj(String spyj){
this.spyj=spyj;
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

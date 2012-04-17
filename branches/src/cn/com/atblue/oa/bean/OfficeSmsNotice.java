package cn.com.atblue.oa.bean;

import java.util.Date;

/**
* 
* @newtime 2012-04-17 20:01:34
*/
public class OfficeSmsNotice {

private Integer tzid;
private String dxnr;
private String fsr;
private String fsbm;
private Date cjsj;
private String zt;

public Integer getTzid(){
return this.tzid;
}

public void setTzid(Integer tzid){
this.tzid=tzid;
}

public String getDxnr(){
return this.dxnr;
}

public void setDxnr(String dxnr){
this.dxnr=dxnr;
}

public String getFsr(){
return this.fsr;
}

public void setFsr(String fsr){
this.fsr=fsr;
}

public String getFsbm(){
return this.fsbm;
}

public void setFsbm(String fsbm){
this.fsbm=fsbm;
}

public Date getCjsj(){
return this.cjsj;
}

public void setCjsj(Date cjsj){
this.cjsj=cjsj;
}

public String getZt(){
return this.zt;
}

public void setZt(String zt){
this.zt=zt;
}
}

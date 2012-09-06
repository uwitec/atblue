package cn.com.atblue.oa.bean;

import java.util.Date;

/**
* 
* @newtime 2012-09-06 17:03:15
*/
public class OfficeSuppliesDepart {

private String pkId;
private String sqid;
private String orgid;
private Date lrsj;

public String getPkId(){
return this.pkId;
}

public void setPkId(String pkId){
this.pkId=pkId;
}

public String getSqid(){
return this.sqid;
}

public void setSqid(String sqid){
this.sqid=sqid;
}

public String getOrgid(){
return this.orgid;
}

public void setOrgid(String orgid){
this.orgid=orgid;
}

public Date getLrsj(){
return this.lrsj;
}

public void setLrsj(Date lrsj){
this.lrsj=lrsj;
}
}

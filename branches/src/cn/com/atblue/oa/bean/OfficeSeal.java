package cn.com.atblue.oa.bean;

import java.util.Date;

/**
* 
* @newtime 2012-04-06 22:26:37
*/
public class OfficeSeal {

private String sealId;
private String userId;
private String sealPwd;
private String createPerson;
private Date createTime;
private String createIp;
private byte[] seal;

public String getSealId(){
return this.sealId;
}

public void setSealId(String sealId){
this.sealId=sealId;
}

public String getUserId(){
return this.userId;
}

public void setUserId(String userId){
this.userId=userId;
}

public String getSealPwd(){
return this.sealPwd;
}

public void setSealPwd(String sealPwd){
this.sealPwd=sealPwd;
}

public String getCreatePerson(){
return this.createPerson;
}

public void setCreatePerson(String createPerson){
this.createPerson=createPerson;
}

public Date getCreateTime(){
return this.createTime;
}

public void setCreateTime(Date createTime){
this.createTime=createTime;
}

public String getCreateIp(){
return this.createIp;
}

public void setCreateIp(String createIp){
this.createIp=createIp;
}

public byte[] getSeal(){
return this.seal;
}

public void setSeal(byte[] seal){
this.seal=seal;
}
}

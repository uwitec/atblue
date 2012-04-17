package cn.com.atblue.oa.bean;

import java.util.Date;

/**
* 
* @newtime 2012-04-17 17:05:31
*/
public class OfficeSms {

private String pkId;
private String userId;
private String userName;
private String phone;
private String smsContent;
private String moduleFlag;
private Date createTime;

public String getPkId(){
return this.pkId;
}

public void setPkId(String pkId){
this.pkId=pkId;
}

public String getUserId(){
return this.userId;
}

public void setUserId(String userId){
this.userId=userId;
}

public String getUserName(){
return this.userName;
}

public void setUserName(String userName){
this.userName=userName;
}

public String getPhone(){
return this.phone;
}

public void setPhone(String phone){
this.phone=phone;
}

public String getSmsContent(){
return this.smsContent;
}

public void setSmsContent(String smsContent){
this.smsContent=smsContent;
}

public String getModuleFlag(){
return this.moduleFlag;
}

public void setModuleFlag(String moduleFlag){
this.moduleFlag=moduleFlag;
}

public Date getCreateTime(){
return this.createTime;
}

public void setCreateTime(Date createTime){
this.createTime=createTime;
}
}

package cn.com.atblue.oa.bean;

import java.util.Date;

/**
* 
* @newtime 2012-04-17 20:01:34
*/
public class OfficeSmsPerson {

private String pkId;
private Integer tzid;
private String userId;
private String userName;
private String phone;
private Date createTime;
private Date readTime;
private String sfqs;

public String getPkId(){
return this.pkId;
}

public void setPkId(String pkId){
this.pkId=pkId;
}

public Integer getTzid(){
return this.tzid;
}

public void setTzid(Integer tzid){
this.tzid=tzid;
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

public Date getCreateTime(){
return this.createTime;
}

public void setCreateTime(Date createTime){
this.createTime=createTime;
}

public Date getReadTime(){
return this.readTime;
}

public void setReadTime(Date readTime){
this.readTime=readTime;
}

public String getSfqs(){
return this.sfqs;
}

public void setSfqs(String sfqs){
this.sfqs=sfqs;
}
}

package cn.com.atblue.oa.bean;

import java.util.Date;

/**
* 模块回复标志：
1、通知公告
2、会议审批
。。。。。。
是否签收 1为已签收
* @newtime 2012-04-17 17:05:31
*/
public class OfficeSmsHis {

private String hisId;
private String userId;
private String userName;
private String phone;
private String smsContent;
private String moduleFlag;
private Date createTime;
private Date readTime;
private String sfqs;

public String getHisId(){
return this.hisId;
}

public void setHisId(String hisId){
this.hisId=hisId;
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

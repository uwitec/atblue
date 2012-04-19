package cn.com.atblue.oa.bean;

import java.util.Date;

/**
* 通知类别
A：会议申请
B：请销假
C：文件审批
D：通知公告
E：用印申请
* @newtime 2012-04-19 19:22:22
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
private String sffs;
private String tzlb;
private String sqId;
private String dxnr;

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

public String getSffs(){
return this.sffs;
}

public void setSffs(String sffs){
this.sffs=sffs;
}

public String getTzlb(){
return this.tzlb;
}

public void setTzlb(String tzlb){
this.tzlb=tzlb;
}

public String getSqId(){
return this.sqId;
}

public void setSqId(String sqId){
this.sqId=sqId;
}

public String getDxnr(){
return this.dxnr;
}

public void setDxnr(String dxnr){
this.dxnr=dxnr;
}
}

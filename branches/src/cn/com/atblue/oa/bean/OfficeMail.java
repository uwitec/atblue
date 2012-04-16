package cn.com.atblue.oa.bean;

import java.util.Date;

/**
* 
* @newtime 2012-04-16 14:20:58
*/
public class OfficeMail {

private String mailId;
private String mailZt;
private String mailNr;
private Date sendTime;
private String sendPerson;
private String mailStatus;

public String getMailId(){
return this.mailId;
}

public void setMailId(String mailId){
this.mailId=mailId;
}

public String getMailZt(){
return this.mailZt;
}

public void setMailZt(String mailZt){
this.mailZt=mailZt;
}

public String getMailNr(){
return this.mailNr;
}

public void setMailNr(String mailNr){
this.mailNr=mailNr;
}

public Date getSendTime(){
return this.sendTime;
}

public void setSendTime(Date sendTime){
this.sendTime=sendTime;
}

public String getSendPerson(){
return this.sendPerson;
}

public void setSendPerson(String sendPerson){
this.sendPerson=sendPerson;
}

public String getMailStatus(){
return this.mailStatus;
}

public void setMailStatus(String mailStatus){
this.mailStatus=mailStatus;
}
}

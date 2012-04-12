package cn.com.atblue.workflow.bean;

import java.util.Date;

/**
* 
* @newtime 2012-04-12 23:19:25
*/
public class WConnect {

private String connectId;
private String processId;
private String connectName;
private String connectValue;
private String startInstance;
private String endInstance;
private String lineId;
private String pendingPerson;
private Date createTime;
private String realPerson;

public String getConnectId(){
return this.connectId;
}

public void setConnectId(String connectId){
this.connectId=connectId;
}

public String getProcessId(){
return this.processId;
}

public void setProcessId(String processId){
this.processId=processId;
}

public String getConnectName(){
return this.connectName;
}

public void setConnectName(String connectName){
this.connectName=connectName;
}

public String getConnectValue(){
return this.connectValue;
}

public void setConnectValue(String connectValue){
this.connectValue=connectValue;
}

public String getStartInstance(){
return this.startInstance;
}

public void setStartInstance(String startInstance){
this.startInstance=startInstance;
}

public String getEndInstance(){
return this.endInstance;
}

public void setEndInstance(String endInstance){
this.endInstance=endInstance;
}

public String getLineId(){
return this.lineId;
}

public void setLineId(String lineId){
this.lineId=lineId;
}

public String getPendingPerson(){
return this.pendingPerson;
}

public void setPendingPerson(String pendingPerson){
this.pendingPerson=pendingPerson;
}

public Date getCreateTime(){
return this.createTime;
}

public void setCreateTime(Date createTime){
this.createTime=createTime;
}

public String getRealPerson(){
return this.realPerson;
}

public void setRealPerson(String realPerson){
this.realPerson=realPerson;
}
}

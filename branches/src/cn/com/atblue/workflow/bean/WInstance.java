package cn.com.atblue.workflow.bean;

import java.util.Date;

/**
* 
* @newtime 2012-04-05 17:29:10
*/
public class WInstance {

private String instanceId;
private Date createTime;
private String createPerson;
private String activityId;
private String processId;
private String instanceStatus;
private String dealPerson;
private Date dealTime;

public String getInstanceId(){
return this.instanceId;
}

public void setInstanceId(String instanceId){
this.instanceId=instanceId;
}

public Date getCreateTime(){
return this.createTime;
}

public void setCreateTime(Date createTime){
this.createTime=createTime;
}

public String getCreatePerson(){
return this.createPerson;
}

public void setCreatePerson(String createPerson){
this.createPerson=createPerson;
}

public String getActivityId(){
return this.activityId;
}

public void setActivityId(String activityId){
this.activityId=activityId;
}

public String getProcessId(){
return this.processId;
}

public void setProcessId(String processId){
this.processId=processId;
}

public String getInstanceStatus(){
return this.instanceStatus;
}

public void setInstanceStatus(String instanceStatus){
this.instanceStatus=instanceStatus;
}

public String getDealPerson(){
return this.dealPerson;
}

public void setDealPerson(String dealPerson){
this.dealPerson=dealPerson;
}

public Date getDealTime(){
return this.dealTime;
}

public void setDealTime(Date dealTime){
this.dealTime=dealTime;
}
}

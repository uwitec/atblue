package cn.com.atblue.workflow.bean;

import java.util.Date;

/**
* 
* @newtime 2012-04-06 10:25:17
*/
public class WProcess {

private String processId;
private String processName;
private String flowId;
private String createPerson;
private Date createTime;
private String processStatus;
private String instanceId;
private String connectId;

public String getProcessId(){
return this.processId;
}

public void setProcessId(String processId){
this.processId=processId;
}

public String getProcessName(){
return this.processName;
}

public void setProcessName(String processName){
this.processName=processName;
}

public String getFlowId(){
return this.flowId;
}

public void setFlowId(String flowId){
this.flowId=flowId;
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

public String getProcessStatus(){
return this.processStatus;
}

public void setProcessStatus(String processStatus){
this.processStatus=processStatus;
}

public String getInstanceId(){
return this.instanceId;
}

public void setInstanceId(String instanceId){
this.instanceId=instanceId;
}

public String getConnectId(){
return this.connectId;
}

public void setConnectId(String connectId){
this.connectId=connectId;
}
}

package cn.com.atblue.workflow.bean;

import java.util.Date;

/**
* 
* @newtime 2012-04-07 23:46:52
*/
public class WWorkflow {

private String flowId;
private String flowName;
private String flowDesc;
private Date createTime;
private Date updateTime;
private String releaseStatus;

public String getFlowId(){
return this.flowId;
}

public void setFlowId(String flowId){
this.flowId=flowId;
}

public String getFlowName(){
return this.flowName;
}

public void setFlowName(String flowName){
this.flowName=flowName;
}

public String getFlowDesc(){
return this.flowDesc;
}

public void setFlowDesc(String flowDesc){
this.flowDesc=flowDesc;
}

public Date getCreateTime(){
return this.createTime;
}

public void setCreateTime(Date createTime){
this.createTime=createTime;
}

public Date getUpdateTime(){
return this.updateTime;
}

public void setUpdateTime(Date updateTime){
this.updateTime=updateTime;
}

public String getReleaseStatus(){
return this.releaseStatus;
}

public void setReleaseStatus(String releaseStatus){
this.releaseStatus=releaseStatus;
}
}

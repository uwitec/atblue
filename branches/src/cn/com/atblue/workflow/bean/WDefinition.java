package cn.com.atblue.workflow.bean;

import java.util.Date;

/**
* 
* @newtime 2012-04-07 22:16:52
*/
public class WDefinition {

private String flowId;
private Date createTime;
private Date updateTime;
private String flowFile;

public String getFlowId(){
return this.flowId;
}

public void setFlowId(String flowId){
this.flowId=flowId;
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

public String getFlowFile(){
return this.flowFile;
}

public void setFlowFile(String flowFile){
this.flowFile=flowFile;
}
}

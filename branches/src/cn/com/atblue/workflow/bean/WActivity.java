package cn.com.atblue.workflow.bean;


/**
* 
* @newtime 2012-04-05 17:29:10
*/
public class WActivity {

private String activityId;
private String activityName;
private String activityDesc;
private String flowId;
private String activityType;
private Double activityOrder;
private String activityRole;
private String activitySfxddw;

public String getActivityId(){
return this.activityId;
}

public void setActivityId(String activityId){
this.activityId=activityId;
}

public String getActivityName(){
return this.activityName;
}

public void setActivityName(String activityName){
this.activityName=activityName;
}

public String getActivityDesc(){
return this.activityDesc;
}

public void setActivityDesc(String activityDesc){
this.activityDesc=activityDesc;
}

public String getFlowId(){
return this.flowId;
}

public void setFlowId(String flowId){
this.flowId=flowId;
}

public String getActivityType(){
return this.activityType;
}

public void setActivityType(String activityType){
this.activityType=activityType;
}

public Double getActivityOrder(){
return this.activityOrder;
}

public void setActivityOrder(Double activityOrder){
this.activityOrder=activityOrder;
}

public String getActivityRole(){
return this.activityRole;
}

public void setActivityRole(String activityRole){
this.activityRole=activityRole;
}

public String getActivitySfxddw(){
return this.activitySfxddw;
}

public void setActivitySfxddw(String activitySfxddw){
this.activitySfxddw=activitySfxddw;
}
}

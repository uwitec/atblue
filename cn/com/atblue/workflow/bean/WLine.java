package cn.com.atblue.workflow.bean;


/**
* 
* @newtime 2012-04-06 16:09:18
*/
public class WLine {

private String lineId;
private String lineName;
private String lineVarValue;
private String startActivity;
private String endActivity;
private String counterType;
private Double counterValue;
private String flowId;

public String getLineId(){
return this.lineId;
}

public void setLineId(String lineId){
this.lineId=lineId;
}

public String getLineName(){
return this.lineName;
}

public void setLineName(String lineName){
this.lineName=lineName;
}

public String getLineVarValue(){
return this.lineVarValue;
}

public void setLineVarValue(String lineVarValue){
this.lineVarValue=lineVarValue;
}

public String getStartActivity(){
return this.startActivity;
}

public void setStartActivity(String startActivity){
this.startActivity=startActivity;
}

public String getEndActivity(){
return this.endActivity;
}

public void setEndActivity(String endActivity){
this.endActivity=endActivity;
}

public String getCounterType(){
return this.counterType;
}

public void setCounterType(String counterType){
this.counterType=counterType;
}

public Double getCounterValue(){
return this.counterValue;
}

public void setCounterValue(Double counterValue){
this.counterValue=counterValue;
}

public String getFlowId(){
return this.flowId;
}

public void setFlowId(String flowId){
this.flowId=flowId;
}
}

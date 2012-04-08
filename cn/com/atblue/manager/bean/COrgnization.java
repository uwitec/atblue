package cn.com.atblue.manager.bean;


/**
* 
* @newtime 2012-03-30 10:12:31
*/
public class COrgnization {

private String orgnaId;
private String orgnaName;
private Integer orgnaOrder;
private String parentId;
private String orgnaMemo;

public String getOrgnaId(){
return this.orgnaId;
}

public void setOrgnaId(String orgnaId){
this.orgnaId=orgnaId;
}

public String getOrgnaName(){
return this.orgnaName;
}

public void setOrgnaName(String orgnaName){
this.orgnaName=orgnaName;
}

public Integer getOrgnaOrder(){
return this.orgnaOrder;
}

public void setOrgnaOrder(Integer orgnaOrder){
this.orgnaOrder=orgnaOrder;
}

public String getParentId(){
return this.parentId;
}

public void setParentId(String parentId){
this.parentId=parentId;
}

public String getOrgnaMemo(){
return this.orgnaMemo;
}

public void setOrgnaMemo(String orgnaMemo){
this.orgnaMemo=orgnaMemo;
}
}

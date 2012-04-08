package cn.com.atblue.manager.bean;


/**
* 
* @newtime 2012-03-30 10:12:31
*/
public class CRelation {

private String relationId;
private String resId;
private String userId;
private String roleId;

public String getRelationId(){
return this.relationId;
}

public void setRelationId(String relationId){
this.relationId=relationId;
}

public String getResId(){
return this.resId;
}

public void setResId(String resId){
this.resId=resId;
}

public String getUserId(){
return this.userId;
}

public void setUserId(String userId){
this.userId=userId;
}

public String getRoleId(){
return this.roleId;
}

public void setRoleId(String roleId){
this.roleId=roleId;
}
}

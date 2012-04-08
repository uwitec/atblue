package cn.com.atblue.manager.bean;


/**
* 
* @newtime 2012-03-30 10:12:31
*/
public class CRole {

private String roleId;
private String roleName;
private String roleDesc;
private Integer roleOrder;

public String getRoleId(){
return this.roleId;
}

public void setRoleId(String roleId){
this.roleId=roleId;
}

public String getRoleName(){
return this.roleName;
}

public void setRoleName(String roleName){
this.roleName=roleName;
}

public String getRoleDesc(){
return this.roleDesc;
}

public void setRoleDesc(String roleDesc){
this.roleDesc=roleDesc;
}

public Integer getRoleOrder(){
return this.roleOrder;
}

public void setRoleOrder(Integer roleOrder){
this.roleOrder=roleOrder;
}
}

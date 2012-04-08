package cn.com.atblue.manager.bean;


/**
* 
* @newtime 2012-03-30 10:12:31
*/
public class CResource {

private String resId;
private String resName;
private String resDesc;
private String resType;
private Integer resOrder;
private String resClass;
private String parentId;

public String getResId(){
return this.resId;
}

public void setResId(String resId){
this.resId=resId;
}

public String getResName(){
return this.resName;
}

public void setResName(String resName){
this.resName=resName;
}

public String getResDesc(){
return this.resDesc;
}

public void setResDesc(String resDesc){
this.resDesc=resDesc;
}

public String getResType(){
return this.resType;
}

public void setResType(String resType){
this.resType=resType;
}

public Integer getResOrder(){
return this.resOrder;
}

public void setResOrder(Integer resOrder){
this.resOrder=resOrder;
}

public String getResClass(){
return this.resClass;
}

public void setResClass(String resClass){
this.resClass=resClass;
}

public String getParentId(){
return this.parentId;
}

public void setParentId(String parentId){
this.parentId=parentId;
}
}

package cn.com.atblue.manager.bean;


/**
* 
* @newtime 2012-03-30 10:12:31
*/
public class CMenu {

private String menuid;
private String menuname;
private String menuurl;
private String menuclass;
private String menulevel;
private String parent;
private String target;

public String getMenuid(){
return this.menuid;
}

public void setMenuid(String menuid){
this.menuid=menuid;
}

public String getMenuname(){
return this.menuname;
}

public void setMenuname(String menuname){
this.menuname=menuname;
}

public String getMenuurl(){
return this.menuurl;
}

public void setMenuurl(String menuurl){
this.menuurl=menuurl;
}

public String getMenuclass(){
return this.menuclass;
}

public void setMenuclass(String menuclass){
this.menuclass=menuclass;
}

public String getMenulevel(){
return this.menulevel;
}

public void setMenulevel(String menulevel){
this.menulevel=menulevel;
}

public String getParent(){
return this.parent;
}

public void setParent(String parent){
this.parent=parent;
}

public String getTarget(){
return this.target;
}

public void setTarget(String target){
this.target=target;
}
}

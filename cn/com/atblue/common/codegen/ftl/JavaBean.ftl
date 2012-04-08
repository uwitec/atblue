package ${package};

<#list importList as import>
import ${import};
</#list>

/**
* ${classComments}
* @newtime ${createTime}
*/
public class ${className} {

<#list columnList as v>
private ${v.beanType} ${v.name};
</#list>
<#list columnList as v>

public ${v.beanType} ${v.getter}(){
return this.${v.name};
}

public void ${v.setter}(${v.beanType} ${v.name}){
this.${v.name}=${v.name};
}
</#list>
}

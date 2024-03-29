<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE beans PUBLIC "-//SPRING//DTD BEAN 2.0//EN" "http://www.springframework.org/dtd/spring-beans-2.0.dtd" >

<beans>
    <#list springBeanList as v>
        <bean id="${v.springBeanId}" class="${v.springBeanClass}" autowire="byName"/>
    </#list>

    <#list springBeanList as v>
        <bean id="${v.springActionId}" class="${v.springActionClass}" scope="prototype" autowire="byName"/>
    </#list>
</beans>
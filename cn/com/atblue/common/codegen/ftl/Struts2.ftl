<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE struts PUBLIC
        "-//Apache Software Foundation//DTD Struts Configuration 2.0//EN"
        "http://struts.apache.org/dtds/struts-2.0.dtd">
<struts>

    <package name="atblue_oa" extends="struts-default" namespace="/oa" >
        <action name="${className}_*" class="${actionName}" method="{1}">
            <result name="list">/oa/fygl/${className}_list.jsp</result>
            <result name="add">/oa/fygl/${className}_add.jsp</result>
            <result name="mod">/oa/fygl/${className}_mod.jsp</result>
            <result name="del" type="redirect">${className}_list.d</result>
            <result name="save" type="redirect">${className}_list.d</result>
        </action>
    </package>
</struts>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE sqlMap PUBLIC "-//ibatis.apache.org//DTD SQL Map 2.0//EN" "http://ibatis.apache.org/dtd/sql-map-2.dtd" >

<sqlMap namespace="${sqlMapPrefix}">
    <typeAlias alias="${className}" type="${absoluteClassName}"/>

    <sql id="dynamicRuleSql">
        <dynamic prepend="where">
        <#list dynamicRuleList as v>
            <isNotEmpty prepend=" and " property="${v.columnParsedName}">
                <![CDATA[${v.columnName}=#${v.columnParsedName}#]]>
            </isNotEmpty>
        </#list>
        </dynamic>
    </sql>
    <insert id="add${className}" parameterClass="${className}">
        <![CDATA[
            insert into ${tableName}(
                ${columnAddListStr}
            ) values(
                ${columnValListStr}
            )
        ]]>
    </insert>

    <update id="mod${className}" parameterClass="${className}">
        <![CDATA[
            update ${tableName}
            set ${columnModListStr}
            where ${pkName}
        ]]>
    </update>

    <delete id="del${className}" parameterClass="java.util.HashMap">
        <![CDATA[
            delete from ${tableName}
            where ${pkName}
        ]]>
    </delete>

    <select id="queryForBean" parameterClass="java.util.HashMap" resultClass="${className}">
        <![CDATA[
            select ${columnColListStr} from ${tableName} where ${pkName}
        ]]>
    </select>

    <select id="queryForList" parameterClass="java.util.HashMap" resultClass="${className}">
        <![CDATA[
            select ${columnColListStr} from ${tableName}
        ]]>
        <!--
        <dynamic prepend="where">
            <isNotEmpty prepend=" and " property="customProperty">
                <![CDATA[customProperty=#customProperty#]]>
            </isNotEmpty>
        </dynamic>
        -->
    </select>

    <select id="queryForCount" parameterClass="java.util.HashMap" resultClass="int">
        <![CDATA[
            select count(*) from ${tableName}
        ]]>
        <!--
        <dynamic prepend="where">
            <isNotEmpty prepend=" and " property="customProperty">
                <![CDATA[customProperty=#customProperty#]]>
            </isNotEmpty>
        </dynamic>
        -->
    </select>

    <select id="getPagedList" parameterClass="java.util.HashMap" resultClass="java.util.HashMap">
        <include refid="basic.pageStart"/>
        <![CDATA[
        select t.*  from ${tableName} t where 1=1
        ]]>
        <!--
          <dynamic prepend="where">
              <isNotEmpty prepend=" and " property="customProperty">
                  <![CDATA[customProperty=#customProperty#]]>
              </isNotEmpty>
          </dynamic>
          -->
        <include refid="basic.pageEnd"/>
    </select>
    <select id="getPagedCount" parameterClass="java.util.HashMap" resultClass="int">
        <![CDATA[
        select count(*) cn  from ${tableName}  t  where 1=1
        ]]>
        <!--
         <dynamic prepend="where">
             <isNotEmpty prepend=" and " property="customProperty">
                 <![CDATA[customProperty=#customProperty#]]>
             </isNotEmpty>
         </dynamic>
         -->
    </select>
</sqlMap>
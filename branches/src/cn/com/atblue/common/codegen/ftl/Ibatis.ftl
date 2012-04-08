<!DOCTYPE sqlMapConfig PUBLIC "-//ibatis.apache.org//DTD SQL Map Config 2.0//EN"
	"http://ibatis.apache.org/dtd/sql-map-config-2.dtd">

<sqlMapConfig>
    <settings cacheModelsEnabled="true"
            enhancementEnabled="true"
            lazyLoadingEnabled="true"
            errorTracingEnabled="true"
            useStatementNamespaces="true"
            maxRequests="100"
            maxSessions="60"
            maxTransactions="20"/>
    <!-- 框架相关配置 -->
    <typeHandler jdbcType="BLOB" javaType="[B" callback="org.springframework.orm.ibatis.support.BlobByteArrayTypeHandler" />
    <typeHandler jdbcType="CLOB" javaType="java.lang.String" callback="org.springframework.orm.ibatis.support.ClobStringTypeHandler" />

    <!-- 支持纯动态SQL的映射文件 -->
    <sqlMap resource="cn/com/victorysoft/oadd/base/dao/basicDAO.xml" />
    <sqlMap resource="cn/com/victorysoft/eaf/dataaccess/DEFAULT_SqlMap.xml" />
    <!--外观层SqlMap映射文件 结束-->

    <#list sqlMapList as v>
    <sqlMap resource="${v.relativeUrl}" />
    </#list>
</sqlMapConfig>
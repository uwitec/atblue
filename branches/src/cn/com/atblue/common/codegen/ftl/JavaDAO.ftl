package ${package};

import java.util.Map;
import java.util.List;
<#list importList as import>
import ${import};
</#list>

public interface ${className}DAO {

    public Object add${className}(${className} paramBean);

    public int mod${className}(${className} paramBean);

    public int del${className}(Map paramMap);

    public ${className} queryForBean(Map paramMap);

    public List<${className}> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}

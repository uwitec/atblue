package ${package};

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
<#list importList as import>
import ${import};
</#list>

public class ${className}Impl extends SqlMapClientDaoSupport implements ${className}DAO {

    public Object add${className}(${className} paramBean){
        return this.getSqlMapClientTemplate().insert("${sqlMapPrefix}.add${className}", paramBean);
    }

    public int mod${className}(${className} paramBean){
        return this.getSqlMapClientTemplate().update("${sqlMapPrefix}.mod${className}", paramBean);
    }

    public int del${className}(Map paramMap){
        return this.getSqlMapClientTemplate().delete("${sqlMapPrefix}.del${className}", paramMap);
    }

    public ${className} queryForBean(Map paramMap){
        return (${className})this.getSqlMapClientTemplate().queryForObject("${sqlMapPrefix}.queryForBean",paramMap);
    }

    public List<${className}> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("${sqlMapPrefix}.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("${sqlMapPrefix}.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("${sqlMapPrefix}.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("${sqlMapPrefix}.getPagedCount", paramMap);
    }
}

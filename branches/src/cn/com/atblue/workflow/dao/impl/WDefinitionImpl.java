package cn.com.atblue.workflow.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.workflow.bean.WDefinition;
import cn.com.atblue.workflow.dao.WDefinitionDAO;

public class WDefinitionImpl extends SqlMapClientDaoSupport implements WDefinitionDAO {

    public Object addWDefinition(WDefinition paramBean){
        return this.getSqlMapClientTemplate().insert("workflow.wdefinition.addWDefinition", paramBean);
    }

    public int modWDefinition(WDefinition paramBean){
        return this.getSqlMapClientTemplate().update("workflow.wdefinition.modWDefinition", paramBean);
    }

    public int delWDefinition(Map paramMap){
        return this.getSqlMapClientTemplate().delete("workflow.wdefinition.delWDefinition", paramMap);
    }

    public WDefinition queryForBean(Map paramMap){
        return (WDefinition)this.getSqlMapClientTemplate().queryForObject("workflow.wdefinition.queryForBean",paramMap);
    }

    public List<WDefinition> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("workflow.wdefinition.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("workflow.wdefinition.queryForCount", paramMap);
    }
}

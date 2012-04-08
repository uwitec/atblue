package cn.com.atblue.workflow.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.workflow.bean.WWorkflow;
import cn.com.atblue.workflow.dao.WWorkflowDAO;

public class WWorkflowImpl extends SqlMapClientDaoSupport implements WWorkflowDAO {

    public Object addWWorkflow(WWorkflow paramBean){
        return this.getSqlMapClientTemplate().insert("workflow.wworkflow.addWWorkflow", paramBean);
    }

    public int modWWorkflow(WWorkflow paramBean){
        return this.getSqlMapClientTemplate().update("workflow.wworkflow.modWWorkflow", paramBean);
    }

    public int delWWorkflow(Map paramMap){
        return this.getSqlMapClientTemplate().delete("workflow.wworkflow.delWWorkflow", paramMap);
    }

    public WWorkflow queryForBean(Map paramMap){
        return (WWorkflow)this.getSqlMapClientTemplate().queryForObject("workflow.wworkflow.queryForBean",paramMap);
    }

    public List<WWorkflow> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("workflow.wworkflow.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("workflow.wworkflow.queryForCount", paramMap);
    }
}

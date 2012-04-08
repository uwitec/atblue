package cn.com.atblue.workflow.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.workflow.bean.WInstance;
import cn.com.atblue.workflow.dao.WInstanceDAO;

public class WInstanceImpl extends SqlMapClientDaoSupport implements WInstanceDAO {

    public Object addWInstance(WInstance paramBean){
        return this.getSqlMapClientTemplate().insert("workflow.winstance.addWInstance", paramBean);
    }

    public int modWInstance(WInstance paramBean){
        return this.getSqlMapClientTemplate().update("workflow.winstance.modWInstance", paramBean);
    }

    public int delWInstance(Map paramMap){
        return this.getSqlMapClientTemplate().delete("workflow.winstance.delWInstance", paramMap);
    }

    public WInstance queryForBean(Map paramMap){
        return (WInstance)this.getSqlMapClientTemplate().queryForObject("workflow.winstance.queryForBean",paramMap);
    }

    public List<WInstance> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("workflow.winstance.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("workflow.winstance.queryForCount", paramMap);
    }
}

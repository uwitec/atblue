package cn.com.atblue.workflow.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.workflow.bean.WActivity;
import cn.com.atblue.workflow.dao.WActivityDAO;

public class WActivityImpl extends SqlMapClientDaoSupport implements WActivityDAO {

    public Object addWActivity(WActivity paramBean){
        return this.getSqlMapClientTemplate().insert("workflow.wactivity.addWActivity", paramBean);
    }

    public int modWActivity(WActivity paramBean){
        return this.getSqlMapClientTemplate().update("workflow.wactivity.modWActivity", paramBean);
    }

    public int delWActivity(Map paramMap){
        return this.getSqlMapClientTemplate().delete("workflow.wactivity.delWActivity", paramMap);
    }

    public WActivity queryForBean(Map paramMap){
        return (WActivity)this.getSqlMapClientTemplate().queryForObject("workflow.wactivity.queryForBean",paramMap);
    }

    public List<WActivity> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("workflow.wactivity.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("workflow.wactivity.queryForCount", paramMap);
    }
}

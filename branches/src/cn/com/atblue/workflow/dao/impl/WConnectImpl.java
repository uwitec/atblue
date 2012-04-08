package cn.com.atblue.workflow.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.workflow.bean.WConnect;
import cn.com.atblue.workflow.dao.WConnectDAO;

public class WConnectImpl extends SqlMapClientDaoSupport implements WConnectDAO {

    public Object addWConnect(WConnect paramBean){
        return this.getSqlMapClientTemplate().insert("workflow.wconnect.addWConnect", paramBean);
    }

    public int modWConnect(WConnect paramBean){
        return this.getSqlMapClientTemplate().update("workflow.wconnect.modWConnect", paramBean);
    }

    public int delWConnect(Map paramMap){
        return this.getSqlMapClientTemplate().delete("workflow.wconnect.delWConnect", paramMap);
    }

    public WConnect queryForBean(Map paramMap){
        return (WConnect)this.getSqlMapClientTemplate().queryForObject("workflow.wconnect.queryForBean",paramMap);
    }

    public List<WConnect> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("workflow.wconnect.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("workflow.wconnect.queryForCount", paramMap);
    }
}

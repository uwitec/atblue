package cn.com.atblue.manager.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.manager.bean.CRelation;
import cn.com.atblue.manager.dao.CRelationDAO;

public class CRelationImpl extends SqlMapClientDaoSupport implements CRelationDAO {

    public Object addCRelation(CRelation paramBean){
        return this.getSqlMapClientTemplate().insert("manager.crelation.addCRelation", paramBean);
    }

    public int modCRelation(CRelation paramBean){
        return this.getSqlMapClientTemplate().update("manager.crelation.modCRelation", paramBean);
    }

    public int delCRelation(Map paramMap){
        return this.getSqlMapClientTemplate().delete("manager.crelation.delCRelation", paramMap);
    }

    public CRelation queryForBean(Map paramMap){
        return (CRelation)this.getSqlMapClientTemplate().queryForObject("manager.crelation.queryForBean",paramMap);
    }

    public List<CRelation> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("manager.crelation.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("manager.crelation.queryForCount", paramMap);
    }
}

package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.OfficeYysq;
import cn.com.atblue.oa.dao.OfficeYysqDAO;

public class OfficeYysqImpl extends SqlMapClientDaoSupport implements OfficeYysqDAO {

    public Object addOfficeYysq(OfficeYysq paramBean){
        return this.getSqlMapClientTemplate().insert("oa.officeyysq.addOfficeYysq", paramBean);
    }

    public int modOfficeYysq(OfficeYysq paramBean){
        return this.getSqlMapClientTemplate().update("oa.officeyysq.modOfficeYysq", paramBean);
    }

    public int delOfficeYysq(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.officeyysq.delOfficeYysq", paramMap);
    }

    public OfficeYysq queryForBean(Map paramMap){
        return (OfficeYysq)this.getSqlMapClientTemplate().queryForObject("oa.officeyysq.queryForBean",paramMap);
    }

    public List<OfficeYysq> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.officeyysq.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.officeyysq.queryForCount", paramMap);
    }
}

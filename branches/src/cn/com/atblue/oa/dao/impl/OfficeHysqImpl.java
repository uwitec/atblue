package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.OfficeHysq;
import cn.com.atblue.oa.dao.OfficeHysqDAO;

public class OfficeHysqImpl extends SqlMapClientDaoSupport implements OfficeHysqDAO {

    public Object addOfficeHysq(OfficeHysq paramBean){
        return this.getSqlMapClientTemplate().insert("oa.officehysq.addOfficeHysq", paramBean);
    }

    public int modOfficeHysq(OfficeHysq paramBean){
        return this.getSqlMapClientTemplate().update("oa.officehysq.modOfficeHysq", paramBean);
    }

    public int delOfficeHysq(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.officehysq.delOfficeHysq", paramMap);
    }

    public OfficeHysq queryForBean(Map paramMap){
        return (OfficeHysq)this.getSqlMapClientTemplate().queryForObject("oa.officehysq.queryForBean",paramMap);
    }

    public List<OfficeHysq> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.officehysq.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.officehysq.queryForCount", paramMap);
    }
}

package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FyglScfzyf;
import cn.com.atblue.oa.dao.FyglScfzyfDAO;

public class FyglScfzyfImpl extends SqlMapClientDaoSupport implements FyglScfzyfDAO {

    public Object addFyglScfzyf(FyglScfzyf paramBean){
        return this.getSqlMapClientTemplate().insert("oa.fyglscfzyf.addFyglScfzyf", paramBean);
    }

    public int modFyglScfzyf(FyglScfzyf paramBean){
        return this.getSqlMapClientTemplate().update("oa.fyglscfzyf.modFyglScfzyf", paramBean);
    }

    public int delFyglScfzyf(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.fyglscfzyf.delFyglScfzyf", paramMap);
    }

    public FyglScfzyf queryForBean(Map paramMap){
        return (FyglScfzyf)this.getSqlMapClientTemplate().queryForObject("oa.fyglscfzyf.queryForBean",paramMap);
    }

    public List<FyglScfzyf> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglscfzyf.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglscfzyf.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglscfzyf.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglscfzyf.getPagedCount", paramMap);
    }
}

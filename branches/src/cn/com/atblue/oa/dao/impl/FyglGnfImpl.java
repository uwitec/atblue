package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FyglGnf;
import cn.com.atblue.oa.dao.FyglGnfDAO;

public class FyglGnfImpl extends SqlMapClientDaoSupport implements FyglGnfDAO {

    public Object addFyglGnf(FyglGnf paramBean){
        return this.getSqlMapClientTemplate().insert("oa.fyglgnf.addFyglGnf", paramBean);
    }

    public int modFyglGnf(FyglGnf paramBean){
        return this.getSqlMapClientTemplate().update("oa.fyglgnf.modFyglGnf", paramBean);
    }

    public int delFyglGnf(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.fyglgnf.delFyglGnf", paramMap);
    }

    public FyglGnf queryForBean(Map paramMap){
        return (FyglGnf)this.getSqlMapClientTemplate().queryForObject("oa.fyglgnf.queryForBean",paramMap);
    }

    public List<FyglGnf> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglgnf.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglgnf.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglgnf.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglgnf.getPagedCount", paramMap);
    }
}

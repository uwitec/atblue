package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FyglWcf;
import cn.com.atblue.oa.dao.FyglWcfDAO;

public class FyglWcfImpl extends SqlMapClientDaoSupport implements FyglWcfDAO {

    public Object addFyglWcf(FyglWcf paramBean){
        return this.getSqlMapClientTemplate().insert("oa.fyglwcf.addFyglWcf", paramBean);
    }

    public int modFyglWcf(FyglWcf paramBean){
        return this.getSqlMapClientTemplate().update("oa.fyglwcf.modFyglWcf", paramBean);
    }

    public int delFyglWcf(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.fyglwcf.delFyglWcf", paramMap);
    }

    public FyglWcf queryForBean(Map paramMap){
        return (FyglWcf)this.getSqlMapClientTemplate().queryForObject("oa.fyglwcf.queryForBean",paramMap);
    }

    public List<FyglWcf> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglwcf.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglwcf.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglwcf.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglwcf.getPagedCount", paramMap);
    }
}
